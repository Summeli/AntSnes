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

#ifndef ANTBLIT_H_
#define ANTBLIT_H_

#include <e32cmn.h>
extern "C" {
//extern TUint8 g_ScanLineSkipTable[240];

//240x320 resolution
void BlitNTSC320x240NGAGE( TUint8* aScreen, TUint8* aBitmap);
void BlitPAL320x240NGAGE( TUint8* aScreen, TUint8* aBitmap);
void BlitNTSC320x240Normal( TUint8* aScreen, TUint8* aBitmap);
void BlitPAL320x240Normal( TUint8* aScreen, TUint8* aBitmap);
void BlitNTSC240x320( TUint8* aScreen, TUint8* aBitmap);
void BlitPAL240x320( TUint8* aScreen, TUint8* aBitmap);

//352x416 resolution
void BlitNTSC416x352Normal( TUint8* aScreen, TUint8* aBitmap);
void BlitPAL416x352Normal( TUint8* aScreen, TUint8* aBitmap);
void BlitNTSC352x416( TUint8* aScreen, TUint8* aBitmap);
void BlitPAL352x416( TUint8* aScreen, TUint8* aBitmap);

void CreateScanLineSkipTable( TSize aScreenSize );

//5th edition
void Init5thEditionBlit( TBool aPAL );
void BlitNTSC5THED( TUint8* aScreen, TUint8* aBitmap );
void BlitPAL5THED( TUint8* aScreen, TUint8* aBitmap );

//16MU

//240x320 resolution
void BlitNTSC320x240NGAGE_16MU( TUint8* aScreen, TUint8* aBitmap);
void BlitPAL320x240NGAGE_16MU( TUint8* aScreen, TUint8* aBitmap);
void BlitNTSC320x240Normal_16MU( TUint8* aScreen, TUint8* aBitmap);
void BlitPAL320x240Normal_16MU( TUint8* aScreen, TUint8* aBitmap);
void BlitNTSC240x320_16MU( TUint8* aScreen, TUint8* aBitmap);
void BlitPAL240x320_16MU( TUint8* aScreen, TUint8* aBitmap);
void BlitNTSC416x352Normal_16MU( TUint8* aScreen, TUint8* aBitmap);
void BlitPAL416x352Normal_16MU( TUint8* aScreen, TUint8* aBitmap);
void BlitNTSC352x416_16MU( TUint8* aScreen, TUint8* aBitmap);
void BlitPAL352x416_16MU( TUint8* aScreen, TUint8* aBitmap);

};


#endif /* ANTBLIT_H_ */
