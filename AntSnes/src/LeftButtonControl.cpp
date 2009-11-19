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

#include <eikapp.h>
#include <eikappui.h>
#include <eikenv.h>
#include <aknutils.h>
#include "akndef.h"
#include <e32svr.h>
#include <e32math.h>
#include <f32file.h>
#include <AknIconUtils.h>

#include "LeftButtonControl.h"

//our resolution is 128 x 360, 
const TPoint KCentter( 64, 180);

_LIT(KBackgroundImageFile, "snescontrol.mbm"); //TODO: put here the own stuff

enum TKeysBits
    {
    EUP = 1,
    EDOWN = 2,
    ERIGHT = 4,
    ELEFT = 8,
    };

CLeftButtonControl::CLeftButtonControl()
    {
    
    }

// Second-phase constructor creates the engine object.
void CLeftButtonControl::ConstructL(const TRect& aRect, MVirtualKeyObserver* aObserver, MRequestMenuObserver* aMenuobserver )
	{
	CreateWindowL();
	EnableDragEvents();

	SetRect(aRect);

   iScreenDevice = CCoeEnv::Static()->ScreenDevice();

    iBitmap = new( ELeave ) CFbsBitmap;

    TFileName completefilename;
    User::LeaveIfError(iFs.Connect());
    iFs.ShareProtected();
    // set path of the control file
    iFs.PrivatePath(completefilename);
    
    // append the MBM file name to the private path
    completefilename.Append(KBackgroundImageFile);
    
    // insert the drive to the private path
    TParsePtrC parse((iEikonEnv->EikAppUi()->Application())->AppFullName());
    completefilename.Insert(0, parse.Drive());
    TInt err;
    
    //iIconProvider = CIconFileProvider::NewL(iFs, completefilename);
    
    //TRAP(err, iBitmap = AknIconUtils::CreateIconL( *iIconProvider, 0));


    iBitmap->Load(completefilename, 0, EFalse);

    // Create Direct Screen Access
    iDirectScreenAccess = CDirectScreenAccess::NewL(iEikonEnv->WsSession(),
            *CCoeEnv::Static()->ScreenDevice(), Window(), *this);

    // Start direct screen access
    iDirectScreenAccess->StartL();
    iGc = iDirectScreenAccess->Gc();
    iRegion = iDirectScreenAccess->DrawingRegion();
    iGc->SetClippingRegion(iRegion);
    iGc->BitBlt(TPoint(0, 0), iBitmap);

    iObserver = aObserver;
	iMenuObserver = aMenuobserver;    
	ActivateL();
	}

// Destructor
CLeftButtonControl::~CLeftButtonControl()
	{
    iFs.Close();
	}

// We don't have any sub-controls
TInt CLeftButtonControl::CountComponentControls() const
	{
	return 0;
	}

// Empty implementation
void CLeftButtonControl::HandleControlEventL(CCoeControl* /*aControl*/,
		TCoeEvent /*aEventType*/)
	{
	}

// Handle resource change event, here it is the event that occurs
// when screen mode changes.
void CLeftButtonControl::HandleResourceChange(TInt aType)
	{
	}

void CLeftButtonControl::SizeChanged()
	{
	}

// This event handler detects key events and calls the engine accordingly
TKeyResponse CLeftButtonControl::OfferKeyEventL(const TKeyEvent &aKeyEvent,
		TEventCode aType)
	{
	return EKeyWasNotConsumed;
	}

void CLeftButtonControl::HandleEnterPressL()
	{
	}

