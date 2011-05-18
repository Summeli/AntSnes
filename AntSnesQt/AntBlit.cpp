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
#include <e32def.h>
static TUint8 g_ScanLineSkipTable[240];

#include "AntBlit.h"
#include "symb_debug.h"
// NTSC 224 and 239 PAL

TInt KOffSetHorizontalWIDE320x240 = 32;
TInt KOffSetHorizontalWIDE352x416 = 80;
TInt KOffSetHorizontalPortrait352x416 = 48;
                           
void CreateScanLineSkipTable( TSize aScreenSize )
	{
	for( TInt i=0; i<240; i++)
		{
		if(i % 15 )
			g_ScanLineSkipTable[i] = 0;
		else
			g_ScanLineSkipTable[i] = 1;
		}
	}

TInt interptable_h[240];
TInt interptable_w[256];

void Init5thEditionBlit( TBool aPAL )
	{
	DEBUGPRINT(_L("InitBlit"));
    TReal j = 1.5; //horizontal
    TReal loop = 0;
    TReal real_temp;

   for( TInt i=0; i<256; i++)
	 {
	 real_temp = i*j + 0.5;
	 interptable_w[i] = real_temp;
	 }

   if( aPAL )
	   {
	   j= 1.5; //vertical
	   for( TInt i=0; i<240; i++)
		   {
		   real_temp = i*j + 0.5;
		   interptable_h[i] = real_temp;
		   }
	   }
   else
	   {
	   j= 1.6; //vertical
	   for( TInt i=0; i<224; i++)
		   {
		   real_temp = i*j + 0.5;
		   interptable_h[i] = real_temp;
		   }
	   }
    DEBUGPRINT(_L("InitBlit Done"));
	 }

void BlitPAL320x240NGAGE( TUint8* aScreen, TUint8* aBitmap)
	{
	TUint16* bitmap = (TUint16*) aBitmap;
	TUint16* screen = (TUint16*) aScreen;
	bitmap += KOffSetHorizontalWIDE320x240;
	screen += 256*239;
    	for( TInt i =0; i<239; i++ )
    		{
    		for( TInt j=0; j<256; j++)
    			{
     			*bitmap = *screen;
      			screen--;
      			bitmap++;
    			}
    		bitmap += KOffSetHorizontalWIDE320x240*2;
    		}
	}

void BlitNTSC320x240NGAGE( TUint8* aScreen, TUint8* aBitmap)
	{
	TUint16* bitmap = (TUint16*) aBitmap;
	TUint16* screen = (TUint16*) aScreen;
	bitmap += 8*320;
	bitmap += KOffSetHorizontalWIDE320x240;
	screen += 256*224;
  	for( TInt i =0; i<224; i++ )
  		{
  		for( TInt j=0; j<256; j++)
  			{
  			*bitmap = *screen;
  			screen--;
  			bitmap++;
  			}
  		bitmap += KOffSetHorizontalWIDE320x240*2;
  		}
	}

void BlitPAL320x240Normal( TUint8* aScreen, TUint8* aBitmap)
	{
	TUint16* bitmap = (TUint16*) aBitmap;
	TUint16* screen = (TUint16*) aScreen;
	bitmap += KOffSetHorizontalWIDE320x240;
    	for( TInt i =0; i<239; i++ )
    		{
    		for( TInt j=0; j<256; j++)
    			{
     			*bitmap = *screen;
      			screen++;
      			bitmap++;
    			}
    		bitmap += KOffSetHorizontalWIDE320x240*2;
    		}
	}

void BlitNTSC320x240Normal( TUint8* aScreen, TUint8* aBitmap)
	{
	TUint16* bitmap = (TUint16*) aBitmap;
	TUint16* screen = (TUint16*) aScreen;
	bitmap += 8*320;
	bitmap += KOffSetHorizontalWIDE320x240;
  	for( TInt i =0; i<224; i++ )
  		{
  		for( TInt j=0; j<256; j++)
  			{
  			*bitmap = *screen;
  			screen++;
  			bitmap++;
  			}
  		bitmap += KOffSetHorizontalWIDE320x240*2;
  		}
	}
