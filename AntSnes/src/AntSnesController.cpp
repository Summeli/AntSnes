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

#include "AntSnesController.h"
#include <coemain.h> // for CCoeEnv
#include "OpenGLES.h"

#include <hal.h>

#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <e32keys.h>

#include <e32base.h>
#include <w32std.h>
#include <EZlib.h>
#include <bitstd.h>
#include "symb_debug.h"
#include "zlib/gzio.h"

// SNES
#include "snes9x.h"
#include "memmap.h"
#include "apu.h"
#include "gfx.h"
#include "soundux.h"
#include "snapshot.h"
#include "AntDSARenderer.h"
#include "AntAntiTearingDSARenderer.h"
#include "AntVideo.h"
//#include "symb_main.h"
#include "tracer.h"
//direct screen access
#include <fbs.h>

#define KSecondInMicroseconds	1000000
#define KPALFrameTime 20000
#define KNTSCFrameTime 16667
//TODO Check currentConfig

_LIT(KOPENGLESLIB, "AntOpenGLES.dll");

// mainloop and it's stuff
char fps_buff[24]; // fps count c string
struct timeval tval; // timing
static int thissec = 0, frames_done = 0, frames_shown = 0, frames_toskip = 0;
static int target_fps, target_frametime, too_fast;
//extern int emu_was_reset;
static int emu_cflags = 0; // emu control flags: reset_timing, saveload_pending, load
static int sndLen = 0;
static signed short* audioOut = 0;
static uint32 JoyPad;
static uint32 JoyPadClicks;
static bool audioEnabled;
//to be removed
static char noticeMsg[64]; // notice msg to draw
static timeval noticeMsgTime = { 0, 0 }; // when started showing

void MainExit();
void MainInit();
void DumpMemInfo();
int saveLoadGame(int load, int slot, int sram=0 );

static MAntVideo* g_DSARenderer;
static int g_samplecount;

TUint16 KAntKeyTable[12]={SNES_UP_MASK,SNES_DOWN_MASK,SNES_LEFT_MASK,SNES_RIGHT_MASK,SNES_A_MASK,SNES_X_MASK,SNES_Y_MASK,SNES_B_MASK,SNES_START_MASK,SNES_SELECT_MASK,SNES_TL_MASK,SNES_TR_MASK};
CAntAudio* g_GameAudio;

TInt Audio_ThreadInit( TAny* )
{
	CTrapCleanup* cleanup= CTrapCleanup::New();

	//Install Active Scheduler
	CActiveScheduler::Install(NULL);
	CActiveScheduler* scheduler = new CActiveScheduler; 
	CActiveScheduler::Install(scheduler); 

	// Now lets increast the priority of this thread
	RThread audioThread; //this is the audiothread
	audioThread.SetPriority(EPriorityRealTime);

	//Create audio
	if( g_GameAudio )
		{
		delete g_GameAudio;
		g_GameAudio = NULL;
		}
	TInt err;
	//TRAP( err, g_GameAudio = CAntAudio::NewL(so.playback_rate, so.stereo, g_samplecount, 4, this ) );
	//g_GameAudio->Reset();
	
	return err;
}

CAntSnesController* CAntSnesController::NewL( CWindowGc& aGc, RWindow& aWindow, TDisplayMode aDisplayMode, TSize aScreenSize,  TAntSettings aSettings )
{
    TRACER("CAntSnesController* CAntSnesController::NewL(CWindowGc& aGc, RWindow& aWindow, TDisplayMode aDisplayMode, TSize aScreenSize,  TAntSettings aSettings)")
	CAntSnesController* self = new (ELeave) CAntSnesController(  aGc,  aWindow, aDisplayMode, aSettings );
    
    CleanupStack::PushL( self );
    self->ConstructL( aScreenSize );
    CleanupStack::Pop( self );
    return self;    
}


CAntSnesController::CAntSnesController( CWindowGc& aGc, RWindow& aWindow, TDisplayMode aDisplayMode, TAntSettings aSettings )
                : iGc( aGc ), iWindow( aWindow ), iDisplayMode( aDisplayMode ), iSettings( aSettings )
{
    TRACER("CAntSnesController::CAntSnesController(CWindowGc& aGc, RWindow& aWindow, TDisplayMode aDisplayMode, TAntSettings aSettings)")
	g_DSARenderer = NULL;
	g_GameAudio = NULL;
}

CAntSnesController::~CAntSnesController()
{
	if( iRomLoaded )
		saveLoadGame(0, 7); //save state
	
    TRACER("CAntSnesController::~CAntSnesController()")
	delete iTimer;
 
    delete iFbsScreenDevice;
    delete iFbsBitmapBuffer; 
    delete iBitmapUtil;
    
    delete iResponse;
    delete iInterfaceSelector;
    iCoreTarget = NULL; //owned by interfaceselector
    delete g_GameAudio;
    delete g_DSARenderer;
    MainExit();
}