void CLeftButtonControl::HandlePointerEventL(const TPointerEvent& aPointerEvent)
{
   // the user wants to control the game
    TBool newkeyevent = EFalse;
    TAntSnesVirtualKey key;
 
    if (aPointerEvent.iType == TPointerEvent::EButton1Down
            || aPointerEvent.iType == TPointerEvent::EDrag)
        {
        //only 200x200 position in the center is used
        if ( aPointerEvent.iPosition.iY > 80 )
            { 
            key = GetGameKeys( aPointerEvent.iPosition );
            //if new key is pressed
            if( key != iSimulatedKey )
                {
                //release the old key
                iObserver->VirtualKeyEvent( iSimulatedKey, EFalse );
                iSimulatedKey = key;
                newkeyevent = ETrue;
                }
            }
        else
            {
            iMenuObserver->ShowMenu();
             return;
            }
    }

    //the control is released release all buttons
    if ( aPointerEvent.iType == TPointerEvent::EButton1Up )
        {
        if( aPointerEvent.iPosition.iY> 80 )
            {
            key = iSimulatedKey;
            iObserver->VirtualKeyEvent( iSimulatedKey, EFalse );
            }
        }
    if( newkeyevent )
        {
        iObserver->VirtualKeyEvent( iSimulatedKey, ETrue );
        }
}


/**
 * GetGameKeys
 * This function calculates the sector of circle and return 
 * corresponding keys. 
 * @param aCurrentPos the clicked postion
 * @return keys pressed
 */
TAntSnesVirtualKey CLeftButtonControl::GetGameKeys(TPoint aCurrentPos)
    {
    TInt key = 0;
    if (aCurrentPos.iY < 280 && aCurrentPos.iY> 80 )
    	{ 
		//Calculate distance from the center
		TInt x = aCurrentPos.iX - KCentter.iX;
		TInt y = aCurrentPos.iY - KCentter.iY;
	
		TReal r;
		Math::ATan(r, y, x);
		r = (r * 180 )/ KPi; //convert radians to degrees
	
		//lets use full circle instead of negative angles
		if (r < 0)
			{
			r = 360 + r;
			}
	
		TInt32 angle;
		Math::Int(angle, r);
	
	
		//360 degrees is divided into 8 sectors.
	    if (angle > 337 || angle < 23)
	        {
	        //right key was pressed
	        key += EKEY_RIGHT;
	        }
	    else if (angle >= 23 && angle < 68)
	        {
	        //right and down was pressed
	        key += EKEY_RIGHT;
	        key += EKEY_DOWN;
	        }
	    else if (angle >= 68 && angle < 113)
	        {
	        //Down key was pressed
	        key += EKEY_DOWN;
	        }
	    else if (angle >= 113 && angle < 158)
	        {
	        //Down and left key was pressed
	        key += EKEY_DOWN;
	        key += EKEY_LEFT;
	        }
	    else if (angle >= 158 && angle < 203)
	        {
	        //Left key was pressed
	        key += EKEY_LEFT;
	        }
	    else if (angle >= 203 && angle < 248)
	        {
	        //left and up key was pressed
	        key += EKEY_LEFT;
	        key += EKEY_UP;
	        }
	    else if (angle >= 248 && angle < 293)
	        {
	        //up key was pressed
	        key += EKEY_UP;
	        }
	    else if (angle >= 293 && angle <= 337)
	        {
	        //up and right key was pressed
	        key += EKEY_UP;
	        key += EKEY_RIGHT;
	        }
    	}
    else if( aCurrentPos.iY >= 280 )
        {
        //left key pressed
		key = EKEY_L;
        }
    
    return (TAntSnesVirtualKey) key;
    }

void CLeftButtonControl::Restart(
        RDirectScreenAccess::TTerminationReasons aReason)
    {
    TRAPD(dsaErr, iDirectScreenAccess->StartL());
    if (dsaErr == KErrNone)
        {
        iGc = iDirectScreenAccess->Gc();
        iRegion = iDirectScreenAccess->DrawingRegion();
        iGc->SetClippingRegion(iRegion);
        iGc->BitBlt(TPoint(0, 0), iBitmap);
        iDirectScreenAccess->ScreenDevice()->Update();
        }

    }

void CLeftButtonControl::AbortNow(
        RDirectScreenAccess::TTerminationReasons aReason)
    {

    }