void BlitNTSC240x320( TUint8* aScreen, TUint8* aBitmap)
	{
	TUint16* bitmap = (TUint16*) aBitmap;
	TUint16* screen = (TUint16*) aScreen;
	bitmap += 48*240; //move to right postion
	TUint16 red;
	TUint16 green;
	TUint16 blue;
	TUint16 red2;
	TUint16 green2;
	TUint16 blue2;
	for( TInt i =0; i<224; i++ )
  		{
  		for( TInt j=0; j<240; j++)
  			{
  			if( g_ScanLineSkipTable[j] == 1)
  				{
  				red = *screen & 0x1F;
  				green = *screen & 0x7E0;
  				blue = *screen & 0xF800;
  				screen++;
  				red2 = *screen & 0x1F;
  				green2 = *screen & 0x7E0;
  				blue2 = *screen & 0xF800;
  				red = red + red2 >>1;
  				green = (green + green2 >> 1) & 0x7E0;
  				blue = (blue + blue2 >> 1) & 0xF800;
  				*bitmap = red + (green) + (blue);
  				bitmap++;
  				screen++;
  				}
  			else
  				{
  				*bitmap = *screen;
  				bitmap++;
  				screen++;
  				}
  			}
  		}
	}

void BlitPAL240x320( TUint8* aScreen, TUint8* aBitmap)
	{
	TUint16* bitmap = (TUint16*) aBitmap;
	TUint16* screen = (TUint16*) aScreen;
	bitmap += 40*240; //move to right postion
	TUint16 red;
	TUint16 green;
	TUint16 blue;
	TUint16 red2;
	TUint16 green2;
	TUint16 blue2;
	for( TInt i =0; i<239; i++ )
		{
		for( TInt j=0; j<240; j++)
			{
			if( g_ScanLineSkipTable[j] == 1)
				{
				red = *screen & 0x1F;
				green = *screen & 0x7E0;
				blue = *screen & 0xF800;
				screen++;
				red2 = *screen & 0x1F;
				green2 = *screen & 0x7E0;
				blue2 = *screen & 0xF800;
				red = red + red2 >>1;
				green = (green + green2 >> 1) & 0x7E0;
				blue = (blue + blue2 >> 1) & 0xF800;
				*bitmap = red + (green) + (blue);
				bitmap++;
				screen++;
				}
			else
				{
				*bitmap = *screen;
				bitmap++;
				screen++;
				}
			}
		}
	}


void BlitNTSC416x352Normal( TUint8* aScreen, TUint8* aBitmap)
	{
	TUint16* bitmap = (TUint16*) aBitmap;
	TUint16* screen = (TUint16*) aScreen;
	bitmap += 64*416;
	bitmap += KOffSetHorizontalWIDE352x416;
  	for( TInt i =0; i<224; i++ )
  		{
  		for( TInt j=0; j<256; j++)
  			{
  			*bitmap = *screen;
  			screen++;
  			bitmap++;
  			}
  		bitmap += KOffSetHorizontalWIDE352x416*2;
  		}
	}

void BlitPAL416x352Normal( TUint8* aScreen, TUint8* aBitmap)
	{
	TUint16* bitmap = (TUint16*) aBitmap;
	TUint16* screen = (TUint16*) aScreen;
	bitmap += 43*416;
	bitmap += KOffSetHorizontalWIDE352x416;
  	for( TInt i =0; i<224; i++ )
  		{
  		for( TInt j=0; j<256; j++)
  			{
  			*bitmap = *screen;
  			screen++;
  			bitmap++;
  			}
  		bitmap += KOffSetHorizontalWIDE352x416*2;
  		}
	}

void BlitNTSC352x416( TUint8* aScreen, TUint8* aBitmap)
	{
	TUint16* bitmap = (TUint16*) aBitmap;
	TUint16* screen = (TUint16*) aScreen;
	bitmap += 96*352;
	bitmap += KOffSetHorizontalPortrait352x416;
  	for( TInt i =0; i<224; i++ )
  		{
  		for( TInt j=0; j<256; j++)
  			{
  			*bitmap = *screen;
  			screen++;
  			bitmap++;
  			}
  		bitmap += KOffSetHorizontalPortrait352x416*2;
  		}
	}