void CAntSnesController::ConstructL( TSize aScreenSize )
{
    TRACER("void CAntSnesController::ConstructL(TSize aScreenSize)")    
 
DEBUG_PRINT_FILE_INIT;

	iPaused = ETrue;
    iRomLoaded = EFalse;
    iScreenSize = aScreenSize;
    // Create video renderer

    if( iSettings.iRenderer == EDSA )
    	{
    	g_DSARenderer = CAntDSARenderer::NewL( iGc, iWindow, aScreenSize, iSettings.iShowFPS, iSettings.iScreenMode );
    	}
    
    else if( iSettings.iRenderer == EOpenGLES )
    	{
    	TInt err = iAntopenGLESLIB.Load( KOPENGLESLIB );
    	if( !err )
    		{
    		_angelesnew esnew;
    		esnew = (_angelesnew) iAntopenGLESLIB.Lookup(1);
    		g_DSARenderer = esnew( iGc, iWindow, aScreenSize, iSettings.iShowFPS, iSettings.iScreenMode );
    		}
    	}
    
    iInterfaceSelector = CRemConInterfaceSelector::NewL();
    iCoreTarget = CRemConCoreApiTarget::NewL(*iInterfaceSelector, *this);
    iInterfaceSelector->OpenTargetL();
    
    iResponse = CAntRemConCoreKeyResponse::NewL( iCoreTarget );
    audioEnabled = EFalse;
    iTimer = CSnesTimer::NewL( *this );
    
}

void CAntSnesController::LoadRom( TDesC8& aFileName )
{
DEBUGPRINT(_L("Load ROM)"));
    TRACER("void CAntSnesController::LoadRom(TDesC8& aFileName)") 
    if( iRomLoaded )
    	saveLoadGame(0, 7); //save state
    
	if( !iInitialized )
		{
		RProcess myProcess;
		myProcess.SetPriority(EPriorityForeground);
		myProcess.Close();
	
		MainInit();
		User::CompressAllHeaps();
		User::Heap().Compress();
		iInitialized = ETrue;
		if (!S9xGraphicsInit()) 
			{
			 DEBUGPRINT(_L("!S9xGraphicsInit()"));
			 MainExit();
			}
		}

	else
		{
		iTimer->Cancel();
		iPaused = ETrue;
		}
	//copy the filename
	TInt length = aFileName.Length();
	HBufC8* buffer = HBufC8::NewLC(length);
	buffer->Des().Copy(aFileName);
    char* str = new(ELeave) char[length+ 1];
    Mem::Copy(str, buffer->Ptr(),length);
    str[length] = '\0';
	
    S9xReset();
    
	User::Heap().Compress();
	
    //Load rom
	Memory.LoadROM(str);
	CleanupStack::PopAndDestroy( buffer );
	free(str);//free memory from filename

	iFrameTime = Settings.PAL ? KPALFrameTime:KNTSCFrameTime;
	
	Settings.FrameTime = Settings.PAL?Settings.FrameTimePAL:Settings.FrameTimeNTSC;
	Memory.ROMFramesPerSecond = Settings.PAL?50:60;
	
	g_DSARenderer->SetPal( Settings.PAL );
	
	//apu executing
	if( iSettings.iAudioOn )
		{
		S9xSetSoundMute (FALSE);
		
		if( iSettings.iEnableSpeedHack )
			CPU.APU_APUExecuting = Settings.APUEnabled = 3;
		else
			CPU.APU_APUExecuting = Settings.APUEnabled = 1;
		//if sound is on
		Settings.SoundPlaybackRate = iSettings.iSampleRate;
		Settings.SoundSync = FALSE;
		Settings.SixteenBitSound=true;
		Settings.Stereo= iSettings.iStereo;
		iSampleCount=Settings.SoundPlaybackRate/(Settings.PAL?50:60); //if pal, then 50
		iTargetFPS = Settings.PAL?50:60;
		if (Settings.Stereo)
			iSampleCount = iSampleCount * 2;
		so.stereo = Settings.Stereo;
		so.playback_rate = Settings.SoundPlaybackRate;
		unsigned int frame_limit = (Settings.PAL?50:60);
		g_samplecount = iSampleCount;
		//Create audio

		
		if( g_GameAudio )
			{
			delete g_GameAudio;
			g_GameAudio = NULL;
			}
		S9xSetPlaybackRate(so.playback_rate);
		
		
		g_GameAudio = CAntAudio::NewL(so.playback_rate, so.stereo, iSampleCount, iSettings.iVolume, this );
		g_GameAudio->Reset();
		TInt err;
		CActiveScheduler::RunIfReady( err, CActive::EPriorityStandard);
	
		}
	else
		CPU.APU_APUExecuting = Settings.APUEnabled = 0;
	
    saveLoadGame(1, 7); //load state
    
    S9xReset();
	iStarttime.HomeTime(); 
	iFrames = 0;
	iRomLoaded = ETrue;
	DEBUGPRINT(_L("ROM LOADED)"));
}
void CAntSnesController::SaveStateL( TInt aState )
	{
    TRACER("void CAntSnesController::SaveStateL(TInt aState)")
	if( !iRomLoaded )
		return;
	User::LeaveIfError(saveLoadGame(0, aState));
	}

void CAntSnesController::LoadStateL( TInt aState )
	{
    TRACER("void CAntSnesController::LoadStateL(TInt aState)")
	if( !iRomLoaded )
		return;
	User::LeaveIfError(saveLoadGame(1, aState));
	}

