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

#include <QFileDialog>
#include <QString>
#include <QSettings>
#include <QDir>

#include "emusettings.h"
#include "debug.h"

#define KAntSettingsVersion 6

EmuSettings::EmuSettings(QWidget *parent)
    : QMainWindow(parent)
{
    loadSettings();

    ui.setupUi(this);
    showFullScreen();

    saveSlotIndexChanged(antsettings.iLastSlot);
    //int audioOn, int samplerte, int stereoOn, int volume, bool enablespeedhack, QWidget *parent
    //TODO: read settings
    audiosettings = new AudioSettings(antsettings.iAudioOn, antsettings.iSampleRate,
                                      antsettings.iStereo, antsettings.iVolume, antsettings.iEnableSpeedHack, this );
    audiosettings->setGeometry(QRect(0, 0, 640, 150));
    audiosettings->hide();

    antvideosettings =new videosettings( antsettings.iFrameSkip, antsettings.iShowFPS, this );
    antvideosettings->setGeometry(QRect(0, 0, 640, 150));
    antvideosettings->hide();

    keysettings =new controlsettings( antsettings.iScreenSettings, antsettings.iDPadSettings, this );
    keysettings->setGeometry(QRect(0, 0, 640, 150));
    keysettings->hide();

    currentWidget = EMainWidget;

    ui.saveSlotBox->setCurrentIndex(antsettings.iLastSlot);

    //connect buttons
    connect(ui.LoadButton, SIGNAL(clicked()), this, SLOT(loadROM()));
    connect(ui.audioButton, SIGNAL(clicked()), this, SLOT(showAudioSettings()));
    connect(ui.videoButton, SIGNAL(clicked()), this, SLOT(showVideoSettings()));
    connect(ui.controlsButton, SIGNAL(clicked()), this, SLOT(showControlSettings()));
    connect(ui.exitButton, SIGNAL(clicked()), this, SLOT(exit()));
    connect(ui.loadStateButton, SIGNAL(clicked()), this, SLOT(loadStateButtonClicked()));
    connect(ui.saveStateButton, SIGNAL(clicked()), this, SLOT(saveStateButtonClicked()));
    connect(ui.resetButton, SIGNAL(clicked()), this, SLOT(resetButtonClicked()));
    connect(ui.ContinueButton, SIGNAL(clicked()), this, SLOT(continueClicked()));
    connect(ui.aboutButton, SIGNAL(clicked()), this, SLOT(aboutClicked()));
    connect(ui.saveSlotBox, SIGNAL(currentIndexChanged(int)), this, SLOT(saveSlotIndexChanged(int)));

    //connect audio settins
    connect( audiosettings, SIGNAL(AudioOn(int)), this, SLOT( setAudioOn(int)));
    connect( audiosettings, SIGNAL(SampleRate(int)), this, SLOT( setSampleRate(int)));
    connect( audiosettings, SIGNAL(enableStereo(int)), this, SLOT( setStereoOn(int)));
    connect( audiosettings, SIGNAL(Volume(int)), this, SLOT( setVolume(int)));
    connect( audiosettings, SIGNAL(enableSpeedHack(bool)), this, SLOT( setSpeedHack(bool)));


    //connect video settings
    connect( antvideosettings, SIGNAL(frameskip(int)), this, SLOT( frameskip(int) ));
    connect( antvideosettings, SIGNAL(showFPS(bool)), this, SLOT( showFPS(bool) ));

    //connect control settings
    connect( keysettings, SIGNAL(runkeyconfig()), this, SLOT( keyConfig() ));
    connect( keysettings, SIGNAL(screensettings(int)), this, SLOT( screensettings(int) ));
    connect( keysettings, SIGNAL(dpadSettings(int)), this, SLOT( dpadSettings(int) ));

    romloaded = false;
    settingsChanged = false;
}

EmuSettings::~EmuSettings()
{
    savecurrentSettings();

    //delete all views
    delete keysettings;
    delete antvideosettings;
    delete audiosettings;
}

void EmuSettings::setRemoteControl( QRemoteControlKeys* remote )
{
    remotecontrol = remote;
}
void EmuSettings::loadROM()
{
    __DEBUG_IN
    savecurrentSettings();
    QDir dir(antsettings.iLastROM);
    QString rom = QFileDialog::getOpenFileName(this,
                               tr("Open File"),
                               dir.absolutePath(),
                               tr("ROMs (*.SMC *.smc *.zip *.fig *.swc *.sfc *.bin);;"));
    if( rom.isEmpty() )
        return;
    
    antsettings.iLastROM = rom;
    emit( LoadROM( rom,antsettings ));
    romloaded = true;
    __DEBUG_OUT
}

void EmuSettings::keyConfig()
{
    keydialog = new keyconfigdialog( this );
    connect(keydialog, SIGNAL(configDone()), this, SLOT(keyconfigDone()));
    remotecontrol->subscribeKeyEvent( keydialog );
    keydialog->show();
    keydialog->setFocus();
}

