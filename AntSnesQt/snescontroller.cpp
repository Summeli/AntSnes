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
#include "snes9x.h"
#include "memmap.h"
#include "apu.h"
#include "gfx.h"
#include "soundux.h"
#include "snapshot.h"
#include "QGLBlitterWidget.h"
#include "symb_adaptation.h"
#include "debug.h"
#include <QDateTime>
#include <QWaitCondition>
#include <QMutex>

#define KPALFrameTime 20000
#define KNTSCFrameTime 16667

QTime fpsTime;
qint64 FRAMETIME;
QSnesController* g_controller;

int saveLoadGame(int load, int slot, int sram = 0);

QSnesController::QSnesController(QGLBlitterWidget* widget, CAntAudio* antaudio, MEmulatorAdaptation* adaptation) :
        iRomLoaded(false),
        iPaused(true),
        iInitialized(false),
        iAdaptation(adaptation)
{
    blitter = widget;
    audio = antaudio;
    g_controller = this;

    connect(this, SIGNAL(setPal(bool)), blitter, SLOT(setPAL(bool)));
}

void QSnesController::run()
{
    __DEBUG_IN

    __DEBUG2("QThread::currentThreadId():", QThread::currentThreadId());

    connect(this, SIGNAL(frameblit(int, int)), blitter, SLOT(render(int, int)), Qt::BlockingQueuedConnection);
    connect(this, SIGNAL(audioFrameReady()), audio, SLOT(FrameMixed()), Qt::BlockingQueuedConnection);

    gameLoop();

    disconnect(this, SIGNAL(frameblit(int, int)), blitter, SLOT(render(int, int)));
    disconnect(this, SIGNAL(audioFrameReady()), audio, SLOT(FrameMixed()));
    __DEBUG_OUT
}

QSnesController::~QSnesController()
{
    if (iRomLoaded)
        saveLoadGame(0, 7); //save state

    disconnect(this, SIGNAL(setPal(bool)), blitter, SLOT(setPAL(bool)));

    MainExit();
}

void QSnesController::defaultSettings()
{
    // try to start emu
    ZeroMemory (&Settings, sizeof (Settings));

    Settings.SoundBufferSize = 0;
    Settings.JoystickEnabled = FALSE;
    Settings.CyclesPercentage = 100;
    Settings.DisableSoundEcho = FALSE;
    Settings.APUEnabled = (iSettings.iEnableSpeedHack ? 3 : 1);
    Settings.H_Max = SNES_CYCLES_PER_SCANLINE;
    Settings.SkipFrames = AUTO_FRAMERATE;
    Settings.AutoMaxSkipFrames = 10;
    Settings.Shutdown = Settings.ShutdownMaster = TRUE;
    Settings.FrameTimePAL = KPALFrameTime;//20;
    Settings.FrameTimeNTSC = KNTSCFrameTime;//17;
    Settings.FrameTime = Settings.FrameTimeNTSC;
    Settings.DisableSampleCaching = FALSE;
    Settings.DisableMasterVolume = FALSE;
    Settings.Mouse = FALSE;
    Settings.SuperScope = FALSE;
    Settings.MultiPlayer5 = FALSE;
    Settings.ControllerOption = 0;
    Settings.ForceTransparency = TRUE;
    Settings.ForceNoTransparency = FALSE;
    Settings.Transparency = TRUE;
    Settings.SixteenBit = TRUE;
    Settings.SupportHiRes = FALSE;
    Settings.NetPlay = FALSE;
    Settings.ServerName[0] = 0;
    Settings.AutoSaveDelay = 30;
    Settings.ApplyCheats = FALSE;
    Settings.TurboMode = FALSE;
    Settings.TurboSkipFrames = 15;
    Settings.HBlankStart = (256 * Settings.H_Max) / SNES_HCOUNTER_MAX;
    Settings.SoundSync = FALSE;
    Settings.SixteenBitSound = TRUE;
    Settings.SoundPlaybackRate = 22050;
    Settings.os9x_hack = FALSE;
    Settings.SoundPlaybackRate = iSettings.iSampleRate;
    Settings.SoundSync = FALSE;
    Settings.SixteenBitSound = true;
    Settings.Stereo = iSettings.iStereo;
    iSampleCount = Settings.SoundPlaybackRate / (Settings.PAL ? 50 : 60);
    if (Settings.Stereo)
        iSampleCount = iSampleCount * 2;
    so.stereo = Settings.Stereo;
    so.playback_rate = Settings.SoundPlaybackRate;
    __DEBUG4("AudioSettings, samplerate, stereo, volume", iSettings.iSampleRate, iSettings.iStereo, iSettings.iVolume );
}