void CAntSnesController::ResetGame()
	{
    TRACER("void CAntSnesController::ResetGame()")
	if( !iRomLoaded )
		return;
	
	S9xReset();
	
	}	

void CAntSnesController::UpdateRunTimeSettings( TAntSettings aSettings )
	{
    TRACER("void CAntSnesController::UpdateRunTimeSettings(TAntSettings aSettings)")
	//update keys
	for(TInt i=4; i<12; i++)
		{
		iSettings.iScanKeyTable[i] = aSettings.iScanKeyTable[i];
		}
	g_DSARenderer->SetShowFPS( aSettings.iShowFPS );
	iSettings.iFrameSkip = aSettings.iFrameSkip;
	}

TInt CAntSnesController::UpdateRenderer( TScreenRenderer aRenderer, TScreenMode aScreenMode, TSize aScreenSize, RWindow& aWindow  )
	{
    TRACER("TInt CAntSnesController::UpdateRenderer(TScreenRenderer aRenderer, TScreenMode aScreenMode, TSize aScreenSize, RWindow& aWindow)")
	iWindow = aWindow;
	if( g_DSARenderer )
		{
		delete g_DSARenderer;
		g_DSARenderer = NULL;
		}
	
	iSettings.iRenderer = aRenderer;
	iSettings.iScreenMode = aScreenMode;
	if( iSettings.iRenderer == EDSA )
	    	{
	    	g_DSARenderer = CAntDSARenderer::NewL( iGc, iWindow, aScreenSize, iSettings.iShowFPS, iSettings.iScreenMode );
	    	}
#ifndef __S60_50__
	else if( iSettings.iRenderer == EOpenGLES )
		{
		TInt err = iAntopenGLESLIB.Load( KOPENGLESLIB );
		if( !err )
			{
			_angelesnew esnew;
			esnew = (_angelesnew) iAntopenGLESLIB.Lookup(1);
			g_DSARenderer = esnew( iGc, iWindow, aScreenSize, iSettings.iShowFPS, iSettings.iScreenMode );
			}
		}	
#endif
	}

TInt CAntSnesController::UpdateAudioSettings( TBool aAudioOn, TBool aEnableSpeedHack, TInt aSampleRate,
							TBool aStereo, TInt aVolume)
	{
    TRACER("TInt CAntSnesController::UpdateAudioSettings(TBool aAudioOn, TBool aEnableSpeedHack, TInt aSampleRate,							TBool aStereo, TInt aVolume)")
	
	iSettings.iAudioOn = aAudioOn;
	iSettings.iEnableSpeedHack = aEnableSpeedHack;
	iSettings.iSampleRate = aSampleRate;
	iSettings.iShowFPS = aStereo;
	iSettings.iVolume = aVolume;
	//apu executing
	if( iSettings.iAudioOn )
		{
		if( iSettings.iEnableSpeedHack )
			CPU.APU_APUExecuting = Settings.APUEnabled = 3;
		else
			CPU.APU_APUExecuting = Settings.APUEnabled = 1;
		//if sound is on
		Settings.SoundPlaybackRate = iSettings.iSampleRate;
		Settings.SoundSync = FALSE;
		Settings.SixteenBitSound=true;
		Settings.Stereo= iSettings.iStereo;
		iSampleCount=Settings.SoundPlaybackRate/(Settings.PAL?50:60); //if pal, then 50
		iTargetFPS = Settings.PAL?50:60;
		if (Settings.Stereo)
			iSampleCount = iSampleCount * 2;
		so.stereo = Settings.Stereo;
		so.playback_rate = Settings.SoundPlaybackRate;
		unsigned int frame_limit = (Settings.PAL?50:60);
	
		//Create audio
		if( g_GameAudio )
			{
			delete g_GameAudio;
			g_GameAudio = NULL;
			}
		g_GameAudio = CAntAudio::NewL(so.playback_rate, so.stereo, iSampleCount, iSettings.iVolume, this );
		g_GameAudio->Reset();
		S9xSetSoundMute (FALSE);
		S9xSetPlaybackRate(so.playback_rate);
		}
	else
		CPU.APU_APUExecuting = Settings.APUEnabled = 0;
		
	}

void CAntSnesController::DrawText(const TDesC& aText, TPoint aPoint )
	{
    TRACER("void CAntSnesController::DrawText(const TDesC& aText, TPoint aPoint)")
	g_DSARenderer->DrawText( aText, aPoint);
	}

