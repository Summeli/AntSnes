/*   
   Generate PPU tiles routines in ARM assembly.
   Syntax used is ARM ADS 1.2
   
   16 Bits version

   Author      : YoyoFR
   Last update : 16-Dec-2003

   notaz: changed syntax to GNU as (2006)
*/

/************************************************************

  Registers usage :
    R14 = SubScreen TranspBuffer
	R12 = OfsGP32 (ram video)
	R11 = Cache Pixel
	R10 = Cache Header
	R9  = Ofs jumptable
	R8  = Column counter
	R7  = ofsgp32 adder
	R6  = Clipping value to add to header value
	R5  = Transp/Opaque

*************************************************************/

#include "stdio.h"
#include "stdlib.h"


void func_begin(char *src,unsigned char mode,int flipping,int align,int transp)
{
	sprintf(src,"%s\nPPU16_%02X_%d_%d_%s:\n@ case %c%c%c%c%c%c%c%c\n",src,mode,flipping,align,(transp?"t":"n"),
		48+((mode>>7)&1),48+((mode>>6)&1),48+((mode>>5)&1),48+((mode>>4)&1),
		48+((mode>>3)&1),48+((mode>>2)&1),48+((mode>>1)&1),48+((mode>>0)&1));
		
}

void func_end(char *src,unsigned char mode,int flipping,int transp)
{	
	if (mode==0xFF)
	{
		//next cache col
		sprintf(src,"%s		add		R11,R11,#16\n",src);
		//next vram col, based on vertical flipping
		if (flipping&1) 
		{
			sprintf(src,"%s		add		R12,R12,#16\n",src);
			if (transp) sprintf(src,"%s		add		R14,R14,#8\n",src);
		}
		else 
		{
			sprintf(src,"%s		sub		R12,R12,#16\n",src);
			if (transp) sprintf(src,"%s		sub		R14,R14,#8\n",src);
		}

	}
	sprintf(src,"%s		NEXT_COL16%s\n@ ----------------------------------------\n",src,(transp?"t":"n"));
}

void func_index(char *src,int flipping,int align,int transp)
{	
	int i,j;
	sprintf(src,"%sjumptable_ppu16%d%d%s:\n",src,flipping,align,(transp?"t":"n"));
	/*for (i=0;i<16;i++)
	{
		sprintf(src,"%s		DCD	",src);
		for (j=0;j<15;j++)
		{
			sprintf(src,"%sPPU_%02X_%d,",src,i*16+j,flipping);
		}
		sprintf(src,"%sPPU_%02X_%d\n",src,i*16+j,flipping);
	}*/
	for (i=0;i<=255;i++)
	{
		sprintf(src,"%s		.long		PPU16_%02X_%d_%d_%s\n",src,i,flipping,align,(transp?"t":"n"));
	}
}

