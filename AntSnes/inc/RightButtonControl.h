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


#ifndef __RIGHTBUTTONCONTROL_
#define __RIGHTBUTTONCONTROL_

#include <e32svr.h>
#include <coecntrl.h>
#include <aknviewappui.h>
#include <w32std.h>

#include "MVirtualKeyObserver.h"

class CRightButtonControl : public CCoeControl, MCoeControlObserver,  MDirectScreenAccess
{
  public:
      CRightButtonControl();
    // Symbian default constructor.
    void ConstructL(const TRect& aRect, MVirtualKeyObserver* aObserver);
    ~CRightButtonControl();

  public: //New function

    void HandleEnterPressL();

  private: // Functions from base classes

    // From CoeControl,CountComponentControls.
    TInt CountComponentControls() const;

    // Event handling section
    void HandleControlEventL(CCoeControl* aControl,TCoeEvent aEventType);
    void HandleResourceChange(TInt aType);
    TKeyResponse OfferKeyEventL(const TKeyEvent &aKeyEvent, TEventCode aType);
    void SizeChanged();
    void HandlePointerEventL(const TPointerEvent& aPointerEvent);

  private:
	  TAntSnesVirtualKey GetGameKeys(TPoint aCurrentPos);
      
  private:
    // Implement MDirectScreenAccess
    void Restart(RDirectScreenAccess::TTerminationReasons aReason);
    void AbortNow(RDirectScreenAccess::TTerminationReasons aReason);
    
  private: // Data
	  //CGameControlEngine*	iEngine;
      MVirtualKeyObserver*				iObserver; //not owned
	  
     CWsScreenDevice* iScreenDevice;       // BYREF

      // Direct Screen Access
     CDirectScreenAccess* iDirectScreenAccess; // OWNED
     CFbsBitGc* iGc;               // BYREF, from DSA
     RRegion* iRegion;             // BYREF, from DSA

     CFbsBitmap* iBitmap;           //OWNED
      
     TAntSnesVirtualKey iSimulatedKey;
};

#endif
// End of file.
