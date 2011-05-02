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
#ifndef SNESCONTROLLER_H_
#define SNESCONTROLLER_H_

#include <QObject>
#include <QThread>

#include "antsettings.h"

#include "QGLBlitterWidget.h"
#include "MEmulatorAdaptation.h"
#include "AntAudio.h"

class QSnesController : public QThread
    {
    Q_OBJECT
public:
    
    QSnesController( QGLBlitterWidget* widget, CAntAudio* antaudio, MEmulatorAdaptation* adaptation ); 
    
    virtual ~QSnesController();
    virtual void run();
  
public:
    void renderSnesFrame(int width, int height);
    uint32 readJoyPad();
    void updateSettings( TAntSettings antSettings );
    
public slots:
    
    /// starts updating enginet
    void Start();

    /// stops updating engine
    void Stop();
    
    void ResetGame();
    
    /**
     * Starts the Game Loop.
     *
     * @param aFileName A reference to the game object.
     */    
    void LoadRom( QString aFileName,  TAntSettings antSettings );
    
    void SaveStateL( int aState );
    void LoadStateL( int aState );
    
#ifdef ENABLE_AUDIO
    void audiocallback( QAudio::State state );
    void initAudio();
    void checkAudioDevices();

public slots:
   void audioStateChanged ( QAudio::State state );
   void audioNotify();
#endif
    
signals:
	void frameblit(int width, int height);
	void setPal( bool pal );
	void audioFrameReady();
	void resetAudio();
	
private:
    void gameLoop();
    void doLoadRom( QString aFileName, TAntSettings antSettings );
    void defaultSettings();
    void updateAudioSettings();
    void MainExit();
      
private: // Data
    bool iRomLoaded;
    bool iPaused;
    bool iInitialized;
    
    int iFrames;
    int iFPS;
    
    int iSampleCount;
    MEmulatorAdaptation* iAdaptation;
    CAntAudio* audio;
    TAntSettings iSettings;
    
    QString iSelectedROM;
    QGLBlitterWidget* blitter; //not owned
};

#endif /* SNESCONTROLLER_H_ */
