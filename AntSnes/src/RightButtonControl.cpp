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

#include "RightButtonControl.h"

//our resolution is 128 x 360, 
const TPoint KCentter( 64, 180);

_LIT(KBackgroundImageFile, "snescontrol.mbm");


CRightButtonControl::CRightButtonControl()
    {
    
    }

// Second-phase constructor creates the engine object.
void CRightButtonControl::ConstructL(const TRect& aRect, MVirtualKeyObserver* aObserver)
	{
	CreateWindowL();
	EnableDragEvents();

	SetRect(aRect);

	/*
	iEngine = new (ELeave) CGameControlEngine (*iEikonEnv );
	iEngine->ConstructL(Window(), CCoeEnv::Static()->ScreenDevice(), aEngine);
*/
   iScreenDevice = CCoeEnv::Static()->ScreenDevice();

    iBitmap = new( ELeave ) CFbsBitmap;

    TFileName completefilename;
    RFs fs;
    User::LeaveIfError(fs.Connect());
    // set path of the control file
    fs.PrivatePath(completefilename);
    fs.Close();

    // append the MBM file name to the private path
    completefilename.Append(KBackgroundImageFile);

    // insert the drive to the private path
    TParsePtrC parse((iEikonEnv->EikAppUi()->Application())->AppFullName());
    completefilename.Insert(0, parse.Drive());

    iBitmap->Load(completefilename, 1, EFalse);

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
	    
	ActivateL();
	}

// Destructor
CRightButtonControl::~CRightButtonControl()
	{
	}

// We don't have any sub-controls
TInt CRightButtonControl::CountComponentControls() const
	{
	return 0;
	}

// Empty implementation
void CRightButtonControl::HandleControlEventL(CCoeControl* /*aControl*/,
		TCoeEvent /*aEventType*/)
	{
	}

// Handle resource change event, here it is the event that occurs
// when screen mode changes.
void CRightButtonControl::HandleResourceChange(TInt aType)
	{
	}

void CRightButtonControl::SizeChanged()
	{
	}

// This event handler detects key events and calls the engine accordingly
TKeyResponse CRightButtonControl::OfferKeyEventL(const TKeyEvent &aKeyEvent,
		TEventCode aType)
	{
	return EKeyWasNotConsumed;
	}

void CRightButtonControl::HandleEnterPressL()
	{
	}

void CRightButtonControl::HandlePointerEventL(const TPointerEvent& aPointerEvent)
{
   // the user wants to control the game
    TEventCode code;
    TBool newkeyevent = EFalse;
    TAntSnesVirtualKey key;

    if (aPointerEvent.iType == TPointerEvent::EButton1Down
            || aPointerEvent.iType == TPointerEvent::EDrag)
        {
        key = GetGameKeys( aPointerEvent.iPosition );
        if( key != iSimulatedKey )
			{
			//release the old key
			iObserver->VirtualKeyEvent( iSimulatedKey, EFalse );
			iSimulatedKey = key;
			newkeyevent = ETrue;
			}
            
    }

    //the control is released release all buttons
    if ( aPointerEvent.iType == TPointerEvent::EButton1Up )
        {
        iObserver->VirtualKeyEvent( iSimulatedKey, EFalse );
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
TAntSnesVirtualKey CRightButtonControl::GetGameKeys(TPoint aCurrentPos)
    {
	TInt key = 0;
    if ((aCurrentPos.iY < 280) && (aCurrentPos.iY > 80) )
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
		if (angle > 337 || angle < 68)
			{
			//right key was pressed
			key = EKEY_A;
			}
		else if (angle >= 68 && angle < 158)
			{
			//Down key was pressed
			key = EKEY_B;
			}
		else if (angle >= 158 && angle < 248)
			{
			//Left key was pressed
			key =  EKEY_Y;
			}
		else if (angle >= 248 && angle < 337)
			{
			//up key was pressed
			key =  EKEY_X;
			}
        }
    else if( aCurrentPos.iY >= 280 )
        {
        //right button pressed
        key = EKEY_R;
        }
    else if( aCurrentPos.iY < 80 )
        {
        if( aCurrentPos.iX < 64 )
			{
			//start
			key = EKEY_START;
			}
		 else
			{
			//select
			key = EKEY_SELECT;
			}
        }
    
    return (TAntSnesVirtualKey) key;
    }

void CRightButtonControl::Restart(
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

void CRightButtonControl::AbortNow(
        RDirectScreenAccess::TTerminationReasons aReason)
    {

    }
