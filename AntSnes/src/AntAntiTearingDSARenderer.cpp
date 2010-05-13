/* AntSnes
 *
 * Copyright (C) 2009 Summeli <summeli@summeli.fi>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of
 * the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 */

#include <w32std.h>
#include <e32cmn.h>
#include <coemain.h>
#include <bitstd.h>
#include <eikenv.h>
#include <e32std.h>
#include "gfx.h"

#include "AntAntiTearingDSARenderer.h"
#include "AntBlit.h"

void (*bitBlit)(TUint8* aScreen, TUint8* aBitmap) = 0;

CAntAntiTearingDSAREnderer::~CAntAntiTearingDSAREnderer()
    {
    // "Cancel" is a meaningless call, since the service 
    // (video driver's screen update process) is not cancellable.
    // When destroying this active object, you must make sure, 
    // that the last update request (CDirectScreenBitmap::EndUpdate()) is completed.
    // Assuming that LCD refresh rate is not less than 60 Hz,
    // the wait time should be more than 1/60 secs.
    // (Otherwise a stay signal comes.)
    Cancel();
    delete iDrawer;
    delete iDSBitmap;
    }
 
CAntAntiTearingDSAREnderer::CAntAntiTearingDSAREnderer( RWindow& aWindow, TBool aShowFPS, TScreenMode aScreenMode )
:CActive( CActive::EPriorityStandard ), iWindow(aWindow), iShowFPS( aShowFPS ), iScreenMode( aScreenMode )
    {
    
    }

CAntAntiTearingDSAREnderer* CAntAntiTearingDSAREnderer::NewL( CWindowGc& aGc, RWindow& aWindow, TSize aScreenSize, TBool aShowFPS, TScreenMode aScreenMode )
{
CAntAntiTearingDSAREnderer* self = new (ELeave) CAntAntiTearingDSAREnderer( aWindow, aShowFPS, aScreenMode );
    
    CleanupStack::PushL( self );
    self->ConstructL( aGc, aScreenSize );
    CleanupStack::Pop( self );
    return self;    
}
 
void CAntAntiTearingDSAREnderer::ConstructL( CWindowGc& aGc, TSize aScreenSize )
    {
    CActiveScheduler::Add( this );
    iSize = aScreenSize;
    // Setting up direct screen access
    iDSBitmap = CDirectScreenBitmap::NewL();
    iDrawer = CDirectScreenAccess::NewL(
    	CEikonEnv::Static()->WsSession(),
    	*CEikonEnv::Static()->ScreenDevice(),
    	iWindow,
    	*this);
    CEikonEnv::Static()->WsSession().Flush();
    
    iDrawer->StartL();
    
    iGc = iDrawer->Gc();
    RRegion* region = iDrawer->DrawingRegion();
    iGc->SetClippingRegion(region);
    
    // It may happen that a device does not support double buffering.
    TPoint point(0,0);
    User::LeaveIfError(
        iDSBitmap->Create(
            TRect(point, iSize), CDirectScreenBitmap::EDoubleBuffer));
    }
 
void CAntAntiTearingDSAREnderer::Restart( RDirectScreenAccess::TTerminationReasons /*aReason*/ )
    {
    TPoint point(0,0);
    TRAPD( err, iDrawer->StartL() ); // You may panic here, if you want
    if( err )
    	{
    	//err
     	iDSAReady = EFalse;
     	return;
    	}
    RRegion* region = iDrawer->DrawingRegion();
    iGc->SetClippingRegion( region );
    iDSBitmap->Create(
        TRect(point, iSize), CDirectScreenBitmap::EDoubleBuffer); 
    iDSAReady = ETrue;
   
    // Put some code here to continue game engine	
    }
 
void CAntAntiTearingDSAREnderer::AbortNow( RDirectScreenAccess::TTerminationReasons /*aReason*/ )
    {
    // Put some code here to suspend game engine	
    if (IsActive())
    	{
    	Cancel();
    	}
    iDSBitmap->Close();
    iDSAReady = EFalse;
    
    }
 
