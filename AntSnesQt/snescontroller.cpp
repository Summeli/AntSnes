/* AntSnes
 *
 * Copyright (C) 2010 Summeli <summeli@summeli.fi>
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

#include "snescontroller.h"
// SNES
#include "snes9x.h"
#include "memmap.h"
#include "apu.h"
#include "gfx.h"
#include "soundux.h"
#include "snapshot.h"

#include "QBlitterWidget.h"
//TODO: ADD ZIP SUPPORT
//#include "zlib/gzio.h"
//#include <EZlib.h>
#include "symb_adaptation.h"
#include "debug.h"
//#include <e32std.h>
#include <QDateTime>

#define KSecondInMicroseconds   1000000
#define KPALFrameTime 20000
#define KNTSCFrameTime 16667

// mainloop and it's stuff
char fps_buff[24]; // fps count c string
struct timeval tval; // timing
static int thissec = 0, frames_done = 0, frames_shown = 0, frames_toskip = 0;
static int target_fps, target_frametime, too_fast;
//extern int emu_was_reset;
static int emu_cflags = 0; // emu control flags: reset_timing, saveload_pending, load
static int sndLen = 0;
#ifdef __STUPID_ANTAUDIO
static uint8* audioOut = 0;
#endif
static uint32 JoyPad;
static bool audioEnabled;
//to be removed
static char noticeMsg[64]; // notice msg to draw
static timeval noticeMsgTime = { 0, 0 }; // when started showing

void MainExit();
void MainInit();
void DumpMemInfo();
int saveLoadGame(int load, int slot, int sram=0 );

static int g_samplecount;

QSnesController* g_controller;

//c helper functions
unsigned long gp2x_timer_read(void);

QSnesController::QSnesController( QBlitterWidget* widget, CAntAudio* antaudio, MEmulatorAdaptation* adaptation )
    {
    blitter = widget;
    audio = antaudio;
	g_controller = this;
	
	connect(this, SIGNAL(setPal(bool)), blitter, SLOT(setPAL(bool)) );
	
    //in qt we have to set all object to default values..
    iRomLoaded = false;
    iInitialized = false;
    audioEnabled = false;
    iPaused = true;
    JoyPad = 0;
    iAdaptation = adaptation;
#ifndef __STUPID_ANTAUDIO
    audiobuf = NULL;
#endif
    }

void QSnesController::run()
    {
    __DEBUG_IN
    
    __DEBUG2("QThread::currentThreadId():", QThread::currentThreadId());
 
    
	connect(this, SIGNAL(frameblit()), blitter, SLOT(render()), 
			Qt::BlockingQueuedConnection );
	
	connect(this, SIGNAL(audioFrameReady()), audio, SLOT(FrameMixed()), 
			Qt::BlockingQueuedConnection );
	
	if( audioEnabled )
		{
#ifdef __STUPID_ANTAUDIO
		connect(this, SIGNAL(resetAudio()), audio, SLOT(Reset()), 
				Qt::BlockingQueuedConnection);
		emit(resetAudio());
#else
		connect(qaudio,SIGNAL(stateChanged(QAudio::State)),this, SLOT(finishedPlaying(QAudio::State)));
		audioOut = qaudio->start();
#endif
		}
    __DEBUG1("thread running");
    if( iSettings.iFrameSkip == 0 )
    	gameLoopAuto();
    else
    	gameLoopSkip(iSettings.iFrameSkip);
    
    if( audioEnabled )
    	{
#ifdef __STUPID_ANTAUDIO
		disconnect(this, SIGNAL(resetAudio()), audio, SLOT(reset()));
#else
		disconnect(qaudio,SIGNAL(stateChanged(QAudio::State)),this, SLOT(finishedPlaying(QAudio::State)));
#endif
    	}
    disconnect(this, SIGNAL(frameblit()), blitter, SLOT(render()) );
    disconnect(this, SIGNAL(audioFrameReady()), audio, SLOT(FrameMixed()) );
    __DEBUG_OUT
	
	
    }


QSnesController::~QSnesController()
{
    if( iRomLoaded )
        saveLoadGame(0, 7); //save state
    
    disconnect(this, SIGNAL(setPal(bool)), blitter, SLOT(setPAL(bool)) );
    
    MainExit();
}


void QSnesController::renderSnesFrame()
	{
	__DEBUG_IN
	emit( frameblit() );
	__DEBUG_OUT
	}

void QSnesController::readJoyPad()
	{
	__DEBUG_IN
	antKeyEvent event;
	while( iAdaptation->getKeyEvent(event) )
		{
		__DEBUG3("keyEvent received pressed: code", event.keyDown, event.key );
		if( event.keyDown )
			{
			JoyPad |= event.key;
			__DEBUG2("KeyDown, JoyPad", JoyPad );
			}
		else
			{
			JoyPad &= ~event.key;
			__DEBUG2("Key up, JoyPad", JoyPad );
			}
		}
	
	__DEBUG_OUT
	}

void QSnesController::updateSettings( TAntSettings antSettings )
	{
	__DEBUG_IN
	//here we can update all the required settings
	bool audioprv = audioEnabled;
	
	iSettings = antSettings;
	audioEnabled = antSettings.iAudioOn;
	if( audioprv && !antSettings.iAudioOn )
		{
		//shot down the audio
	    S9xSetSoundMute (TRUE);
		}
    if( audioEnabled )
        {
        S9xSetSoundMute (FALSE);
        
        if( iSettings.iEnableSpeedHack )
            CPU.APU_APUExecuting = Settings.APUEnabled = 3;
        else
            CPU.APU_APUExecuting = Settings.APUEnabled = 1;
        //if sound is on
        Settings.SoundPlaybackRate = antSettings.iSampleRate;
        Settings.SoundSync = FALSE;
        Settings.SixteenBitSound=true;
        Settings.Stereo= antSettings.iStereo;
        iSampleCount=Settings.SoundPlaybackRate/(Settings.PAL?50:60); //if pal, then 50
        iTargetFPS = Settings.PAL?50:60;
        if (Settings.Stereo)
            iSampleCount = iSampleCount * 2;
        so.stereo = Settings.Stereo;
        so.playback_rate = Settings.SoundPlaybackRate;
        unsigned int frame_limit = (Settings.PAL?50:60);
        g_samplecount = iSampleCount;
        //Create audio
        __DEBUG4("AudioSettings, samplerate, stereo, volume", antSettings.iSampleRate, antSettings.iStereo, antSettings.iVolume );
        audio->setAudioSettings( antSettings.iSampleRate, antSettings.iStereo, iSampleCount, antSettings.iVolume );
        
        S9xSetPlaybackRate(so.playback_rate);
        }
    
	__DEBUG_OUT
	}

void QSnesController::LoadRom( QString aFileName, TAntSettings antSettings )
{
__DEBUG_IN
	__DEBUG4("LOADROM, antsettings...", antSettings.iAudioOn, antSettings.iEnableSpeedHack, antSettings.iSampleRate )
	iSettings = antSettings;
	audioEnabled = antSettings.iAudioOn; 
    if( iRomLoaded )
        saveLoadGame(0, 7); //save state

    if( !iInitialized )
        {
        setHighPriority();
        __DEBUG1("Initializing...");
        packHeap();
        MainInit();
        packHeap();
        __DEBUG1("init done.");
        iInitialized = true;
        if (!S9xGraphicsInit()) 
            {
            __DEBUG1("graphics init fail.");
             MainExit();
            }
        }

    
    S9xReset();
    
    User::Heap().Compress();
    
    //Load rom
    __DEBUG2( "Load ROM", aFileName)
    Memory.LoadROM(aFileName.toStdString().c_str());
    __DEBUG1( "File loaded");
    
    Settings.FrameTime = Settings.PAL?Settings.FrameTimePAL:Settings.FrameTimeNTSC;
    Memory.ROMFramesPerSecond = Settings.PAL?50:60;
    
    iFrameTime = Settings.PAL ? KPALFrameTime:KNTSCFrameTime;
    
    emit( setPal(  Settings.PAL ) );
    
    //apu executing
    if( audioEnabled )
        {
#ifdef __STUPID_ANTAUDIO
        S9xSetSoundMute (FALSE);
        
        if( iSettings.iEnableSpeedHack )
            CPU.APU_APUExecuting = Settings.APUEnabled = 3;
        else
            CPU.APU_APUExecuting = Settings.APUEnabled = 1;
        //if sound is on
        Settings.SoundPlaybackRate = antSettings.iSampleRate;
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
        __DEBUG4("AudioSettings, samplerate, stereo, volume", antSettings.iSampleRate, antSettings.iStereo, antSettings.iVolume );
        audio->setAudioSettings( antSettings.iSampleRate, antSettings.iStereo, iSampleCount, antSettings.iVolume );
        
        S9xSetPlaybackRate(so.playback_rate);
#else
        S9xSetSoundMute (FALSE);
        
        if( iSettings.iEnableSpeedHack )
            CPU.APU_APUExecuting = Settings.APUEnabled = 3;
        else
            CPU.APU_APUExecuting = Settings.APUEnabled = 1;
        //if sound is on
        Settings.SoundPlaybackRate = antSettings.iSampleRate;
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
        __DEBUG4("AudioSettings, samplerate, stereo, volume", antSettings.iSampleRate, antSettings.iStereo, antSettings.iVolume );
        //audio->setAudioSettings( antSettings.iSampleRate, antSettings.iStereo, iSampleCount, antSettings.iVolume );

        audioformat.setFrequency(antSettings.iSampleRate);
        audioformat.setChannels(1 + (int) antSettings.iStereo);
        audioformat.setSampleSize(iSampleCount);
        audioformat.setCodec("audio/pcm");
        audioformat.setByteOrder(QAudioFormat::LittleEndian);
        audioformat.setSampleType(QAudioFormat::UnSignedInt);
  
        if( qaudio )
        	{
			delete qaudio;
			qaudio = NULL;
        	}
        if( audiobuf )
        	{
			free( audiobuf );
			audiobuf = NULL;
        	}
        qaudio = new QAudioOutput(audioformat, this);
        audiobuf = (quint8*) malloc( iSampleCount );
        S9xSetPlaybackRate(so.playback_rate);
#endif
        }
    else
        CPU.APU_APUExecuting = Settings.APUEnabled = 0;
    
    saveLoadGame(1, 7); //load state
    
     S9xReset();
     iRomLoaded = true;
__DEBUG_OUT
}
void QSnesController::SaveStateL( int aState )
    {
	__DEBUG_IN
    if( !iRomLoaded )
        return;
    int err = saveLoadGame(0, aState);
    __DEBUG_OUT
    }

void QSnesController::LoadStateL( int aState )
    {
	__DEBUG_IN
    if( !iRomLoaded )
        return;
    int err = saveLoadGame(1, aState);
    __DEBUG_OUT
    }

void QSnesController::ResetGame()
    {
    if( !iRomLoaded )
        return;
    
    S9xReset();
    
    }   

/*
 * This basically the mainloop
 * from Zodtdd's iphone port
 * */