void EmuSettings::frameskip( int skip )
{
    __DEBUG_IN
    __DEBUG2("Frameskip is", skip );
    settingsChanged = true;
    antsettings.iFrameSkip = skip;
}

void EmuSettings::showFPS( bool showFPS )
{
    settingsChanged = true;
    antsettings.iShowFPS = showFPS;
}

void EmuSettings::screensettings( int settings )
{
    __DEBUG_IN
    __DEBUG2("current screensetetings are", settings );
    settingsChanged = true;
    antsettings.iScreenSettings = settings;
    __DEBUG_OUT
}

void EmuSettings::dpadSettings( int settings )
{
    settingsChanged = true;
    antsettings.iDPadSettings = settings;
}


void EmuSettings::showAudioSettings()
{
    if( currentWidget == EAudioWidget )
        {
        //hide audio Widget, and continue
        audiosettings->hide();
        ui.settingsViewWidget->show();
        currentWidget = EMainWidget;
        }
    else
        {
        hidecurrentWidget();
        audiosettings->show();
        currentWidget = EAudioWidget;
        }
}

void EmuSettings::showVideoSettings()
{
    if( currentWidget == EVideoWidget )
        {
        //hide video Widget, and continue
        antvideosettings->hide();
        ui.settingsViewWidget->show();
        currentWidget = EMainWidget;
        }
    else
        {
        hidecurrentWidget();
        antvideosettings->show();
        currentWidget = EVideoWidget;
        }

}

void EmuSettings::showControlSettings()
{
    if( currentWidget == EKeyWidget )
        {
        //hide keysettings Widget, and continue
        keysettings->hide();
        ui.settingsViewWidget->show();
        currentWidget = EMainWidget;
        }
    else
        {
        hidecurrentWidget();
        keysettings->show();
        currentWidget = EKeyWidget;
        }
}

void EmuSettings::setAudioOn( int audioOn )
{
    settingsChanged = true;
    antsettings.iAudioOn = (bool) audioOn;
}

void EmuSettings::setSampleRate( int sampleRate )
{
    __DEBUG_IN
   settingsChanged = true;
    __DEBUG2("SampleRate is", sampleRate );
    antsettings.iSampleRate = sampleRate;
    __DEBUG_OUT
}

void EmuSettings::setStereoOn( int stereoOn )
{
    __DEBUG_IN
    settingsChanged = true;
    antsettings.iStereo = (bool) stereoOn;
    __DEBUG_OUT
}

void EmuSettings::setVolume( int volume )
{
    settingsChanged = true;
    antsettings.iVolume = volume;
}

void EmuSettings::setSpeedHack(bool enable)
{
    settingsChanged = true;
    antsettings.iEnableSpeedHack = enable;
}

void EmuSettings::keyconfigDone()
{
    settingsChanged = true;
    //get the key config
    for( int i=0; i<12; i++)
        {
        __DEBUG2("keyconfigDone: keyID is ", keydialog->getKeyBind(i) );
        antsettings.iScanKeyTable[i] = keydialog->getKeyBind(i);
        }
    //take the keyevents away, so it doesn't crash
    remotecontrol->subscribeKeyEvent( this );
    //Delete the dialog
    keydialog->hide();
    delete keydialog;
    keydialog = NULL;
    emit( updateSettings(antsettings) );
}

void EmuSettings::exit()
{
    savecurrentSettings();
    QApplication::exit(0);
}

void EmuSettings::resetButtonClicked()
{
    if( settingsChanged )
    {
        savecurrentSettings();
        emit( updateSettings(antsettings) );
        settingsChanged = false;
    }
    
    if( romloaded )
        emit( resetGame() );
}

void EmuSettings::continueClicked()
{
    if( settingsChanged )
        {
        savecurrentSettings();
        emit( updateSettings(antsettings) );
        settingsChanged = false;
        }
    
    //if there was no ROM loaded, load previous ROM
    if( !romloaded )
        {
        emit( LoadROM( antsettings.iLastROM, antsettings ));
        romloaded = true;
        }
    //just continue the game
    else
        {
        emit( continueGame() );
        }
}

void EmuSettings::aboutClicked()
{
    __DEBUG_IN
    //show about dialog
    about = new aboutdialog( this );
    connect( about, SIGNAL(closeDialog()), this, SLOT( closeAboutDialog() ));
    about->show();
    about->setFocus();
    __DEBUG_OUT
}

void EmuSettings::closeAboutDialog()
{
    __DEBUG_IN
    disconnect( about, SIGNAL(closeDialog()), this, SLOT( closeAboutDialog() ));
    delete about;
    about = NULL;
    __DEBUG_OUT
}

void EmuSettings::saveSlotIndexChanged( int index )
{
    __DEBUG_IN
        //change the pixmap
        /*
     QPixmap *pixmap = new QPixmap();
     QString filename = antsettings.iLastROM.left( antsettings.iLastROM.size() - 4 );
     filename.append( QString::number(index) );
     filename.append( ".jpg");

     bool loaded = pixmap->load(filename);
     if( loaded )
      {
      ui.stateLabel->setPixmap(*pixmap);
      ui.stateLabel->setScaledContents(true);
      }
     */
   __DEBUG_OUT
}

