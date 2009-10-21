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
#ifndef ANTSNESCONTROLLER_H_
#define ANTSNESCONTROLLER_H_

#include <gles/egl.h> // for egl functions.
#include <e32base.h>  // for CBase
#include <w32std.h>   // for TWsEvent


#include <remconcoreapitargetobserver.h>    // link against RemConCoreApi.lib
#include <remconcoreapitarget.h>            // and
#include <remconinterfaceselector.h>        // RemConInterfaceBase.lib

#include "AntRemConCoreResponse.h"
#include "MSnesTimerObserver.h"
#include "CSnesTimer.h"
#include "AntAudio.h"
#include "AntSettings.h"
#include "MVirtualKeyObserver.h"

// CONSTANTS
const TUint KBufferSize = 32;

// Forward declarations
class RWindow;
class CWsEventReceiver;


enum EGameSTateState {
	EPaused,
	ERunning,
	EQuit,
	EKeyConfig
};

// CLASS DECLARATION

class MAudioListener
	{
public:
	virtual void AudioChannelOpened() = 0;
	};

/**
 * The Game Controller class.
 * Controls the intialization of the Game and mediates the 
 * Key Event delivery to the game.
 */
class CAntSnesController : public CBase, public MRemConCoreApiTargetObserver, public MSnesTimerObserver, public MVirtualKeyObserver, MAudioListener
{
public:
    enum TAntControllerState {
        EIdle = 0,
        EStarting,
        ERunnin,
        ECancelling
    };
    
    enum TAntControllerNextAction {
        ENoAction = 0x00,
        ECreateAudio = 0x01,
        ECreateVideo = 0x02,
        ERun = 0x04,
        ECancel = 0x08,
        EDeleteVideo = 0x10,
        EDeleteAudio = 0x20
    };
    /**
     * Two phase constructor.
     *
     * @param aEglDisplay the egl display to drawn on.
     */
    static CAntSnesController* NewL( CWindowGc& aGc, RWindow& aWindow, TDisplayMode aDisplayMode, TSize aScreenSize, TAntSettings aSettings  );
    
    /**
     * Starts the Game Loop.
     *
     * @param aFileName A reference to the game object.
     */    
    void LoadRom( TDesC8& aFileName );
    
    void SaveStateL( TInt aState );
    void LoadStateL( TInt aState );
    

    /// Container updates key events here:
    /// @param aKeyEvent key event type
    /// @param aType key event code
    void KeyEvent( const TKeyEvent& aKeyEvent,TEventCode aType );
    
    /// starts updating engine
    void Start();

    /// stops updating engine
    void Stop();
    
    void ResetGame();
    
    void UpdateRunTimeSettings( TAntSettings aSettings );
    
    TInt UpdateRenderer( TScreenRenderer aRenderer, TScreenMode aScreenMode, TSize aScreenSize, RWindow& aWindow );
    
    TInt UpdateAudioSettings( TBool aAudioOn, TBool aEnableSpeedHack, TInt aSampleRate,
								TBool aStereo, TInt aVolume);
    void DrawText(const TDesC& aText, TPoint aPoint );
    /**
     * Destructor.
     */            
    ~CAntSnesController();
        
private: // Constructors.
    /**
     * Constructor.
     *
     * @param aEglDisplay A handle to the egl display.
     */
	CAntSnesController( CWindowGc& aGc, RWindow& aWindow, TDisplayMode aDisplayMode, TAntSettings aSettings  );  
    
    /**
     * Two phase constructor.
     * Intializes the EGL Context and surface.
     */
    void ConstructL( TSize aScreenSize );
    
public: //From MRemConCoreApiTargetObserver
	void MrccatoCommand(TRemConCoreApiOperationId aOperationId, 
		TRemConCoreApiButtonAction aButtonAct);
	
	void MrccatoPlay(TRemConCoreApiPlaybackSpeed aSpeed, 
		TRemConCoreApiButtonAction aButtonAct);

	void MrccatoTuneFunction(TBool aTwoPart, 
		TUint aMajorChannel, 
		TUint aMinorChannel,
		TRemConCoreApiButtonAction aButtonAct);

	void MrccatoSelectDiskFunction(TUint aDisk,
		TRemConCoreApiButtonAction aButtonAct);

	void MrccatoSelectAvInputFunction(TUint8 aAvInputSignalNumber,
		TRemConCoreApiButtonAction aButtonAct);

	void MrccatoSelectAudioInputFunction(TUint8 aAudioInputSignalNumber,
		TRemConCoreApiButtonAction aButtonAct);
	
public: //from MSnesTimerObserver
	TInt DoSnesFrameL();
	TInt DoSnesFrameL(TInt aFrameSkip);
public:
	void AudioChannelOpened();
	
public:
	void VirtualKeyEvent( const TAntSnesVirtualKey& aKey, TBool isDown );
	  
private: // Data
    /** OpenGL es */
    EGLDisplay iEglDisplay;
    EGLSurface iEglSurface;  
    EGLContext iEglContext;
    
    TDisplayMode        iDisplayMode;       // current display mode
    
    //Direct screen access
    CFbsScreenDevice*   iFbsScreenDevice;   // screen device for direct screen flushing
	CFbsBitmap* iFbsBitmapBuffer;		// CFbsBitmap containing drawing screen
	TBitmapUtil*	iBitmapUtil;		// Only for bitmap locking
	
    /** Handle to Symbian's Window */    
    RWindow&    iWindow;
    CWindowGc&  iGc;
    
    TRect iDrawRect;              // Draw region on screen
    
    TBool       iPaused;                // paused flag
    TBool		iRomLoaded;
    TBool		iInitialized;
    
    CRemConInterfaceSelector* iInterfaceSelector;
    CRemConCoreApiTarget*     iCoreTarget;
    CAntRemConCoreKeyResponse* iResponse;

    CSnesTimer* iTimer;                 // CIdle timer to run the engine
    
    //Audio members
  //  CAntAudio* iGameAudio;
    TInt iSampleCount;
    RThread iAudioThread;
    
    TTime iStarttime; 
    TTime iEndTime;
    TInt iFrames;
    TInt iFrameTime;
    TInt iTargetFPS;
    TInt iFPS;
    TSize iScreenSize;
    TAntSettings iSettings;
    
    RLibrary iAntopenGLESLIB;
    
    TAntControllerState iState;
    TUint iNextAction;
    CIdle *iIdle;
};

#endif /*ANTSNESCONTROLLER_H_*/
