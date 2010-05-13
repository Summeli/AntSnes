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

#include "AntSnesQt.h"

#include "snescontroller.h"
#include "debug.h"

#include "snes9x.h"


uint KAntKeyTable[12]={SNES_UP_MASK,SNES_DOWN_MASK,SNES_LEFT_MASK,SNES_RIGHT_MASK,SNES_A_MASK,
		SNES_X_MASK,SNES_Y_MASK,SNES_B_MASK,SNES_START_MASK,SNES_SELECT_MASK,SNES_TL_MASK,SNES_TR_MASK};

AntSnesQt::AntSnesQt(QWidget *parent)
    : QMainWindow(parent)
{
	QThread::currentThread()->setPriority( QThread::NormalPriority );
	ui.setupUi(this);
	showFullScreen();
	
	QMainWindow::setStyleSheet("QMainWindow { background: #111111; }");
    //create button widgets
    dpad = new DPadWidget( this );
    dpad->setGeometry(QRect(0, 0, 128, 360));
    dpad->show();
    connect(dpad, SIGNAL(showMenu()), this, SLOT( showAntSnesMenu()) );
    connect(dpad, SIGNAL(virtualKeyEvent(quint32, bool)), this, SLOT( virtualKeyEvent(quint32, bool)) );
    
    lpad = new largepad( this );
    lpad->setGeometry(QRect(0, 0, 256, 360));
    lpad->hide();
    connect(lpad, SIGNAL(showMenu()), this, SLOT( showAntSnesMenu()) );
    connect(lpad, SIGNAL(virtualKeyEvent(quint32, bool)), this, SLOT( virtualKeyEvent(quint32, bool)) );
        
    buttons = new buttonwidget( this );
    buttons->setGeometry(QRect(512, 0, 128, 360));
    buttons->show();
    connect(buttons, SIGNAL(virtualKeyEvent(quint32, bool)), this, SLOT( virtualKeyEvent(quint32, bool)) );
    
    smallwidget = new smalloptionswidget( this );
    smallwidget->setGeometry(QRect(0, 0, 128, 360));
    smallwidget->hide();
    connect(smallwidget, SIGNAL(showMenu()), this, SLOT( showAntSnesMenu()) );
    
    smallwidget2 =  new smalloptionswidget( this );
    smallwidget2->setGeometry(QRect(512, 0, 128, 360));
    smallwidget2->hide();
    connect(smallwidget2, SIGNAL(showMenu()), this, SLOT( showAntSnesMenu()) );
    
    widget = new QBlitterWidget();
    widget->setObjectName(QString::fromUtf8("QBlitterWidget"));
    widget->setGeometry(QRect(0, 0, 384, 360));
   // ui.menuButton->setEditFocus(false);
    
    antaudio = new CAntAudio();
    //connect buttons from the ui
   // connect(ui.menuButton, SIGNAL(clicked()), this, SLOT( showAntSnesMenu()) );
    
    //the widget cam be repainted with repaint or update commands
    //widget->repaint();    
    control = new QSnesController( widget, antaudio, this );
    //TODO: use Qt::QueuedConnection in here?
    connect(this, SIGNAL(Start()), widget, SLOT(startDSA()) );
    connect(this, SIGNAL(Stop()), widget, SLOT(stopDSA()) );
    
    connect(this, SIGNAL(Start()), control, SLOT(Start()) );
    connect(this, SIGNAL(Stop()), control, SLOT(Stop()) );
    
    connect(this, SIGNAL(Start()), this, SLOT(listencontrols()) );
    
    connect(this, SIGNAL(doLoadROM( QString,TAntSettings)), control, SLOT(LoadRom(QString,TAntSettings)) );
    
}

AntSnesQt::~AntSnesQt()
{
	delete widget;
	delete control;
	delete smallwidget;
	delete smallwidget2;
	delete dpad;
	delete antaudio;
}

void AntSnesQt::setRemoteControl( QRemoteControlKeys* remote )
	{
	remotecontrol = remote;
	}

