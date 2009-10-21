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

#ifndef ANTDSARENDERER_H_
#define ANTDSARENDERER_H_

#include <w32std.h>
#include <cdsb.h>	//CDirectScreenBitmap
#include "AntSettings.h"
#include "AntVideo.h"

class FileLogger;

class CAntDSARenderer: public CBase, public MAntVideo, public MDirectScreenAccess
    {
public:
	CAntDSARenderer( RWindow& aWindow, TBool aShowFPS, TScreenMode aScreenMode );
	static CAntDSARenderer* NewL( CWindowGc& aGc, RWindow& aWindow, TSize aScreenSize, TBool aShowFPS, TScreenMode aScreenMode );
	~CAntDSARenderer();
	
    void ConstructL( CWindowGc& aGc, TSize aScreenSize);
    
public: //MAntVideo    
    void SetPal( TBool aPAL );
    void UpdateFPS( TInt aFPS );
    void SetShowFPS( TBool aShowFPS );
    void DrawText(const TDesC& aText, TPoint aPoint );
    void PutS9xFrame( TUint8* FrameBuf);
    TBool isReady();
    void Stop();
    void Start();
     
public: //from MDirectScreenAccess
    void AbortNow(RDirectScreenAccess::TTerminationReasons aReason);
    void Restart(RDirectScreenAccess::TTerminationReasons aReason);
 
private:
	CDirectScreenAccess* iDSA; 
	CFbsBitGc* iGc;
	CFbsBitmap* iBitmap;
	//CDirectScreenBitmap* iBitmap;
	CFbsBitmap* iBlackScreen;
	RWindow& iWindow;
	TBool iDSAReady;
	TBool iPAL;
	TBool iShowFPS;
	
	TSize iSize;
	TInt iFPS;
	TScreenMode iScreenMode;
	
	RRegion* iRegion;
    };

#endif /* ANTDSARENDERER_H_ */
