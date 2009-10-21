/* AntSnes
 *
 * Copyright (C) 2009 Summeli <summeli@summeli.fi>
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


#ifndef __VIRTUALKEYOBSERVER_H__
#define __VIRTUALKEYOBSERVER_H__

#include <w32std.h>

enum TAntSnesVirtualKey
	{
    EKEY_UP = 1,
    EKEY_DOWN = 2,
    EKEY_RIGHT = 4,
    EKEY_LEFT = 8,
    EKEY_A = 16,
    EKEY_B = 32,
    EKEY_Y = 64,
    EKEY_X = 128,
    EKEY_L = 256,
    EKEY_R = 512,
    EKEY_START = 1024,
    EKEY_SELECT = 2048
	};

class MVirtualKeyObserver
	{
public:
	virtual void VirtualKeyEvent( const TAntSnesVirtualKey& aKey, TBool isDown ) = 0;
	};


#endif