void BlitPAL352x416( TUint8* aScreen, TUint8* aBitmap)
	{
	TUint16* bitmap = (TUint16*) aBitmap;
	TUint16* screen = (TUint16*) aScreen;
	bitmap += 88*352;
	bitmap += KOffSetHorizontalPortrait352x416;
  	for( TInt i =0; i<224; i++ )
  		{
  		for( TInt j=0; j<256; j++)
  			{
  			*bitmap = *screen;
  			screen++;
  			bitmap++;
  			}
  		bitmap += KOffSetHorizontalPortrait352x416*2;
  		}
	}



//16MU
void BlitNTSC320x240NGAGE_16MU( TUint8* aScreen, TUint8* aBitmap)
	{
	TUint32* bitmap = (TUint32*) aBitmap;
	TUint16* screen = (TUint16*) aScreen;
	bitmap += 8*320;
	bitmap += KOffSetHorizontalWIDE320x240;
	screen += 256*224;
	TUint32 red = 0;
	TUint32 green = 0;
	TUint32 blue = 0;
  	for( TInt i =0; i<224; i++ )
  		{
  		for( TInt j=0; j<256; j++)
  			{
			red = (*screen >> 11) & 0x1F;
			green = (*screen  >> 5) & 0x3F;
			blue = (*screen  & 0x001F);  
			
			red = (red << 3) | (red >> 2);
			green = (green << 2) | (green >> 4);
			blue = (blue << 3) | (blue >> 2);
	   
			*bitmap = (red << 16) | (green << 8) | (blue);
  			screen--;
  			bitmap++;
  			}
  		bitmap += KOffSetHorizontalWIDE320x240*2;
  		}
	}

void BlitPAL320x240NGAGE_16MU( TUint8* aScreen, TUint8* aBitmap)
	{
	TUint32* bitmap = (TUint32*) aBitmap;
	TUint16* screen = (TUint16*) aScreen;
	bitmap += KOffSetHorizontalWIDE320x240;
	screen += 256*239;
	TUint32 red = 0;
	TUint32 green = 0;
	TUint32 blue = 0;
	for( TInt i =0; i<239; i++ )
		{
		for( TInt j=0; j<256; j++)
			{
			red = (*screen >> 11) & 0x1F;
			green = (*screen  >> 5) & 0x3F;
			blue = (*screen  & 0x001F);  
			
			red = (red << 3) | (red >> 2);
			green = (green << 2) | (green >> 4);
			blue = (blue << 3) | (blue >> 2);
	   
			*bitmap = (red << 16) | (green << 8) | (blue);
			screen--;
			bitmap++;
			}
		bitmap += KOffSetHorizontalWIDE320x240*2;
		}
	}

void BlitNTSC320x240Normal_16MU( TUint8* aScreen, TUint8* aBitmap)
	{
	TUint32* bitmap = (TUint32*) aBitmap;
	TUint16* screen = (TUint16*) aScreen;
	bitmap += 8*320;
	bitmap += KOffSetHorizontalWIDE320x240;
	TUint32 red = 0;
	TUint32 green = 0;
	TUint32 blue = 0;
  	for( TInt i =0; i<224; i++ )
  		{
  		for( TInt j=0; j<256; j++)
  			{
			red = (*screen >> 11) & 0x1F;
			green = (*screen  >> 5) & 0x3F;
			blue = (*screen  & 0x001F);  
			
			red = (red << 3) | (red >> 2);
			green = (green << 2) | (green >> 4);
			blue = (blue << 3) | (blue >> 2);
	   
			*bitmap = (red << 16) | (green << 8) | (blue);
  			screen++;
  			bitmap++;
  			}
  		bitmap += KOffSetHorizontalWIDE320x240*2;
  		}
	}