TInt CAntSnesController::DoSnesFrameL()
	{
    DEBUGPRINT(_L("!TInt CAntSnesController::DoSnesFrameL()"));
    if( iPaused )
        {
        // stop gametimer
        return EFalse;
        }
    TBool skip = EFalse;
    iEndTime.HomeTime();
	TTimeIntervalMicroSeconds time_passed = iEndTime.MicroSecondsFrom(iStarttime); 
	TInt64 fc = iFrames * iFrameTime;
	if( time_passed.Int64() >= fc )
		 skip = ETrue;
	if( time_passed > KSecondInMicroseconds )
		{
		if( iFrames < iTargetFPS )
			skip = ETrue;
		else
			{
			skip = EFalse;
			iStarttime.HomeTime();
			iFrames=0;
			//update fps
			g_DSARenderer->UpdateFPS( iFPS );
			
			iFPS = 0;
			}
		}
	
	if(iFrames == 15 )
		{
		User::ResetInactivityTime(); //keep the backlight on
		}
	
	if( !skip ) 
		{	
		IPPU.RenderThisFrame=TRUE;
		iFrames++;
		iFPS++;	
		}
	else
		{
		 IPPU.RenderThisFrame=FALSE;
		 iFrames++;
		}
	//see if we are going too fast
	if( time_passed.Int64() < (fc - iFrameTime) )
		{
		User::After( iFrameTime );
		}
	DEBUGPRINT(_L("mainloop"));
	S9xMainLoop();
	DEBUGPRINT(_L("mainloop done"));
	if( audioEnabled )
		{
		TInt err;
		audioOut = (signed short*) g_GameAudio->NextFrameL();	
		if(audioOut)
			{
			S9xMixSamplesO(audioOut, iSampleCount, 0);
			g_GameAudio->FrameMixed();			
			}
		CActiveScheduler::RunIfReady( err, CActive::EPriorityStandard);
		} 
    // continue gametimer
	  DEBUGPRINT(_L("continue timer"));
    return ETrue;
    
	}

TInt CAntSnesController::DoSnesFrameL(TInt aRenderFrame)
	{
    TRACER("TInt CAntSnesController::DoSnesFrameL(TInt aRenderFrame)")
	  if( iPaused )
	        {
	        // stop gametimer
	        return EFalse;
	        }
	    iEndTime.HomeTime();
		TTimeIntervalMicroSeconds time_passed = iEndTime.MicroSecondsFrom(iStarttime); 

		if( time_passed > KSecondInMicroseconds )
			{
			iStarttime.HomeTime();
			iFrames=0;
			//update fps
			g_DSARenderer->UpdateFPS( iFPS );
			
			iFPS = 0;
			}
		
		if(iFrames == 15 )
			{
			User::ResetInactivityTime(); //keep the backlight on
			}
		
		if( aRenderFrame ) 
			{	
			IPPU.RenderThisFrame=TRUE;
			iFrames++;
			iFPS++;	
			}
		else
			{
			 IPPU.RenderThisFrame=FALSE;
			 iFrames++;
			}
			
		S9xMainLoop();
		if( audioEnabled )
			{
			TInt err;
			audioOut = (signed short*) g_GameAudio->NextFrameL();	
			if(audioOut)
				{
				S9xMixSamplesO(audioOut, iSampleCount, 0);
				g_GameAudio->FrameMixed();				
				}
			CActiveScheduler::RunIfReady( err, CActive::EPriorityStandard);
			} 
		
	    // continue gametimer
	    return ETrue;
	    
	}

void CAntSnesController::AudioChannelOpened()
	{
	DEBUGPRINT(_L("Audio channel opened"));
	audioEnabled = ETrue;
	}
void CAntSnesController::Start()
	{
    TRACER("void CAntSnesController::Start()")
    if( !iPaused || !iRomLoaded ) 
    	return;
    DEBUGPRINT(_L("Start)"));
    iPaused = EFalse;
    iStarttime.HomeTime();
    iTimer->Start( iSettings.iFrameSkip);
	}

void CAntSnesController::Stop()
	{
    TRACER("void CAntSnesController::Stop()")
    if( iPaused || !iRomLoaded )
        return;
    DEBUGPRINT(_L("Stop)"));
    JoyPad = 0;
    iPaused = ETrue;
    iTimer->Cancel();
	}

/*
 * Receive Multimeidakey events such as play,stop,pause,forward and backward
 * */
