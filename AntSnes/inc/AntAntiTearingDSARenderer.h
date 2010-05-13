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


#ifndef ANTANTITEARINGDSARENDERER_H_
#define ANTANTITEARINGDSARENDERER_H_

#include <w32std.h>
#include <cdsb.h>	//CDirectScreenBitmap
#include "AntSettings.h"
#include "AntVideo.h"

class CAntAntiTearingDSAREnderer : public CActive, public MDirectScreenAccess, public MAntVideo
    {
public:
    static CAntAntiTearingDSAREnderer* NewL( CWindowGc& aGc, RWindow& aWindow, TSize aScreenSize, TBool aShowFPS, TScreenMode aScreenMode );
    ~CAntAntiTearingDSAREnderer();
    
    public: // from MDirectScreenAccess
    
    	virtual void Restart( RDirectScreenAccess::TTerminationReasons aReason );
    	virtual void AbortNow( RDirectScreenAccess::TTerminationReasons aReason );
    
    protected: // from CActive
    
    	void DoCancel();
    	void RunL();
    
        
    public: //from MAntVideo
        void SetPal( TBool aPAL );
        void UpdateFPS( TInt aFPS );
        void SetShowFPS( TBool aShowFPS );
        void DrawText(const TDesC& aText, TPoint aPoint );
        void PutS9xFrame( TUint8* FrameBuf );
    	
    private:
    
    	CAntAntiTearingDSAREnderer( RWindow& aWindow, TBool aShowFPS, TScreenMode aScreenMode );
    	void ConstructL( CWindowGc& aGc, TSize aScreenSize );
    	
    private:
    	void SetPal16M(TBool aPAL);
    	void SetPal16MU(TBool aPAL);
    	
    private:
    
    	CDirectScreenAccess* iDrawer;
    	CDirectScreenBitmap* iDSBitmap;
    
    	CFbsBitGc* iGc;
    	RWindow& iWindow;
    	TBool iDSAReady;
    	TBool iPAL;
    	TSize iSize;
    	TInt iFPS;
    	TBool iShowFPS;
    	TScreenMode iScreenMode;
    };


#endif /* ANTANTITEARINGDSARENDERER_H_ */
