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

#include "QBlitterWidget.h"

#include <QtGui/QImage>
#include <QtGui/QPainter>
#include <QThread>

#include "gfx.h"
#include "debug.h"

//Symbian DSA stuff
#include <eikenv.h>
#include <coecntrl.h>
#include <w32std.h>
#include "AntBlit.h"

void (*bitmapBlit)(TUint8* aScreen, TUint8* aBitmap) = 0;

QBlitterWidget::QBlitterWidget()
:CActive( CActive::EPriorityStandard )
    {
	__DEBUG_IN
    QWidget();

    iDSA = NULL;
    iDSBitmap = NULL;
    
    CActiveScheduler::Add( this );
    
    __DEBUG_OUT
    }

QBlitterWidget::~QBlitterWidget()
    {
	
    Cancel();
    delete iDSA;
    delete iDSBitmap;
    
    }

void QBlitterWidget::render()
    {
	__DEBUG_IN
    __DEBUG2("Rendering.. QThread::currentThreadId():", QThread::currentThreadId());
	
	if( !iDSA )
		return;
	
    if (IsActive())
    	{
    	Cancel();
    	}
    
    TAcceleratedBitmapInfo bitmapInfo;
    iDSBitmap->BeginUpdate(bitmapInfo);        
    
    bitmapdata = (TUint8*) bitmapInfo.iAddress;
    bitmapBlit( GFX.Screen, bitmapdata);
    
    iDSBitmap->EndUpdate(iStatus);
    SetActive();
    
    __DEBUG_OUT
    }
/*
 * We have to make a choise in here. we can allocate the memory in advance in the constructor
 * or we can create a new qimage each time when we got a paint event. Using pre-allocated
 * memory should be faster.
*/
 void QBlitterWidget::paintEvent(QPaintEvent *)
     {
     __DEBUG_IN
     __DEBUG2("QThread::currentThreadId():", QThread::currentThreadId());
     // QImage( uchar * data, int width, int height, Format format )
     //uchar* g_data = NULL; //temp
     
     QImage im( "C:\\data\\mytest.jpg", "JPG");

     QRectF target(0.0, 0.0, 256.0, 234.0);
     QRectF source(0.0, 0.0, 256.0, 234.0);

     QPainter painter(this);
     painter.drawImage(target, im, source);
     __DEBUG_OUT
     }

void QBlitterWidget::stopDSA()
	{
	__DEBUG_IN
	if (iDSA)
		{
		iDSA->Cancel();
		delete iDSA;
		iDSA = NULL;
		iDSBitmap->Close();
		}
	__DEBUG_OUT
	}
 
void QBlitterWidget::startDSA()
	{
	__DEBUG_IN
	if(!iDSA)
		{
	    iDSBitmap = CDirectScreenBitmap::NewL();
	    iDSA = CDirectScreenAccess::NewL(CEikonEnv::Static()->WsSession(),
	  		*CEikonEnv::Static()->ScreenDevice(),
	    		*winId()->DrawableWindow(),
	    		*this);
	    CEikonEnv::Static()->WsSession().Flush();
	    iDSA->StartL();
	    CFbsBitGc *gc = iDSA->Gc();
	    RRegion *region = iDSA->DrawingRegion();
	    
	    gc->SetClippingRegion(region);
	    //User::LeaveIfError(iDSBitmap->Create(TRect(128,0, 512,360), CDirectScreenBitmap::EDoubleBuffer));
	    createScreenBuffer();
	    }
	__DEBUG_OUT
	}

void QBlitterWidget::setScreenMode( int mode)
	{
	screenmode = mode;
	}

void QBlitterWidget::Restart(RDirectScreenAccess::TTerminationReasons aReason)
	{
	__DEBUG_IN
    TRAPD( err, iDSA->StartL() ); // You may panic here, if you want
    CFbsBitGc* gc = iDSA->Gc();
    RRegion* region = iDSA->DrawingRegion();
    gc->SetClippingRegion(region);
 
    //iDSBitmap->Create(
     //   TRect(128,0, 512,360), CDirectScreenBitmap::EDoubleBuffer); 
    createScreenBuffer();
    __DEBUG_OUT
	}

void QBlitterWidget::AbortNow(RDirectScreenAccess::TTerminationReasons aReason)
	{
	iDSBitmap->Close();
	}

    // from CActive 
void QBlitterWidget::DoCancel()
	{
	
	}

void QBlitterWidget::RunL()
	{
	
	}

void QBlitterWidget::setPAL( bool pal )
	{
	__DEBUG_IN
	__DEBUG1("SET PAL");
	Init5thEditionBlit( pal );
	if( pal )
		{
		bitmapBlit = BlitPALQTDSA;
		}
	else
		{
		bitmapBlit = BlitNTSCQTDSA;
		}
	__DEBUG_OUT
	}

void QBlitterWidget::saveStateImage( QString rom, int sate )
	{
	__DEBUG_IN
	QString filename = rom.left( rom.size() - 4 );
	filename.append( QString::number(sate) );
	filename.append( ".jpg");
	__DEBUG2("filename is ", filename);
	QImage image( bitmapdata, 256, 224, QImage::Format_RGB16 );
	bool saved = image.save ( filename, "jpg", 100 );
	__DEBUG2("file saved ", saved);
	__DEBUG_OUT
	}
	
void QBlitterWidget::createScreenBuffer()
	{
	switch( screenmode )
		{
		case 0:
			 User::LeaveIfError(iDSBitmap->Create(TRect(256,0, 640,360), CDirectScreenBitmap::EDoubleBuffer));
			break;
		case 1: 
			 User::LeaveIfError(iDSBitmap->Create(TRect(128,0, 512,360), CDirectScreenBitmap::EDoubleBuffer));
			break;
		case 2:
			User::LeaveIfError(iDSBitmap->Create(TRect(128,0, 512,360), CDirectScreenBitmap::EDoubleBuffer));
			break;
		default:
			break;
		}
	}
