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

#include "OpenGLES.h"
#include <coemain.h> // for CCoeEnv
#include <w32std.h>
#include "gfx.h"

_LIT( KTESTDATA, "c:\\Data\\test_data\\Snes9xTest.data");
_LIT( KTESTDATASNES, "c:\\Data\\test_data\\test_565.mbm");
_LIT( KTESTDATA256x239, "c:\\Data\\test_data\\test_256x239.mbm");
static GLuint	texture;
static GLint format;
static GLint type;
static GLuint textures [2];
static EGLDisplay g_EglDisplay;
static EGLSurface g_EglSurface;

#ifdef OPENGL_ES_BENCHMARK	
static CFbsBitmap* iBitmap;
#endif

static const GLbyte bgverts[8] =
   {
        0, 0,
        1, 0,
        0, 1,
        1, 1
   };

static const GLubyte bgtex[8] =
   {
   0, 1,
   1, 1,
   0, 0,
   1, 0
   };
static const GLubyte rot180_bgtex[8] =
   {
   1, 0,
   0, 0,
   1, 1,
   0, 1
   };
static const GLbyte vertices[3 * 3] =
{
     -1,    1,    0,
      1,   -1,    0,
      1,    1,    0
};

static const GLubyte colors[3 * 4] =
{
        255,      0,    0,    255,
          0,    255,    0,    255,
          0,      0,  255,    255
};

CAntOpenGLESRenderer::CAntOpenGLESRenderer( RWindow& aWindow, TBool aShowFPS, TScreenMode aScreenMode )
:iWindow(aWindow), iShowFPS(aShowFPS), iScreenMode( aScreenMode )
    {
    
    }

EXPORT_C MAntVideo* CAntOpenGLESRenderer::NewL( CWindowGc& aGc, RWindow& aWindow, TSize aScreenSize, TBool aShowFPS, TScreenMode aScreenMode )
{
	CAntOpenGLESRenderer* self = new (ELeave) CAntOpenGLESRenderer( aWindow, aShowFPS, aScreenMode );
    
    CleanupStack::PushL( self );
    self->ConstructL( aGc, aScreenSize );
    CleanupStack::Pop( self );
    return self;    
}

void CAntOpenGLESRenderer::ConstructL(CWindowGc& aGc, TSize aScreenSize)
    {
    iSize = aScreenSize;
    CWsScreenDevice* device = static_cast<CWsScreenDevice*> (aGc.Device());
    RRegion *dsa_region = 0;
    	
    iEglDisplay = eglGetDisplay( EGL_DEFAULT_DISPLAY );
    	
	EGLint majorVersion;
	EGLint minorVersion;
	
	if( !eglInitialize( iEglDisplay, &majorVersion, &minorVersion ) ) 
			{
			User::Panic( _L("GL Init"), 0 );
			}
   
	// Choose the buffer size based on the Window's display mode.
	TInt bufferSize = 0;
	switch( iWindow.DisplayMode() )
	{
		case(EColor4K):
			bufferSize = 12;
			break;
		case(EColor64K):
			bufferSize = 16;
			break;
		case(EColor16M):
			bufferSize = 24;
			break;
		case(EColor16MU):
		case(EColor16MA):
			bufferSize = 32;
			break;
		default:
			break;
	}
			 
	// Set the desired properties for the EGLSurface
	const EGLint attributeList[] = {       EGL_BUFFER_SIZE, bufferSize,
								   EGL_DEPTH_SIZE,  15,
								   EGL_NONE                                 };
	
	EGLConfig bestConfig;
	EGLint numConfigs = 0;

	// Choose the best EGLConfig that matches the desired properties. 
	if( eglChooseConfig( iEglDisplay, attributeList, &bestConfig,
						  1, &numConfigs
						) == EGL_FALSE )
		{
		User::Leave( KErrConfigFailed );
		}
	
	if( numConfigs == 0 )
	{
		User::Leave( KErrConfigFailed );
	}
		
	// Create a window surface where the graphics are blitted.
	// Pass the Native Window handle to egl.
	iEglSurface = eglCreateWindowSurface( iEglDisplay, bestConfig, 
										  &iWindow, NULL 
										);
	if( iEglSurface == NULL )
	{
		User::Leave( KErrCreateWindowSurfaceFailed );
	}
		
	// Create a rendering context
	iEglContext = eglCreateContext( iEglDisplay, bestConfig,
									EGL_NO_CONTEXT, NULL 
								  );
	if( iEglContext == NULL )
	{
		User::Leave( KErrCreateContextFailed );    
	}
	
	// Make it the current context.
	if( eglMakeCurrent( iEglDisplay, iEglSurface, 
						 iEglSurface, iEglContext 
					  ) == EGL_FALSE
	  )
	{
		User::Leave( KErrSetContextFailed );        
	} 
	
	InitializeOpenGLES(iEglDisplay, iEglSurface);
    
	for (TInt i=0 ; i<KLineBuffers ; i++)
	{
		iLineBuffers[i] = HBufC8::NewL(256*2);
		iLineBuffers[i]->Des().FillZ  (256*2);
	}
	
    }

