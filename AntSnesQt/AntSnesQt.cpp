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

#include <QtGui/QImage>
#include <QtGui/QPainter>
#include <QtOpenGL/QGLWidget>
#include <QThread>
#include <QEvent>
#include <QTouchEvent>
#include <QImageReader>
#include "gfx.h"
#include "debug.h"

#include "AntSnesQt.h"
#include "snescontroller.h"
#include "debug.h"
#include "snes9x.h"
#include "buttonpositions.h"


extern float g_fps;

uint KAntKeyTable[12]={SNES_UP_MASK,SNES_DOWN_MASK,SNES_LEFT_MASK,SNES_RIGHT_MASK,SNES_A_MASK,
		SNES_X_MASK,SNES_Y_MASK,SNES_B_MASK,SNES_START_MASK,SNES_SELECT_MASK,SNES_TL_MASK,SNES_TR_MASK};

AntSnesQt::AntSnesQt(QWidget *parent)
    : QGLWidget(parent), buf(NULL), iSnesKeys(0), iHardKeys(0)
{
  //  QMainWindow::setAttribute(Qt::WA_AcceptTouchEvents);

    //setBackgroundRole ( QPalette::Window );
    //setAutoFillBackground ( true );

    bitmapdata = new uint8_32[256 * 240 * 2];
    QWidget::setAttribute(Qt::WA_AcceptTouchEvents);

    QThread::currentThread()->setPriority( QThread::NormalPriority );
    //ui.setupUi(this);
    showFullScreen();
    setFocusPolicy(Qt::StrongFocus);

   // QGLWidget:setStyleSheet(" background: #111111;");

    dpad = new DPadWidget( this );
    buttons = new buttonwidget( this );
    connect(dpad, SIGNAL(showMenu()), this, SLOT( showAntSnesMenu()) );

    antaudio = new CAntAudio();

    control = new QSnesController( this, antaudio, this );

#ifndef __SYMBIAN32__ //meego
    meegoAdapt = new meegoAdaptation();
    meegoAdapt->setActiveWidget(this);
    connect(this, SIGNAL(Start()), meegoAdapt, SLOT(disableSwipe()) );
    connect(this, SIGNAL(Stop()), meegoAdapt, SLOT(enableSwipe()) );
#endif
    connect(this, SIGNAL(Start()), control, SLOT(Start()) );
    connect(this, SIGNAL(Stop()), control, SLOT(Stop()) );
    connect(this, SIGNAL(Start()), this, SLOT(listencontrols()) );
    connect(this, SIGNAL(doLoadROM( QString,TAntSettings)), control, SLOT(LoadRom(QString,TAntSettings)) );

    //create graphics for the button overlay
    buttonOpacity = iAntSettings.iButtonOpacity;
    LoadButtons();
}

AntSnesQt::~AntSnesQt()
{
    delete control;
    delete dpad;
    delete antaudio;

}

void AntSnesQt::render(int width, int height)
{
    __DEBUG_IN
    __DEBUG2("Rendering.. QThread::currentThreadId():", QThread::currentThreadId());

    __DEBUG4("rendering: ", width, "x", height)
    if (buf != NULL)
    {
        delete buf;
        buf = NULL;
    }

    __DEBUG1("creating buffer")
    buf = new QImage(GFX.Screen, width, height, GFX.RealPitch, QImage::Format_RGB16);

    if ( buttonOpacity != iAntSettings.iButtonOpacity )
    {
        buttonOpacity = iAntSettings.iButtonOpacity;
        LoadButtons();
    }
    __DEBUG1("calling repaint")
    repaint();
    __DEBUG_OUT
}

