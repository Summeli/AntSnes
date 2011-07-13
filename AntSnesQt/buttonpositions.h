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

//statics for rendering
const int SCREEN_TOP = 0;
const int SCREEN_HEIGHT = 360;
const int SCREEN_WIDTH = 640;
const int DPAD_LEFT_POS = 0;
const int DPAD_WIDTH = 169;
const int BUTTON_WIDTH = 169;
const int MENU_WIDTH = 200;
const int MENU_HEIGHT = 32;
const int BUTTON_LEFT_POS = SCREEN_WIDTH -BUTTON_WIDTH ;
const int GL_LEFT_POS = 128;
const int GL_WIDTH = 384;
const int TR_WIDTH = 80;
const int TL_WIDTH = 80;
const int SMALLBUTTON_HEIGHT = 32;
const int SMALLBUTTON_WIDTH = 80;

const QPoint tl_point(0, SMALLBUTTON_HEIGHT);
const QPoint tr_point(SCREEN_WIDTH - TR_WIDTH, SMALLBUTTON_HEIGHT );
const QPoint dpad_point(0,SCREEN_HEIGHT - DPAD_WIDTH);
const QPoint buttons_point( BUTTON_LEFT_POS,SCREEN_HEIGHT - BUTTON_WIDTH);
const QPoint menu_point(0,0);
const QPoint start_select_point( SCREEN_WIDTH - SMALLBUTTON_WIDTH, 0 );
const QPoint showFPS_point(128,20);