void CAntSnesController::MrccatoCommand(TRemConCoreApiOperationId aOperationId, 
	TRemConCoreApiButtonAction aButtonAct)
	{
    TRACER("void CAntSnesController::MrccatoCommand(TRemConCoreApiOperationId aOperationId, 	TRemConCoreApiButtonAction aButtonAct)")
	TRequestStatus status;
       switch( aOperationId )
       {
       case ERemConCoreApiPausePlayFunction:
           {
           switch (aButtonAct)
               {
               case ERemConCoreApiButtonPress:
                   // Play/Pause button pressed
            	   JoyPad |= SNES_A_MASK;
                   break;
               case ERemConCoreApiButtonRelease:
            	   JoyPad &= ~SNES_A_MASK;
                   // Play/Pause button released
                   break;
               case ERemConCoreApiButtonClick:
            	   JoyPad |= SNES_A_MASK;
            	   JoyPadClicks |= SNES_A_MASK;
                   // Play/Pause button clicked
                   break;
               default:
                   // Play/Pause unknown action
                   break;
               }                               
           break;
           }   
         
       case ERemConCoreApiStop:
           {
           switch (aButtonAct)
               {
        	   case ERemConCoreApiButtonPress:
        		   JoyPad |= SNES_B_MASK;  
                  break;
               case ERemConCoreApiButtonRelease:
            	   JoyPad &= ~SNES_B_MASK;
                  break;
               case ERemConCoreApiButtonClick:
            	   JoyPad |= SNES_B_MASK;  
            	   JoyPadClicks |= SNES_B_MASK;
                   break;   
               default:
                     
                break; 
               // for possible actions
               }
           break;
           }
           
       case ERemConCoreApiRewind:
           {
           switch (aButtonAct)
               {
        	   case ERemConCoreApiButtonPress:
        		   JoyPad |=  SNES_X_MASK;         
                  break;
               case ERemConCoreApiButtonRelease:
            	   JoyPad &= ~SNES_X_MASK;
                  break;
               case ERemConCoreApiButtonClick:
              	   JoyPad |= SNES_X_MASK;
              	   JoyPadClicks |= SNES_X_MASK;
               default:
                     
                break; 
               // see above for possible actions
               }
           break;
           }    
       case ERemConCoreApiFastForward:
           {
           switch (aButtonAct)
               {
        	   case ERemConCoreApiButtonPress:
        		   JoyPad |= SNES_Y_MASK;       
                  break;
               case ERemConCoreApiButtonRelease:
            	   JoyPad &= ~SNES_Y_MASK;
                  break;
               case ERemConCoreApiButtonClick:
              	   JoyPad |= SNES_Y_MASK;
              	   JoyPadClicks |= SNES_Y_MASK;
               default:
                     
                break; 
               // see above for possible actions
               }
           break;
           }      
       case ERemConCoreApiVolumeUp:
           {   
           switch (aButtonAct)
               {
        	   case ERemConCoreApiButtonPress:
        		   JoyPad |= SNES_SELECT_MASK;         
                  break;
               case ERemConCoreApiButtonRelease:
            	   JoyPad &= ~SNES_SELECT_MASK;
                  break;
               case ERemConCoreApiButtonClick:
              	   JoyPad |= SNES_SELECT_MASK;
              	   JoyPadClicks |= SNES_SELECT_MASK;
               default:
                     
                break; 
               // see above for possible actions
               }
           break;
           }       
       case ERemConCoreApiVolumeDown:
           {
           switch (aButtonAct)
               {
        	   case ERemConCoreApiButtonPress:
        		   JoyPad |= SNES_START_MASK;     
                  break;
               case ERemConCoreApiButtonRelease:
            	   JoyPad &= ~SNES_START_MASK;
                  break;
               case ERemConCoreApiButtonClick:
              	   JoyPad |= SNES_START_MASK;
              	   JoyPadClicks |= SNES_START_MASK;
               default:
                     
                break; 
               // see above for possible actions
               }
           break;
           }  
       case ERemConCoreApiBackward:
           {
           switch (aButtonAct)
               {
        	   case ERemConCoreApiButtonPress:
        		   JoyPad |=  SNES_X_MASK;         
                  break;
               case ERemConCoreApiButtonRelease:
            	   JoyPad &= ~SNES_X_MASK;
                  break;
               case ERemConCoreApiButtonClick:
              	   JoyPad |= SNES_X_MASK;
              	   JoyPadClicks |= SNES_X_MASK;
               default:
                     
                break; 
               // see above for possible actions
               }
           break;
           }       
       case ERemConCoreApiForward: //TODO: fix this
           {
           switch (aButtonAct)
               {
        	   case ERemConCoreApiButtonPress:
        		   JoyPad |= SNES_Y_MASK;       
                  break;
               case ERemConCoreApiButtonRelease:
            	   JoyPad &= ~SNES_Y_MASK;
                  break;
               case ERemConCoreApiButtonClick:
              	   JoyPad |= SNES_Y_MASK;
              	   JoyPadClicks |= SNES_Y_MASK;
               default:
                     
                break; 
               // see above for possible actions
               }
           break;
           }
       default:
           break;
       }
       //complete key event
       iResponse->CompleteMediaKeyEvent( aOperationId );
   }
void CAntSnesController::MrccatoPlay(TRemConCoreApiPlaybackSpeed aSpeed, 
	TRemConCoreApiButtonAction aButtonAct)
	{
    TRACER("void CAntSnesController::MrccatoPlay(TRemConCoreApiPlaybackSpeed aSpeed, 	TRemConCoreApiButtonAction aButtonAct)")
	iResponse->CompleteMediaKeyEvent( ERemConCoreApiPlay );
	}

void CAntSnesController::MrccatoTuneFunction(TBool aTwoPart, 
	TUint aMajorChannel, 
	TUint aMinorChannel,
	TRemConCoreApiButtonAction aButtonAct)
	{
    TRACER("void CAntSnesController::MrccatoTuneFunction(TBool aTwoPart, 	TUint aMajorChannel, 	TUint aMinorChannel,	TRemConCoreApiButtonAction aButtonAct)")
	iResponse->CompleteMediaKeyEvent( ERemConCoreApiTuneFunction );
	}

void CAntSnesController::MrccatoSelectDiskFunction(TUint aDisk,
	TRemConCoreApiButtonAction aButtonAct)
	{
    TRACER("void CAntSnesController::MrccatoSelectDiskFunction(TUint aDisk,	TRemConCoreApiButtonAction aButtonAct)")
	iResponse->CompleteMediaKeyEvent( ERemConCoreApiSelectDiskFunction );
	}

