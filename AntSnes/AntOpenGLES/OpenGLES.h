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

#ifndef OPENGLES_H_
#define OPENGLES_H_

#include <gles/egl.h> // for egl functions.
#include <e32base.h>  // for CBase
#include <gles/EGLTYPES.H>
#include <w32std.h>

#include "AntVideo.h"
#include "AntSettings.h"
//#define OPENGL_ES_BENCHMARK

// Error constants
const TInt KErrConfigFailed = -6001;
const TInt KErrCreateWindowSurfaceFailed = -6002;
const TInt KErrCreateContextFailed = -6003;
const TInt KErrSetContextFailed = -6004;
const TInt KErrCoeEnvNotCreated = -6005;
const TInt KErrCoeEnvNotInitialized = -6006;

const TInt KLineBuffers = 32;

class CAntOpenGLESRenderer: public CBase, public MAntVideo
    {
public:
	CAntOpenGLESRenderer( RWindow& aWindow, TBool aShowFPS, TScreenMode aScreenMode );
	IMPORT_C static MAntVideo* NewL( CWindowGc& aGc, RWindow& aWindow, TSize aScreenSize, TBool aShowFPS, TScreenMode aScreenMode );
	~CAntOpenGLESRenderer();
	
    void ConstructL( CWindowGc& aGc, TSize aScreenSize);
    
public: //MAntVideo    
    void SetPal( TBool aPAL );
    void UpdateFPS( TInt aFPS );
    void SetShowFPS( TBool aShowFPS );
    void DrawText(const TDesC& aText, TPoint aPoint );
    void PutS9xFrame( TUint8* FrameBuf );

private: 
	void InitializeOpenGLES(EGLDisplay aDisplay, EGLSurface aSurface);
	void DeInitOpenGLES();
private:
	
	RWindow& iWindow;
	TBool iDSAReady;
	TBool iPAL;
	
    /** OpenGL es */
    EGLDisplay iEglDisplay;
    EGLSurface iEglSurface;  
    EGLContext iEglContext;
    
    HBufC8*	iLineBuffers[KLineBuffers];
	TSize iSize;
	TInt iFPS;
	TBool iShowFPS;
	TScreenMode iScreenMode;
    };

typedef MAntVideo *(*_angelesnew)(CWindowGc& aGc, RWindow& aWindow, TSize aScreenSize, TBool aShowFPS, TScreenMode aScreenMode);

#endif /*OPENGLES_H_*/