void func_base(char *src)
{
//	sprintf(src,"%s		AREA		ppuasm16, CODE, READONLY\n",src);
	sprintf(src,"%s		.globl		asmDrawTile16\n",src);
	sprintf(src,"%s		.globl		asmDrawTileClipped16\n\n",src);
#ifdef GENERATE_TRAMSP
	sprintf(src,"%s		.globl		asmDrawTileTranspO16\n",src);
	sprintf(src,"%s		.globl		asmDrawTileClippedTranspO16\n\n",src);
	sprintf(src,"%s		.globl		asmDrawTileTranspT16\n",src);
	sprintf(src,"%s		.globl		asmDrawTileClippedTranspT16\n\n",src);
#endif
	sprintf(src,"%s		.extern		SubScreenTranspBuffer\n\n\n",src);

	sprintf(src,"%s	@ R14 = SubScreen TranspBuffer\n",src);
	sprintf(src,"%s	@ R12 = OfsGP32 (ram video)\n",src);
	sprintf(src,"%s	@ R11 = Cache Pixel\n",src);
	sprintf(src,"%s	@ R10 = Cache Header\n",src);
	sprintf(src,"%s	@ R9  = Ofs jumptable\n",src);
	sprintf(src,"%s	@ R8  = Column counter\n",src);
	sprintf(src,"%s	@ R7  = ofsgp32 adder\n",src);
	sprintf(src,"%s	@ R6  = Clipping value to add to header value\n",src);
	sprintf(src,"%s	@ R5  = Transp/Opaque\n\n\n",src);


	sprintf(src,"%s		.macro NEXT_COL16n\n",src);
	sprintf(src,"%s		subs		R8,R8,#1\n",src);
	sprintf(src,"%s		ldrneb		R0,[R10],#1\n",src);
	sprintf(src,"%s		addne		R12,R12,R7\n",src);
	sprintf(src,"%s		orrne		R0,R0,R6\n",src);	
	sprintf(src,"%s		ldrne		PC,[R9,R0,lsl #2]\n",src);
	sprintf(src,"%s		ldmfd		R13!,{R4-R11}\n",src);
	sprintf(src,"%s		mov			PC,LR\n",src);
	sprintf(src,"%s		.endm\n\n\n",src);

#ifdef GENERATE_TRAMSP
	sprintf(src,"%s		.macro NEXT_COL16t\n",src);
	sprintf(src,"%s		subs		R8,R8,#1\n",src);
	sprintf(src,"%s		ldrneb		R0,[R10],#1\n",src);
	sprintf(src,"%s		addne		R12,R12,R7,lsl #1\n",src);
	sprintf(src,"%s		addne		R14,R14,R7\n",src);
	sprintf(src,"%s		orrne		R0,R0,R6\n",src);	
	sprintf(src,"%s		ldrne		PC,[R9,R0,lsl #2]\n",src);
	sprintf(src,"%s		ldmfd		R13!,{R4-R11,R14}\n",src);
	sprintf(src,"%s		mov			PC,LR\n",src);
	sprintf(src,"%s		.endm\n\n\n",src);
#endif

	
	sprintf(src,"%s@ main funcs\n",src);
	sprintf(src,"%sasmDrawTile16:\n",src);
	sprintf(src,"%s@  asmDrawTile( cache,solidbuf,OffsetGP32,Flip) \n",src);
	sprintf(src,"%s@                R0    R1       R2         R3 \n",src);
	sprintf(src,"%s@  Flip : 0,1,2,3 -> None,VFLIP,HFLIP,VFLIP&HFLIP \n",src);
	sprintf(src,"%s		stmfd		R13!,{R4-R11}\n",src);
	sprintf(src,"%s		mov		R12,R2\n",src);
	sprintf(src,"%s		mov		R10,R0\n",src);	
	sprintf(src,"%s		add		R11,R0,#8\n",src);	
	sprintf(src,"%s		mov		R8,#8\n",src);
	sprintf(src,"%s		mov		R6,R1\n",src);	

	sprintf(src,"%s		tst		R12,#2\n",src);
	sprintf(src,"%s		bne		not_aligned16\n",src);


	sprintf(src,"%s		cmp		R3,#0\n",src);
	sprintf(src,"%s		bne		flip_not0_aligned16\n",src);
	sprintf(src,"%s		ldr		R9,= jumptable_ppu1600n\n",src);
	sprintf(src,"%s		ldrb	R0,[R10],#1\n",src);
	sprintf(src,"%s		orr		R0,R0,R6\n",src);
	sprintf(src,"%s		ldr		R7, = 496\n",src);
	sprintf(src,"%s		ldr		PC,[R9,R0,lsl #2]\n",src);
	sprintf(src,"%sflip_not0_aligned16:\n",src);
	sprintf(src,"%s		cmp		R3,#1\n",src);
	sprintf(src,"%s		bne		flip_not1_aligned16\n",src);
	sprintf(src,"%s		ldr		R9,= jumptable_ppu1611n\n",src);
	sprintf(src,"%s		ldrb	R0,[R10],#1\n",src);
	sprintf(src,"%s		orr		R0,R0,R6\n",src);
	sprintf(src,"%s		ldr		R7, = 464\n",src);
	sprintf(src,"%s		sub		R12,R12,#14\n",src);
	sprintf(src,"%s		ldr		PC,[R9,R0,lsl #2]\n",src);
	sprintf(src,"%sflip_not1_aligned16:\n",src);
	sprintf(src,"%s		cmp		R3,#2\n",src);
	sprintf(src,"%s		bne		flip_not2_aligned16\n",src);
	sprintf(src,"%s		ldr		R9,= jumptable_ppu1600n\n",src);
	sprintf(src,"%s		ldrb	R0,[R10],#1\n",src);
	sprintf(src,"%s		orr		R0,R0,R6\n",src);
	sprintf(src,"%s		ldr		R7, = -464\n",src);
	sprintf(src,"%s		ldr		PC,[R9,R0,lsl #2]\n",src);
	sprintf(src,"%sflip_not2_aligned16:\n",src);
	sprintf(src,"%s		ldr		R9,= jumptable_ppu1611n\n",src);
	sprintf(src,"%s		ldrb	R0,[R10],#1\n",src);
	sprintf(src,"%s		orr		R0,R0,R6\n",src);
	sprintf(src,"%s		ldr		R7, = -496\n",src);
	sprintf(src,"%s		sub		R12,R12,#14\n",src);
	sprintf(src,"%s		ldr		PC,[R9,R0,lsl #2]\n",src);

	sprintf(src,"%snot_aligned16:\n",src);
	sprintf(src,"%s		cmp		R3,#0\n",src);
	sprintf(src,"%s		bne		flip_not0_not_aligned16\n",src);
	sprintf(src,"%s		ldr		R9,= jumptable_ppu1601n\n",src);
	sprintf(src,"%s		ldrb	R0,[R10],#1\n",src);
	sprintf(src,"%s		orr		R0,R0,R6\n",src);
	sprintf(src,"%s		ldr		R7, = 496\n",src);
	sprintf(src,"%s		ldr		PC,[R9,R0,lsl #2]\n",src);
	sprintf(src,"%sflip_not0_not_aligned16:\n",src);
	sprintf(src,"%s		cmp		R3,#1\n",src);
	sprintf(src,"%s		bne		flip_not1_not_aligned16\n",src);	
	sprintf(src,"%s		ldr		R9,= jumptable_ppu1610n\n",src);
	sprintf(src,"%s		ldrb	R0,[R10],#1\n",src);
	sprintf(src,"%s		orr		R0,R0,R6\n",src);
	sprintf(src,"%s		ldr		R7, = 464\n",src);	
	sprintf(src,"%s		sub		R12,R12,#14\n",src);	
	sprintf(src,"%s		ldr		PC,[R9,R0,lsl #2]\n",src);
	sprintf(src,"%sflip_not1_not_aligned16:\n",src);
	sprintf(src,"%s		cmp		R3,#2\n",src);
	sprintf(src,"%s		bne		flip_not2_not_aligned16\n",src);
	sprintf(src,"%s		ldr		R9,= jumptable_ppu1601n\n",src);
	sprintf(src,"%s		ldrb	R0,[R10],#1\n",src);
	sprintf(src,"%s		orr		R0,R0,R6\n",src);
	sprintf(src,"%s		ldr		R7, = -464\n",src);	
	sprintf(src,"%s		ldr		PC,[R9,R0,lsl #2]\n",src);
	sprintf(src,"%sflip_not2_not_aligned16:\n",src);
	sprintf(src,"%s		ldr		R9,= jumptable_ppu1610n\n",src);
	sprintf(src,"%s		ldrb	R0,[R10],#1\n",src);
	sprintf(src,"%s		orr		R0,R0,R6\n",src);
	sprintf(src,"%s		ldr		R7, = -496\n",src);
	sprintf(src,"%s		sub		R12,R12,#14\n",src);
	sprintf(src,"%s		ldr		PC,[R9,R0,lsl #2]\n",src);

	sprintf(src,"%s\n\n",src);

	sprintf(src,"%sasmDrawTileClipped16:\n",src);
	sprintf(src,"%s		@  asmDrawTileClipped( cache,start<<16 width<<8 solidbuf,OffsetGP32,Flip) \n",src);
	sprintf(src,"%s		@                       R0             R1                 R2         R3 \n",src);
	sprintf(src,"%s		@  Flip : 0,1,2,3 -> None,VFLIP,HFLIP,VFLIP&HFLIP \n\n",src);
	sprintf(src,"%s		stmfd		R13!,{R4-R11}\n",src);
	sprintf(src,"%s		mov		R12,R2\n",src);
	sprintf(src,"%s		mov		R10,R0\n",src);
	sprintf(src,"%s		add		R11,R0,#8\n\n",src);
		
	sprintf(src,"%s		mov		R0,R1,lsr #8\n",src);
	sprintf(src,"%s		and		R8,R0,#0xFF				\n",src);
	sprintf(src,"%s		mov		R0,R0,lsr #8			\n",src);
	sprintf(src,"%s		add		R10,R10,R0\n",src);
	sprintf(src,"%s		add		R11,R11,R0,lsl #4\n\n",src);
		
	sprintf(src,"%s		and		R6,R1,#0xFF\n\n",src);
	sprintf(src,"%s		tst		R12,#2\n",src);
	sprintf(src,"%s		bne		clip_not_aligned16\n",src);


	sprintf(src,"%s		cmp		R3,#0\n",src);
	sprintf(src,"%s		bne		clip_flip_not0_aligned16\n",src);
	sprintf(src,"%s		ldr		R9,= jumptable_ppu1600n\n",src);
	sprintf(src,"%s		ldrb	R0,[R10],#1\n",src);
	sprintf(src,"%s		orr		R0,R0,R6\n",src);
	sprintf(src,"%s		ldr		R7, = 496\n",src);
	sprintf(src,"%s		ldr		PC,[R9,R0,lsl #2]\n",src);
	sprintf(src,"%sclip_flip_not0_aligned16:\n",src);
	sprintf(src,"%s		cmp		R3,#1\n",src);
	sprintf(src,"%s		bne		clip_flip_not1_aligned16\n",src);
	sprintf(src,"%s		ldr		R9,= jumptable_ppu1611n\n",src);
	sprintf(src,"%s		ldrb	R0,[R10],#1\n",src);
	sprintf(src,"%s		orr		R0,R0,R6\n",src);
	sprintf(src,"%s		ldr		R7, = 464\n",src);
	sprintf(src,"%s		sub		R12,R12,#14\n",src);
	sprintf(src,"%s		ldr		PC,[R9,R0,lsl #2]\n",src);
	sprintf(src,"%sclip_flip_not1_aligned16:\n",src);
	sprintf(src,"%s		cmp		R3,#2\n",src);
	sprintf(src,"%s		bne		clip_flip_not2_aligned16\n",src);
	sprintf(src,"%s		ldr		R9,= jumptable_ppu1600n\n",src);
	sprintf(src,"%s		ldrb	R0,[R10],#1\n",src);
	sprintf(src,"%s		orr		R0,R0,R6\n",src);
	sprintf(src,"%s		ldr		R7, = -464\n",src);
	sprintf(src,"%s		ldr		PC,[R9,R0,lsl #2]\n",src);
	sprintf(src,"%sclip_flip_not2_aligned16:\n",src);
	sprintf(src,"%s		ldr		R9,= jumptable_ppu1611n\n",src);
	sprintf(src,"%s		ldrb	R0,[R10],#1\n",src);
	sprintf(src,"%s		orr		R0,R0,R6\n",src);
	sprintf(src,"%s		ldr		R7, = -496\n",src);
	sprintf(src,"%s		sub		R12,R12,#14\n",src);
	sprintf(src,"%s		ldr		PC,[R9,R0,lsl #2]\n",src);

	sprintf(src,"%sclip_not_aligned16:\n",src);
	sprintf(src,"%s		cmp		R3,#0\n",src);
	sprintf(src,"%s		bne		clip_flip_not0_not_aligned16\n",src);
	sprintf(src,"%s		ldr		R9,= jumptable_ppu1601n\n",src);
	sprintf(src,"%s		ldrb	R0,[R10],#1\n",src);
	sprintf(src,"%s		orr		R0,R0,R6\n",src);
	sprintf(src,"%s		ldr		R7, = 496\n",src);
	sprintf(src,"%s		ldr		PC,[R9,R0,lsl #2]\n",src);
	sprintf(src,"%sclip_flip_not0_not_aligned16:\n",src);
	sprintf(src,"%s		cmp		R3,#1\n",src);
	sprintf(src,"%s		bne		clip_flip_not1_not_aligned16\n",src);	
	sprintf(src,"%s		ldr		R9,= jumptable_ppu1610n\n",src);
	sprintf(src,"%s		ldrb	R0,[R10],#1\n",src);
	sprintf(src,"%s		orr		R0,R0,R6\n",src);
	sprintf(src,"%s		ldr		R7, = 464\n",src);	
	sprintf(src,"%s		sub		R12,R12,#14\n",src);	
	sprintf(src,"%s		ldr		PC,[R9,R0,lsl #2]\n",src);
	sprintf(src,"%sclip_flip_not1_not_aligned16:\n",src);
	sprintf(src,"%s		cmp		R3,#2\n",src);
	sprintf(src,"%s		bne		clip_flip_not2_not_aligned16\n",src);
	sprintf(src,"%s		ldr		R9,= jumptable_ppu1601n\n",src);
	sprintf(src,"%s		ldrb	R0,[R10],#1\n",src);
	sprintf(src,"%s		orr		R0,R0,R6\n",src);
	sprintf(src,"%s		ldr		R7, = -464\n",src);	
	sprintf(src,"%s		ldr		PC,[R9,R0,lsl #2]\n",src);
	sprintf(src,"%sclip_flip_not2_not_aligned16:\n",src);
	sprintf(src,"%s		ldr		R9,= jumptable_ppu1610n\n",src);
	sprintf(src,"%s		ldrb	R0,[R10],#1\n",src);
	sprintf(src,"%s		orr		R0,R0,R6\n",src);
	sprintf(src,"%s		ldr		R7, = -496\n",src);
	sprintf(src,"%s		sub		R12,R12,#14\n",src);
	sprintf(src,"%s		ldr		PC,[R9,R0,lsl #2]\n",src);
		
	
	sprintf(src,"%s\n\n",src);

	sprintf(src,"%s	.ltorg\n\n",src);


#ifdef GENERATE_TRAMSP
	sprintf(src,"%s@ main funcs\n",src);
	sprintf(src,"%sasmDrawTileTranspO16:\n",src);
	sprintf(src,"%s@  asmDrawTile( cache,solidbuf,OffsetGP32,Flip) \n",src);
	sprintf(src,"%s@                R0    R1       R2         R3 \n",src);
	sprintf(src,"%s@  Flip : 0,1,2,3 -> None,VFLIP,HFLIP,VFLIP&HFLIP \n",src);
	sprintf(src,"%s		stmfd		R13!,{R4-R11,R14}\n",src);
	sprintf(src,"%s		ldr		R14,= SubScreenTranspBuffer\n",src);
	sprintf(src,"%s		ldr		R14,[R14]\n",src);
	sprintf(src,"%s@ opaque\n",src);
	sprintf(src,"%s		mov		R5,#0\n\n",src);
	sprintf(src,"%s		mov		R12,R2\n",src);
	sprintf(src,"%s		mov		R10,R0\n",src);	
	sprintf(src,"%s		add		R11,R0,#8\n",src);	
	sprintf(src,"%s		mov		R8,#8\n",src);
	sprintf(src,"%s		mov		R6,R1\n",src);	

	sprintf(src,"%s		tst		R12,#2\n",src);
	sprintf(src,"%s		bne		TranspOnot_aligned16\n",src);


	sprintf(src,"%s		cmp		R3,#0\n",src);
	sprintf(src,"%s		bne		TranspOflip_not0_aligned16\n",src);
	sprintf(src,"%s		ldr		R9,= jumptable_ppu1600t\n",src);
	sprintf(src,"%s		ldrb	R0,[R10],#1\n",src);
	sprintf(src,"%s		orr		R0,R0,R6\n",src);
	sprintf(src,"%s		ldr		R7, = 248\n",src);
	sprintf(src,"%s		ldr		PC,[R9,R0,lsl #2]\n",src);
	sprintf(src,"%sTranspOflip_not0_aligned16:\n",src);
	sprintf(src,"%s		cmp		R3,#1\n",src);
	sprintf(src,"%s		bne		TranspOflip_not1_aligned16\n",src);
	sprintf(src,"%s		ldr		R9,= jumptable_ppu1611t\n",src);
	sprintf(src,"%s		ldrb	R0,[R10],#1\n",src);
	sprintf(src,"%s		orr		R0,R0,R6\n",src);
	sprintf(src,"%s		ldr		R7, = 232\n",src);
	sprintf(src,"%s		sub		R12,R12,#14\n",src);
	sprintf(src,"%s		sub		R14,R14,#7\n",src);
	sprintf(src,"%s		ldr		PC,[R9,R0,lsl #2]\n",src);
	sprintf(src,"%sTranspOflip_not1_aligned16:\n",src);
	sprintf(src,"%s		cmp		R3,#2\n",src);
	sprintf(src,"%s		bne		TranspOflip_not2_aligned16\n",src);
	sprintf(src,"%s		ldr		R9,= jumptable_ppu1600t\n",src);
	sprintf(src,"%s		ldrb	R0,[R10],#1\n",src);
	sprintf(src,"%s		orr		R0,R0,R6\n",src);
	sprintf(src,"%s		ldr		R7, = -232\n",src);
	sprintf(src,"%s		ldr		PC,[R9,R0,lsl #2]\n",src);
	sprintf(src,"%sTranspOflip_not2_aligned16:\n",src);
	sprintf(src,"%s		ldr		R9,= jumptable_ppu1611t\n",src);
	sprintf(src,"%s		ldrb	R0,[R10],#1\n",src);
	sprintf(src,"%s		orr		R0,R0,R6\n",src);
	sprintf(src,"%s		ldr		R7, = -248\n",src);
	sprintf(src,"%s		sub		R12,R12,#14\n",src);
	sprintf(src,"%s		sub		R14,R14,#7\n",src);
	sprintf(src,"%s		ldr		PC,[R9,R0,lsl #2]\n",src);

	sprintf(src,"%sTranspOnot_aligned16:\n",src);
	sprintf(src,"%s		cmp		R3,#0\n",src);
	sprintf(src,"%s		bne		TranspOflip_not0_not_aligned16\n",src);
	sprintf(src,"%s		ldr		R9,= jumptable_ppu1601t\n",src);
	sprintf(src,"%s		ldrb	R0,[R10],#1\n",src);
	sprintf(src,"%s		orr		R0,R0,R6\n",src);
	sprintf(src,"%s		ldr		R7, = 248\n",src);
	sprintf(src,"%s		ldr		PC,[R9,R0,lsl #2]\n",src);
	sprintf(src,"%sTranspOflip_not0_not_aligned16:\n",src);
	sprintf(src,"%s		cmp		R3,#1\n",src);
	sprintf(src,"%s		bne		TranspOflip_not1_not_aligned16\n",src);	
	sprintf(src,"%s		ldr		R9,= jumptable_ppu1610t\n",src);
	sprintf(src,"%s		ldrb	R0,[R10],#1\n",src);
	sprintf(src,"%s		orr		R0,R0,R6\n",src);
	sprintf(src,"%s		ldr		R7, = 232\n",src);	
	sprintf(src,"%s		sub		R12,R12,#14\n",src);	
	sprintf(src,"%s		sub		R14,R14,#7\n",src);
	sprintf(src,"%s		ldr		PC,[R9,R0,lsl #2]\n",src);
	sprintf(src,"%sTranspOflip_not1_not_aligned16:\n",src);
	sprintf(src,"%s		cmp		R3,#2\n",src);
	sprintf(src,"%s		bne		TranspOflip_not2_not_aligned16\n",src);
	sprintf(src,"%s		ldr		R9,= jumptable_ppu1601t\n",src);
	sprintf(src,"%s		ldrb	R0,[R10],#1\n",src);
	sprintf(src,"%s		orr		R0,R0,R6\n",src);
	sprintf(src,"%s		ldr		R7, = -232\n",src);	
	sprintf(src,"%s		ldr		PC,[R9,R0,lsl #2]\n",src);
	sprintf(src,"%sTranspOflip_not2_not_aligned16:\n",src);
	sprintf(src,"%s		ldr		R9,= jumptable_ppu1610t\n",src);
	sprintf(src,"%s		ldrb	R0,[R10],#1\n",src);
	sprintf(src,"%s		orr		R0,R0,R6\n",src);
	sprintf(src,"%s		ldr		R7, = -248\n",src);
	sprintf(src,"%s		sub		R12,R12,#14\n",src);
	sprintf(src,"%s		sub		R14,R14,#7\n",src);
	sprintf(src,"%s		ldr		PC,[R9,R0,lsl #2]\n",src);

	sprintf(src,"%s\n\n",src);

	sprintf(src,"%sasmDrawTileClippedTranspO16:\n",src);
	sprintf(src,"%s		@  asmDrawTileClipped( cache,start<<16 width<<8 solidbuf,OffsetGP32,Flip) \n",src);
	sprintf(src,"%s		@                       R0             R1                 R2         R3 \n",src);
	sprintf(src,"%s		@  Flip : 0,1,2,3 -> None,VFLIP,HFLIP,VFLIP&HFLIP \n\n",src);
	sprintf(src,"%s		stmfd		R13!,{R4-R11,R14}\n",src);
	sprintf(src,"%s		ldr		R14,= SubScreenTranspBuffer\n",src);
	sprintf(src,"%s		ldr		R14,[R14]\n",src);
	sprintf(src,"%s@ opaque\n",src);
	sprintf(src,"%s		mov		R5,#0\n\n",src);
	sprintf(src,"%s		mov		R12,R2\n",src);
	sprintf(src,"%s		mov		R10,R0\n",src);
	sprintf(src,"%s		add		R11,R0,#8\n\n",src);
		
	sprintf(src,"%s		mov		R0,R1,lsr #8\n",src);
	sprintf(src,"%s		and		R8,R0,#0xFF				\n",src);
	sprintf(src,"%s		mov		R0,R0,lsr #8			\n",src);
	sprintf(src,"%s		add		R10,R10,R0\n",src);
	sprintf(src,"%s		add		R11,R11,R0,lsl #4\n\n",src);
		
	sprintf(src,"%s		and		R6,R1,#0xFF\n\n",src);
	sprintf(src,"%s		tst		R12,#2\n",src);
	sprintf(src,"%s		bne		TranspOclip_not_aligned16\n",src);


	sprintf(src,"%s		cmp		R3,#0\n",src);
	sprintf(src,"%s		bne		TranspOclip_flip_not0_aligned16\n",src);
	sprintf(src,"%s		ldr		R9,= jumptable_ppu1600t\n",src);
	sprintf(src,"%s		ldrb	R0,[R10],#1\n",src);
	sprintf(src,"%s		orr		R0,R0,R6\n",src);
	sprintf(src,"%s		ldr		R7, = 248\n",src);
	sprintf(src,"%s		ldr		PC,[R9,R0,lsl #2]\n",src);
	sprintf(src,"%sTranspOclip_flip_not0_aligned16:\n",src);
	sprintf(src,"%s		cmp		R3,#1\n",src);
	sprintf(src,"%s		bne		TranspOclip_flip_not1_aligned16\n",src);
	sprintf(src,"%s		ldr		R9,= jumptable_ppu1611t\n",src);
	sprintf(src,"%s		ldrb	R0,[R10],#1\n",src);
	sprintf(src,"%s		orr		R0,R0,R6\n",src);
	sprintf(src,"%s		ldr		R7, = 232\n",src);
	sprintf(src,"%s		sub		R12,R12,#14\n",src);
	sprintf(src,"%s		sub		R14,R14,#7\n",src);
	sprintf(src,"%s		ldr		PC,[R9,R0,lsl #2]\n",src);
	sprintf(src,"%sTranspOclip_flip_not1_aligned16:\n",src);
	sprintf(src,"%s		cmp		R3,#2\n",src);
	sprintf(src,"%s		bne		TranspOclip_flip_not2_aligned16\n",src);
	sprintf(src,"%s		ldr		R9,= jumptable_ppu1600t\n",src);
	sprintf(src,"%s		ldrb	R0,[R10],#1\n",src);
	sprintf(src,"%s		orr		R0,R0,R6\n",src);
	sprintf(src,"%s		ldr		R7, = -232\n",src);
	sprintf(src,"%s		ldr		PC,[R9,R0,lsl #2]\n",src);
	sprintf(src,"%sTranspOclip_flip_not2_aligned16:\n",src);
	sprintf(src,"%s		ldr		R9,= jumptable_ppu1611t\n",src);
	sprintf(src,"%s		ldrb	R0,[R10],#1\n",src);
	sprintf(src,"%s		orr		R0,R0,R6\n",src);
	sprintf(src,"%s		ldr		R7, = -248\n",src);
	sprintf(src,"%s		sub		R12,R12,#14\n",src);
	sprintf(src,"%s		sub		R14,R14,#7\n",src);
	sprintf(src,"%s		ldr		PC,[R9,R0,lsl #2]\n",src);

	sprintf(src,"%sTranspOclip_not_aligned16:\n",src);
	sprintf(src,"%s		cmp		R3,#0\n",src);
	sprintf(src,"%s		bne		TranspOclip_flip_not0_not_aligned16\n",src);
	sprintf(src,"%s		ldr		R9,= jumptable_ppu1601t\n",src);
	sprintf(src,"%s		ldrb	R0,[R10],#1\n",src);
	sprintf(src,"%s		orr		R0,R0,R6\n",src);
	sprintf(src,"%s		ldr		R7, = 248\n",src);
	sprintf(src,"%s		ldr		PC,[R9,R0,lsl #2]\n",src);
	sprintf(src,"%sTranspOclip_flip_not0_not_aligned16:\n",src);
	sprintf(src,"%s		cmp		R3,#1\n",src);
	sprintf(src,"%s		bne		TranspOclip_flip_not1_not_aligned16\n",src);	
	sprintf(src,"%s		ldr		R9,= jumptable_ppu1610t\n",src);
	sprintf(src,"%s		ldrb	R0,[R10],#1\n",src);
	sprintf(src,"%s		orr		R0,R0,R6\n",src);
	sprintf(src,"%s		ldr		R7, = 232\n",src);	
	sprintf(src,"%s		sub		R12,R12,#14\n",src);	
	sprintf(src,"%s		sub		R14,R14,#7\n",src);
	sprintf(src,"%s		ldr		PC,[R9,R0,lsl #2]\n",src);
	sprintf(src,"%sTranspOclip_flip_not1_not_aligned16:\n",src);
	sprintf(src,"%s		cmp		R3,#2\n",src);
	sprintf(src,"%s		bne		TranspOclip_flip_not2_not_aligned16\n",src);
	sprintf(src,"%s		ldr		R9,= jumptable_ppu1601t\n",src);
	sprintf(src,"%s		ldrb	R0,[R10],#1\n",src);
	sprintf(src,"%s		orr		R0,R0,R6\n",src);
	sprintf(src,"%s		ldr		R7, = -232\n",src);	
	sprintf(src,"%s		ldr		PC,[R9,R0,lsl #2]\n",src);
	sprintf(src,"%sTranspOclip_flip_not2_not_aligned16:\n",src);
	sprintf(src,"%s		ldr		R9,= jumptable_ppu1610t\n",src);
	sprintf(src,"%s		ldrb	R0,[R10],#1\n",src);
	sprintf(src,"%s		orr		R0,R0,R6\n",src);
	sprintf(src,"%s		ldr		R7, = -248\n",src);
	sprintf(src,"%s		sub		R12,R12,#14\n",src);
	sprintf(src,"%s		sub		R14,R14,#7\n",src);
	sprintf(src,"%s		ldr		PC,[R9,R0,lsl #2]\n",src);
		
	
	sprintf(src,"%s\n\n",src);


	sprintf(src,"%s@ main funcs\n",src);
	sprintf(src,"%sasmDrawTileTranspT16:\n",src);
	sprintf(src,"%s@  asmDrawTile( cache,solidbuf,OffsetGP32,Flip) \n",src);
	sprintf(src,"%s@                R0    R1       R2         R3 \n",src);
	sprintf(src,"%s@  Flip : 0,1,2,3 -> None,VFLIP,HFLIP,VFLIP&HFLIP \n",src);
	sprintf(src,"%s		stmfd		R13!,{R4-R11,R14}\n",src);
	sprintf(src,"%s		ldr		R14,= SubScreenTranspBuffer\n",src);
	sprintf(src,"%s		ldr		R14,[R14]\n",src);
	sprintf(src,"%s@ opaque\n",src);
	sprintf(src,"%s		mov		R5,#1\n\n",src);
	sprintf(src,"%s		mov		R12,R2\n",src);
	sprintf(src,"%s		mov		R10,R0\n",src);	
	sprintf(src,"%s		add		R11,R0,#8\n",src);	
	sprintf(src,"%s		mov		R8,#8\n",src);
	sprintf(src,"%s		mov		R6,R1\n",src);	

	sprintf(src,"%s		tst		R12,#2\n",src);
	sprintf(src,"%s		bne		TranspTnot_aligned16\n",src);


	sprintf(src,"%s		cmp		R3,#0\n",src);
	sprintf(src,"%s		bne		TranspTflip_not0_aligned16\n",src);
	sprintf(src,"%s		ldr		R9,= jumptable_ppu1600t\n",src);
	sprintf(src,"%s		ldrb	R0,[R10],#1\n",src);
	sprintf(src,"%s		orr		R0,R0,R6\n",src);
	sprintf(src,"%s		ldr		R7, = 248\n",src);
	sprintf(src,"%s		ldr		PC,[R9,R0,lsl #2]\n",src);
	sprintf(src,"%sTranspTflip_not0_aligned16:\n",src);
	sprintf(src,"%s		cmp		R3,#1\n",src);
	sprintf(src,"%s		bne		TranspTflip_not1_aligned16\n",src);
	sprintf(src,"%s		ldr		R9,= jumptable_ppu1611t\n",src);
	sprintf(src,"%s		ldrb	R0,[R10],#1\n",src);
	sprintf(src,"%s		orr		R0,R0,R6\n",src);
	sprintf(src,"%s		ldr		R7, = 232\n",src);
	sprintf(src,"%s		sub		R12,R12,#14\n",src);
	sprintf(src,"%s		sub		R14,R14,#7\n",src);
	sprintf(src,"%s		ldr		PC,[R9,R0,lsl #2]\n",src);
	sprintf(src,"%sTranspTflip_not1_aligned16:\n",src);
	sprintf(src,"%s		cmp		R3,#2\n",src);
	sprintf(src,"%s		bne		TranspTflip_not2_aligned16\n",src);
	sprintf(src,"%s		ldr		R9,= jumptable_ppu1600t\n",src);
	sprintf(src,"%s		ldrb	R0,[R10],#1\n",src);
	sprintf(src,"%s		orr		R0,R0,R6\n",src);
	sprintf(src,"%s		ldr		R7, = -232\n",src);
	sprintf(src,"%s		ldr		PC,[R9,R0,lsl #2]\n",src);
	sprintf(src,"%sTranspTflip_not2_aligned16:\n",src);
	sprintf(src,"%s		ldr		R9,= jumptable_ppu1611t\n",src);
	sprintf(src,"%s		ldrb	R0,[R10],#1\n",src);
	sprintf(src,"%s		orr		R0,R0,R6\n",src);
	sprintf(src,"%s		ldr		R7, = -248\n",src);
	sprintf(src,"%s		sub		R12,R12,#14\n",src);
	sprintf(src,"%s		sub		R14,R14,#7\n",src);
	sprintf(src,"%s		ldr		PC,[R9,R0,lsl #2]\n",src);

	sprintf(src,"%sTranspTnot_aligned16:\n",src);
	sprintf(src,"%s		cmp		R3,#0\n",src);
	sprintf(src,"%s		bne		TranspTflip_not0_not_aligned16\n",src);
	sprintf(src,"%s		ldr		R9,= jumptable_ppu1601t\n",src);
	sprintf(src,"%s		ldrb	R0,[R10],#1\n",src);
	sprintf(src,"%s		orr		R0,R0,R6\n",src);
	sprintf(src,"%s		ldr		R7, = 248\n",src);
	sprintf(src,"%s		ldr		PC,[R9,R0,lsl #2]\n",src);
	sprintf(src,"%sTranspTflip_not0_not_aligned16:\n",src);
	sprintf(src,"%s		cmp		R3,#1\n",src);
	sprintf(src,"%s		bne		TranspTflip_not1_not_aligned16\n",src);	
	sprintf(src,"%s		ldr		R9,= jumptable_ppu1610t\n",src);
	sprintf(src,"%s		ldrb	R0,[R10],#1\n",src);
	sprintf(src,"%s		orr		R0,R0,R6\n",src);
	sprintf(src,"%s		ldr		R7, = 232\n",src);	
	sprintf(src,"%s		sub		R12,R12,#14\n",src);	
	sprintf(src,"%s		sub		R14,R14,#7\n",src);
	sprintf(src,"%s		ldr		PC,[R9,R0,lsl #2]\n",src);
	sprintf(src,"%sTranspTflip_not1_not_aligned16:\n",src);
	sprintf(src,"%s		cmp		R3,#2\n",src);
	sprintf(src,"%s		bne		TranspTflip_not2_not_aligned16\n",src);
	sprintf(src,"%s		ldr		R9,= jumptable_ppu1601t\n",src);
	sprintf(src,"%s		ldrb	R0,[R10],#1\n",src);
	sprintf(src,"%s		orr		R0,R0,R6\n",src);
	sprintf(src,"%s		ldr		R7, = -232\n",src);	
	sprintf(src,"%s		ldr		PC,[R9,R0,lsl #2]\n",src);
	sprintf(src,"%sTranspTflip_not2_not_aligned16:\n",src);
	sprintf(src,"%s		ldr		R9,= jumptable_ppu1610t\n",src);
	sprintf(src,"%s		ldrb	R0,[R10],#1\n",src);
	sprintf(src,"%s		orr		R0,R0,R6\n",src);
	sprintf(src,"%s		ldr		R7, = -248\n",src);
	sprintf(src,"%s		sub		R12,R12,#14\n",src);
	sprintf(src,"%s		sub		R14,R14,#7\n",src);
	sprintf(src,"%s		ldr		PC,[R9,R0,lsl #2]\n",src);

	sprintf(src,"%s\n\n",src);

	sprintf(src,"%sasmDrawTileClippedTranspT16:\n",src);
	sprintf(src,"%s		@  asmDrawTileClipped( cache,start<<16 width<<8 solidbuf,OffsetGP32,Flip) \n",src);
	sprintf(src,"%s		@                       R0             R1                 R2         R3 \n",src);
	sprintf(src,"%s		@  Flip : 0,1,2,3 -> None,VFLIP,HFLIP,VFLIP&HFLIP \n\n",src);
	sprintf(src,"%s		stmfd		R13!,{R4-R11,R14}\n",src);
	sprintf(src,"%s		ldr		R14,= SubScreenTranspBuffer\n",src);
	sprintf(src,"%s		ldr		R14,[R14]\n",src);
	sprintf(src,"%s@ opaque\n",src);
	sprintf(src,"%s		mov		R5,#1\n\n",src);
	sprintf(src,"%s		mov		R12,R2\n",src);
	sprintf(src,"%s		mov		R10,R0\n",src);
	sprintf(src,"%s		add		R11,R0,#8\n\n",src);
		
	sprintf(src,"%s		mov		R0,R1,lsr #8\n",src);
	sprintf(src,"%s		and		R8,R0,#0xFF				\n",src);
	sprintf(src,"%s		mov		R0,R0,lsr #8			\n",src);
	sprintf(src,"%s		add		R10,R10,R0\n",src);
	sprintf(src,"%s		add		R11,R11,R0,lsl #4\n\n",src);
		
	sprintf(src,"%s		and		R6,R1,#0xFF\n\n",src);
	sprintf(src,"%s		tst		R12,#2\n",src);
	sprintf(src,"%s		bne		TranspTclip_not_aligned16\n",src);


	sprintf(src,"%s		cmp		R3,#0\n",src);
	sprintf(src,"%s		bne		TranspTclip_flip_not0_aligned16\n",src);
	sprintf(src,"%s		ldr		R9,= jumptable_ppu1600t\n",src);
	sprintf(src,"%s		ldrb	R0,[R10],#1\n",src);
	sprintf(src,"%s		orr		R0,R0,R6\n",src);
	sprintf(src,"%s		ldr		R7, = 248\n",src);
	sprintf(src,"%s		ldr		PC,[R9,R0,lsl #2]\n",src);
	sprintf(src,"%sTranspTclip_flip_not0_aligned16:\n",src);
	sprintf(src,"%s		cmp		R3,#1\n",src);
	sprintf(src,"%s		bne		TranspTclip_flip_not1_aligned16\n",src);
	sprintf(src,"%s		ldr		R9,= jumptable_ppu1611t\n",src);
	sprintf(src,"%s		ldrb	R0,[R10],#1\n",src);
	sprintf(src,"%s		orr		R0,R0,R6\n",src);
	sprintf(src,"%s		ldr		R7, = 232\n",src);
	sprintf(src,"%s		sub		R12,R12,#14\n",src);
	sprintf(src,"%s		sub		R14,R14,#7\n",src);
	sprintf(src,"%s		ldr		PC,[R9,R0,lsl #2]\n",src);
	sprintf(src,"%sTranspTclip_flip_not1_aligned16:\n",src);
	sprintf(src,"%s		cmp		R3,#2\n",src);
	sprintf(src,"%s		bne		TranspTclip_flip_not2_aligned16\n",src);
	sprintf(src,"%s		ldr		R9,= jumptable_ppu1600t\n",src);
	sprintf(src,"%s		ldrb	R0,[R10],#1\n",src);
	sprintf(src,"%s		orr		R0,R0,R6\n",src);
	sprintf(src,"%s		ldr		R7, = -232\n",src);
	sprintf(src,"%s		ldr		PC,[R9,R0,lsl #2]\n",src);
	sprintf(src,"%sTranspTclip_flip_not2_aligned16:\n",src);
	sprintf(src,"%s		ldr		R9,= jumptable_ppu1611t\n",src);
	sprintf(src,"%s		ldrb	R0,[R10],#1\n",src);
	sprintf(src,"%s		orr		R0,R0,R6\n",src);
	sprintf(src,"%s		ldr		R7, = -248\n",src);
	sprintf(src,"%s		sub		R12,R12,#14\n",src);
	sprintf(src,"%s		sub		R14,R14,#7\n",src);
	sprintf(src,"%s		ldr		PC,[R9,R0,lsl #2]\n",src);

	sprintf(src,"%sTranspTclip_not_aligned16:\n",src);
	sprintf(src,"%s		cmp		R3,#0\n",src);
	sprintf(src,"%s		bne		TranspTclip_flip_not0_not_aligned16\n",src);
	sprintf(src,"%s		ldr		R9,= jumptable_ppu1601t\n",src);
	sprintf(src,"%s		ldrb	R0,[R10],#1\n",src);
	sprintf(src,"%s		orr		R0,R0,R6\n",src);
	sprintf(src,"%s		ldr		R7, = 248\n",src);
	sprintf(src,"%s		ldr		PC,[R9,R0,lsl #2]\n",src);
	sprintf(src,"%sTranspTclip_flip_not0_not_aligned16:\n",src);
	sprintf(src,"%s		cmp		R3,#1\n",src);
	sprintf(src,"%s		bne		TranspTclip_flip_not1_not_aligned16\n",src);	
	sprintf(src,"%s		ldr		R9,= jumptable_ppu1610t\n",src);
	sprintf(src,"%s		ldrb	R0,[R10],#1\n",src);
	sprintf(src,"%s		orr		R0,R0,R6\n",src);
	sprintf(src,"%s		ldr		R7, = 232\n",src);	
	sprintf(src,"%s		sub		R12,R12,#14\n",src);	
	sprintf(src,"%s		sub		R14,R14,#7\n",src);
	sprintf(src,"%s		ldr		PC,[R9,R0,lsl #2]\n",src);
	sprintf(src,"%sTranspTclip_flip_not1_not_aligned16:\n",src);
	sprintf(src,"%s		cmp		R3,#2\n",src);
	sprintf(src,"%s		bne		TranspTclip_flip_not2_not_aligned16\n",src);
	sprintf(src,"%s		ldr		R9,= jumptable_ppu1601t\n",src);
	sprintf(src,"%s		ldrb	R0,[R10],#1\n",src);
	sprintf(src,"%s		orr		R0,R0,R6\n",src);
	sprintf(src,"%s		ldr		R7, = -232\n",src);	
	sprintf(src,"%s		ldr		PC,[R9,R0,lsl #2]\n",src);
	sprintf(src,"%sTranspTclip_flip_not2_not_aligned16:\n",src);
	sprintf(src,"%s		ldr		R9,= jumptable_ppu1610t\n",src);
	sprintf(src,"%s		ldrb	R0,[R10],#1\n",src);
	sprintf(src,"%s		orr		R0,R0,R6\n",src);
	sprintf(src,"%s		ldr		R7, = -248\n",src);
	sprintf(src,"%s		sub		R12,R12,#14\n",src);
	sprintf(src,"%s		sub		R14,R14,#7\n",src);
	sprintf(src,"%s		ldr		PC,[R9,R0,lsl #2]\n",src);
		
	
	sprintf(src,"%s\n\n",src);

	sprintf(src,"%s	.ltorg\n\n",src);
#endif
}