void BlitPAL320x240Normal_16MU( TUint8* aScreen, TUint8* aBitmap)
	{
	TUint32* bitmap = (TUint32*) aBitmap;
	TUint16* screen = (TUint16*) aScreen;
	bitmap += KOffSetHorizontalWIDE320x240;
	TUint32 red = 0;
	TUint32 green = 0;
	TUint32 blue = 0;
	for( TInt i =0; i<239; i++ )
		{
		for( TInt j=0; j<256; j++)
			{
			red = (*screen >> 11) & 0x1F;
			green = (*screen  >> 5) & 0x3F;
			blue = (*screen  & 0x001F);  
			
			red = (red << 3) | (red >> 2);
			green = (green << 2) | (green >> 4);
			blue = (blue << 3) | (blue >> 2);
	   
			*bitmap = (red << 16) | (green << 8) | (blue);
			screen++;
			bitmap++;
			}
		bitmap += KOffSetHorizontalWIDE320x240*2;
		}
	}

void BlitNTSC240x320_16MU( TUint8* aScreen, TUint8* aBitmap)
	{
	TUint32* bitmap = (TUint32*) aBitmap;
	TUint16* screen = (TUint16*) aScreen;
	bitmap += 48*240; //move to right postion
	TUint32 red = 0;
	TUint32 green = 0;
	TUint32 blue = 0;
	TUint32 red2 = 0;
	TUint32 green2 = 0;
	TUint32 blue2 = 0;
	for( TInt i =0; i<224; i++ )
  		{
  		for( TInt j=0; j<240; j++)
  			{
  			if( g_ScanLineSkipTable[j] == 1)
  				{
  			    red = (*screen >> 11) & 0x1F;
    			green = (*screen  >> 5) & 0x3F;
    			blue = (*screen  & 0x001F); 
  				screen++;
  			    red2 = (*screen >> 11) & 0x1F;
    			green2 = (*screen  >> 5) & 0x3F;
    			blue2 = (*screen  & 0x001F); 
  				red = red + red2 >>1;
  				green = green + green2 >> 1;
  				blue = blue + blue2 >> 1;
  				
			   red = (red << 3) | (red >> 2);
			   green = (green << 2) | (green >> 4);
			   blue = (blue << 3) | (blue >> 2);

				*bitmap = (red << 16) | (green << 8) | (blue);
  				bitmap++;
  				screen++;
  				}
  			else
  				{
  				red = (*screen >> 11) & 0x1F;
  				green = (*screen  >> 5) & 0x3F;
  				blue = (*screen  & 0x001F);  
  				
  				red = (red << 3) | (red >> 2);
  				green = (green << 2) | (green >> 4);
  				blue = (blue << 3) | (blue >> 2);
			   
  				*bitmap = (red << 16) | (green << 8) | (blue);
  				 bitmap++;
  				screen++;
  				}
  			}
  		}
	}

void BlitPAL240x320_16MU( TUint8* aScreen, TUint8* aBitmap)
	{	
	TUint32* bitmap = (TUint32*) aBitmap;
	TUint16* screen = (TUint16*) aScreen;
	bitmap += 40*240; //move to right postion
	TUint32 red = 0;
	TUint32 green = 0;
	TUint32 blue = 0;
	TUint32 red2 = 0;
	TUint32 green2 = 0;
	TUint32 blue2 = 0;
	for( TInt i =0; i<239; i++ )
		{
		for( TInt j=0; j<240; j++)
			{
  			if( g_ScanLineSkipTable[j] == 1)
  				{
  			    red = (*screen >> 11) & 0x1F;
    			green = (*screen  >> 5) & 0x3F;
    			blue = (*screen  & 0x001F); 
  				screen++;
  			    red2 = (*screen >> 11) & 0x1F;
    			green2 = (*screen  >> 5) & 0x3F;
    			blue2 = (*screen  & 0x001F); 
  				red = red + red2 >>1;
  				green = green + green2 >> 1;
  				blue = blue + blue2 >> 1;
  				
			   red = (red << 3) | (red >> 2);
			   green = (green << 2) | (green >> 4);
			   blue = (blue << 3) | (blue >> 2);

				*bitmap = (red << 16) | (green << 8) | (blue);
  				bitmap++;
  				screen++;
  				}
  			else
  				{
  				red = (*screen >> 11) & 0x1F;
  				green = (*screen  >> 5) & 0x3F;
  				blue = (*screen  & 0x001F);  
  				
  				red = (red << 3) | (red >> 2);
  				green = (green << 2) | (green >> 4);
  				blue = (blue << 3) | (blue >> 2);
			   
  				*bitmap = (red << 16) | (green << 8) | (blue);
  				 bitmap++;
  				screen++;
  				}
			}
		}}
