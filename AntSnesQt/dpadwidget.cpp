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

#include "dpadwidget.h"
#include "debug.h"

#include <QMouseEvent>
#include <qmath.h>
#include "snes9x.h"

#define KCenter_x 64
#define KCenter_y 180


DPadWidget::DPadWidget(QWidget *parent)
    : QWidget(parent)
{
	__DEBUG_IN
	ui.setupUi(this);
	prevkeys = 0;
	__DEBUG_OUT
}

DPadWidget::~DPadWidget()
{

}


void DPadWidget::mousePressEvent(QMouseEvent* event )
	{
	__DEBUG_IN
	processbuttons( event );
	__DEBUG_OUT
	}

void DPadWidget::mouseReleaseEvent(QMouseEvent* event )
	{
	__DEBUG_IN
	 if( event->y() > 80 )
		 {
		 emit(virtualKeyEvent(prevkeys,false));
	     prevkeys = 0;
	     }
	__DEBUG_OUT
	}

void DPadWidget::mouseMoveEvent(QMouseEvent* event)
	{
	__DEBUG_IN
	processbuttons( event );
	__DEBUG_OUT
	}

void DPadWidget::processbuttons( QMouseEvent* event )
	{
	__DEBUG_IN
	if( event->y() < 80 )
		{
		emit(showMenu() );
		return;
		}
	else
		{
		quint32 key = getSnesKeys( event );
		if( key != prevkeys )
			{
			//release old keys
			quint32 release = prevkeys;
			release &= ~(key & prevkeys);
			emit(virtualKeyEvent(release,false));
			
			//send new key
			quint32 newkey = key;
			newkey &=  ~(key & prevkeys);
			emit(virtualKeyEvent(newkey,true));
			}
		prevkeys = key;
		}
	__DEBUG_OUT
	}

quint32 DPadWidget::getSnesKeys( QMouseEvent* event )
	{
	quint32 key = 0;
	if(  event->y() >= 280 )
	        {
	        //left key pressed
			key = SNES_TL_MASK;
	        }
	else
		{
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
	
	
		//360 degrees is divided into 8 sectors.
		if (angle > 337 || angle < 23)
			{
			//right key was pressed
			key += SNES_RIGHT_MASK;
			}
		else if (angle >= 23 && angle < 68)
			{
			//right and down was pressed
			key += SNES_RIGHT_MASK;
			key += SNES_DOWN_MASK;
			}
		else if (angle >= 68 && angle < 113)
			{
			//Down key was pressed
			key += SNES_DOWN_MASK;
			}
		else if (angle >= 113 && angle < 158)
			{
			//Down and left key was pressed
			key += SNES_DOWN_MASK;
			key += SNES_LEFT_MASK;
			}
		else if (angle >= 158 && angle < 203)
			{
			//Left key was pressed
			key += SNES_LEFT_MASK;
			}
		else if (angle >= 203 && angle < 248)
			{
			//left and up key was pressed
			key += SNES_LEFT_MASK;
			key += SNES_UP_MASK;
			}
		else if (angle >= 248 && angle < 293)
			{
			//up key was pressed
			key += SNES_UP_MASK;
			}
		else if (angle >= 293 && angle <= 337)
			{
			//up and right key was pressed
			key += SNES_UP_MASK;
			key += SNES_RIGHT_MASK;
			}
		}
		return key;
	}

