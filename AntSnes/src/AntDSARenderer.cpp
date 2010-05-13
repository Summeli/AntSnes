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
#include "gfx.h"
#include "AntDSARenderer.h"
#include "AntBlit.h"

#include "symb_debug.h"
void (*bitmapBlit)(TUint8* aScreen, TUint8* aBitmap) = 0;

CAntDSARenderer::CAntDSARenderer( RWindow& aWindow, TBool aShowFPS, TScreenMode aScreenMode )
:iWindow(aWindow),iShowFPS( aShowFPS ),  iScreenMode( aScreenMode )
    {
    
    }

CAntDSARenderer* CAntDSARenderer::NewL( CWindowGc& aGc, RWindow& aWindow, TSize aScreenSize, TBool aShowFPS, TScreenMode aScreenMode )
{
	CAntDSARenderer* self = new (ELeave) CAntDSARenderer( aWindow, aShowFPS, aScreenMode );
    
    CleanupStack::PushL( self );
    self->ConstructL( aGc, aScreenSize );
    CleanupStack::Pop( self );
    return self;    
}

void CAntDSARenderer::AbortNow(RDirectScreenAccess::TTerminationReasons aReason)
    {
    DEBUGPRINT(_L("ABORT"));
     //g_DSA->Cancel(); 
    //no updates during this time
    iDSAReady = EFalse;
    }

void CAntDSARenderer::Restart(RDirectScreenAccess::TTerminationReasons aReason)
    {
    DEBUGPRINT(_L("RESTART"));
    TRAPD(dsaErr, iDSA->StartL());
     if( dsaErr )
     	{
     	//err
     	iDSAReady = EFalse;
     	return;
     	}
    RRegion *dsa_region = 0;
    dsa_region = iDSA->DrawingRegion();
    
    iGc->SetClippingRegion( dsa_region );
    iGc->BitBlt(TPoint(0, 0), iBlackScreen);
    iDSA->ScreenDevice()->Update();
    iDSAReady = ETrue;
    }

void CAntDSARenderer::ConstructL(CWindowGc& aGc, TSize aScreenSize)
    {
    iSize = aScreenSize;
    CWsScreenDevice* device = static_cast<CWsScreenDevice*> (aGc.Device());
    RRegion *dsa_region = 0;
    	
    iDSA = CDirectScreenAccess::NewL( CCoeEnv::Static()->WsSession(), *device, iWindow, *this );
    iDSA->SetPriority( EPriorityHigh );
    TRAPD(dsaErr, iDSA->StartL());
    iGc = iDSA->Gc();
    
    dsa_region = iDSA->DrawingRegion();
    iRegion = dsa_region;
    iGc->SetClippingRegion( dsa_region );
    iBitmap = new (ELeave) CFbsBitmap;
    iBitmap->Create( aScreenSize, EColor64K );
    
    iBlackScreen = new (ELeave) CFbsBitmap;
    iBlackScreen->Create( aScreenSize, EColor64K );
    
    iBlackScreen->LockHeap();
    iBitmap->LockHeap();
    
    TUint8 *bmpData = (TUint8 *) iBlackScreen->DataAddress();
    for( TInt i =0; i< aScreenSize.iWidth*aScreenSize.iHeight*2; i++)
     	{
     	*bmpData = 0x0;
     	bmpData++;
     	}
    
    bmpData = (TUint8 *) iBitmap->DataAddress();
    for( TInt i =0; i< aScreenSize.iWidth*aScreenSize.iHeight*2; i++)
    	{
    	*bmpData = 0x0;
    	bmpData++;
    	}
        
    iBlackScreen->UnlockHeap();
    iBitmap->UnlockHeap();
    
    }

CAntDSARenderer::~CAntDSARenderer()
    {
    if( iDSA )
    	{
    	iDSA->Cancel();
    	delete iDSA;
    	}
    delete iBitmap;
    delete iBlackScreen;
    }

void CAntDSARenderer::SetPal( TBool aPAL )
	{
	
	TSize landscape( 320, 240);
	TSize portrait( 240, 320);
	
	TSize landscape352( 416, 352);
	TSize portrait352( 352, 416);
	
	TSize s60_5th_edition( 384, 360 );
	
	iPAL = aPAL;
	if( iSize == portrait )
		{
		if( iPAL )
			bitmapBlit = BlitPAL240x320;
		else
			bitmapBlit = BlitNTSC240x320;
		
		//Create skiptable
		CreateScanLineSkipTable(iSize);
		}
	if( iSize == landscape)
		{
		if (iScreenMode == ENGage)
			{
			//if ngage
			if( iPAL )
				bitmapBlit = BlitPAL320x240NGAGE;
			else
				bitmapBlit = BlitNTSC320x240NGAGE;
			}
		else
			{
			if( iPAL )
				bitmapBlit = BlitPAL320x240Normal;
			else
				bitmapBlit = BlitNTSC320x240Normal;
			}
		}
	
	if( iSize == portrait352 )
		{
		if( iPAL )
			bitmapBlit = BlitPAL352x416;
		else
			bitmapBlit = BlitNTSC352x416;
		}
	
	if( iSize == landscape352 )
		{
		if( iPAL )
			bitmapBlit = BlitPAL416x352Normal;
		else
			bitmapBlit = BlitNTSC416x352Normal;
		}
	if( iSize == s60_5th_edition )
		{
		_LIT(kjee, "Before Init");
		HBufC* buf = HBufC::NewL( 100 );
		buf->Des().Copy(kjee);
		TPtr ptr = buf->Des();
		//create scalint table
		Init5thEditionBlit( aPAL );
		if( iPAL )
			{
			DEBUGPRINT(_L("PAL"));
			bitmapBlit = BlitPAL5THED;
			}
		else
			{
			DEBUGPRINT(_L("NTSC"));
			bitmapBlit = BlitNTSC5THED;
			}
		}
	}