void QSnesController::updateAudioSettings()
{
    audio->setAudioSettings(iSettings.iSampleRate, iSettings.iStereo, iSampleCount, iSettings.iVolume);
    S9xSetPlaybackRate(so.playback_rate);
    audio->Reset();
    
    if (iSettings.iAudioOn)
    {
        S9xSetSoundMute(FALSE);
    }
    else
    {
        S9xSetSoundMute(TRUE);
    }
}

void QSnesController::LoadRom(QString aFileName, TAntSettings antSettings)
{
    __DEBUG_IN
    __DEBUG4("LOADROM, antsettings...", antSettings.iAudioOn, antSettings.iEnableSpeedHack, antSettings.iSampleRate )

    if (iRomLoaded)
        saveLoadGame(0, 7); //save state

    defaultSettings();
    
    if (!iInitialized)
    {
        setHighPriority();
        __DEBUG1("Initializing...");
        packHeap();
        GFX.Pitch = 256 * 2;
        GFX.RealPitch = 256 * 2;
        GFX.PPL = GFX.Pitch >> 1;
        GFX.PPLx2 = GFX.Pitch;
        GFX.ZPitch = GFX.Pitch >> 1;
        GFX.Screen = (uint8 *) malloc(GFX.RealPitch * 239);
        GFX.SubScreen = (uint8 *) malloc(GFX.RealPitch * 239);
        GFX.ZBuffer = (uint8 *) malloc(GFX.PPL * 239);
        GFX.SubZBuffer = (uint8 *) malloc(GFX.PPL * 239);
        GFX.Delta = (GFX.SubScreen - GFX.Screen) >> 1;

        if (!GFX.Screen || !GFX.SubScreen || !GFX.ZBuffer || !Memory.Init() || !S9xInitAPU() || !GFX.SubZBuffer )
        {
            MainExit();
        }
        S9xInitSound();
        __DEBUG1("init done.");
        iInitialized = true;
        if (!S9xGraphicsInit())
        {
            __DEBUG1("graphics init fail.");
            MainExit();
        }
    }

    packHeap();
    updateSettings(antSettings);

    __DEBUG2( "Load ROM", aFileName)
    Memory.LoadROM(aFileName.toStdString().c_str());
    saveLoadGame(1, 7);
    __DEBUG1( "File loaded");

    Settings.FrameTime = Settings.PAL ? Settings.FrameTimePAL : Settings.FrameTimeNTSC;
    Memory.ROMFramesPerSecond = Settings.PAL ? 50 : 60;
    emit(setPal(Settings.PAL));
   
    iRomLoaded = true;
    __DEBUG_OUT
}

void QSnesController::SaveStateL(int aState)
{
    __DEBUG_IN
    if (!iRomLoaded)
        return;
    saveLoadGame(0, aState);
    __DEBUG_OUT
}

void QSnesController::gameLoop()
{
    __DEBUG_IN

    short int* aframe;
    S9xSetSoundMute(FALSE);

    FRAMETIME = QDateTime::currentMSecsSinceEpoch() * 1000;
    fpsTime.start();
    
    while (!iPaused)
    {
        S9xMainLoop();

        if (iSettings.iAudioOn)
        {
            aframe = (short int*) audio->NextFrameL();
            if (aframe)
            {
                S9xMixSamples(aframe, iSampleCount);
                emit audioFrameReady();
            }
            else
            {
                __DEBUG1("audiobuffers owerflow");
            }
        }
    }
    __DEBUG_OUT
}