void QSnesController::gameLoopAuto()
	{
	__DEBUG_IN
    unsigned long frameskip_counter = 0;
    unsigned long current_frameskip_value = 0;
  	unsigned long fps = 60;
  	unsigned long long last_screen_timestamp = 0;
  	unsigned long long last_frame_interval_timestamp = 0;
  	unsigned long long last_frame_value_timestamp = 0;
  	unsigned long interval_skipped_frames = 0;
  	unsigned long framecount = 0;
  	unsigned long frames_counted;
  	unsigned long skipped_frames = 0;
  	int aim=0, done=0, skip=0, Frames=0, tick=0, efps=0, SaveFrames=0;
  	unsigned long Timer=0;
  	unsigned long tickframe = 0;
  	unsigned long frame_ticks_total = 0;
  	const long frame_speed = Settings.FrameTime;
	int skipper = 0;
	int skipcount = 0;
	
    while(!iPaused)
        {
		unsigned long frame_ticks;
    
	   Timer= gp2x_timer_read();
	   frame_ticks = Timer - tickframe;
	   frame_ticks_total += frame_ticks;
	   tickframe = Timer;
	   Frames++;
	   if(((frame_speed*Frames) > frame_ticks_total))
		   {
		   //usleep(((frame_speed*Frames) - frame_ticks_total) * 1000);
	       //frame_ticks_total = (frame_speed*Frames);
	       skipper = 0;
	       IPPU.RenderThisFrame = TRUE;
		   }
	   else
		  {
		  skipper++;
		  if(skipper < 10)
			  {
			  skipcount++;
			  IPPU.RenderThisFrame=FALSE;
			  }
	     else
	    	 {
			 skipper = 0;
			 IPPU.RenderThisFrame=TRUE;
	    	 }
	     }

	   
	  if(Timer-tick>=(KSecondInMicroseconds))
		  {
		  fps=Frames;
		  Frames=0;
		  tick=Timer;
		  //sprintf(fps_display,"%d %d",fps, skipcount);
		  skipcount = 0;
		  frame_ticks_total = 0;
		  }
	  
		//IPPU.RenderThisFrame=TRUE;
        S9xMainLoop();
        if( audioEnabled )
            {

#ifdef __STUPID_ANTAUDIO
        
           audioOut = audio->NextFrameL();   
            if(audioOut)
                {
                S9xMixSamplesO(audioOut, iSampleCount, 0);
                emit(audioFrameReady());     
                }
#else
			S9xMixSamplesO(audiobuf, iSampleCount, 0);
			audioOut->write( (char*) audiobuf, iSampleCount );
#endif
			
            } 
            
    
        }
    __DEBUG_OUT
	}