void CAntSnesController::MrccatoSelectAvInputFunction(TUint8 aAvInputSignalNumber,
	TRemConCoreApiButtonAction aButtonAct)
	{
    TRACER("void CAntSnesController::MrccatoSelectAvInputFunction(TUint8 aAvInputSignalNumber,	TRemConCoreApiButtonAction aButtonAct)")
	iResponse->CompleteMediaKeyEvent( ERemConCoreApiSelectAvInputFunction );
	}

void CAntSnesController::MrccatoSelectAudioInputFunction(TUint8 aAudioInputSignalNumber,
	TRemConCoreApiButtonAction aButtonAct)
	{
    TRACER("void CAntSnesController::MrccatoSelectAudioInputFunction(TUint8 aAudioInputSignalNumber,	TRemConCoreApiButtonAction aButtonAct)")
	iResponse->CompleteMediaKeyEvent( ERemConCoreApiSelectAudioInputFunction );
	}

void CAntSnesController::KeyEvent( const TKeyEvent& aKeyEvent,TEventCode aType )
{
    TRACER("void CAntSnesController::KeyEvent(const TKeyEvent& aKeyEvent,TEventCode aType)")
DEBUGPRINT(_L("KeyEvent"));
	TInt c=aKeyEvent.iScanCode;

	if( aType == EEventKeyDown )
		{
		for(TInt i=0;i<12;i++)
			{
			if(c==iSettings.iScanKeyTable[i])
				{
				JoyPad |= KAntKeyTable[i];
				break;
				}
			}
		}
	if(aType == EEventKeyUp)
		{
		for(TInt i=0;i<12;i++)
			{
			if(c==iSettings.iScanKeyTable[i])
				{
				JoyPad &= ~KAntKeyTable[i];
				break;
				}
			}
		}

	   
}


void CAntSnesController::VirtualKeyEvent( const TUint32 aKey, TBool isDown )
	{
	TUint32 key = (TUint32) aKey; 
	if( isDown )
		{
		JoyPad |= aKey;
		}
	else
		{
		JoyPad &= ~aKey;
		}
	}

void MainInit()
{
	DumpMemInfo();
	DEBUGPRINT(_L("\r\n\r\nstarting.."));

	// try to start emu
	ZeroMemory (&Settings, sizeof (Settings));

	Settings.SoundBufferSize = 0;
	Settings.JoystickEnabled = FALSE;
	Settings.CyclesPercentage = 100;
	Settings.DisableSoundEcho = FALSE;
	Settings.APUEnabled = FALSE;
	Settings.H_Max = SNES_CYCLES_PER_SCANLINE;
	Settings.SkipFrames = AUTO_FRAMERATE;
	Settings.Shutdown = Settings.ShutdownMaster = TRUE;
	Settings.FrameTimePAL = KPALFrameTime;//20;
	Settings.FrameTimeNTSC = KNTSCFrameTime;//17;
	Settings.FrameTime = Settings.FrameTimeNTSC;
	Settings.DisableSampleCaching = FALSE;
	Settings.DisableMasterVolume = FALSE;
	Settings.Mouse = FALSE;
	Settings.SuperScope = FALSE;
	Settings.MultiPlayer5 = FALSE;
	//Settings.ControllerOption = SNES_MULTIPLAYER5;
	Settings.ControllerOption = 0;
	Settings.ForceTransparency = TRUE;
	Settings.ForceNoTransparency = FALSE;
	Settings.Transparency = TRUE;
	Settings.SixteenBit = TRUE;
	Settings.SupportHiRes = FALSE;
	Settings.NetPlay = FALSE;
	Settings.ServerName [0] = 0;
	Settings.AutoSaveDelay = 30;
	Settings.ApplyCheats = FALSE;
	Settings.TurboMode = FALSE;
	Settings.TurboSkipFrames = 15;
	//Settings.NoPatch = true;
	Settings.HBlankStart = (256 * Settings.H_Max) / SNES_HCOUNTER_MAX;
	// sound
	Settings.SoundSync = FALSE;
	Settings.SixteenBitSound = TRUE;
	Settings.SoundPlaybackRate = 22050;
	
	Settings.os9x_hack = FALSE; //AUDIO_ENABLED
	GFX.Pitch = 256 * 2;
	GFX.RealPitch = 256 * 2;
	GFX.Screen = (uint8 *)malloc(256*240*2);
	
	GFX.SubScreen = (uint8 *)malloc(GFX.RealPitch * 240 * 2); 
	GFX.ZBuffer =  (uint8 *)malloc(GFX.RealPitch * 240 * 2); 
	GFX.SubZBuffer = (uint8 *)malloc(GFX.RealPitch * 240 * 2);
	
	GFX.Delta = (GFX.SubScreen - GFX.Screen) >> 1;
	GFX.PPL = GFX.Pitch >> 1;
	GFX.PPLx2 = GFX.Pitch;
	GFX.ZPitch = GFX.Pitch >> 1;
	
	if(!GFX.Screen || !GFX.SubScreen || !GFX.ZBuffer) { //  || !GFX.SubZBuffer
		 DEBUGPRINT(_L("OOM: display buffers"));
		 MainExit();
	}

	DumpMemInfo();
	DEBUGPRINT(_L("Memory.Init()"));
	if (!Memory.Init()) {
		 DEBUGPRINT(_L("!Memory.Init()"));
		 MainExit();
	}
	
	
	if (!S9xInitAPU()) {
		 DEBUGPRINT(_L("!S9xInitAPU()"));
		 MainExit();
	}
	
	S9xInitSound();
}