void usSleep(quint32 us)
{
    QMutex mutex;
    mutex.lock();
    QWaitCondition waitCondition;
    waitCondition.wait(&mutex, us / 1000);
    mutex.unlock();
}

extern "C" void S9xSyncSpeed(void)
{
    if (Settings.SkipFrames == AUTO_FRAMERATE) // Auto skip rate
    {
        IPPU.RenderThisFrame = TRUE;
        int skippedframes = 0;
        qint64 time = QDateTime::currentMSecsSinceEpoch() * 1000;

#ifdef _DEBUG
        RDebug::Printf( "S9xSyncSpeed - AUTO_FRAMERATE - Time: %d - FRAMETIME: %d", (quint32)(time), (quint32)FRAMETIME );
#endif
        if ((FRAMETIME - time) > Settings.FrameTime)
        {
            // Frame is supposed to be rendered more than one frame time ahead of now, wait one frame
#ifdef _DEBUG
            RDebug::Printf( "S9xSyncSpeed - Rendering too quickly, waiting for %d", Settings.FrameTime );
#endif
            usSleep(Settings.FrameTime);
        }
        else if (((time - FRAMETIME) > Settings.FrameTime) && (IPPU.SkippedFrames < Settings.AutoMaxSkipFrames))
        {
            // Frame is supposed to be rendered more than one frame time ago, skip this frame
#ifdef _DEBUG
            RDebug::Printf( "S9xSyncSpeed - Rendering too slowly, skipping frame - Skipped: %d", IPPU.SkippedFrames );
#endif
            skippedframes = IPPU.SkippedFrames + 1;
            IPPU.RenderThisFrame = FALSE;
        }
        else
        {
            // Frame is supposed to be rendered within one frame time from now or max skip counter reached, render it
#ifdef _DEBUG
            RDebug::Printf("S9xSyncSpeed - Within frame window or max skip count reached, rendering the frame");
#endif
        }

        IPPU.SkippedFrames = skippedframes;
        FRAMETIME += Settings.FrameTime;
    }
    else // Fixed skip rate
    {
        if (++IPPU.FrameSkip >= Settings.SkipFrames)
        {
            IPPU.FrameSkip = 0;
            IPPU.RenderThisFrame = TRUE;
            IPPU.SkippedFrames = 0;
        }
        else
        {
            IPPU.SkippedFrames++;
            IPPU.RenderThisFrame = FALSE;
        }
    }
}

extern "C" bool8 S9xDeinitUpdate(int Width, int Height, bool8 a)
{
    __DEBUG_IN
    //render frame here
    g_controller->renderSnesFrame(Width, Height);
    
    static int fpsCount = 0;
    fpsCount++;
    if ( fpsTime.elapsed() > 2000 ) 
    {
        float elapsed = fpsTime.restart() / 1000;
        float fps = fpsCount / elapsed;
        fpsCount = 0;
        RDebug::Printf("********** FPS: %2.1f **********", fps);
    }
    __DEBUG_OUT
    return true;
}

extern "C" uint32 S9xReadJoypad(int which1)
{
    __DEBUG_IN
    if (which1)
        return 0;

    uint32 joyPad = g_controller->readJoyPad();

    __DEBUG2("returning JoyPAD", joyPad );
    return joyPad;
}

void QSnesController::renderSnesFrame(int width, int height)
{
    __DEBUG_IN emit
    emit(frameblit(width, height));
    __DEBUG_OUT
}

uint32 QSnesController::readJoyPad()
{
    __DEBUG_IN
    return iAdaptation->getSnesKeys();
    __DEBUG_OUT
}

void QSnesController::updateSettings(TAntSettings antSettings)
{
    __DEBUG_IN
    iSettings = antSettings;
    defaultSettings();
    updateAudioSettings();
    __DEBUG_OUT
}

void QSnesController::LoadStateL(int aState)
{
    __DEBUG_IN
    if (!iRomLoaded)
        return;
    saveLoadGame(1, aState);
    __DEBUG_OUT
}