void QSnesController::gameLoopSkip( int frameskip )
	{
	__DEBUG_IN
	bool renderframe;
	int counter = 0;
	int skip = 0;
	while( !iPaused )
		{
		if( !counter )
			{
		    counter = 30;
			skip = frameskip;
			}
	    if( skip )
	    	{
			IPPU.RenderThisFrame=FALSE;
	   		iFrames++;
	    	skip--;
	    	}
	    else
	    	{
			IPPU.RenderThisFrame=TRUE;
	    	iFrames++;
	    	iFPS++;	
	    	skip = frameskip;
	    	}
					
		S9xMainLoop();
		if( audioEnabled )
			{
#ifdef __STUPID_ANTAUDIO
			audioOut = audio->NextFrameL();   
			if(audioOut)
			  {
			  S9xMixSamplesO(audioOut, iSampleCount, 0);
			  emit(audioFrameReady());     
			   }
#else
			S9xMixSamplesO(audiobuf, iSampleCount, 0);
			audioOut->write( (char*) audiobuf, iSampleCount );
#endif
			 } 
		 counter--;
		}
	__DEBUG_OUT
	}

void QSnesController::Start()
    {
    __DEBUG_IN
    
    if( !iPaused || !iRomLoaded ) 
        return;
    
    iPaused = false;
    //we don't want to start this thread again
    if( !isRunning() )	
    	start( QThread::LowPriority );
    __DEBUG_OUT
    }