void AntSnesQt::keyPressEvent( QKeyEvent * event)
    {
	__DEBUG_IN
    __DEBUG2("Key Pressed: ", event->text()); 
    
    quint32 c = event->nativeScanCode();
    antKeyEvent keyevent;
    
	__DEBUG2("key pressed, scancode is ", c );
	for(TInt i=0;i<16;i++)
		{
		if(c==iAntSettings.iScanKeyTable[i])
			{
			keyevent.key = KAntKeyTable[i];
			keyevent.keyDown = true;
			iPressedKeys.append( keyevent );
			break;
			}
		}

    }

void AntSnesQt::keyReleaseEvent(QKeyEvent* event)
	{
	__DEBUG_IN
    quint32 c = event->nativeScanCode();
    antKeyEvent keyevent;
    
	__DEBUG2("key released, scancode is ", c );
	for(TInt i=0;i<16;i++)
		{
		if(c==iAntSettings.iScanKeyTable[i])
			{
			keyevent.key = KAntKeyTable[i];
			keyevent.keyDown = false;
			iPressedKeys.append( keyevent );
			break;
			}
		}
	__DEBUG_OUT
	}

void AntSnesQt::LoadROM(QString rom, TAntSettings antSettings )
    {
	__DEBUG_IN
	updateSettings( antSettings );
    emit( doLoadROM( rom, antSettings ));
	
	emit(Start());
	__DEBUG_OUT
    }

void AntSnesQt::showAntSnesMenu()
	{
	__DEBUG_IN
	emit( Stop() );
	emit( showmenu() );
	__DEBUG_OUT
	}

void AntSnesQt::LoadState( int state )
	{
	__DEBUG_IN
	control->LoadStateL( state );
	emit(Start());
	__DEBUG_OUT
	}

void AntSnesQt::SaveState( int state )
	{
	__DEBUG_IN
	widget->saveStateImage( iAntSettings.iLastROM, state );
	control->SaveStateL( state );
	emit(Start());
	__DEBUG_OUT
	}

void AntSnesQt::reset()
	{
	control->ResetGame();
	emit( Start() );
	}

void AntSnesQt::continueGame()
	{
	emit( Start() );
	}

void AntSnesQt::updateSettings( TAntSettings antSettings )
	{
	__DEBUG_IN
	control->updateSettings( antSettings );
	iAntSettings = antSettings;
	
	//change the are in blitter widget
	widget->setScreenMode( antSettings.iScreenSettings );
	
	__DEBUG2("antSettings.iScreenSettings is ", antSettings.iScreenSettings );
	//change the widgets too
	switch(antSettings.iScreenSettings  )
		{
		case 0:
			smallwidget->hide();
			smallwidget2->hide();
			buttons->hide();
			dpad->hide();
			lpad->show();
			break;
		case 1:
			lpad->hide();
			smallwidget->hide();
			smallwidget2->hide();
			buttons->show();
			dpad->show();
			break;
		case 2:
			lpad->hide();
			buttons->hide();
			dpad->hide();
			smallwidget->show();
			smallwidget2->show();
			break;
		}
	__DEBUG_OUT
	}

void AntSnesQt::virtualKeyEvent( quint32 aKey, bool isDown )
	{
	__DEBUG_IN
    antKeyEvent keyevent;
    keyevent.key = aKey;
    keyevent.keyDown = isDown;
    iPressedKeys.append( keyevent );
    __DEBUG_OUT
	}

int AntSnesQt::getKeyEvent( antKeyEvent& keyEvent )
	{
	if( iPressedKeys.isEmpty() )
		{
		return 0;
		}
	keyEvent = iPressedKeys.takeFirst();
	 __DEBUG3("returning keyevent, pressed, scancode", keyEvent.keyDown, keyEvent.key );
	 return 1;
	}


void AntSnesQt::listencontrols()
	{
	remotecontrol->subscribeKeyEvent(this);
	}