void QSnesController::ResetGame()
{
    if (!iRomLoaded)
        return;

    S9xReset();
}

void QSnesController::Start()
{
    __DEBUG_IN

    if (!iPaused || !iRomLoaded)
        return;

    iPaused = false;

    //we don't want to start this thread again
    if (!isRunning())
        start(QThread::NormalPriority);
    __DEBUG_OUT
}

void QSnesController::Stop()
{
    __DEBUG_IN
    if (iPaused || !iRomLoaded)
        return;

    saveLoadGame(0, 7); //let's save
    iPaused = true;
    __DEBUG_OUT
}


// does not return
void QSnesController::MainExit()
{
    __DEBUG_IN
    iPaused = true;
    wait();
    S9xSetSoundMute(TRUE);
    Memory.Deinit();
    S9xDeinitAPU();
    S9xGraphicsDeinit();

    // gfx buffers
    if (GFX.Screen)
        free(GFX.Screen);
    if (GFX.SubScreen)
        free(GFX.SubScreen);
    if (GFX.ZBuffer)
        free(GFX.ZBuffer);
    if (GFX.SubZBuffer)
        free(GFX.SubZBuffer);
    __DEBUG_OUT
}















// remaining s9x stuff
extern "C" void S9xExtraUsage() {}
extern "C" void S9xParseArg(char **argv, int &index, int argc) {}
extern "C" void S9xMessage(int /* type */, int /* number */, const char *message) {}
extern "C" void S9xGenerateSound(void) {}
extern "C" void S9xSetPalette(void) {}
void S9xExit() {} 

extern "C" bool8 S9xInitUpdate()
{
    return true;
}

extern "C" void S9xLoadSDD1Data(void)
{
    Settings.SDD1Pack = TRUE;
    Memory.FreeSDD1Data();

    //TODO: now what?
    Settings.SDD1Pack = FALSE;
}


extern "C" const char *S9xGetFilename(const char *ex) // ex is like ".srm"
{
    static char filename[PATH_MAX];
    char *p;

    strcpy(filename, Memory.ROMFilename);
    for (p = filename + strlen(filename) - 1; p > filename + 3; p--)
        if (*p == '.' || *p == '\\')
            break;
    strcpy(p, ex);

    return filename;
}

extern "C" bool8 S9xReadMousePosition(int /* which1 */, int &/* x */,
        int & /* y */, uint32 & /* buttons */)
{
    return (FALSE);
}

extern "C" bool8 S9xReadSuperScopePosition(int & /* x */, int & /* y */,
        uint32 & /* buttons */)
{
    return (FALSE);
}

extern "C" const char *S9xGetFilenameInc(const char *e)
{
    return e;
}

extern "C" const char *S9xBasename(const char *f)
{
    const char *p;
    if ((p = strrchr(f, '/')) != NULL || (p = strrchr(f, '\\')) != NULL)
        return (p + 1);
    return (f);
}

int yo_rand(void)
{
    static int yo_rand_val = 0;
    return ++yo_rand_val;
}

void S9xAutoSaveSRAM(void)
{
    Memory.SaveSRAM(S9xGetFilename(".srm"));
}

bool8 S9xOpenSoundDevice(int mode, bool8 stereo, int buffer_size)
{
    return TRUE;
}

///////////////////////
// save stuff

int (*statef_open)(const char *fname, const char *mode);
int (*statef_read)(void *p, int l);
int (*statef_write)(void *p, int l);
void (*statef_close)();
//TODO: ADD ZIP SUPPORT!
//static gzFile state_gzfile = 0;
static FILE *state_file = 0;

int state_gzip_open(const char *fname, const char *mode)
{/*
 state_gzfile = gzopen(fname, mode);
 if(state_gzfile && strchr(mode, 'w'))
 gzsetparams(state_gzfile, 9, Z_DEFAULT_STRATEGY);
 return (int) state_gzfile;*/
    return 0;
}

int state_gzip_read(void *p, int l)
{
    //return gzread(state_gzfile, p, l);
    return 0;
}