void QSnesController::Stop()
    {
    __DEBUG_IN
    if( iPaused || !iRomLoaded )
        return;
    
    saveLoadGame(0, 7); //let's save
    JoyPad = 0;
    iPaused = true;
    __DEBUG_OUT
    }
#ifndef __STUPID_ANTAUDIO
void QSnesController::finishedPlaying( QAudio::State audiostate )
	{
    __DEBUG_IN
    if(audiostate == QAudio::IdleState) {
      qaudio->stop();
      delete qaudio;
      qaudio = NULL;
    }

    __DEBUG_OUT
	}
#endif

void MainInit()
{
    DumpMemInfo();

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
         MainExit();
    }

    DumpMemInfo();
    if (!Memory.Init()) {
         MainExit();
    }
    
    
    if (!S9xInitAPU()) {
         MainExit();
    }
    
    S9xInitSound();
}

// does not return
void MainExit()
{
__DEBUG_IN
    S9xSetSoundMute(TRUE);
    Memory.Deinit();
    S9xDeinitAPU();
    S9xGraphicsDeinit();

    // gfx buffers
    if(GFX.Screen)     free(GFX.Screen);
    if(GFX.SubScreen)  free(GFX.SubScreen);
    if(GFX.ZBuffer)    free(GFX.ZBuffer);
    if(GFX.SubZBuffer )free(GFX.SubZBuffer );
__DEBUG_OUT
}
    