void CAntAntiTearingDSAREnderer::RunL()
    {
    // Video driver finished to draw the last frame on the screen
    // You may initiate rendering the next frame from here, 
    // but it would be slow, since there is a delay between CDirectScreenBitmap::EndUpdate() 
    // and the completition of screen refresh by the video driver	
    }
 
void CAntAntiTearingDSAREnderer::DoCancel()
    {
    // Cancel not implemented in service provider, so we can't do anything here
    }

void CAntAntiTearingDSAREnderer::SetPal( TBool aPAL )
	{
    TAcceleratedBitmapInfo bitmapInfo;
    iDSBitmap->BeginUpdate(bitmapInfo);        
    
    TDisplayMode mode = bitmapInfo.iDisplayMode;
    
    if( mode == EColor16M )
    	{
    	SetPal16M(aPAL);
    	}
    
    if( mode == EColor16MU)
    	{
    	SetPal16MU(aPAL);
    	}
    if( mode == EColor16MA )
    	{
    	SetPal16MU(aPAL);
    	}
	
    iDSBitmap->EndUpdate(iStatus);
    SetActive();
	}

void CAntAntiTearingDSAREnderer::SetPal16M(TBool aPAL)
	{
	
	}

void CAntAntiTearingDSAREnderer::SetPal16MU(TBool aPAL)
	{
	TSize landscape( 320, 240);
	TSize portrait( 240, 320);
	
	TSize landscape352( 416, 352);
	TSize portrait352( 352, 416);
	iPAL = aPAL;
	if( iSize == portrait )
		{
		if( iPAL )
			bitBlit = BlitPAL240x320_16MU;
		else
			bitBlit = BlitNTSC240x320_16MU;
		
		//Create skiptable
		CreateScanLineSkipTable(iSize);
		}
	if( iSize == landscape)
		{
		if (iScreenMode == ENGage)
			{
			//if ngage
			if( iPAL )
				bitBlit = BlitPAL320x240NGAGE_16MU;
			else
				bitBlit = BlitNTSC320x240NGAGE_16MU;
			}
		else
			{
			if( iPAL )
				bitBlit = BlitPAL320x240Normal_16MU;
			else
				bitBlit = BlitNTSC320x240Normal_16MU;
			}
		}
	
	if( iSize == portrait352 )
		{
		if( iPAL )
			bitBlit = BlitPAL352x416_16MU;
		else
			bitBlit = BlitNTSC352x416_16MU;
		}
	
	if( iSize == landscape352 )
		{
		if( iPAL )
			bitBlit = BlitPAL416x352Normal_16MU;
		else
			bitBlit = BlitNTSC416x352Normal_16MU;
		}
	}

void CAntAntiTearingDSAREnderer::UpdateFPS( TInt aFPS )
	{
	
	}
void CAntAntiTearingDSAREnderer::SetShowFPS( TBool aShowFPS )
	{
	
	}
void CAntAntiTearingDSAREnderer::DrawText(const TDesC& aText, TPoint aPoint )
	{
	
	}

void CAntAntiTearingDSAREnderer::PutS9xFrame( TUint8* FrameBuf )
	{
    if( !iDSAReady )
    	return;
    
    
    if (IsActive())
    	{
    	return;
    	}
    
    // Obtain the screen address every time before drawing the frame, 
    // since the address always changes
    TAcceleratedBitmapInfo bitmapInfo;
    iDSBitmap->BeginUpdate(bitmapInfo);        
    TUint8 *bmpData = (TUint8 *) bitmapInfo.iAddress;
    TUint8* screen = GFX.Screen;

	//blit
    bitBlit( screen, bmpData );
      
    iDSBitmap->EndUpdate(iStatus);
    SetActive();
    
	}
