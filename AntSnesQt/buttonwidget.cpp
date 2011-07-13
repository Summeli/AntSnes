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
#include "buttonpositions.h"

#ifdef __SYMBIAN32__
#define KCenter_x 85
#define KCenter_y 275
#else
const int KCenter_x  = 85;
const int KCenter_y  = 395;
#endif

#ifndef KPi
#define KPi 3.14
#endif

const int BUTTONS_CENTER_RIGHT = KCenter_x + 10;
const int BUTTONS_CENTER_LEFT = KCenter_x - 10;
const int BUTTONS_CENTER_TOP  = KCenter_y - 10;
const int BUTTONS_CENTER_BOTTOM = KCenter_y + 10;

#ifdef __SYMBIAN32__
const int BUTTONS_TOP = 200 - 30;
const int R_TOP = MENU_HEIGHT + SMALLBUTTON_HEIGHT;
const int SELECT_LEFT = BUTTON_WIDTH - SMALLBUTTON_WIDTH / 2;
const int R_BOTTOM = MENU_HEIGHT;
#else
const int BUTTONS_TOP = 320 - 30;
const int R_TOP = MENU_HEIGHT + SMALLBUTTON_HEIGHT + 100;
const int SELECT_LEFT = BUTTON_WIDTH - SMALLBUTTON_WIDTH / 2;
const int R_BOTTOM = R_TOP - 50;
#endif

buttonwidget::buttonwidget(QObject *parent)
    : QObject(parent)
{
        //ui.setupUi(this);
}

buttonwidget::~buttonwidget()
{
}

quint32 buttonwidget::getSnesKey( int x, int y )
	{
	quint32 key = 0;
	__DEBUG3("buttonwidget, x pos, y pos", x, y);
        if(  y <= MENU_HEIGHT )
            {
            //select or start was pressed
            if( x > SELECT_LEFT )
                key = SNES_SELECT_MASK;
            else
                key = SNES_START_MASK;
            }
        else if(  y > R_BOTTOM && y <= R_TOP )
            {
            //R was pressed
            key = SNES_TR_MASK;
            }

        else if ((y > BUTTONS_CENTER_TOP ) && (y < BUTTONS_CENTER_BOTTOM ) && (x > BUTTONS_CENTER_LEFT )
                && (x < BUTTONS_CENTER_RIGHT ))
        {
            // Inside center circle of dpad
        }
        else if ( y > BUTTONS_TOP )
            {
            //Calculate distance from the center
            qreal rx = x - KCenter_x;
            qreal ry = y - KCenter_y;

            qreal r = qAtan2(ry,rx);
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

	
	return key;
	}

