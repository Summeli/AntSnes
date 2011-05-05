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
const int SCREEN_WIDTH = 640;
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
    setFocusPolicy(Qt::StrongFocus);

    QMainWindow::setStyleSheet("QMainWindow { background: #111111; }");

    dpad = new DPadWidget( this );
    dpad->setGeometry(QRect(DPAD_LEFT_POS, SCREEN_TOP, DPAD_WIDTH, SCREEN_HEIGHT));
    dpad->show();
    connect(dpad, SIGNAL(showMenu()), this, SLOT( showAntSnesMenu()) );
        
    buttons = new buttonwidget( this );
    buttons->setGeometry(QRect(BUTTON_LEFT_POS, SCREEN_TOP, BUTTON_WIDTH, SCREEN_HEIGHT));
    buttons->show();
    
    widget = new QGLBlitterWidget(this);
    widget->setObjectName(QString::fromUtf8("QGLBlitterWidget"));
    widget->setGeometry(QRect(GL_LEFT_POS, SCREEN_TOP, GL_WIDTH, SCREEN_HEIGHT));
    //widget->setGeometry(QRect(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT));
    widget->show();
    setFocusProxy( widget );
    antaudio = new CAntAudio();

    control = new QSnesController( widget, antaudio, this );

    connect(this, SIGNAL(Start()), control, SLOT(Start()) );
    connect(this, SIGNAL(Stop()), control, SLOT(Stop()) );
    connect(this, SIGNAL(Start()), this, SLOT(listencontrols()) );
    connect(this, SIGNAL(doLoadROM( QString,TAntSettings)), control, SLOT(LoadRom(QString,TAntSettings)) );
    //qApp->installEventFilter(this);
}

AntSnesQt::~AntSnesQt()
{
    delete control;
    delete widget;
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

	if ( event->isAutoRepeat() )
	{
	    return;
	}
    quint32 c = event->nativeScanCode();
    antKeyEvent keyevent;

    __DEBUG2("key pressed, scancode is ", c );
    for(TInt i=0;i<16;i++)
        {
        if(c==iAntSettings.iScanKeyTable[i])
            {
            iHardKeys |= KAntKeyTable[i];
            break;
            }
        }

}

void AntSnesQt::keyReleaseEvent(QKeyEvent* event)
{
    __DEBUG_IN
    if ( event->isAutoRepeat() )
    {
        return;
    }
    quint32 c = event->nativeScanCode();
    antKeyEvent keyevent;

    __DEBUG2("key released, scancode is ", c );
    for(TInt i=0;i<16;i++)
        {
        if(c==iAntSettings.iScanKeyTable[i])
            {
            iHardKeys &= ~KAntKeyTable[i];
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
    setFocus();
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
    widget->updateSettings( antSettings );

}

void AntSnesQt::virtualKeyEvent( quint32 aKey, bool isDown )
{
    __DEBUG_IN
    if( isDown )
        iHardKeys |= aKey;
    else
        iHardKeys &= ~aKey;
    __DEBUG_OUT
}


quint32 AntSnesQt::getSnesKeys()
{
    return iSnesKeys | iHardKeys;
}

void AntSnesQt::listencontrols()
{
    remotecontrol->subscribeKeyEvent(this);
}

bool AntSnesQt::eventFilter(QObject *obj, QEvent *event)
{
    if(event->type() == QEvent::TouchBegin || event->type() == QEvent::TouchUpdate ) {
        qDebug(obj->objectName().toAscii());
        return true;
    } else {
            return QObject::eventFilter(obj, event);
    }
}
