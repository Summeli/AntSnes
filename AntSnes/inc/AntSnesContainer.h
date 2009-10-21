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
#ifndef __ANTSCONTAINER_h__
#define __ANTSCONTAINER_h__

// INCLUDES
#include <coecntrl.h>
#include <eikenv.h> 

#include "AntSnesController.h"
#include "AntSettings.h"

class CEikLabel;        // for example labels
class CEikButtonGroupContainer;
class CEikStatusPane;

// CLASS DECLARATION
class CAntSnesContainer : public CCoeControl, MCoeForegroundObserver
	{
public: // Constructors and destructor
    
    /// Second phase constructor
    /// @param aRect the drawing rect
    void ConstructL( const TRect& aRect, TAntSettings aSettings );

    /// Destructor
    ~CAntSnesContainer();

private: // From CCoeCotrol:

    TKeyResponse OfferKeyEventL(const TKeyEvent& aKeyEvent,TEventCode aType);
    void SizeChanged();
    void HandleResourceChange(TInt aType);

private: // From MCoeForegroundObserver

    void HandleGainingForeground();
    void HandleLosingForeground();

public:
    void LoadROM( const TDesC& aROM );
    void SaveStateL( TInt aState );
    void LoadStateL( TInt aState );
    void ResetGame();
    void UpdateRunTimeSettings( TAntSettings aSettings );
    TInt UpdateRenderer( TScreenRenderer aRenderer, TScreenMode aScreenMode, TSize aScreenSize );
    TInt UpdateAudioSettings( TBool aAudioOn, TBool aEnableSpeedHack, TInt aSampleRate,
								TBool aStereo, TInt aVolume);
    void Pause();
    void Start();
#ifdef __S60_50__
    CAntSnesController* GetEngine();
#endif
	
public: //data
    
	CAntSnesController* iController;
	
    /// draw area with title- and menupane
    TRect       iRect;

    /// Full screen flag
    TBool       iFullScreen;

    CEikButtonGroupContainer*   iToolBar;
    CEikStatusPane*             iStatusPane;
};
#endif // __ANTSCONTAINER_h__
// End of File