CAntOpenGLESRenderer::~CAntOpenGLESRenderer()
    {
    DeInitOpenGLES();
    
    eglMakeCurrent( iEglDisplay, EGL_NO_SURFACE, 
                    EGL_NO_SURFACE, EGL_NO_CONTEXT 
                  );
    eglDestroySurface( iEglDisplay, iEglSurface );
    eglDestroyContext( iEglDisplay, iEglContext );
    eglTerminate( iEglDisplay );
    
	for (TInt i=0 ; i<KLineBuffers ; i++)
		{
		delete iLineBuffers[i];
		}
	
    }

void CAntOpenGLESRenderer::SetPal( TBool aPAL )
	{
	TSize landscape( 320, 240);
	TSize portrait( 240, 320);
	
	TSize landscape352( 416, 352);
	TSize portrait352( 352, 416);
	iPAL = aPAL;
	}

void CAntOpenGLESRenderer::UpdateFPS( TInt aFPS )
	{   
	iFPS = aFPS;
	}

void CAntOpenGLESRenderer::SetShowFPS( TBool aShowFPS )
	{
	
	}

void CAntOpenGLESRenderer::DrawText(const TDesC& aText, TPoint aPoint )
{

}

void CAntOpenGLESRenderer::PutS9xFrame( TUint8* FrameBuf )
    {
    TUint16 *data = (TUint16 *)FrameBuf;
    TUint16 *dataprev = NULL;
    TUint16* lineptr =NULL;
    TUint8*  screendata = FrameBuf;
    TUint8* linptr = NULL;
    TInt line = 0;
	TUint32 red;
	TUint32 green;
	TUint32 blue;
	TUint32 red2;
	TUint32 green2;
	TUint32 blue2;
	TInt offset = 0;
    //y-offset8, TODO: calculate this for each resolution
    if( iPAL )
    	{
    	//interpolate on in 7
		for( TInt i = 0; i<234; i=i+13)
			{
			glTexSubImage2D (GL_TEXTURE_2D, 0, 0, i+offset, 256, 13,
					GL_RGB, GL_UNSIGNED_SHORT_5_6_5, screendata);
			screendata += 256*13*2;
			data += 256*13;
			dataprev = data - 256;
			lineptr = (TUint16*) iLineBuffers[line]->Ptr();
			for(TInt j =0; j<256; j++)
				{
				red = (*dataprev >> 11) & 0x1F;
				green = (*dataprev  >> 5) & 0x3F;
				blue = (*dataprev  & 0x001F);  	
				red2 = (*data >> 11) & 0x1F;
				green2 = (*data  >> 5) & 0x3F;
				blue2 = (*data  & 0x001F);  	    			
				red = red + red2 >>1;
				green = green + green2 >> 1;
				blue = blue + blue2 >> 1;
				*lineptr = (red<<11) | (green<<5) | (blue);
				data ++;
				dataprev++;
				lineptr++;
				}
			linptr = (TUint8*) iLineBuffers[line]->Ptr();
			glTexSubImage2D (GL_TEXTURE_2D, 0, 0, i+offset+13, 256, 1,
										GL_RGB, GL_UNSIGNED_SHORT_5_6_5, linptr);
			offset++;
			data -= 256;
			line++;
			
			
			}
		//reminder
		glTexSubImage2D (GL_TEXTURE_2D, 0, 0, 252, 256, 4,
					GL_RGB, GL_UNSIGNED_SHORT_5_6_5, screendata);
    	}
    else
    	{
    	//interpolate on in 7
    	for( TInt i = 0; i<224; i=i+7)
    		{
    		glTexSubImage2D (GL_TEXTURE_2D, 0, 0, i+offset, 256, 7,
    				GL_RGB, GL_UNSIGNED_SHORT_5_6_5, screendata);
    		screendata += 256*7*2;
    		data += 256*7;
    		dataprev = data - 256;
    		lineptr = (TUint16*) iLineBuffers[line]->Ptr();
    		for(TInt j =0; j<256; j++)
    			{
    			red = (*dataprev >> 11) & 0x1F;
    			green = (*dataprev  >> 5) & 0x3F;
    			blue = (*dataprev  & 0x001F);  	
    			red2 = (*data >> 11) & 0x1F;
				green2 = (*data  >> 5) & 0x3F;
				blue2 = (*data  & 0x001F);  	    			
				red = red + red2 >>1;
				green = green + green2 >> 1;
				blue = blue + blue2 >> 1;
				*lineptr = (red<<11) | (green<<5) | (blue);
				data ++;
				dataprev++;
				lineptr++;
    			}
    		linptr = (TUint8*) iLineBuffers[line]->Ptr();
    		glTexSubImage2D (GL_TEXTURE_2D, 0, 0, i+offset+7, 256, 1,
    		    		   				GL_RGB, GL_UNSIGNED_SHORT_5_6_5, linptr);
    		offset++;
    		data -= 256;
    		line++;
    		//glTexSubImage2D (GL_TEXTURE_2D, 0, 0, i+8, 256, 1,
    		 //   				GL_RGB, GL_UNSIGNED_SHORT_5_6_5, GFX.Screen);
    		
    		
    		}
    	}
    	    
             
    // Enable vertex arrays.
    glEnableClientState( GL_VERTEX_ARRAY );
    // Set array pointers.
    glVertexPointer( 2, GL_BYTE, 0, bgverts );
    // Enable texture arrays 
    glEnableClientState( GL_TEXTURE_COORD_ARRAY );
    // Set texture coords
    if( iScreenMode == ENGage)
    	glTexCoordPointer( 2, GL_BYTE, 0, rot180_bgtex );
    else 
    	glTexCoordPointer( 2, GL_BYTE, 0, bgtex );
    glEnable(GL_TEXTURE_2D);
    glBindTexture( GL_TEXTURE_2D, textures[0] );
    glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
    glDisable(GL_TEXTURE_2D);
    glDisableClientState(GL_TEXTURE_COORD_ARRAY);
    glDisableClientState(GL_VERTEX_ARRAY);
                       
     // Go back to model view matrix
     glMatrixMode( GL_MODELVIEW );
     eglSwapBuffers( g_EglDisplay, g_EglSurface);
    }


