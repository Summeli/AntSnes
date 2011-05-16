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
#ifndef EMUSETTINGS_H
#define EMUSETTINGS_H

#include <QtGui/QMainWindow>
#include "ui_emusettings.h"
#include "keyconfigdialog.h"
#include "audiosettings.h"
#include "AntSettings.h"

#include "qremotecontrolkeys.h"
#include "videosettings.h"
#include "controlsettings.h"
#include "aboutdialog.h"

class EmuSettings : public QMainWindow
{
    Q_OBJECT

    enum
    {
    	EEmptyWidget = 0,
    	EMainWidget = 1,
    	EAudioWidget = 2,
    	EVideoWidget = 3,
    	EKeyWidget = 4
    };
public:
    EmuSettings(QWidget *parent = 0);
    ~EmuSettings();

public:
    void setRemoteControl( QRemoteControlKeys* remote );
    
public slots:
    void loadROM();
    void keyConfig();
    void dpadSettings( int settings );
    void keyconfigDone();
    void exit();
    void resetButtonClicked();
    void continueClicked();
    void aboutClicked();
    void saveSlotIndexChanged( int index );
    
    //states
    void loadStateButtonClicked();
    void saveStateButtonClicked();
    
    //Audio Settings
    void showAudioSettings();
    void setAudioOn( int audioOn );
    void setSampleRate( int sampleRate );
    void setStereoOn( int stereoOn );
    void setVolume( int volume );
    void setSpeedHack(bool enable); 
    
    //Video Settings
    void showVideoSettings();
    void frameskip( int skip );
    void showFPS( bool showFPS );
    void stretch( int stretch );
    void buttonOpacity( int opacity );
    
    void showControlSettings();
    void closeAboutDialog();
signals:
    void LoadROM( QString rom, TAntSettings antSettings );
    void LoadState( int state );
    void SaveState( int state );
    void resetGame();
    void continueGame();
    void updateSettings( TAntSettings );
    
private:
    void hidecurrentWidget();
    void setDefaultSettings();
    void savecurrentSettings();
    void loadSettings();
    
private:
    Ui::EmuSettingsClass ui;
    keyconfigdialog* keydialog;
    AudioSettings* audiosettings;
    videosettings* antvideosettings;
    controlsettings* keysettings;
    aboutdialog* about;
    
    int currentWidget;
    bool romloaded;
 
    bool settingsChanged;
    TAntSettings antsettings;
    QRemoteControlKeys* remotecontrol;
};

#endif // EMUSETTINGS_H
