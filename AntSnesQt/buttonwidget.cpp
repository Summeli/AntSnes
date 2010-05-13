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

#include <QMouseEvent>
#include <qmath.h>

#include "buttonwidget.h"
#include "debug.h"

#include "snes9x.h"

#define KCenter_x 64
#define KCenter_y 180

buttonwidget::buttonwidget(QWidget *parent)
    : QWidget(parent)
{
	ui.setupUi(this);
	prevkeys = 0;
}

buttonwidget::~buttonwidget()
{

}

void buttonwidget::mousePressEvent(QMouseEvent* event )
	{
	__DEBUG_IN
	processbuttons( event );
	__DEBUG_OUT
	}

void buttonwidget::mouseReleaseEvent(QMouseEvent* event )
	{
	__DEBUG_IN
	 emit(virtualKeyEvent(prevkeys,false));
	 prevkeys = 0;
	__DEBUG_OUT
	}

void buttonwidget::mouseMoveEvent(QMouseEvent* event)
	{
	__DEBUG_IN
	processbuttons( event );
	__DEBUG_OUT
	}

void buttonwidget::processbuttons( QMouseEvent* event )
	{
	quint32 key = getSnesKeys( event );
	if( key != prevkeys )
		{
		//release old keys
		emit(virtualKeyEvent(prevkeys,false));
		
		//send new key
		emit(virtualKeyEvent(key,true));
		}
	prevkeys = key;
	}

quint32 buttonwidget::getSnesKeys( QMouseEvent* event )
	{
	quint32 key = 0;
	__DEBUG3("buttonwidget, x pos, y pos", event->x(), event->y());
	if ((event->y() < 320) && (event->y() > 40) )
		{ 
		//Calculate distance from the center
		qreal x = event->x() - KCenter_x;
		qreal y = event->y() - KCenter_y;
	
		qreal r = qAtan2(y,x);
		r = (r * 180 )/ KPi; //convert radians to degrees
	
		//lets use full circle instead of negative angles
		if (r < 0)
			{
			r = 360 + r;
			}
	
		qint32 angle = qRound(r);
		__DEBUG2("buttonwidget, angle is ", angle );
	
		//360 degrees is divided into 8 sectors.
		if (angle > 337 || angle < 68)
			{
			//right key was pressed
			__DEBUG1("buttonwidget, A WAS PRESSED");
			key = SNES_A_MASK;
			}
		else if (angle >= 68 && angle < 158)
			{
			//Down key was pressed
			__DEBUG1("buttonwidget, B WAS PRESSED");
			key = SNES_B_MASK;
			}
		else if (angle >= 158 && angle < 248)
			{
			//Left key was pressed
			__DEBUG1("buttonwidget, Y WAS PRESSED");
			key =  SNES_Y_MASK;
			}
		else if (angle >= 248 && angle < 337)
			{
			//up key was pressed
			__DEBUG1("buttonwidget, X WAS PRESSED");
			key =  SNES_X_MASK;
			}
		}
	else if( event->y() >= 320 )
		{
		//right button pressed
		__DEBUG1("buttonwidget, TR WAS PRESSED");
		key = SNES_TR_MASK;
		}
	else if( event->y() <= 40 )
		{
		if( event->x() < KCenter_x )
			{
			//start
			__DEBUG1("buttonwidget, START WAS PRESSED");
			key = SNES_START_MASK;
			}
		 else
			{
			//select
		    __DEBUG1("buttonwidget, SELECT WAS PRESSED");
			key = SNES_SELECT_MASK;
			}
		}
	
	return key;
	}

