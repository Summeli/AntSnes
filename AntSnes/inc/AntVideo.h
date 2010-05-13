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


#ifndef ANTVIDEO_H_
#define ANTVIDEO_H_

class MAntVideo
	{
public:
	virtual ~MAntVideo() {};
public:
    virtual void SetPal( TBool aPAL ) = 0;
    virtual void UpdateFPS( TInt aFPS ) = 0;
    virtual void SetShowFPS( TBool aShowFPS ) = 0;
    virtual void DrawText(const TDesC& aText, TPoint aPoint ) = 0;
    virtual void PutS9xFrame( TUint8* FrameBuf ) = 0;
    virtual TBool isReady() = 0;
    virtual void Stop() = 0;
    virtual void Start() = 0;
	};

#endif /* ANTVIDEO_H_ */