void draw_pix(char *src,int skipval,int flipping)
{
	if (flipping&1)
		sprintf(src,"%s		ldrh	R0,[R11,#%d]\n		strh	R0,[R12,#-%d]\n",src,skipval*2,(7-skipval)*2);	
	else	
		sprintf(src,"%s		ldrh	R0,[R11,#%d]\n		strh	R0,[R12,#-%d]\n",src,skipval*2,skipval*2);

}

void draw_pix2(char *src,int counter,int count_opaque,int count_transp,int first,int flipping,int align,int transp)
{
	int alignDest=(align+counter)&1;
	int alignSrc=counter&1;
	int to_draw;

	if (first&&counter)
	{
		sprintf(src,"%s		add	R11,R11,#%d\n",src,counter*2);
		if (flipping&1) 
		{
			sprintf(src,"%s		add	R12,R12,#%d\n",src,counter*2);

			if (transp) sprintf(src,"%s		add	R14,R14,#%d\n",src,counter);
		}
		else 
		{
			sprintf(src,"%s		sub	R12,R12,#%d\n",src,counter*2);
			if (transp) sprintf(src,"%s		sub	R14,R14,#%d\n",src,counter);
		}
	}
	
	while (count_opaque)
	{
		if (alignSrc)
		{
			if (count_opaque>1) 
			{				
				sprintf(src,"%s		ldrh	R0,[R11],#2\n",src);
				sprintf(src,"%s		strh	R0,[R12],#%d\n",src,(flipping&1?2:-2));
				if (transp) sprintf(src,"%s		strb	R5,[R14],#%d\n",src,(flipping&1?1:-1));
			}
			else 
			{
				sprintf(src,"%s		ldrh	R0,[R11],#%d\n",src,count_transp*2+2);
				sprintf(src,"%s		strh	R0,[R12],#%d\n",src,(flipping&1?count_transp*2+2:-(count_transp*2+2)));
				if (transp) sprintf(src,"%s		strb	R5,[R14],#%d\n",src,(flipping&1?count_transp+1:-(count_transp+1)));
			}
			count_opaque--;
			alignSrc^=1;
			alignDest^=1;
		}
		else
		{
			to_draw=count_opaque;
			switch (count_opaque&0xE)
			{
				case 8:
					sprintf(src,"%s		ldmia	R11!,{R0,R1,R2,R3}\n",src);
					count_opaque-=8;
					break;
				case 6:
					sprintf(src,"%s		ldmia	R11!,{R0,R1,R2}\n",src);
					count_opaque-=6;
					break;
				case 4:
					sprintf(src,"%s		ldmia	R11!,{R0,R1}\n",src);
					count_opaque-=4;
					break;
				case 2:
					sprintf(src,"%s		ldmia	R11!,{R0}\n",src);
					count_opaque-=2;
					break;
			}
			if (count_opaque&1) 
			{
				sprintf(src,"%s		ldrh	R4,[R11],#%d\n",src,count_transp*2+2);
				count_opaque--;			
			}
			else 
				if (count_transp) sprintf(src,"%s		add	R11,R11,#%d\n",src,count_transp*2);
			
			switch (to_draw)
			{

/*			case 8:
				
					sprintf(src,"%s		strh	R0,[R12],#%d\n",src,(flipping&1?2:-2));
					sprintf(src,"%s		mov	R0,R0,lsr #16\n",src);
					sprintf(src,"%s		strh	R0,[R12],#%d\n",src,(flipping&1?2:-2));
					sprintf(src,"%s		strh	R1,[R12],#%d\n",src,(flipping&1?2:-2));
					sprintf(src,"%s		mov	R1,R1,lsr #16\n",src);
					sprintf(src,"%s		strh	R1,[R12],#%d\n",src,(flipping&1?2:-2));
					sprintf(src,"%s		strh	R2,[R12],#%d\n",src,(flipping&1?2:-2));
					sprintf(src,"%s		mov	R2,R2,lsr #16\n",src);
					sprintf(src,"%s		strh	R2,[R12],#%d\n",src,(flipping&1?2:-2));
					sprintf(src,"%s		strh	R3,[R12],#%d\n",src,(flipping&1?2:-2));
					sprintf(src,"%s		mov	R3,R3,lsr #16\n",src);
					sprintf(src,"%s		strh	R3,[R12],#%d\n",src,(flipping&1?2:-2));
				
				break;
			case 7:								
					sprintf(src,"%s		strh	R0,[R12],#%d\n",src,(flipping&1?2:-2));
					sprintf(src,"%s		mov	R0,R0,lsr #16\n",src);
					sprintf(src,"%s		strh	R0,[R12],#%d\n",src,(flipping&1?2:-2));
					sprintf(src,"%s		strh	R1,[R12],#%d\n",src,(flipping&1?2:-2));
					sprintf(src,"%s		mov	R1,R1,lsr #16\n",src);
					sprintf(src,"%s		strh	R1,[R12],#%d\n",src,(flipping&1?2:-2));
					sprintf(src,"%s		strh	R2,[R12],#%d\n",src,(flipping&1?2:-2));
					sprintf(src,"%s		mov	R2,R2,lsr #16\n",src);
					sprintf(src,"%s		strh	R2,[R12],#%d\n",src,(flipping&1?2:-2));					
					sprintf(src,"%s		strh	R4,[R12],#%d\n",src,(flipping&1?count_transp*2+2:-count_transp*2-2));
				
				break;
			case 6:				
					sprintf(src,"%s		strh	R0,[R12],#%d\n",src,(flipping&1?2:-2));
					sprintf(src,"%s		mov	R0,R0,lsr #16\n",src);
					sprintf(src,"%s		strh	R0,[R12],#%d\n",src,(flipping&1?2:-2));
					sprintf(src,"%s		strh	R1,[R12],#%d\n",src,(flipping&1?2:-2));
					sprintf(src,"%s		mov	R1,R1,lsr #16\n",src);
					sprintf(src,"%s		strh	R1,[R12],#%d\n",src,(flipping&1?2:-2));
					sprintf(src,"%s		strh	R2,[R12],#%d\n",src,(flipping&1?2:-2));
					sprintf(src,"%s		mov	R2,R2,lsr #16\n",src);					
					sprintf(src,"%s		strh	R2,[R12],#%d\n",src,(flipping&1?count_transp*2+2:-count_transp*2-2));
				
				break;
			case 5:				
				
					sprintf(src,"%s		strh	R0,[R12],#%d\n",src,(flipping&1?2:-2));
					sprintf(src,"%s		mov	R0,R0,lsr #16\n",src);
					sprintf(src,"%s		strh	R0,[R12],#%d\n",src,(flipping&1?2:-2));
					sprintf(src,"%s		strh	R1,[R12],#%d\n",src,(flipping&1?2:-2));
					sprintf(src,"%s		mov	R1,R1,lsr #16\n",src);
					sprintf(src,"%s		strh	R1,[R12],#%d\n",src,(flipping&1?2:-2));					
					sprintf(src,"%s		strh	R4,[R12],#%d\n",src,(flipping&1?count_transp*2+2:-count_transp*2-2));
				
				break;
			case 4:				
				
					sprintf(src,"%s		strh	R0,[R12],#%d\n",src,(flipping&1?2:-2));
					sprintf(src,"%s		mov	R0,R0,lsr #16\n",src);
					sprintf(src,"%s		strh	R0,[R12],#%d\n",src,(flipping&1?2:-2));
					sprintf(src,"%s		strh	R1,[R12],#%d\n",src,(flipping&1?2:-2));
					sprintf(src,"%s		mov	R1,R1,lsr #16\n",src);					
					sprintf(src,"%s		strh	R1,[R12],#%d\n",src,(flipping&1?count_transp*2+2:-count_transp*2-2));
				
				break;
/*			case 3:				
				
					sprintf(src,"%s		strh	R0,[R12],#%d\n",src,(flipping&1?2:-2));
					sprintf(src,"%s		mov	R0,R0,lsr #16\n",src);
					sprintf(src,"%s		strh	R0,[R12],#%d\n",src,(flipping&1?2:-2));					
					sprintf(src,"%s		strh	R4,[R12],#%d\n",src,(flipping&1?count_transp*2+2:-count_transp*2-2));
				
				break;
			case 2:
				
					sprintf(src,"%s		strh	R0,[R12],#%d\n",src,(flipping&1?2:-2));
					sprintf(src,"%s		mov	R0,R0,lsr #16\n",src);					
					sprintf(src,"%s		strh	R0,[R12],#%d\n",src,(flipping&1?count_transp*2+2:-count_transp*2-2));
				
				break;
			case 1:								
				sprintf(src,"%s		strh	R4,[R12],#%d\n",src,(flipping&1?count_transp*2+2:-count_transp*2-2));
				break;			
*/
			case 8:					
					if (alignDest)
					{							
						if (flipping&1)
						{							
							sprintf(src,"%s		strh	R0,[R12],#2\n",src);								
							sprintf(src,"%s		mov	R0,R0,lsr #16\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#1\n",src);
							sprintf(src,"%s		orr	R0,R0,R1,lsl #16\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#1\n",src);
							sprintf(src,"%s		mov	R1,R1,lsr #16\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#1\n",src);
							sprintf(src,"%s		orr	R1,R1,R2,lsl #16\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#1\n",src);
							sprintf(src,"%s		mov	R2,R2,lsr #16\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#1\n",src);
							sprintf(src,"%s		orr	R2,R2,R3,lsl #16\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#1\n",src);
							sprintf(src,"%s		mov	R3,R3,lsr #16\n",src);										
								if (transp) sprintf(src,"%s		strb	R5,[R14],#1\n",src);
							sprintf(src,"%s		stmia	R12!,{R0,R1,R2}\n",src);							
								if (transp) sprintf(src,"%s		strb	R5,[R14],#1\n",src);
							sprintf(src,"%s		strh	R3,[R12],#2\n",src);
						}
						else
						{
							sprintf(src,"%s		sub	R12,R12,#2",src);
							sprintf(src,"%s		@ Swap reg R0,R1,R2,R3\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#-1\n",src);
							sprintf(src,"%s		mov	R4,R0,ror #16\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#-1\n",src);
							sprintf(src,"%s		mov	R0,R3,ror #16\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#-1\n",src);
							sprintf(src,"%s		mov	R3,R4\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#-1\n",src);
							sprintf(src,"%s		mov	R4,R1,ror #16\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#-1\n",src);
							sprintf(src,"%s		mov	R1,R2,ror #16\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#-1\n",src);
							sprintf(src,"%s		mov	R2,R4\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#-1\n",src);
							sprintf(src,"%s		stmda	R12!,{R0,R1,R2,R3}\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#-1\n",src);
							sprintf(src,"%s		add	R12,R12,#2\n",src);							
						}
					}
					else
					{
						if (flipping&1) 
						{						
							//sprintf(src,"%s		add	R12,R12,#%d\n",src,(to_draw+count_transp)*2);
							sprintf(src,"%s		stmia	R12!,{R0,R1,R2,R3}\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#1\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#1\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#1\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#1\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#1\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#1\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#1\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#1\n",src);
						}
						else 
						{					
							
							sprintf(src,"%s		strh	R0,[R12],#-4\n",src);
							sprintf(src,"%s		mov	R0,R0,lsr #16\n",src);
							sprintf(src,"%s		orr	R0,R0,R1,lsl #16\n",src);
							sprintf(src,"%s		mov	R1,R1,lsr #16\n",src);
							sprintf(src,"%s		orr	R1,R1,R2,lsl #16\n",src);
							sprintf(src,"%s		mov	R2,R2,lsr #16\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#-1\n",src);
							sprintf(src,"%s		orr	R2,R2,R3,lsl #16\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#-1\n",src);
							sprintf(src,"%s		mov	R3,R3,lsr #16\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#-1\n",src);
							sprintf(src,"%s		mov	R4,R0,ror #16\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#-1\n",src);
							sprintf(src,"%s		mov	R0,R2,ror #16\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#-1\n",src);
							sprintf(src,"%s		mov	R2,R4\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#-1\n",src);
							sprintf(src,"%s		mov	R1,R1,ror #16\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#-1\n",src);
							sprintf(src,"%s		stmda	R12!,{R0,R1,R2}\n",src);														
								if (transp) sprintf(src,"%s		strb	R5,[R14],#-1\n",src);
							sprintf(src,"%s		strh	R3,[R12,#2]\n",src);							
						}
					}
					break;
				case 7:									
				case 6:										
					

					if (alignDest)
					{
						if (flipping&1)
						{
							
							sprintf(src,"%s		strh	R0,[R12],#2\n",src);															
							sprintf(src,"%s		mov	R0,R0,lsr #16\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#1\n",src);
							sprintf(src,"%s		orr	R0,R0,R1,lsl #16\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#1\n",src);
							sprintf(src,"%s		mov	R1,R1,lsr #16\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#1\n",src);
							sprintf(src,"%s		orr	R1,R1,R2,lsl #16\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#1\n",src);
							sprintf(src,"%s		mov	R2,R2,lsr #16\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#1\n",src);
							if (to_draw==7)
							{
								sprintf(src,"%s		orr	R2,R2,R4,lsl #16\n",src);
								sprintf(src,"%s		stmia	R12!,{R0,R1,R2}\n",src);
									if (transp) sprintf(src,"%s		strb	R5,[R14],#1\n",src);
								if (count_transp) sprintf(src,"%s		add	R12,R12,#%d\n",src,count_transp*2);
									if (transp) sprintf(src,"%s		strb	R5,[R14],#%d\n",src,count_transp+1);
							}
							else
							{
								sprintf(src,"%s		stmia	R12!,{R0,R1}\n",src);
									if (transp) sprintf(src,"%s		strb	R5,[R14],#%d\n",src,count_transp+1);
								sprintf(src,"%s		strh	R2,[R12],#%d\n",src,count_transp*2+2);
							}
						}
						else
						{
							sprintf(src,"%s		sub	R12,R12,#2\n",src);
							sprintf(src,"%s		@ Swap reg R0,R1,R2\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#-1\n",src);
							sprintf(src,"%s		mov	R3,R0,ror #16\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#-1\n",src);
							sprintf(src,"%s		mov	R0,R2,ror #16\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#-1\n",src);
							sprintf(src,"%s		mov	R2,R3\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#-1\n",src);
							sprintf(src,"%s		mov	R1,R1,ror #16\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#-1\n",src);
							sprintf(src,"%s		stmda	R12!,{R0,R1,R2}\n",src);
							if (to_draw==7) 
							{
									if (transp) sprintf(src,"%s		strb	R5,[R14],#-1\n",src);
								sprintf(src,"%s		strh	R4,[R12,#2]\n",src);
								if (count_transp) sprintf(src,"%s		sub	R12,R12,#%d\n",src,count_transp*2);
									if (transp) sprintf(src,"%s		strb	R5,[R14],#%d\n",src,-(count_transp+1));
									
							}
							else
							{
									if (transp) sprintf(src,"%s		strb	R5,[R14],#%d\n",src,-(count_transp+1));
								if (count_transp!=1) sprintf(src,"%s		add	R12,R12,#%d\n",src,2-count_transp*2);
									
							}
						}
					}
					else
					{
						if (flipping&1) 
						{	
							
							sprintf(src,"%s		stmia	R12!,{R0,R1,R2}\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#1\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#1\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#1\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#1\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#1\n",src);
							if (to_draw==7) 
							{
									if (transp) sprintf(src,"%s		strb	R5,[R14],#1\n",src);
								sprintf(src,"%s		strh	R4,[R12],#%d\n",src,count_transp*2+2);
									if (transp) sprintf(src,"%s		strb	R5,[R14],#%d\n",src,count_transp+1);
							}
							else
							{
								if (count_transp) sprintf(src,"%s		add	R12,R12,#%d\n",src,count_transp*2);
									if (transp) sprintf(src,"%s		strb	R5,[R14],#%d\n",src,count_transp+1);
							}
						}
						else 
						{
							

							sprintf(src,"%s		strh	R0,[R12],#-4\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#-1\n",src);
							sprintf(src,"%s		mov	R0,R0,lsr #16\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#-1\n",src);
							sprintf(src,"%s		orr	R0,R0,R1,lsl #16\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#-1\n",src);
							sprintf(src,"%s		mov	R1,R1,lsr #16\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#-1\n",src);
							sprintf(src,"%s		orr	R1,R1,R2,lsl #16\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#-1\n",src);
							sprintf(src,"%s		mov	R2,R2,lsr #16\n",src);							
							if (to_draw==7)
							{
								sprintf(src,"%s		orr	R2,R2,R4,lsl #16\n",src);
								sprintf(src,"%s		mov	R3,R2,ror #16\n",src);
								sprintf(src,"%s		mov	R2,R0,ror #16\n",src);
									if (transp) sprintf(src,"%s		strb	R5,[R14],#-1\n",src);
								sprintf(src,"%s		mov	R0,R3\n",src);
								sprintf(src,"%s		mov	R1,R1,ror #16\n",src);
								sprintf(src,"%s		stmda	R12!,{R0,R1,R2}\n",src);									
								if (count_transp!=1) sprintf(src,"%s		add	R12,R12,#%d\n",src,2-count_transp*2);
									if (transp) sprintf(src,"%s		strb	R5,[R14],#%d\n",src,-(count_transp+1));
							}
							else
							{
								sprintf(src,"%s		mov	R3,R1,ror #16\n",src);
								sprintf(src,"%s		mov	R1,R0,ror #16\n",src);
								sprintf(src,"%s		mov	R0,R3\n",src);
								sprintf(src,"%s		stmda	R12!,{R0,R1}\n",src);
								sprintf(src,"%s		strh	R2,[R12,#2]\n",src);
								if (count_transp) sprintf(src,"%s		sub	R12,R12,#%d\n",src,count_transp*2);
									if (transp) sprintf(src,"%s		strb	R5,[R14],#%d\n",src,-(count_transp+1));
							}
						}
					}
					break;
				case 5:					
				case 4:										
				
					if (alignDest)
					{
						if (flipping&1)
						{
							
							sprintf(src,"%s		strh	R0,[R12],#2\n",src);							
								if (transp) sprintf(src,"%s		strb	R5,[R14],#1\n",src);
							sprintf(src,"%s		mov	R0,R0,lsr #16\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#1\n",src);
							sprintf(src,"%s		orr	R0,R0,R1,lsl #16\n",src);							
								if (transp) sprintf(src,"%s		strb	R5,[R14],#1\n",src);
							sprintf(src,"%s		mov	R1,R1,lsr #16\n",src);
							if (to_draw==5)
							{
									if (transp) sprintf(src,"%s		strb	R5,[R14],#1\n",src);
								sprintf(src,"%s		orr	R1,R1,R4,lsl #16\n",src);
								sprintf(src,"%s		stmia	R12!,{R0,R1}\n",src);
								if (count_transp) sprintf(src,"%s		add	R12,R12,#%d\n",src,count_transp*2);
									if (transp) sprintf(src,"%s		strb	R5,[R14],#%d\n",src,(count_transp+1));
							}
							else
							{
								sprintf(src,"%s		stmia	R12!,{R0}\n",src);
								sprintf(src,"%s		strh	R1,[R12],#%d\n",src,count_transp*2+2);
									if (transp) sprintf(src,"%s		strb	R5,[R14],#%d\n",src,(count_transp+1));
							}
						}
						else
						{
							sprintf(src,"%s		sub	R12,R12,#2\n",src);
							sprintf(src,"%s		@ Swap reg R0,R1\n",src);
							sprintf(src,"%s		mov	R3,R0,ror #16\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#-1\n",src);
							sprintf(src,"%s		mov	R0,R1,ror #16\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#-1\n",src);
							sprintf(src,"%s		mov	R1,R3\n",src);							
								if (transp) sprintf(src,"%s		strb	R5,[R14],#-1\n",src);
							sprintf(src,"%s		stmda	R12!,{R0,R1}\n",src);
							if (to_draw==5) 
							{
									if (transp) sprintf(src,"%s		strb	R5,[R14],#-1\n",src);
								sprintf(src,"%s		strh	R4,[R12,#2]\n",src);
								if (count_transp) sprintf(src,"%s		sub	R12,R12,#%d\n",src,count_transp*2);
									if (transp) sprintf(src,"%s		strb	R5,[R14],#%d\n",src,-(count_transp+1));
							}
							else
							{
								if (count_transp!=1) sprintf(src,"%s		add	R12,R12,#%d\n",src,2-count_transp*2);
									if (transp) sprintf(src,"%s		strb	R5,[R14],#%d\n",src,-(count_transp+1));
							}
						}
					}
					else
					{
						if (flipping&1) 
						{		
							
							sprintf(src,"%s		stmia	R12!,{R0,R1}\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#1\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#1\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#1\n",src);
							if (to_draw==5) 
							{
									if (transp) sprintf(src,"%s		strb	R5,[R14],#1\n",src);
								sprintf(src,"%s		strh	R4,[R12],#%d\n",src,count_transp*2+2);
									if (transp) sprintf(src,"%s		strb	R5,[R14],#%d\n",src,(count_transp+1));
							}
							else
							{
								if (count_transp) sprintf(src,"%s		add	R12,R12,#%d\n",src,count_transp*2);
									if (transp) sprintf(src,"%s		strb	R5,[R14],#%d\n",src,(count_transp+1));
							}
						}
						else 
						{
							

							sprintf(src,"%s		strh	R0,[R12],#-4\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#-1\n",src);
							sprintf(src,"%s		mov	R0,R0,lsr #16\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#-1\n",src);
							sprintf(src,"%s		orr	R0,R0,R1,lsl #16\n",src);							
								if (transp) sprintf(src,"%s		strb	R5,[R14],#-1\n",src);
							sprintf(src,"%s		mov	R1,R1,lsr #16\n",src);							
							if (to_draw==5)
							{
								sprintf(src,"%s		orr	R1,R1,R4,lsl #16\n",src);
								sprintf(src,"%s		mov	R3,R1,ror #16\n",src);
									if (transp) sprintf(src,"%s		strb	R5,[R14],#-1\n",src);
								sprintf(src,"%s		mov	R1,R0,ror #16\n",src);
								sprintf(src,"%s		mov	R0,R3\n",src);								
								sprintf(src,"%s		stmda	R12!,{R0,R1}\n",src);
								if (count_transp!=1) sprintf(src,"%s		add	R12,R12,#%d\n",src,2-count_transp*2);
									if (transp) sprintf(src,"%s		strb	R5,[R14],#%d\n",src,-(count_transp+1));
							}
							else
							{								
								sprintf(src,"%s		mov	R0,R0,ror #16\n",src);							
								sprintf(src,"%s		stmda	R12!,{R0}\n",src);
								sprintf(src,"%s		strh	R1,[R12,#2]\n",src);
								if (count_transp) sprintf(src,"%s		sub	R12,R12,#%d\n",src,count_transp*2);
									if (transp) sprintf(src,"%s		strb	R5,[R14],#%d\n",src,-(count_transp+1));
							}
						}
					}
					break;
				case 3:					
				case 2:
					
					
				if (alignDest)
					{
						if (flipping&1)
						{
							
							sprintf(src,"%s		strh	R0,[R12],#2\n",src);														
								if (transp) sprintf(src,"%s		strb	R5,[R14],#1\n",src);
							sprintf(src,"%s		mov	R0,R0,lsr #16\n",src);
							if (to_draw==3)
							{
									if (transp) sprintf(src,"%s		strb	R5,[R14],#1\n",src);
								sprintf(src,"%s		orr	R0,R0,R4,lsl #16\n",src);
								sprintf(src,"%s		stmia	R12!,{R0}\n",src);
								if (count_transp) sprintf(src,"%s		add	R12,R12,#%d\n",src,count_transp*2);
									if (transp) sprintf(src,"%s		strb	R5,[R14],#%d\n",src,(count_transp+1));
							}
							else
							{								
								sprintf(src,"%s		strh	R0,[R12],#%d\n",src,count_transp*2+2);
									if (transp) sprintf(src,"%s		strb	R5,[R14],#%d\n",src,(count_transp+1));
							}
						}
						else
						{
							sprintf(src,"%s		sub	R12,R12,#2\n",src);
							sprintf(src,"%s		@ Swap reg R0\n",src);							
								if (transp) sprintf(src,"%s		strb	R5,[R14],#-1\n",src);
							sprintf(src,"%s		mov	R0,R0,ror #16\n",src);							
							sprintf(src,"%s		stmda	R12!,{R0}\n",src);
							if (to_draw==3) 
							{
									if (transp) sprintf(src,"%s		strb	R5,[R14],#-1\n",src);
								sprintf(src,"%s		strh	R4,[R12,#2]\n",src);
								if (count_transp) sprintf(src,"%s		sub	R12,R12,#%d\n",src,count_transp*2);
									if (transp) sprintf(src,"%s		strb	R5,[R14],#%d\n",src,-(count_transp+1));
							}
							else
							{
								if (count_transp!=1) sprintf(src,"%s		add	R12,R12,#%d\n",src,2-count_transp*2);
									if (transp) sprintf(src,"%s		strb	R5,[R14],#%d\n",src,-(count_transp+1));
							}
							
						}

					}
					else
					{
						if (flipping&1) 
						{	
							
							sprintf(src,"%s		stmia	R12!,{R0}\n",src);
								if (transp) sprintf(src,"%s		strb	R5,[R14],#1\n",src);
							if (to_draw==3) 
							{
									if (transp) sprintf(src,"%s		strb	R5,[R14],#1\n",src);
								sprintf(src,"%s		strh	R4,[R12],#%d\n",src,count_transp*2+2);
									if (transp) sprintf(src,"%s		strb	R5,[R14],#%d\n",src,(count_transp+1));
							}
							else
							{
								if (count_transp) sprintf(src,"%s		add	R12,R12,#%d\n",src,count_transp*2);
									if (transp) sprintf(src,"%s		strb	R5,[R14],#%d\n",src,(count_transp+1));
							}							
						}
						else 
						{							
							sprintf(src,"%s		strh	R0,[R12],#-4\n",src);							
								if (transp) sprintf(src,"%s		strb	R5,[R14],#-1\n",src);
							sprintf(src,"%s		mov	R0,R0,lsr #16\n",src);							
							if (to_draw==3)
							{
								sprintf(src,"%s		orr	R0,R0,R4,lsl #16\n",src);								
									if (transp) sprintf(src,"%s		strb	R5,[R14],#-1\n",src);
								sprintf(src,"%s		mov	R0,R0,ror #16\n",src);								
								sprintf(src,"%s		stmda	R12!,{R0}\n",src);
								if (count_transp!=1) sprintf(src,"%s		add	R12,R12,#%d\n",src,2-count_transp*2);
									if (transp) sprintf(src,"%s		strb	R5,[R14],#%d\n",src,-(count_transp+1));
							}
							else
							{																
								sprintf(src,"%s		strh	R0,[R12,#2]\n",src);
								if (count_transp) sprintf(src,"%s		sub	R12,R12,#%d\n",src,count_transp*2);
									if (transp) sprintf(src,"%s		strb	R5,[R14],#%d\n",src,-(count_transp+1));
							}
							
						}
					}
					break;
				case 1:					
					
					if (flipping&1)
					{
						
						sprintf(src,"%s		strh	R4,[R12],#%d\n",src,count_transp*2+2);
						if (transp) sprintf(src,"%s		strb	R5,[R14],#%d\n",src,(count_transp+1));
						
					}
					else 
					{							
						sprintf(src,"%s		strh	R4,[R12],#-%d\n",src,count_transp*2+2);
						if (transp) sprintf(src,"%s		strb	R5,[R14],#%d\n",src,-(count_transp+1));
					}					
					break;				
					
			}
			
		}
	}		
}