void EmuSettings::loadStateButtonClicked()
{
    __DEBUG_IN
    if( !romloaded )
        return;

    antsettings.iLastSlot = ui.saveSlotBox->currentIndex();
    savecurrentSettings();
    if( settingsChanged )
       {
       emit( updateSettings(antsettings) );
       settingsChanged = false;
       }

    int state = ui.saveSlotBox->currentIndex();
    emit( LoadState(state) );
    __DEBUG_OUT
}

void EmuSettings::saveStateButtonClicked()
{
    __DEBUG_IN
    if( !romloaded )
        return;

    antsettings.iLastSlot = ui.saveSlotBox->currentIndex();
    savecurrentSettings();
    if( settingsChanged )
        {
        emit( updateSettings(antsettings) );
        settingsChanged = false;
        }

    int state = ui.saveSlotBox->currentIndex();
    emit( SaveState(state) );

    __DEBUG_OUT
}

void EmuSettings::hidecurrentWidget()
{
    switch( currentWidget )
    {
    case EMainWidget:
        ui.settingsViewWidget->hide();
        break;
    case EAudioWidget:
        audiosettings->hide();
        break;
    case EVideoWidget:
        antvideosettings->hide();
        break;
    case EKeyWidget:
        keysettings->hide();
        break;
    }
}

void EmuSettings::setDefaultSettings()
{

    antsettings.iVersion = KAntSettingsVersion;

    for(int i=0;i<12;i++)
        {
        antsettings.iScanKeyTable[i] = 0;
        }

    antsettings.iLastROM = "";
    antsettings.iLastSlot = 0;
    antsettings.iShowFPS = false;
    antsettings.iFrameSkip = 0;
    antsettings.iAudioOn = false;
    antsettings.iEnableSpeedHack = true;
    antsettings.iSampleRate = 22050;
    antsettings.iStereo = false;
    antsettings.iVolume = 4;
    antsettings.iScreenSettings = 0;
    antsettings.iDPadSettings = 1;
}

void EmuSettings::savecurrentSettings()
{
    __DEBUG_IN

    QSettings settings;
    settings.setValue("snes_version", KAntSettingsVersion );

    for(int i=0;i<12;i++)
    {
        QString keyval = "snes_kebind";
        keyval.append( QString::number(i) );
        settings.setValue(keyval, antsettings.iScanKeyTable[i]);
    }
    settings.setValue("snes_lastrom",antsettings.iLastROM);
    settings.setValue("snes_lastslot",antsettings.iLastSlot);
    settings.setValue("snes_showfps",antsettings.iShowFPS);
    settings.setValue("snes_frameskip",antsettings.iFrameSkip);
    settings.setValue("snes_audioOn",antsettings.iAudioOn);
    settings.setValue("snes_enableSpeedHack",antsettings.iEnableSpeedHack);
    settings.setValue("snes_samplerate",antsettings.iSampleRate);
    settings.setValue("snes_stereo",antsettings.iStereo);
    settings.setValue("snes_volume",antsettings.iVolume);
    settings.setValue("snes_screensettings", antsettings.iScreenSettings);
    settings.setValue("snes_dpadsettings", antsettings.iDPadSettings);
    settings.sync();
    __DEBUG_OUT
}

void EmuSettings::loadSettings()
{
    __DEBUG_IN
    QSettings settings;
    int version = settings.value("snes_version").toInt();
    if( version != KAntSettingsVersion )
        {
        __DEBUG1("No version was set, creating default settings");
        setDefaultSettings();
        savecurrentSettings();
        return;
        }
    antsettings.iVersion = version;

    for(int i=0;i<12;i++)
        {
        QString keyval = "snes_kebind";
        keyval.append( QString::number(i) );
        antsettings.iScanKeyTable[i] = settings.value(keyval).toUInt();
        }
    antsettings.iLastROM = settings.value("snes_lastrom").toString();
    antsettings.iLastSlot = settings.value("snes_lastslot").toInt();
    antsettings.iShowFPS = settings.value("snes_showfps").toBool();
    antsettings.iFrameSkip = settings.value("snes_frameskip").toInt();
    antsettings.iAudioOn = settings.value("snes_audioOn").toBool();
    antsettings.iEnableSpeedHack = settings.value("snes_enableSpeedHack").toBool();
    antsettings.iSampleRate = settings.value("snes_samplerate").toInt();
    antsettings.iStereo = settings.value("snes_stereo").toBool();
    antsettings.iVolume = settings.value("snes_volume").toInt();
    antsettings.iScreenSettings = settings.value("snes_screensettings").toInt();
    antsettings.iDPadSettings = settings.value("snes_dpadsettings").toInt();
    __DEBUG_OUT
}