void CAntOpenGLESRenderer::InitializeOpenGLES(EGLDisplay aDisplay, EGLSurface aSurface)
	{
#ifdef OPENGL_ES_BENCHMARK	
	iBitmap = new (ELeave) CFbsBitmap();
    TInt error = iBitmap->Load( KTESTDATA256x239, 0 );
    TDisplayMode mode = iBitmap->DisplayMode();
    if( mode == EColor64K )
    	{
    	// 64k maps to RGB565, which we will use as opengl es texture,
    	RDebug::Print(_L("Colour mode is correct"));
    	}
    
    RDebug::Print(_L("ConstructL complete"));   
#endif	    
	g_EglDisplay = aDisplay;
	g_EglSurface = aSurface;
	glClear(GL_COLOR_BUFFER_BIT);
	glClearColor(0.0, 0.0, 0.0, 0.0); // set background to black 
   // Textures are initialized in OpenGL ES API by this function.
    glGenTextures( 1, &textures[0] );   
    //Bind the background texture to iTexturesID[0], set the texture environment. 
    glBindTexture( GL_TEXTURE_2D, textures[0] );
    
    glTexImage2D (GL_TEXTURE_2D, 0, GL_RGB,
    				 256, 256, 0,
    				 GL_RGB, GL_UNSIGNED_SHORT_5_6_5, NULL);
    
    glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_REPLACE);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);  
    glMatrixMode(GL_PROJECTION);                  
    // Push on a new matrix so that we can just pop it off to go back to perspective mode       
    glDisable( GL_DEPTH_TEST );
    glDisable( GL_CULL_FACE  );
    // Reset the current matrix to our identify matrix
    glLoadIdentity();                        
    // Pass in our 2D ortho screen coordinates (left, right, bottom, top, near, far).   
    glOrthof( 0, 1, 0, 1, -1, 1 );   
    // Switch to model view so that we can render the texture
    glMatrixMode(GL_MODELVIEW);                        
    // Initialize the current model view matrix with the identity matrix
    glLoadIdentity();
    glMatrixMode( GL_PROJECTION );                     
    //glEnable( GL_DEPTH_TEST );
    //glEnable( GL_CULL_FACE  );
	}

void CAntOpenGLESRenderer::DeInitOpenGLES()
	{
	 glDeleteTextures(1, &textures[0]);
	}