void CAntDSARenderer::UpdateFPS( TInt aFPS )
	{   
	DEBUGPRINT(_L("UPDATE FPS"));
	iFPS = aFPS;    
    
    //if show FPS
    if( iShowFPS )
    	{
        iBitmap->LockHeap();
        TUint8 *bmpData = (TUint8 *) iBitmap->DataAddress();
    	TInt16* dataptr = (TInt16*) bmpData;
    	for( TInt i =0; i<10*2; i++)
    		{
    		for( TInt j = 0; j < 15 * 2; j++ )
    			{
    			*dataptr = 0x0;
    			dataptr++;
    			}
    		dataptr += iSize.iWidth - (15 * 2);
    		}

    	iBitmap->UnlockHeap();
    	
		CFbsBitmapDevice* bitDevice = CFbsBitmapDevice::NewL(iBitmap);
		CleanupStack::PushL( bitDevice );
		CFbsBitGc* bitGc;
		User::LeaveIfError(bitDevice->CreateContext(bitGc));
		
		_LIT(KFps,"%d");
		TBuf<10> fpsBuf;
		TPoint pos(0,0);
		fpsBuf.Format( KFps, iFPS);
		bitGc->SetPenColor(KRgbRed);
		bitGc->UseFont(CEikonEnv::Static()->DenseFont() );
		bitGc->SetPenStyle(CGraphicsContext::ESolidPen);
		bitGc->DrawText(fpsBuf, TPoint(10, 10));
		CleanupStack::Pop(bitDevice);
    	}
    	
	}

void CAntDSARenderer::SetShowFPS( TBool aShowFPS )
	{
	DEBUGPRINT(_L("SET FPS"));
	iShowFPS = aShowFPS;
    
    
    //if show FPS
    if( !iShowFPS )
    	{
    	 iBitmap->LockHeap();
        TUint8 *bmpData = (TUint8 *) iBitmap->DataAddress();
        
    	TInt16* dataptr = (TInt16*) bmpData;
    	for( TInt i =0; i<10*2; i++)
    		{
    		for( TInt j = 0; j < 15 * 2; j++ )
    			{
    			*dataptr = 0x0;
    			dataptr++;
    			}
    		dataptr += iSize.iWidth - (15 * 2);
    		}
    	iBitmap->UnlockHeap();
    	}
	}

void CAntDSARenderer::DrawText(const TDesC& aText, TPoint aPoint )
{
DEBUGPRINT(_L("DRAW TEXT"));
	iGc->SetBrushColor(KRgbGreen);
	iGc->SetBrushStyle(CGraphicsContext::ESolidBrush);

	iGc->SetPenStyle(CGraphicsContext::ESolidPen);
	iGc->UseFont(CEikonEnv::Static()->DenseFont());
	iGc->DrawText(aText,aPoint);
	iGc->DiscardFont();
	
	iDSA->ScreenDevice()->Update();		

}

void CAntDSARenderer::PutS9xFrame( TUint8* FrameBuf )
    {
    DEBUGPRINT(_L("PUT FRAME"));
    if( !iDSAReady )
    	return;
    
    iBitmap->LockHeap();
    TUint8 *bmpData = (TUint8 *) iBitmap->DataAddress();
    TUint8* screen = GFX.Screen;

    //blit
    bitmapBlit( screen, bmpData );
    
    iBitmap->UnlockHeap();
    
    iGc->BitBlt(TPoint(0, 0), iBitmap);
    iDSA->ScreenDevice()->Update();
    }

void CAntDSARenderer::Stop()
	{
	iDSAReady = EFalse;
	iDSA->Cancel();
	}

void CAntDSARenderer::Start()
	{
    TRAPD(dsaErr, iDSA->StartL());
     if( dsaErr )
     	{
     	//err
     	iDSAReady = EFalse;
     	return;
     	}
    RRegion *dsa_region = 0;
    dsa_region = iDSA->DrawingRegion();
    
    iGc->SetClippingRegion( dsa_region );
    iGc->BitBlt(TPoint(0, 0), iBlackScreen);
    iDSA->ScreenDevice()->Update();
    iDSAReady = ETrue;
	}

TBool CAntDSARenderer::isReady()
	{
	return iDSAReady;
	}