int state_gzip_write(void *p, int l)
{
    //  return gzwrite(state_gzfile, p, l);
    return 0;
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

int stateLoad(int slot)
{
    int res = 0;
    char ext[6];

    switch (slot)
    {
        case 0:
            strcpy(ext, ".sst");
            break;
        case 1:
            strcpy(ext, "sst");
            break;
        case 2:
            strcpy(ext, "2.sst");
            break;
        case 3:
            strcpy(ext, "3.sst");
            break;
        case 4:
            strcpy(ext, "4.sst");
            break;
        case 7:
            strcpy(ext, "7.sst");
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

    if (!res)
    { // gzip failed or was disabled
        statef_open = state_unc_open;
        statef_read = state_unc_read;
        statef_write = state_unc_write;
        statef_close = state_unc_close;
        res = S9xUnfreezeGame(S9xGetFilename(ext));
    }

    return !res;
}

int stateSave(int slot)
{
    char ext[6];

    switch (slot)
    {
        case 0:
            strcpy(ext, ".sst");
            break;
        case 1:
            strcpy(ext, "sst");
            break;
        case 2:
            strcpy(ext, "2.sst");
            break;
        case 3:
            strcpy(ext, "3.sst");
            break;
        case 4:
            strcpy(ext, "4.sst");
            break;
        case 7:
            strcpy(ext, "7.sst");
            break;
    }

    /*if(currentConfig.iOpt & 4) { // gzip saves
     statef_open  = state_gzip_open;
     statef_read  = state_gzip_read;
     statef_write = state_gzip_write;
     statef_close = state_gzip_close;
     return !S9xFreezeGame(S9xGetFilename(".sst.gz"));
     } else {*/
    statef_open = state_unc_open;
    statef_read = state_unc_read;
    statef_write = state_unc_write;
    statef_close = state_unc_close;
    return !S9xFreezeGame(S9xGetFilename(ext));
    //}
}

int saveLoadGame(int load, int slot, int sram)
{
    int res = 0;

    if (sram)
    {
        if (load)
            Memory.LoadSRAM(S9xGetFilename(".srm"));
        else
            Memory.SaveSRAM(S9xGetFilename(".srm"));
    }
    else
    {
        if (load)
            res = stateLoad(slot);
        else
            res = stateSave(slot);
    }

    return res;
}

void _splitpath(const char *path, char *drive, char *dir, char *fname,
        char *ext)
{
    *drive = 0;

    char *slash = strrchr(path, '/');
    if (!slash)
        slash = strrchr(path, '\\');

    char *dot = strrchr(path, '.');

    if (dot && slash && dot < slash)
        dot = NULL;

    if (!slash)
    {
        strcpy(dir, "");
        strcpy(fname, path);
        if (dot)
        {
            *(fname + (dot - path)) = 0;
            strcpy(ext, dot + 1);
        }
        else
            strcpy(ext, "");
    }
    else
    {
        strcpy(dir, path);
        *(dir + (slash - path)) = 0;
        strcpy(fname, slash + 1);
        if (dot)
        {
            *(fname + (dot - slash) - 1) = 0;
            strcpy(ext, dot + 1);
        }
        else
            strcpy(ext, "");
    }
}

void _makepath(char *path, const char *, const char *dir, const char *fname,
        const char *ext)
{
    if (dir && *dir)
    {
        strcpy(path, dir);
        strcat(path, "/");
    }
    else
        *path = 0;
    strcat(path, fname);
    if (ext && *ext)
    {
        strcat(path, ".");
        strcat(path, ext);
    }
}

extern "C" bool8 S9xOpenSnapshotFile( const char *fname, bool8 read_only, STREAM *file )
{
    if ( read_only )
    {
        if ( (*file = fopen( fname, "rb" )) != NULL )
            return TRUE;
    }
    else
    {
        if ( (*file = fopen( fname, "wb" )) != NULL )
            return TRUE;
    }

    return FALSE;
}

extern "C" void S9xCloseSnapshotFile( STREAM file )
{
    fclose( file );
}
