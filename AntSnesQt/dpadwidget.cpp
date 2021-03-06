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

const int KCenter_x  = 85;
const int KCenter_y  = 275;

const int DPAD_CENTER_RIGHT = KCenter_x + 10;
const int DPAD_CENTER_LEFT = KCenter_x - 10;
const int DPAD_CENTER_TOP  = KCenter_y - 10;
const int DPAD_CENTER_BOTTOM = KCenter_y + 10;

const int DPAD_TOP = 200 - 30;

DPadWidget::DPadWidget(QObject *parent) :
    QObject(parent), dpadMode(1)
{
    __DEBUG_IN
    __DEBUG_OUT
}

DPadWidget::~DPadWidget()
{

}

quint32 DPadWidget::getSnesKey(int x, int y)
{
    quint32 key = 0;
    if (y < 45)
    {
        key = SNES_TL_MASK;
    }
    else if ((y > DPAD_CENTER_TOP ) && (y < DPAD_CENTER_BOTTOM ) && (x > DPAD_CENTER_LEFT )
            && (x < DPAD_CENTER_RIGHT ))
    {
        // Inside center circle of dpad
    }
    else if ( y > DPAD_TOP )
    {
        //return only 4-directions
        if( dpadMode == 0 )
            return getFourDirectinalPad( x, y );

        qreal rx = x - KCenter_x;
        qreal ry = y - KCenter_y;

        qreal r = qAtan2(ry, rx);

        r = (r * 180) / KPi; //convert radians to degrees

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

quint32 DPadWidget::getFourDirectinalPad(  int x, int y )
{
    quint32 key = 0;

    qreal rx = x - KCenter_x;
    qreal ry = y - KCenter_y;

    qreal r = qAtan2(ry, rx);

    r = (r * 180) / KPi; //convert radians to degrees

    //lets use full circle instead of negative angles
    if (r < 0)
    {
        r = 360 + r;
    }

    qint32 angle = qRound(r);


    //360 degrees is divided into 8 sectors.
    if (angle > 337 || angle < 68)
    {
        //right key was pressed
        key += SNES_RIGHT_MASK;
    }

    else if (angle >= 68 && angle < 158)
    {
        //Down key was pressed
        key += SNES_DOWN_MASK;
    }
    else if (angle >= 158 && angle < 248)
    {
        //Left key was pressed
        key += SNES_LEFT_MASK;
    }
    else if (angle >= 248 && angle < 337)
    {
        //up key was pressed
        key += SNES_UP_MASK;
    }
    return key;
}

void DPadWidget::setDpadMode( int mode )
{
    dpadMode = mode;
}