char *generate_code16(char *filename)
{
	int mode,transp=0;
	char *code_src;
	int count_transp,count_opaque,shifter,counter,flipping,cur_align,dep_align,first;
	char moving_char[4]={'-','\\','|','/'};
	FILE *f;


	f=fopen(filename,"w+t");
	
	
	

	code_src=malloc(1024*1024*2); //2Mo of text data should be enough
	code_src[0]=0;
	func_base(code_src);
	//mode 0 is fully opaque
	//mode 0xFF is fully transparent
	
#ifdef GENERATE_TRAMSP
	for (transp=0;transp<=1;transp++)
#endif
	for (dep_align=0;dep_align<=1;dep_align++)
	{		
		for (flipping=0;flipping<=1;flipping++)
		{
			printf("\ngenerating align:%s / flipping:%s / transp:%s ",(dep_align?"no":"yes"),(flipping&1?"on":"off"),(transp?"on":"off"));
			for (mode=0;mode<=0xFF;mode++)		
			{	
				if (mode==0x80)
				{
					fprintf(f,"%s\n",code_src);
					code_src[0]=0;
				}

				if (!(mode&3))
					printf("\b%c",moving_char[(mode>>2)&3]);

				func_begin(code_src,mode,flipping,dep_align,transp);
				
				shifter=7;
				counter=0;
				first=1;
				//cherche le 1er pix opaque
				while ((shifter>=0)&&( (mode>>shifter)&1 ) )
				{
					shifter--;
					counter++;
				}
				if (shifter>=0) sprintf(code_src,"%s@ mode : %c%c%c%c%c%c%c%c => first pix:%d\n",code_src,
					48+((mode>>7)&1),48+((mode>>6)&1),48+((mode>>5)&1),48+((mode>>4)&1),
					48+((mode>>3)&1),48+((mode>>2)&1),48+((mode>>1)&1),48+((mode>>0)&1),
					counter);
				while (shifter>=0)
				{
					count_opaque=0;
					//on compte le nombre de pix opaque
					while ((shifter>=0)&&(!((mode>>shifter)&1)))
					{
						count_opaque++;
						shifter--;
					}
					count_transp=0;
					
					while ((shifter>=0)&&((mode>>shifter)&1))
					{
						count_transp++;
						shifter--;
					}
					
					sprintf(code_src,"%s	@ Pos : %d, Pix opaque : %d, Pix transp : %d\n",code_src,counter,count_opaque,count_transp);
					draw_pix2(code_src,counter,count_opaque,count_transp,first,flipping,dep_align,transp);
					counter+=count_opaque+count_transp;
					first=0;
				}
				//getchar();
				/*shifter=7;			 
				count_transp=0;
				while (shifter>=0)
				{				
					if (!((mode>>shifter)&1))
					{  //pixel opaque
						count_opaque=1;
						shifter--;
						while (shifter>=0)
						{						
							if (!((mode>>shifter)&1)) count_opaque++;
						}						

						draw_pix(code_src,counter_zero,count_opaque,flipping,dep_align);
						count_transp=0;				
					}
					else 
					{  //pixel transparent
						count_transp++;  //on compte les pix transparents
						shifter--;
					}												
				}*/

				func_end(code_src,mode,flipping,transp);
			}
			func_index(code_src,flipping,dep_align,transp);
			fprintf(f,"%s\n",code_src);
			code_src[0]=0;
		}
	}
	//sprintf(code_src,"%s		END\n",code_src);

	fprintf(f,"%s",code_src);

	fclose(f);

	return code_src;
}

void show(char *src)
{
	printf("%s",src);
}

void pause(void)
{
	printf("Press [enter]...");
	getchar();
}

void main(int argc,char **argv)
{	
	generate_code16("ppuasmfunc16.S");

//	pause();
}
