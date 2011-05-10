/* AntSnes
 *
 * Copyright (C) 2011 Summeli <summeli@summeli.fi>
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

#include "middlebuttons.h"
#include "debug.h"

#include <QMouseEvent>
#include <qmath.h>
#include "snes9x.h"


const int SCREEN_HEIGHT = 360;
const int SCREEN_WIDTH = 640;

const int MENU_LEFT = SCREEN_WIDTH / 2 - 100;
const int MENU_RIGHT = SCREEN_WIDTH / 2;
const int START_LEFT  = MENU_RIGHT + 1;
const int START_RIGHT = START_LEFT + 50;
const int SELECT_LEFT = START_RIGHT + 1;
const int SELECT_RIGHT = SELECT_LEFT + 50;


MiddleButtons::MiddleButtons(QObject *parent) :
    QObject(parent)
{
    __DEBUG_IN
    __DEBUG_OUT
}

MiddleButtons::~MiddleButtons()
{

}

quint32 MiddleButtons::getSnesKey(int x, int y)
{
    quint32 key = 0;
    if (y > 40)
    {
        return 0;
    }

    if ( x > MENU_LEFT  && x < MENU_RIGHT )
    {
        emit(showMenu());
        return 0;

    }
    else if ( x > START_LEFT && x < START_RIGHT )
    {
        key |= SNES_START_MASK;
    }
    else if ( x > SELECT_LEFT && x < SELECT_RIGHT )
    {
        key |= SNES_SELECT_MASK;
    }
    return key;
}