extern "C" bool8 S9xInitUpdate ()
{   
    return true;        
}

extern "C" bool8 S9xDeinitUpdate (int Width, int Height, bool8 a)
{
__DEBUG_IN
    //render frame here
	g_controller->renderSnesFrame();
__DEBUG_OUT
    return true;
}

extern "C" uint32 S9xReadJoypad (int which1)
{
__DEBUG_IN
    if(which1) return 0;

	g_controller->readJoyPad();
 
	__DEBUG2("returning JoyPAD", JoyPad );
    return JoyPad;
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
    S9xMessage (0,0,"generate sound");
    return;
}

extern "C" void S9xSetPalette (void)
{
    //S9xMessage (0,0,"set palette");
}

extern "C" const char *S9xGetFilename (const char *ex) // ex is like ".srm"
{
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
    S9xMessage (0,0,"read mouse");
    return (FALSE);
}

extern "C" bool8 S9xReadSuperScopePosition (int & /* x */, int & /* y */, uint32 & /* buttons */)
{
    S9xMessage (0,0,"read scope");
    return (FALSE);
}

extern "C" const char *S9xGetFilenameInc (const char *e)
{
    S9xMessage (0,0,"get filename inc");
    return e;
}

extern "C" const char *S9xBasename (const char *f)
{
    const char *p;

    S9xMessage (0,0,"s9x base name");

    if ((p = strrchr (f, '/')) != NULL || (p = strrchr (f, '\\')) != NULL)
        return (p + 1);

    return (f);
}

extern "C" void S9xSyncSpeed(void)
{
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
//TODO: ADD ZIP SUPPORT!
//static gzFile state_gzfile = 0;
static FILE  *state_file = 0;


int state_gzip_open(const char *fname, const char *mode)
{/*
    state_gzfile = gzopen(fname, mode);
    if(state_gzfile && strchr(mode, 'w'))
        gzsetparams(state_gzfile, 9, Z_DEFAULT_STRATEGY);
    return (int) state_gzfile;*/
}

int state_gzip_read(void *p, int l)
{
    //return gzread(state_gzfile, p, l);
}

int state_gzip_write(void *p, int l)
{
  //  return gzwrite(state_gzfile, p, l);
}

void state_gzip_close()
{
 //   gzclose(state_gzfile);
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
}

unsigned long gp2x_timer_read(void)
{
  // Once again another peice of direct hardware access bites the dust
  // the code below is broken in firmware 2.1.1 so I've replaced it with a
  // to a linux function which seems to work
  //return gp2x_memregl[0x0A00>>2]/gp2x_ticks_per_second;
  struct timeval tval; // timing
  
  gettimeofday(&tval, 0);
  //tval.tv_usec
  //tval.tv_sec
  return (tval.tv_sec*1000000)+tval.tv_usec;
}
