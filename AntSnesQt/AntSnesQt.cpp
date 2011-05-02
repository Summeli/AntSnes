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

const int SCREEN_TOP = 0;
const int SCREEN_HEIGHT = 360;
const int DPAD_LEFT_POS = 0;
const int DPAD_WIDTH = 128;
const int LDPAD_WIDTH = 256;
const int BUTTON_LEFT_POS = 512;
const int BUTTON_WIDTH = 128;
const int GL_LEFT_POS = 128;
const int GL_WIDTH = 384;


uint KAntKeyTable[12]={SNES_UP_MASK,SNES_DOWN_MASK,SNES_LEFT_MASK,SNES_RIGHT_MASK,SNES_A_MASK,
		SNES_X_MASK,SNES_Y_MASK,SNES_B_MASK,SNES_START_MASK,SNES_SELECT_MASK,SNES_TL_MASK,SNES_TR_MASK};

AntSnesQt::AntSnesQt(QWidget *parent)
    : QMainWindow(parent)
{
    QMainWindow::setAttribute(Qt::WA_AcceptTouchEvents);

	QThread::currentThread()->setPriority( QThread::NormalPriority );
	ui.setupUi(this);
	showFullScreen();
	
	QMainWindow::setStyleSheet("QMainWindow { background: #111111; }");

	dpad = new DPadWidget( this );
    dpad->setGeometry(QRect(DPAD_LEFT_POS, SCREEN_TOP, DPAD_WIDTH, SCREEN_HEIGHT));
    dpad->show();
    connect(dpad, SIGNAL(showMenu()), this, SLOT( showAntSnesMenu()) );
    
    lpad = new largepad( this );
    lpad->setGeometry(QRect(DPAD_LEFT_POS, SCREEN_TOP, LDPAD_WIDTH, SCREEN_HEIGHT));
    lpad->hide();
    connect(lpad, SIGNAL(showMenu()), this, SLOT( showAntSnesMenu()) );
    connect(lpad, SIGNAL(virtualKeyEvent(quint32, bool)), this, SLOT( virtualKeyEvent(quint32, bool)) );
        
    buttons = new buttonwidget( this );
    buttons->setGeometry(QRect(BUTTON_LEFT_POS, SCREEN_TOP, BUTTON_WIDTH, SCREEN_HEIGHT));
    buttons->show();
    
    smallwidget = new smalloptionswidget( this );
    smallwidget->setGeometry(QRect(0, SCREEN_TOP, 128, SCREEN_HEIGHT));
    smallwidget->hide();
    connect(smallwidget, SIGNAL(showMenu()), this, SLOT( showAntSnesMenu()) );
    
    smallwidget2 =  new smalloptionswidget( this );
    smallwidget2->setGeometry(QRect(512, SCREEN_TOP, 128, SCREEN_HEIGHT));
    smallwidget2->hide();
    connect(smallwidget2, SIGNAL(showMenu()), this, SLOT( showAntSnesMenu()) );
    
    widget = new QGLBlitterWidget(this);
    widget->setObjectName(QString::fromUtf8("QGLBlitterWidget"));
    widget->setGeometry(QRect(GL_LEFT_POS, SCREEN_TOP, GL_WIDTH, SCREEN_HEIGHT));
    widget->show();
    
    antaudio = new CAntAudio();

    control = new QSnesController( widget, antaudio, this );

    connect(this, SIGNAL(Start()), control, SLOT(Start()) );
    connect(this, SIGNAL(Stop()), control, SLOT(Stop()) );
    connect(this, SIGNAL(Start()), this, SLOT(listencontrols()) );
    connect(this, SIGNAL(doLoadROM( QString,TAntSettings)), control, SLOT(LoadRom(QString,TAntSettings)) );
}

AntSnesQt::~AntSnesQt()
{
	delete control;
    delete widget;
	delete smallwidget;
	delete smallwidget2;
	delete dpad;
	delete antaudio;
}

bool AntSnesQt::event(QEvent *event)
{
    switch (event->type())
    {
        case QEvent::TouchBegin:
        case QEvent::TouchUpdate:
        {
            QList<QTouchEvent::TouchPoint> touchPoints = (static_cast<QTouchEvent*>(event))->touchPoints();
#ifdef _DEBUG
            RDebug::Printf("Event %s - Number of points: %d", (event->type() == QEvent::TouchBegin) ? "TouchBegin" : "TouchUpdate", touchPoints.length());
#endif
            iSnesKeys = 0;
            for ( int i = 0; i < touchPoints.length(); i++ )
            {
                QTouchEvent::TouchPoint tp = touchPoints[i];
#ifdef _DEBUG
                RDebug::Printf("TouchPoint %d - State: %d - Pos: %fx%f", i, tp.state(), tp.screenPos().x(), tp.screenPos().y());
#endif
                if ( tp.state() == Qt::TouchPointPressed || tp.state() == Qt::TouchPointMoved || tp.state() == Qt::TouchPointStationary)
                {
                    if ( tp.screenPos().x() < DPAD_WIDTH )
                    {
                        iSnesKeys |= dpad->getSnesKey(tp.screenPos().x(), tp.screenPos().y());
                    }
                    else if ( tp.screenPos().x() > BUTTON_LEFT_POS )
                    {
                        iSnesKeys |= buttons->getSnesKey(tp.screenPos().x() - BUTTON_LEFT_POS, tp.screenPos().y());
                    }
                }
            }

            event->accept();
            return true;
        }
        case QEvent::TouchEnd:
        {
#ifdef _DEBUG
            RDebug::Printf("Event TouchEnd");
#endif
            iSnesKeys = 0;
            break;
        }
        default:
            break;
    }
    return QWidget::event(event);
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

quint32 AntSnesQt::getSnesKeys()
    {
    return iSnesKeys;
    }

void AntSnesQt::listencontrols()
	{
	remotecontrol->subscribeKeyEvent(this);
	}