void BlitNTSC416x352Normal_16MU( TUint8* aScreen, TUint8* aBitmap)
	{	
	TUint32* bitmap = (TUint32*) aBitmap;
	TUint16* screen = (TUint16*) aScreen;
	bitmap += 64*416;
	bitmap += KOffSetHorizontalWIDE352x416;
	TUint32 red = 0;
	TUint32 green = 0;
	TUint32 blue = 0;
  	for( TInt i =0; i<224; i++ )
  		{
  		for( TInt j=0; j<256; j++)
  			{
			red = (*screen >> 11) & 0x1F;
			green = (*screen  >> 5) & 0x3F;
			blue = (*screen  & 0x001F);  
			
			red = (red << 3) | (red >> 2);
			green = (green << 2) | (green >> 4);
			blue = (blue << 3) | (blue >> 2);
	   
			*bitmap = (red << 16) | (green << 8) | (blue);
  			screen++;
  			bitmap++;
  			}
  		bitmap += KOffSetHorizontalWIDE352x416*2;
  		}}
void BlitPAL416x352Normal_16MU( TUint8* aScreen, TUint8* aBitmap)
	{
	TUint32* bitmap = (TUint32*) aBitmap;
	TUint16* screen = (TUint16*) aScreen;
	bitmap += 43*416;
	bitmap += KOffSetHorizontalWIDE352x416;
	TUint32 red = 0;
	TUint32 green = 0;
	TUint32 blue = 0;
  	for( TInt i =0; i<224; i++ )
  		{
  		for( TInt j=0; j<256; j++)
  			{
			red = (*screen >> 11) & 0x1F;
			green = (*screen  >> 5) & 0x3F;
			blue = (*screen  & 0x001F);  
			
			red = (red << 3) | (red >> 2);
			green = (green << 2) | (green >> 4);
			blue = (blue << 3) | (blue >> 2);
	   
			*bitmap = (red << 16) | (green << 8) | (blue);
  			screen++;
  			bitmap++;
  			}
  		bitmap += KOffSetHorizontalWIDE352x416*2;
  		}
	}

void BlitNTSC352x416_16MU( TUint8* aScreen, TUint8* aBitmap)
	{	
	TUint32* bitmap = (TUint32*) aBitmap;
	TUint16* screen = (TUint16*) aScreen;
	bitmap += 96*352;
	bitmap += KOffSetHorizontalPortrait352x416;
	TUint32 red = 0;
	TUint32 green = 0;
	TUint32 blue = 0;
  	for( TInt i =0; i<224; i++ )
  		{
  		for( TInt j=0; j<256; j++)
  			{
			red = (*screen >> 11) & 0x1F;
			green = (*screen  >> 5) & 0x3F;
			blue = (*screen  & 0x001F);  
			
			red = (red << 3) | (red >> 2);
			green = (green << 2) | (green >> 4);
			blue = (blue << 3) | (blue >> 2);
	   
			*bitmap = (red << 16) | (green << 8) | (blue);
  			screen++;
  			bitmap++;
  			}
  		bitmap += KOffSetHorizontalPortrait352x416*2;
  		}}

void BlitPAL352x416_16MU( TUint8* aScreen, TUint8* aBitmap)
	{	
	TUint32* bitmap = (TUint32*) aBitmap;
	TUint16* screen = (TUint16*) aScreen;
	bitmap += 88*352;
	bitmap += KOffSetHorizontalPortrait352x416;
	TUint32 red = 0;
	TUint32 green = 0;
	TUint32 blue = 0;
  	for( TInt i =0; i<224; i++ )
  		{
  		for( TInt j=0; j<256; j++)
  			{
			red = (*screen >> 11) & 0x1F;
			green = (*screen  >> 5) & 0x3F;
			blue = (*screen  & 0x001F);  
			
			red = (red << 3) | (red >> 2);
			green = (green << 2) | (green >> 4);
			blue = (blue << 3) | (blue >> 2);
	   
			*bitmap = (red << 16) | (green << 8) | (blue);
  			screen++;
  			bitmap++;
  			}
  		bitmap += KOffSetHorizontalPortrait352x416*2;
  		}
  	}


