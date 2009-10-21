#include "tracer.h"
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
// INCLUDE FILES
#include <coemain.h>
#include "AntSnesController.h"

// INCLUDE FILES
#include "AntSnesContainer.h"
#include "AntSnes.hrh"
#include <eikmenub.h>
#include <eikspane.h>
#include <eikbtgpc.h>
#include <eiktbar.h>
#include <aknutils.h> 

void CAntSnesContainer::ConstructL( const TRect& aRect, TAntSettings aSettings )
    {
    TRACER("void CAntSnesContainer::ConstructL(const TRect& aRect, TAntSettings aSettings)")
    CreateWindowL();

    iController = CAntSnesController::NewL( SystemGc(), Window(),
                             CCoeEnv::Static()->ScreenDevice()->DisplayMode(),aRect.Size(), aSettings
                             );
    ControlEnv()->AddForegroundObserverL( *this );
    // Start in  fullscreen because of problem issue in 3.0 openGL 
    //SetExtentToWholeScreen();
    SetRect( aRect );
    iFullScreen = 1;
  
    ActivateL();

    }



CAntSnesContainer::~CAntSnesContainer()
    {
    TRACER("CAntSnesContainer::~CAntSnesContainer()")
    delete iController;
    }



void CAntSnesContainer::SizeChanged()
    {
    TRACER("void CAntSnesContainer::SizeChanged()")
    }

void CAntSnesContainer::HandleResourceChange(TInt aType)
    {
    }

void CAntSnesContainer::HandleGainingForeground()
    {
    TRACER("void CAntSnesContainer::HandleGainingForeground()")
    iController->Start();
    }



void CAntSnesContainer::HandleLosingForeground()
    {
    TRACER("void CAntSnesContainer::HandleLosingForeground()")
    iController->Stop();
    }



TKeyResponse CAntSnesContainer::OfferKeyEventL(const TKeyEvent& aKeyEvent,TEventCode aType)
    {
    TRACER("TKeyResponse CAntSnesContainer::OfferKeyEventL(const TKeyEvent& aKeyEvent,TEventCode aType)")
    // Game's idle timer doesn't allow focuschange too easily,
    // this is to help it a little
    // So when application change key is pressed, the key event comes here
    // but the OS doesn't have enough time to change the application focus
    // This catches the application key press and leaves the thread for one second
    // In that time OS has all the time it needs to change focus.
    if( aKeyEvent.iScanCode == EStdKeyApplication0 )
        {
        User::After( 1000000 );
        return EKeyWasConsumed;
        }
    if( aKeyEvent.iScanCode == EStdKeyDevice1 )
    	{
    	return EKeyWasNotConsumed;
    	}
    // In all other cases just forward the key presses to the game engine.
    iController->KeyEvent( aKeyEvent, aType );
    return EKeyWasConsumed;
    }

void CAntSnesContainer::LoadROM( const TDesC& aROM )
	{
    TRACER("void CAntSnesContainer::LoadROM(const TDesC& aROM)")
	HBufC8* buf = HBufC8::NewLC( aROM.Length() );
	TPtr8 ptr = buf->Des();
	ptr.Copy( aROM );
	iController->LoadRom( ptr );
	CleanupStack::PopAndDestroy( buf );
	}

void CAntSnesContainer::SaveStateL( TInt aState )
	{
    TRACER("void CAntSnesContainer::SaveStateL(TInt aState)")
	iController->SaveStateL( aState );
	}

void CAntSnesContainer::LoadStateL( TInt aState )
	{
    TRACER("void CAntSnesContainer::LoadStateL(TInt aState)")
	iController->LoadStateL( aState );
	}

void CAntSnesContainer::ResetGame()
	{
    TRACER("void CAntSnesContainer::ResetGame()")
	iController->ResetGame();
	}

void CAntSnesContainer::UpdateRunTimeSettings( TAntSettings aSettings )
	{
    TRACER("void CAntSnesContainer::UpdateRunTimeSettings(TAntSettings aSettings)")
	iController->UpdateRunTimeSettings( aSettings);
	}

TInt CAntSnesContainer::UpdateRenderer( TScreenRenderer aRenderer, TScreenMode aScreenMode, TSize aScreenSize )
	{
    TRACER("TInt CAntSnesContainer::UpdateRenderer(TScreenRenderer aRenderer, TScreenMode aScreenMode, TSize aScreenSize)")
	return iController->UpdateRenderer( aRenderer, aScreenMode, aScreenSize,  Window() );
	}

void CAntSnesContainer::Pause()
	{
    TRACER("void CAntSnesContainer::Pause()")
	iController->Stop();
	}
void CAntSnesContainer::Start()
	{
    TRACER("void CAntSnesContainer::Start()")
	iController->Start();
	}
TInt CAntSnesContainer::UpdateAudioSettings( TBool aAudioOn, TBool aEnableSpeedHack, TInt aSampleRate,
							TBool aStereo, TInt aVolume)
	{
    TRACER("TInt CAntSnesContainer::UpdateAudioSettings(TBool aAudioOn, TBool aEnableSpeedHack, TInt aSampleRate,							TBool aStereo, TInt aVolume)")
	return iController->UpdateAudioSettings( aAudioOn, aEnableSpeedHack, aSampleRate, aStereo, aVolume );
	}

#ifdef __S60_50__
CAntSnesController* CAntSnesContainer::GetEngine()
	{
	return iController;
	}
#endif
    