// does not return
void MainExit()
{
DEBUGPRINT(_L("MainExit"));
	S9xSetSoundMute(TRUE);
	Memory.Deinit();
	S9xDeinitAPU();
	S9xGraphicsDeinit();

	// gfx buffers
	if(GFX.Screen)     free(GFX.Screen);
	if(GFX.SubScreen)  free(GFX.SubScreen);
	if(GFX.ZBuffer)    free(GFX.ZBuffer);
	if(GFX.SubZBuffer )free(GFX.SubZBuffer );
	
}
	
extern "C" bool8 S9xInitUpdate ()
{	
DEBUGPRINT(_L("Init Update"));
	return true;		
}

extern "C" bool8 S9xDeinitUpdate (int Width, int Height, bool8 a)
{
DEBUGPRINT(_L("S9xDeinitUpdate"));
	g_DSARenderer->PutS9xFrame( GFX.Screen );
	return true;
}

extern "C" uint32 S9xReadJoypad (int which1)
{
DEBUGPRINT(_L("S9xReadJoypad"));
	
	if(which1) return 0;
	uint32 temp;
	temp = JoyPad;
	if( JoyPadClicks )
		{
		JoyPad &= ~JoyPadClicks;
		JoyPadClicks = 0;
		}
	return temp;
}

// remaining s9x stuff
extern "C" void S9xExtraUsage ()
{
}

extern "C" void S9xParseArg (char **argv, int &index, int argc)
{	
}

extern "C" void S9xMessage (int /* type */, int /* number */, const char *message)
{
	DEBUGPRINT(_L("WE HAVE A MESSAGE"));
}

extern "C" void S9xLoadSDD1Data (void)
{
	Settings.SDD1Pack=TRUE;
	Memory.FreeSDD1Data();
	
	//TODO: now what?
	Settings.SDD1Pack = FALSE;
}

extern "C" void S9xGenerateSound (void)
{
DEBUGPRINT(_L("S9xGenerateSound"));
	S9xMessage (0,0,"generate sound");
	return;
}

extern "C" void S9xSetPalette (void)
{
	//S9xMessage (0,0,"set palette");
}

extern "C" const char *S9xGetFilename (const char *ex) // ex is like ".srm"
{
DEBUGPRINT(_L("S9xGetFilename"));
	static char filename [PATH_MAX];
	char *p;

	strcpy (filename, Memory.ROMFilename);
	for(p = filename+strlen(filename)-1; p > filename+3; p--)
		if(*p == '.' || *p == '\\') break;
	strcpy(p, ex);

	return filename;
}

extern "C" bool8 S9xReadMousePosition (int /* which1 */, int &/* x */, int & /* y */, uint32 & /* buttons */)
{
DEBUGPRINT(_L("S9xReadMousePosition"));
	S9xMessage (0,0,"read mouse");
	return (FALSE);
}

extern "C" bool8 S9xReadSuperScopePosition (int & /* x */, int & /* y */, uint32 & /* buttons */)
{
DEBUGPRINT(_L("S9xReadSuperScopePosition"));
	S9xMessage (0,0,"read scope");
	return (FALSE);
}

extern "C" const char *S9xGetFilenameInc (const char *e)
{
DEBUGPRINT(_L("S9xGetFilenameInc"));
	S9xMessage (0,0,"get filename inc");
	return e;
}

extern "C" const char *S9xBasename (const char *f)
{
DEBUGPRINT(_L("S9xBasename"));
	const char *p;

	S9xMessage (0,0,"s9x base name");

	if ((p = strrchr (f, '/')) != NULL || (p = strrchr (f, '\\')) != NULL)
		return (p + 1);

	return (f);
}

extern "C" void S9xSyncSpeed(void)
{
DEBUGPRINT(_L("S9xSyncSpeed"));
	//S9xMessage (0,0,"sync speed");
}


int yo_rand(void)
{
	static int yo_rand_val=0;
	return ++yo_rand_val;
}

void S9xExit ()
{
}

void S9xAutoSaveSRAM (void)
{
	Memory.SaveSRAM(S9xGetFilename (".srm"));
}

bool8 S9xOpenSoundDevice (int mode, bool8 stereo, int buffer_size)
{
	return TRUE;
}


///////////////////////
// save stuff

int  (*statef_open)(const char *fname, const char *mode);
int  (*statef_read)(void *p, int l);
int  (*statef_write)(void *p, int l);
void (*statef_close)();
static gzFile state_gzfile = 0;
static FILE  *state_file = 0;

int state_gzip_open(const char *fname, const char *mode)
{
	state_gzfile = gzopen(fname, mode);
	if(state_gzfile && strchr(mode, 'w'))
		gzsetparams(state_gzfile, 9, Z_DEFAULT_STRATEGY);
	return (int) state_gzfile;
}

int state_gzip_read(void *p, int l)
{
	return gzread(state_gzfile, p, l);
}