void BlitNTSC5THED( TUint8* aScreen, TUint8* aBitmap )
	{
	  DEBUGPRINT(_L("Try to BLIT"));
	TUint16* bitmap = (TUint16*) aBitmap;
	TUint16* screen = (TUint16*) aScreen;

	TUint16* screen_temp;
	

	//skip 1 lines
	bitmap += 384;
	
	for(TInt j=0; j<224;j++)
	 {
	 for( TInt i=0; i<254; i++)
	   {
	   *bitmap = *screen;
	   //*screenlarge_ptr = *screengba_ptr;
	   if( interptable_w[i] != (interptable_w[i+1] -1) )
	     {
	     //interpolate, or reproduce the pixel
	     bitmap++;
	     *bitmap = *screen;
	      }
		screen++;
		bitmap++;
	   }
	 if( interptable_h[j] != (interptable_h[j+1] -1))
	   {
	   //copy whole previous line
	  screen_temp = bitmap - 384;
	  memcpy(bitmap, screen_temp, 2 * 384);
	  bitmap += 384;
	   }
	 }
	
	}

void BlitPAL5THED( TUint8* aScreen, TUint8* aBitmap )
	{
	DEBUGPRINT(_L("Try to BLIT"));
	TUint16* bitmap = (TUint16*) aBitmap;
	TUint16* screen = (TUint16*) aScreen;

	TUint16* screen_temp;
	
	
	for(TInt j=0; j<240;j++)
	 {
	 for( TInt i=0; i<254; i++)
	   {
	   *bitmap = *screen;
	   //*screenlarge_ptr = *screengba_ptr;
	   if( interptable_w[i] != (interptable_w[i+1] -1) )
	     {
	     //interpolate, or reproduce the pixel
	     bitmap++;
	     *bitmap = *screen;
	      }
		screen++;
		bitmap++;
	   }
	 if( interptable_h[j] != (interptable_h[j+1] -1))
	   {
	   //copy whole previous line
	  screen_temp = bitmap - 384;
	  memcpy(bitmap, screen_temp, 2 * 384);
	  bitmap += 384;
	   }
	 }
	}

inline void copyPixel16MU( TUint32* bitmap, TUint16* screen, TUint32 red,
					TUint32 green, TUint32 blue )
	{
	red = (*screen >> 11) & 0x1F;
	green = (*screen  >> 5) & 0x3F;
	blue = (*screen  & 0x001F);  
	
	red = (red << 3) | (red >> 2);
	green = (green << 2) | (green >> 4);
	blue = (blue << 3) | (blue >> 2);

	*bitmap = (red << 16) | (green << 8) | (blue);
//	screen++;
//	bitmap++;
	}


void BlitNTSCQTDSA( TUint8* aScreen, TUint8* aBitmap )
	{
	TUint32* bitmap = (TUint32*) aBitmap;
	TUint16* screen = (TUint16*) aScreen;
    TUint32* screen_temp;
    
	TUint32 red = 0;
	TUint32 green = 0;
	TUint32 blue = 0;
	
	//skip 1 lines
	bitmap += 384;
	 
	for(TInt j=0; j<224;j++)
	 {
	 for( TInt i=0; i<254; i++)
	   {
	   copyPixel16MU( bitmap, screen, red, green, blue );
	   //*bitmap = *screen;
	   //*screenlarge_ptr = *screengba_ptr;
	   if( interptable_w[i] != (interptable_w[i+1] -1) )
	     {
	     //interpolate, or reproduce the pixel
	     bitmap++;
	     copyPixel16MU( bitmap, screen, red, green, blue );
	     //*bitmap = *screen;
	      }
		screen++;
		bitmap++;
	   }
	 if( interptable_h[j] != (interptable_h[j+1] -1))
	   {
	   //copy whole previous line
	   screen_temp = bitmap - 384;
	   memcpy(bitmap, screen_temp, 4*384);
	   bitmap += 384;
	   }
	 }
	bitmap += 384;
	}