void AntSnesQt::paintEvent(QPaintEvent *)
{
    __DEBUG_IN
    __DEBUG2("QThread::currentThreadId():", QThread::currentThreadId());

    QPainter painter;
    painter.begin(this);


    if ( (buf == NULL) || (stretch != iAntSettings.iStretch) ) 
        stretch = iAntSettings.iStretch;
    {   QRect fullrect(0,0,SCREEN_WIDTH, SCREEN_HEIGHT );
        painter.fillRect(fullrect, QColor(0x11, 0x11, 0x11 ));
    }
    
    if (buf != NULL)
    {
        __DEBUG1("Creating QRectF");
        int newWidth = width();
        int left = 0; 
        if ( stretch == TAntSettings::AntKeepAspectRatio ) {
            newWidth = (buf->width() / buf->height()) * SCREEN_HEIGHT;
            left = (SCREEN_WIDTH - newWidth) >> 1;
        }
        else if(stretch == TAntSettings::AntStrechLittle ){
             left = 96;
#ifdef __SYMBIAN32__
             newWidth = 448;
#else
              newWidth = 662;
#endif
        }
        QRect target(left, SCREEN_TOP, newWidth, height());
        __DEBUG1("Drawing image");
        painter.drawImage(target, *buf);
        __DEBUG1("Ending QPainter");
    }



    //Draw pad
    painter.drawPixmap(tl_point, tl_graphics);
    painter.drawPixmap( dpad_point, dpad_graphics);
    painter.drawPixmap(tr_point, tr_graphics);
    painter.drawPixmap( buttons_point, buttons_graphics);
    painter.drawPixmap( menu_point, m_menuGraphics);
    painter.drawPixmap( start_select_point, m_startSelectGraphics);


    if( iAntSettings.iShowFPS )
        {
        painter.setPen ( Qt::green );
        painter.drawText ( showFPS_point, QString::number(g_fps) );
        }

    painter.end();
    __DEBUG_OUT
}

void AntSnesQt::LoadButtons()
{
    ApplyTransparency(dpad_graphics, ":/gfx/dpad.png");
    ApplyTransparency(buttons_graphics, ":/gfx/buttons.png");
    ApplyTransparency(tl_graphics, ":/gfx/tl_button_top.png");
    ApplyTransparency(tr_graphics, ":/gfx/tr_button_top.png");
    ApplyTransparency(m_startSelectGraphics, ":/gfx/select_start_buttons.png");
    ApplyTransparency(m_menuGraphics, ":/gfx/menu.png");
}

void AntSnesQt::ApplyTransparency(QPixmap &pm, QString png)
{
    pm.load(png);
    QPixmap transparent(pm.size());
    transparent.fill(Qt::transparent);
    QPainter p(&transparent);
    p.setCompositionMode(QPainter::CompositionMode_Source);
    p.drawPixmap(0, 0, pm);
    p.setCompositionMode(QPainter::CompositionMode_DestinationIn);
    p.fillRect(transparent.rect(), QColor(0, 0, 0, (iAntSettings.iButtonOpacity * 255) / 4));
    p.end();
    pm = transparent;
}

void AntSnesQt::saveStateImage(QString rom, int state)
{
    /*
    __DEBUG_IN
    QString filename = rom.left(rom.size() - 4);
    filename.append(QString::number(state));
    filename.append(".jpg");
    __DEBUG2("filename is ", filename);
    QImage image(bitmapdata, 256, 224, QImage::Format_RGB16);
    bool saved = image.save(filename, "jpg", 100);
    __DEBUG2("file saved ", saved);
    __DEBUG_OUT*/
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
            //RDebug::Printf("Event %s - Number of points: %d", (event->type() == QEvent::TouchBegin) ? "TouchBegin" : "TouchUpdate", touchPoints.length());
#endif
            iSnesKeys = 0;
            for ( int i = 0; i < touchPoints.length(); i++ )
            {
                QTouchEvent::TouchPoint tp = touchPoints[i];
#ifdef _DEBUG
              //  RDebug::Printf("TouchPoint %d - State: %d - Pos: %fx%f", i, tp.state(), tp.screenPos().x(), tp.screenPos().y());
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
            //RDebug::Printf("Event TouchEnd");
#endif
            iSnesKeys = 0;
            break;
        }
        case QEvent::FocusOut:
        {
            showAntSnesMenu();
        }
        default:
            break;
    }
    return QWidget::event(event);
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
    for(int i=0;i<16;i++)
        {
        if(c==iAntSettings.iScanKeyTable[i])
            {
            iHardKeys |= KAntKeyTable[i];
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
    for(int i=0;i<16;i++)
        {
        if(c==iAntSettings.iScanKeyTable[i])
            {
            iHardKeys &= ~KAntKeyTable[i];
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
    saveStateImage( iAntSettings.iLastROM, state );
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

    dpad->setDpadMode( antSettings.iDPadSettings );
    __DEBUG2("antSettings.iScreenSettings is ", antSettings.iScreenSettings );
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

#ifdef __SYMBIAN32__
void AntSnesQt::setRemoteControl( QRemoteControlKeys* remote )
{
    remotecontrol = remote;
}

void AntSnesQt::listencontrols()
{
    remotecontrol->subscribeKeyEvent(this);
}
#endif