int state_gzip_write(void *p, int l)
{
	return gzwrite(state_gzfile, p, l);
}

void state_gzip_close()
{
	gzclose(state_gzfile);
}

int state_unc_open(const char *fname, const char *mode)
{
	state_file = fopen(fname, mode);
	return (int) state_file;
}

int state_unc_read(void *p, int l)
{
	return fread(p, 1, l, state_file);
}

int state_unc_write(void *p, int l)
{
	return fwrite(p, 1, l, state_file);
}

void state_unc_close()
{
	fclose(state_file);
}


int stateLoad( int slot )
{
DEBUGPRINT(_L("StateLoad"));
	int res = 0;
	char ext[6];
	
	switch( slot )
		{
		case 0:
			strcpy(ext,".sst");
			break;
		case 1:
			strcpy(ext,"sst");
			break;
		case 2:
			strcpy(ext,"2.sst");
			break;
		case 3:
			strcpy(ext,"3.sst");
			break;
		case 4:
			strcpy(ext,"4.sst");
			break;
		case 7:
			strcpy(ext,"7.sst");
			break;
		}
	
/*
	if(currentConfig.iOpt & 4) { // gzip saves
		statef_open  = state_gzip_open;
		statef_read  = state_gzip_read;
		statef_write = state_gzip_write;
		statef_close = state_gzip_close;
		res = S9xUnfreezeGame(S9xGetFilename(".sst.gz"));
	}*/

	if(!res) { // gzip failed or was disabled
		statef_open  = state_unc_open;
		statef_read  = state_unc_read;
		statef_write = state_unc_write;
		statef_close = state_unc_close;
		res = S9xUnfreezeGame(S9xGetFilename(ext));
	}

	return !res;
}


int stateSave( int slot )
{
DEBUGPRINT(_L("StateSave"));
	char ext[6];
	
	switch( slot )
		{
		case 0:
			strcpy(ext,".sst");
			break;
		case 1:
			strcpy(ext,"sst");
			break;
		case 2:
			strcpy(ext,"2.sst");
			break;
		case 3:
			strcpy(ext,"3.sst");
			break;
		case 4:
			strcpy(ext,"4.sst");
			break;
		case 7:
			strcpy(ext,"7.sst");
			break;
		}

	/*if(currentConfig.iOpt & 4) { // gzip saves
		statef_open  = state_gzip_open;
		statef_read  = state_gzip_read;
		statef_write = state_gzip_write;
		statef_close = state_gzip_close;
		return !S9xFreezeGame(S9xGetFilename(".sst.gz"));
	} else {*/
		statef_open  = state_unc_open;
		statef_read  = state_unc_read;
		statef_write = state_unc_write;
		statef_close = state_unc_close;
		return !S9xFreezeGame(S9xGetFilename(ext));
	//}
}


int saveLoadGame(int load, int slot, int sram )
{
DEBUGPRINT(_L("SaveLoadGame"));
	int res = 0;

	if(sram) {
		if(load)
			 Memory.LoadSRAM(S9xGetFilename(".srm")); 
		else Memory.SaveSRAM(S9xGetFilename(".srm"));
	} else {
		if(load)
			 res = stateLoad(slot);
		else res = stateSave(slot);

		if(res) strcpy(noticeMsg, load ? "LOAD@FAILED" : "SAVE@FAILED");
		else    strcpy(noticeMsg, load ? "GAME@LOADED" : "GAME@SAVED");
		gettimeofday(&noticeMsgTime, 0);
	}

	if(!sram) gettimeofday(&noticeMsgTime, 0);
	return res;
}

void DumpMemInfo()
{
	TInt	ramSize, ramSizeFree;
	
	HAL::Get(HALData::EMemoryRAM, ramSize);
	HAL::Get(HALData::EMemoryRAMFree, ramSizeFree);

	DEBUGPRINT(_L("ram_free=%dKB/%dKB"), ramSizeFree/1024, ramSize/1024);
}

void _splitpath (const char *path, char *drive, char *dir, char *fname,
	char *ext)
{
	*drive = 0;

	char *slash = strrchr (path, '/');
	if (!slash)
		slash = strrchr (path, '\\');

	char *dot = strrchr (path, '.');

	if (dot && slash && dot < slash)
		dot = NULL;

	if (!slash)
	{
		strcpy (dir, "");
		strcpy (fname, path);
		if (dot)
		{
			*(fname + (dot - path)) = 0;
			strcpy (ext, dot + 1);
		}
		else
			strcpy (ext, "");
	}
	else
	{
		strcpy (dir, path);
		*(dir + (slash - path)) = 0;
		strcpy (fname, slash + 1);
		if (dot)
		{
			*(fname + (dot - slash) - 1) = 0;
			strcpy (ext, dot + 1);
		}
		else
			strcpy (ext, "");
	}
} 


void _makepath (char *path, const char *, const char *dir,
	const char *fname, const char *ext)
{
	if (dir && *dir)
	{
		strcpy (path, dir);
		strcat (path, "/");
	}
	else
	*path = 0;
	strcat (path, fname);
	if (ext && *ext)
	{
		strcat (path, ".");
		strcat (path, ext);
	}
}
// eof