void BlitSamsungNTSCQTDSA( TUint8* aScreen, TUint8* aBitmap )
	{
	TUint32* bitmap = (TUint32*) aBitmap;
	TUint16* screen = (TUint16*) aScreen;
    TUint32* screen_temp;
	TUint32* bitmap_temp = bitmap;	
    screen += 256*224;
	TUint32 red = 0;
	TUint32 green = 0;
	TUint32 blue = 0;
	
	for(TInt j=0; j<224;j++)
	 {
	 screen -= 256;

	 for( TInt i=0; i<256; i++)
	   {
	   copyPixel16MU( bitmap, screen, red, green, blue );

	   if( interptable_w[i] != (interptable_w[i+1] -1) )
	     {
	     //interpolate, or reproduce the pixel
	     bitmap+=360;
	     copyPixel16MU( bitmap, screen, red, green, blue );
	     }
		screen++;
		bitmap+=360;
	   }
	   screen-=256;
	   bitmap_temp++;
	   bitmap = bitmap_temp;
	 if( interptable_h[j] != (interptable_h[j+1] -1))
	   {
	   //copy whole previous line
		for( TInt i=0; i<256; i++)
		{
			copyPixel16MU( bitmap, screen, red, green, blue );

			if( interptable_w[i] != (interptable_w[i+1] -1) )
			{
				//interpolate, or reproduce the pixel
				bitmap+=360;
				copyPixel16MU( bitmap, screen, red, green, blue );
			}
			screen++;
			bitmap+=360;
			
	    }
	   bitmap_temp++;
	   bitmap = bitmap_temp;
	   screen-=256;
	  }
	 }
	 
	 //copy the last but three line in the last but two line
	 bitmap = (TUint32*) aBitmap;
	 bitmap_temp = bitmap;
	 bitmap+=358;
	 		for( TInt i=0; i<256; i++)
		{
			copyPixel16MU( bitmap, screen, red, green, blue );

			if( interptable_w[i] != (interptable_w[i+1] -1) )
			{
				//interpolate, or reproduce the pixel
				bitmap+=360;
				copyPixel16MU( bitmap, screen, red, green, blue );
			}
			screen++;
			bitmap+=360;
			
	    }
	 //copy the last but three line in the last but one line
	 screen-=256;
	 bitmap = bitmap_temp;
	 bitmap += 359;
	 	for( TInt i=0; i<256; i++)
		{
			copyPixel16MU( bitmap, screen, red, green, blue );

			if( interptable_w[i] != (interptable_w[i+1] -1) )
			{
				//interpolate, or reproduce the pixel
				bitmap+=360;
				copyPixel16MU( bitmap, screen, red, green, blue );
			}
			screen++;
			bitmap+=360;
			
	    }	 
	}
	
void BlitPALQTDSA( TUint8* aScreen, TUint8* aBitmap )
	{
	TUint32* bitmap = (TUint32*) aBitmap;
	TUint16* screen = (TUint16*) aScreen;
    TUint32* screen_temp;
    
	TUint32 red = 0;
	TUint32 green = 0;
	TUint32 blue = 0;
	
	//skip 1 lines
	 
	for(TInt j=0; j<240;j++)
		 {
		 for( TInt i=0; i<254; i++)
		   {
			 copyPixel16MU( bitmap, screen, red, green, blue );
		   if( interptable_w[i] != (interptable_w[i+1] -1) )
		     {
		     //interpolate, or reproduce the pixel
		     bitmap++;
		     copyPixel16MU( bitmap, screen, red, green, blue );
		      }
			screen++;
			bitmap++;
		   }
		 if( interptable_h[j] != (interptable_h[j+1] -1))
		   {
		   //copy whole previous line
		   screen_temp = bitmap - 384;
		   memcpy(bitmap, screen_temp, 4*384);
		   bitmap += 384;
		   }
		 }
	
	}
