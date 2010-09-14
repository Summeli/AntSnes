		.globl		asmDrawTile16
		.globl		asmDrawTileClipped16

		.extern		SubScreenTranspBuffer


	@ R14 = SubScreen TranspBuffer
	@ R12 = OfsGP32 (ram video)
	@ R11 = Cache Pixel
	@ R10 = Cache Header
	@ R9  = Ofs jumptable
	@ R8  = Column counter
	@ R7  = ofsgp32 adder
	@ R6  = Clipping value to add to header value
	@ R5  = Transp/Opaque


		.macro NEXT_COL16n
		subs		R8,R8,#1
		ldrneb		R0,[R10],#1
		addne		R12,R12,R7
		orrne		R0,R0,R6
		ldrne		PC,[R9,R0,lsl #2]
		ldmfd		R13!,{R4-R11}
		mov			PC,LR
		.endm


@ main funcs
asmDrawTile16:
@  asmDrawTile( cache,solidbuf,OffsetGP32,Flip) 
@                R0    R1       R2         R3 
@  Flip : 0,1,2,3 -> None,VFLIP,HFLIP,VFLIP&HFLIP 
		stmfd		R13!,{R4-R11}
		mov		R12,R2
		mov		R10,R0
		add		R11,R0,#8
		mov		R8,#8
		mov		R6,R1
		tst		R12,#2
		bne		not_aligned16
		cmp		R3,#0
		bne		flip_not0_aligned16
		ldr		R9,= jumptable_ppu1600n
		ldrb	R0,[R10],#1
		orr		R0,R0,R6
		ldr		R7, = 496
		ldr		PC,[R9,R0,lsl #2]
flip_not0_aligned16:
		cmp		R3,#1
		bne		flip_not1_aligned16
		ldr		R9,= jumptable_ppu1611n
		ldrb	R0,[R10],#1
		orr		R0,R0,R6
		ldr		R7, = 464
		sub		R12,R12,#14
		ldr		PC,[R9,R0,lsl #2]
flip_not1_aligned16:
		cmp		R3,#2
		bne		flip_not2_aligned16
		ldr		R9,= jumptable_ppu1600n
		ldrb	R0,[R10],#1
		orr		R0,R0,R6
		ldr		R7, = -464
		ldr		PC,[R9,R0,lsl #2]
flip_not2_aligned16:
		ldr		R9,= jumptable_ppu1611n
		ldrb	R0,[R10],#1
		orr		R0,R0,R6
		ldr		R7, = -496
		sub		R12,R12,#14
		ldr		PC,[R9,R0,lsl #2]
not_aligned16:
		cmp		R3,#0
		bne		flip_not0_not_aligned16
		ldr		R9,= jumptable_ppu1601n
		ldrb	R0,[R10],#1
		orr		R0,R0,R6
		ldr		R7, = 496
		ldr		PC,[R9,R0,lsl #2]
flip_not0_not_aligned16:
		cmp		R3,#1
		bne		flip_not1_not_aligned16
		ldr		R9,= jumptable_ppu1610n
		ldrb	R0,[R10],#1
		orr		R0,R0,R6
		ldr		R7, = 464
		sub		R12,R12,#14
		ldr		PC,[R9,R0,lsl #2]
flip_not1_not_aligned16:
		cmp		R3,#2
		bne		flip_not2_not_aligned16
		ldr		R9,= jumptable_ppu1601n
		ldrb	R0,[R10],#1
		orr		R0,R0,R6
		ldr		R7, = -464
		ldr		PC,[R9,R0,lsl #2]
flip_not2_not_aligned16:
		ldr		R9,= jumptable_ppu1610n
		ldrb	R0,[R10],#1
		orr		R0,R0,R6
		ldr		R7, = -496
		sub		R12,R12,#14
		ldr		PC,[R9,R0,lsl #2]


asmDrawTileClipped16:
		@  asmDrawTileClipped( cache,start<<16 width<<8 solidbuf,OffsetGP32,Flip) 
		@                       R0             R1                 R2         R3 
		@  Flip : 0,1,2,3 -> None,VFLIP,HFLIP,VFLIP&HFLIP 

		stmfd		R13!,{R4-R11}
		mov		R12,R2
		mov		R10,R0
		add		R11,R0,#8

		mov		R0,R1,lsr #8
		and		R8,R0,#0xFF				
		mov		R0,R0,lsr #8			
		add		R10,R10,R0
		add		R11,R11,R0,lsl #4

		and		R6,R1,#0xFF

		tst		R12,#2
		bne		clip_not_aligned16
		cmp		R3,#0
		bne		clip_flip_not0_aligned16
		ldr		R9,= jumptable_ppu1600n
		ldrb	R0,[R10],#1
		orr		R0,R0,R6
		ldr		R7, = 496
		ldr		PC,[R9,R0,lsl #2]
clip_flip_not0_aligned16:
		cmp		R3,#1
		bne		clip_flip_not1_aligned16
		ldr		R9,= jumptable_ppu1611n
		ldrb	R0,[R10],#1
		orr		R0,R0,R6
		ldr		R7, = 464
		sub		R12,R12,#14
		ldr		PC,[R9,R0,lsl #2]
clip_flip_not1_aligned16:
		cmp		R3,#2
		bne		clip_flip_not2_aligned16
		ldr		R9,= jumptable_ppu1600n
		ldrb	R0,[R10],#1
		orr		R0,R0,R6
		ldr		R7, = -464
		ldr		PC,[R9,R0,lsl #2]
clip_flip_not2_aligned16:
		ldr		R9,= jumptable_ppu1611n
		ldrb	R0,[R10],#1
		orr		R0,R0,R6
		ldr		R7, = -496
		sub		R12,R12,#14
		ldr		PC,[R9,R0,lsl #2]
clip_not_aligned16:
		cmp		R3,#0
		bne		clip_flip_not0_not_aligned16
		ldr		R9,= jumptable_ppu1601n
		ldrb	R0,[R10],#1
		orr		R0,R0,R6
		ldr		R7, = 496
		ldr		PC,[R9,R0,lsl #2]
clip_flip_not0_not_aligned16:
		cmp		R3,#1
		bne		clip_flip_not1_not_aligned16
		ldr		R9,= jumptable_ppu1610n
		ldrb	R0,[R10],#1
		orr		R0,R0,R6
		ldr		R7, = 464
		sub		R12,R12,#14
		ldr		PC,[R9,R0,lsl #2]
clip_flip_not1_not_aligned16:
		cmp		R3,#2
		bne		clip_flip_not2_not_aligned16
		ldr		R9,= jumptable_ppu1601n
		ldrb	R0,[R10],#1
		orr		R0,R0,R6
		ldr		R7, = -464
		ldr		PC,[R9,R0,lsl #2]
clip_flip_not2_not_aligned16:
		ldr		R9,= jumptable_ppu1610n
		ldrb	R0,[R10],#1
		orr		R0,R0,R6
		ldr		R7, = -496
		sub		R12,R12,#14
		ldr		PC,[R9,R0,lsl #2]


	.ltorg


PPU16_00_0_0_n:
@ case 00000000
@ mode : 00000000 => first pix:0
	@ Pos : 0, Pix opaque : 8, Pix transp : 0
		ldmia	R11!,{R0,R1,R2,R3}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		orr	R1,R1,R2,lsl #16
		mov	R2,R2,lsr #16
		orr	R2,R2,R3,lsl #16
		mov	R3,R3,lsr #16
		mov	R4,R0,ror #16
		mov	R0,R2,ror #16
		mov	R2,R4
		mov	R1,R1,ror #16
		stmda	R12!,{R0,R1,R2}
		strh	R3,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_01_0_0_n:
@ case 00000001
@ mode : 00000001 => first pix:0
	@ Pos : 0, Pix opaque : 7, Pix transp : 1
		ldmia	R11!,{R0,R1,R2}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		orr	R1,R1,R2,lsl #16
		mov	R2,R2,lsr #16
		orr	R2,R2,R4,lsl #16
		mov	R3,R2,ror #16
		mov	R2,R0,ror #16
		mov	R0,R3
		mov	R1,R1,ror #16
		stmda	R12!,{R0,R1,R2}
		NEXT_COL16n
@ ----------------------------------------

PPU16_02_0_0_n:
@ case 00000010
@ mode : 00000010 => first pix:0
	@ Pos : 0, Pix opaque : 6, Pix transp : 1
		ldmia	R11!,{R0,R1,R2}
		add	R11,R11,#2
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		orr	R1,R1,R2,lsl #16
		mov	R2,R2,lsr #16
		mov	R3,R1,ror #16
		mov	R1,R0,ror #16
		mov	R0,R3
		stmda	R12!,{R0,R1}
		strh	R2,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_03_0_0_n:
@ case 00000011
@ mode : 00000011 => first pix:0
	@ Pos : 0, Pix opaque : 6, Pix transp : 2
		ldmia	R11!,{R0,R1,R2}
		add	R11,R11,#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		orr	R1,R1,R2,lsl #16
		mov	R2,R2,lsr #16
		mov	R3,R1,ror #16
		mov	R1,R0,ror #16
		mov	R0,R3
		stmda	R12!,{R0,R1}
		strh	R2,[R12,#2]
		sub	R12,R12,#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_04_0_0_n:
@ case 00000100
@ mode : 00000100 => first pix:0
	@ Pos : 0, Pix opaque : 5, Pix transp : 1
		ldmia	R11!,{R0,R1}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		orr	R1,R1,R4,lsl #16
		mov	R3,R1,ror #16
		mov	R1,R0,ror #16
		mov	R0,R3
		stmda	R12!,{R0,R1}
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_05_0_0_n:
@ case 00000101
@ mode : 00000101 => first pix:0
	@ Pos : 0, Pix opaque : 5, Pix transp : 1
		ldmia	R11!,{R0,R1}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		orr	R1,R1,R4,lsl #16
		mov	R3,R1,ror #16
		mov	R1,R0,ror #16
		mov	R0,R3
		stmda	R12!,{R0,R1}
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_06_0_0_n:
@ case 00000110
@ mode : 00000110 => first pix:0
	@ Pos : 0, Pix opaque : 5, Pix transp : 2
		ldmia	R11!,{R0,R1}
		ldrh	R4,[R11],#6
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		orr	R1,R1,R4,lsl #16
		mov	R3,R1,ror #16
		mov	R1,R0,ror #16
		mov	R0,R3
		stmda	R12!,{R0,R1}
		add	R12,R12,#-2
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_07_0_0_n:
@ case 00000111
@ mode : 00000111 => first pix:0
	@ Pos : 0, Pix opaque : 5, Pix transp : 3
		ldmia	R11!,{R0,R1}
		ldrh	R4,[R11],#8
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		orr	R1,R1,R4,lsl #16
		mov	R3,R1,ror #16
		mov	R1,R0,ror #16
		mov	R0,R3
		stmda	R12!,{R0,R1}
		add	R12,R12,#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_08_0_0_n:
@ case 00001000
@ mode : 00001000 => first pix:0
	@ Pos : 0, Pix opaque : 4, Pix transp : 1
		ldmia	R11!,{R0,R1}
		add	R11,R11,#2
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R1,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_09_0_0_n:
@ case 00001001
@ mode : 00001001 => first pix:0
	@ Pos : 0, Pix opaque : 4, Pix transp : 1
		ldmia	R11!,{R0,R1}
		add	R11,R11,#2
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R1,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_0A_0_0_n:
@ case 00001010
@ mode : 00001010 => first pix:0
	@ Pos : 0, Pix opaque : 4, Pix transp : 1
		ldmia	R11!,{R0,R1}
		add	R11,R11,#2
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R1,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_0B_0_0_n:
@ case 00001011
@ mode : 00001011 => first pix:0
	@ Pos : 0, Pix opaque : 4, Pix transp : 1
		ldmia	R11!,{R0,R1}
		add	R11,R11,#2
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R1,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
		NEXT_COL16n
@ ----------------------------------------

PPU16_0C_0_0_n:
@ case 00001100
@ mode : 00001100 => first pix:0
	@ Pos : 0, Pix opaque : 4, Pix transp : 2
		ldmia	R11!,{R0,R1}
		add	R11,R11,#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R1,[R12,#2]
		sub	R12,R12,#4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_0D_0_0_n:
@ case 00001101
@ mode : 00001101 => first pix:0
	@ Pos : 0, Pix opaque : 4, Pix transp : 2
		ldmia	R11!,{R0,R1}
		add	R11,R11,#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R1,[R12,#2]
		sub	R12,R12,#4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_0E_0_0_n:
@ case 00001110
@ mode : 00001110 => first pix:0
	@ Pos : 0, Pix opaque : 4, Pix transp : 3
		ldmia	R11!,{R0,R1}
		add	R11,R11,#6
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R1,[R12,#2]
		sub	R12,R12,#6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_0F_0_0_n:
@ case 00001111
@ mode : 00001111 => first pix:0
	@ Pos : 0, Pix opaque : 4, Pix transp : 4
		ldmia	R11!,{R0,R1}
		add	R11,R11,#8
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R1,[R12,#2]
		sub	R12,R12,#8
		NEXT_COL16n
@ ----------------------------------------

PPU16_10_0_0_n:
@ case 00010000
@ mode : 00010000 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 4, Pix opaque : 4, Pix transp : 0
		ldmia	R11!,{R0,R1}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R1,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_11_0_0_n:
@ case 00010001
@ mode : 00010001 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 4, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_12_0_0_n:
@ case 00010010
@ mode : 00010010 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 4, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_13_0_0_n:
@ case 00010011
@ mode : 00010011 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 4, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_14_0_0_n:
@ case 00010100
@ mode : 00010100 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_15_0_0_n:
@ case 00010101
@ mode : 00010101 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_16_0_0_n:
@ case 00010110
@ mode : 00010110 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 4, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_17_0_0_n:
@ case 00010111
@ mode : 00010111 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 4, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
		NEXT_COL16n
@ ----------------------------------------

PPU16_18_0_0_n:
@ case 00011000
@ mode : 00011000 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#6
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-2
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_19_0_0_n:
@ case 00011001
@ mode : 00011001 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#6
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-2
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_1A_0_0_n:
@ case 00011010
@ mode : 00011010 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#6
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-2
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_1B_0_0_n:
@ case 00011011
@ mode : 00011011 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#6
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-2
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
		NEXT_COL16n
@ ----------------------------------------

PPU16_1C_0_0_n:
@ case 00011100
@ mode : 00011100 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 3
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#8
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_1D_0_0_n:
@ case 00011101
@ mode : 00011101 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 3
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#8
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_1E_0_0_n:
@ case 00011110
@ mode : 00011110 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 4
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#10
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_1F_0_0_n:
@ case 00011111
@ mode : 00011111 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 5
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#12
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-8
		NEXT_COL16n
@ ----------------------------------------

PPU16_20_0_0_n:
@ case 00100000
@ mode : 00100000 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 3, Pix opaque : 5, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0,R1}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R1,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_21_0_0_n:
@ case 00100001
@ mode : 00100001 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 3, Pix opaque : 4, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_22_0_0_n:
@ case 00100010
@ mode : 00100010 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 3, Pix opaque : 3, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_23_0_0_n:
@ case 00100011
@ mode : 00100011 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 3, Pix opaque : 3, Pix transp : 2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_24_0_0_n:
@ case 00100100
@ mode : 00100100 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 3, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_25_0_0_n:
@ case 00100101
@ mode : 00100101 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 3, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_26_0_0_n:
@ case 00100110
@ mode : 00100110 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 3, Pix opaque : 2, Pix transp : 2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_27_0_0_n:
@ case 00100111
@ mode : 00100111 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 3, Pix opaque : 2, Pix transp : 3
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
		NEXT_COL16n
@ ----------------------------------------

PPU16_28_0_0_n:
@ case 00101000
@ mode : 00101000 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_29_0_0_n:
@ case 00101001
@ mode : 00101001 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_2A_0_0_n:
@ case 00101010
@ mode : 00101010 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_2B_0_0_n:
@ case 00101011
@ mode : 00101011 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
		NEXT_COL16n
@ ----------------------------------------

PPU16_2C_0_0_n:
@ case 00101100
@ mode : 00101100 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 3, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_2D_0_0_n:
@ case 00101101
@ mode : 00101101 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 3, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_2E_0_0_n:
@ case 00101110
@ mode : 00101110 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 3, Pix opaque : 1, Pix transp : 3
		ldrh	R0,[R11],#8
		strh	R0,[R12],#-8
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_2F_0_0_n:
@ case 00101111
@ mode : 00101111 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 3, Pix opaque : 1, Pix transp : 4
		ldrh	R0,[R11],#10
		strh	R0,[R12],#-10
		NEXT_COL16n
@ ----------------------------------------

PPU16_30_0_0_n:
@ case 00110000
@ mode : 00110000 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#4
	@ Pos : 4, Pix opaque : 4, Pix transp : 0
		ldmia	R11!,{R0,R1}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R1,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_31_0_0_n:
@ case 00110001
@ mode : 00110001 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#4
	@ Pos : 4, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_32_0_0_n:
@ case 00110010
@ mode : 00110010 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#4
	@ Pos : 4, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_33_0_0_n:
@ case 00110011
@ mode : 00110011 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#4
	@ Pos : 4, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_34_0_0_n:
@ case 00110100
@ mode : 00110100 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#4
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_35_0_0_n:
@ case 00110101
@ mode : 00110101 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#4
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_36_0_0_n:
@ case 00110110
@ mode : 00110110 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#4
	@ Pos : 4, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_37_0_0_n:
@ case 00110111
@ mode : 00110111 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#4
	@ Pos : 4, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
		NEXT_COL16n
@ ----------------------------------------

PPU16_38_0_0_n:
@ case 00111000
@ mode : 00111000 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 3
		ldmia	R11!,{R0}
		add	R11,R11,#6
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#6
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_39_0_0_n:
@ case 00111001
@ mode : 00111001 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 3
		ldmia	R11!,{R0}
		add	R11,R11,#6
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#6
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_3A_0_0_n:
@ case 00111010
@ mode : 00111010 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 3
		ldmia	R11!,{R0}
		add	R11,R11,#6
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#6
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_3B_0_0_n:
@ case 00111011
@ mode : 00111011 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 3
		ldmia	R11!,{R0}
		add	R11,R11,#6
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#6
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
		NEXT_COL16n
@ ----------------------------------------

PPU16_3C_0_0_n:
@ case 00111100
@ mode : 00111100 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 4
		ldmia	R11!,{R0}
		add	R11,R11,#8
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#8
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_3D_0_0_n:
@ case 00111101
@ mode : 00111101 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 4
		ldmia	R11!,{R0}
		add	R11,R11,#8
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#8
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_3E_0_0_n:
@ case 00111110
@ mode : 00111110 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 5
		ldmia	R11!,{R0}
		add	R11,R11,#10
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#10
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_3F_0_0_n:
@ case 00111111
@ mode : 00111111 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 6
		ldmia	R11!,{R0}
		add	R11,R11,#12
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#12
		NEXT_COL16n
@ ----------------------------------------

PPU16_40_0_0_n:
@ case 01000000
@ mode : 01000000 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 6, Pix transp : 0
		ldmia	R11!,{R0,R1,R2}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		orr	R1,R1,R2,lsl #16
		mov	R2,R2,lsr #16
		mov	R3,R1,ror #16
		mov	R1,R0,ror #16
		mov	R0,R3
		stmda	R12!,{R0,R1}
		strh	R2,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_41_0_0_n:
@ case 01000001
@ mode : 01000001 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 5, Pix transp : 1
		ldmia	R11!,{R0,R1}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		orr	R1,R1,R4,lsl #16
		mov	R3,R1,ror #16
		mov	R1,R0,ror #16
		mov	R0,R3
		stmda	R12!,{R0,R1}
		NEXT_COL16n
@ ----------------------------------------

PPU16_42_0_0_n:
@ case 01000010
@ mode : 01000010 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 4, Pix transp : 1
		ldmia	R11!,{R0,R1}
		add	R11,R11,#2
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R1,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_43_0_0_n:
@ case 01000011
@ mode : 01000011 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 4, Pix transp : 2
		ldmia	R11!,{R0,R1}
		add	R11,R11,#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R1,[R12,#2]
		sub	R12,R12,#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_44_0_0_n:
@ case 01000100
@ mode : 01000100 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_45_0_0_n:
@ case 01000101
@ mode : 01000101 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_46_0_0_n:
@ case 01000110
@ mode : 01000110 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 3, Pix transp : 2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#6
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-2
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_47_0_0_n:
@ case 01000111
@ mode : 01000111 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 3, Pix transp : 3
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#8
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_48_0_0_n:
@ case 01001000
@ mode : 01001000 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_49_0_0_n:
@ case 01001001
@ mode : 01001001 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_4A_0_0_n:
@ case 01001010
@ mode : 01001010 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_4B_0_0_n:
@ case 01001011
@ mode : 01001011 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
		NEXT_COL16n
@ ----------------------------------------

PPU16_4C_0_0_n:
@ case 01001100
@ mode : 01001100 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_4D_0_0_n:
@ case 01001101
@ mode : 01001101 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_4E_0_0_n:
@ case 01001110
@ mode : 01001110 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 2, Pix transp : 3
		ldmia	R11!,{R0}
		add	R11,R11,#6
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_4F_0_0_n:
@ case 01001111
@ mode : 01001111 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 2, Pix transp : 4
		ldmia	R11!,{R0}
		add	R11,R11,#8
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#8
		NEXT_COL16n
@ ----------------------------------------

PPU16_50_0_0_n:
@ case 01010000
@ mode : 01010000 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 4, Pix opaque : 4, Pix transp : 0
		ldmia	R11!,{R0,R1}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R1,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_51_0_0_n:
@ case 01010001
@ mode : 01010001 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 4, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_52_0_0_n:
@ case 01010010
@ mode : 01010010 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 4, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_53_0_0_n:
@ case 01010011
@ mode : 01010011 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 4, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_54_0_0_n:
@ case 01010100
@ mode : 01010100 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_55_0_0_n:
@ case 01010101
@ mode : 01010101 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_56_0_0_n:
@ case 01010110
@ mode : 01010110 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 4, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_57_0_0_n:
@ case 01010111
@ mode : 01010111 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 4, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
		NEXT_COL16n
@ ----------------------------------------

PPU16_58_0_0_n:
@ case 01011000
@ mode : 01011000 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_59_0_0_n:
@ case 01011001
@ mode : 01011001 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_5A_0_0_n:
@ case 01011010
@ mode : 01011010 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_5B_0_0_n:
@ case 01011011
@ mode : 01011011 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
		NEXT_COL16n
@ ----------------------------------------

PPU16_5C_0_0_n:
@ case 01011100
@ mode : 01011100 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_5D_0_0_n:
@ case 01011101
@ mode : 01011101 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_5E_0_0_n:
@ case 01011110
@ mode : 01011110 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 1, Pix transp : 4
		ldrh	R4,[R11],#10
		strh	R4,[R12],#-10
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_5F_0_0_n:
@ case 01011111
@ mode : 01011111 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 1, Pix transp : 5
		ldrh	R4,[R11],#12
		strh	R4,[R12],#-12
		NEXT_COL16n
@ ----------------------------------------

PPU16_60_0_0_n:
@ case 01100000
@ mode : 01100000 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 3, Pix opaque : 5, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0,R1}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R1,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_61_0_0_n:
@ case 01100001
@ mode : 01100001 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 3, Pix opaque : 4, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_62_0_0_n:
@ case 01100010
@ mode : 01100010 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 3, Pix opaque : 3, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_63_0_0_n:
@ case 01100011
@ mode : 01100011 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 3, Pix opaque : 3, Pix transp : 2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_64_0_0_n:
@ case 01100100
@ mode : 01100100 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 3, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_65_0_0_n:
@ case 01100101
@ mode : 01100101 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 3, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_66_0_0_n:
@ case 01100110
@ mode : 01100110 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 3, Pix opaque : 2, Pix transp : 2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_67_0_0_n:
@ case 01100111
@ mode : 01100111 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 3, Pix opaque : 2, Pix transp : 3
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
		NEXT_COL16n
@ ----------------------------------------

PPU16_68_0_0_n:
@ case 01101000
@ mode : 01101000 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_69_0_0_n:
@ case 01101001
@ mode : 01101001 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_6A_0_0_n:
@ case 01101010
@ mode : 01101010 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_6B_0_0_n:
@ case 01101011
@ mode : 01101011 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
		NEXT_COL16n
@ ----------------------------------------

PPU16_6C_0_0_n:
@ case 01101100
@ mode : 01101100 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 3, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_6D_0_0_n:
@ case 01101101
@ mode : 01101101 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 3, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_6E_0_0_n:
@ case 01101110
@ mode : 01101110 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 3, Pix opaque : 1, Pix transp : 3
		ldrh	R0,[R11],#8
		strh	R0,[R12],#-8
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_6F_0_0_n:
@ case 01101111
@ mode : 01101111 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 3, Pix opaque : 1, Pix transp : 4
		ldrh	R0,[R11],#10
		strh	R0,[R12],#-10
		NEXT_COL16n
@ ----------------------------------------

PPU16_70_0_0_n:
@ case 01110000
@ mode : 01110000 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
	@ Pos : 4, Pix opaque : 4, Pix transp : 0
		ldmia	R11!,{R0,R1}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R1,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_71_0_0_n:
@ case 01110001
@ mode : 01110001 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
	@ Pos : 4, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_72_0_0_n:
@ case 01110010
@ mode : 01110010 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
	@ Pos : 4, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_73_0_0_n:
@ case 01110011
@ mode : 01110011 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
	@ Pos : 4, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_74_0_0_n:
@ case 01110100
@ mode : 01110100 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_75_0_0_n:
@ case 01110101
@ mode : 01110101 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_76_0_0_n:
@ case 01110110
@ mode : 01110110 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
	@ Pos : 4, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_77_0_0_n:
@ case 01110111
@ mode : 01110111 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
	@ Pos : 4, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
		NEXT_COL16n
@ ----------------------------------------

PPU16_78_0_0_n:
@ case 01111000
@ mode : 01111000 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 4
		ldrh	R4,[R11],#10
		strh	R4,[R12],#-10
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_79_0_0_n:
@ case 01111001
@ mode : 01111001 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 4
		ldrh	R4,[R11],#10
		strh	R4,[R12],#-10
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_7A_0_0_n:
@ case 01111010
@ mode : 01111010 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 4
		ldrh	R4,[R11],#10
		strh	R4,[R12],#-10
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_7B_0_0_n:
@ case 01111011
@ mode : 01111011 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 4
		ldrh	R4,[R11],#10
		strh	R4,[R12],#-10
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
		NEXT_COL16n
@ ----------------------------------------

PPU16_7C_0_0_n:
@ case 01111100
@ mode : 01111100 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 5
		ldrh	R4,[R11],#12
		strh	R4,[R12],#-12
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_7D_0_0_n:
@ case 01111101
@ mode : 01111101 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 5
		ldrh	R4,[R11],#12
		strh	R4,[R12],#-12
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_7E_0_0_n:
@ case 01111110
@ mode : 01111110 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 6
		ldrh	R4,[R11],#14
		strh	R4,[R12],#-14
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_7F_0_0_n:
@ case 01111111
@ mode : 01111111 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 7
		ldrh	R4,[R11],#16
		strh	R4,[R12],#-16
		NEXT_COL16n
@ ----------------------------------------


PPU16_80_0_0_n:
@ case 10000000
@ mode : 10000000 => first pix:1
	@ Pos : 1, Pix opaque : 7, Pix transp : 0
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0,R1,R2}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		orr	R1,R1,R2,lsl #16
		mov	R2,R2,lsr #16
		mov	R3,R1,ror #16
		mov	R1,R0,ror #16
		mov	R0,R3
		stmda	R12!,{R0,R1}
		strh	R2,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_81_0_0_n:
@ case 10000001
@ mode : 10000001 => first pix:1
	@ Pos : 1, Pix opaque : 6, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0,R1}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		orr	R1,R1,R4,lsl #16
		mov	R3,R1,ror #16
		mov	R1,R0,ror #16
		mov	R0,R3
		stmda	R12!,{R0,R1}
		NEXT_COL16n
@ ----------------------------------------

PPU16_82_0_0_n:
@ case 10000010
@ mode : 10000010 => first pix:1
	@ Pos : 1, Pix opaque : 5, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0,R1}
		add	R11,R11,#2
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R1,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_83_0_0_n:
@ case 10000011
@ mode : 10000011 => first pix:1
	@ Pos : 1, Pix opaque : 5, Pix transp : 2
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0,R1}
		add	R11,R11,#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R1,[R12,#2]
		sub	R12,R12,#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_84_0_0_n:
@ case 10000100
@ mode : 10000100 => first pix:1
	@ Pos : 1, Pix opaque : 4, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_85_0_0_n:
@ case 10000101
@ mode : 10000101 => first pix:1
	@ Pos : 1, Pix opaque : 4, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_86_0_0_n:
@ case 10000110
@ mode : 10000110 => first pix:1
	@ Pos : 1, Pix opaque : 4, Pix transp : 2
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#6
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-2
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_87_0_0_n:
@ case 10000111
@ mode : 10000111 => first pix:1
	@ Pos : 1, Pix opaque : 4, Pix transp : 3
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#8
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_88_0_0_n:
@ case 10001000
@ mode : 10001000 => first pix:1
	@ Pos : 1, Pix opaque : 3, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_89_0_0_n:
@ case 10001001
@ mode : 10001001 => first pix:1
	@ Pos : 1, Pix opaque : 3, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_8A_0_0_n:
@ case 10001010
@ mode : 10001010 => first pix:1
	@ Pos : 1, Pix opaque : 3, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_8B_0_0_n:
@ case 10001011
@ mode : 10001011 => first pix:1
	@ Pos : 1, Pix opaque : 3, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
		NEXT_COL16n
@ ----------------------------------------

PPU16_8C_0_0_n:
@ case 10001100
@ mode : 10001100 => first pix:1
	@ Pos : 1, Pix opaque : 3, Pix transp : 2
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_8D_0_0_n:
@ case 10001101
@ mode : 10001101 => first pix:1
	@ Pos : 1, Pix opaque : 3, Pix transp : 2
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_8E_0_0_n:
@ case 10001110
@ mode : 10001110 => first pix:1
	@ Pos : 1, Pix opaque : 3, Pix transp : 3
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		add	R11,R11,#6
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_8F_0_0_n:
@ case 10001111
@ mode : 10001111 => first pix:1
	@ Pos : 1, Pix opaque : 3, Pix transp : 4
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		add	R11,R11,#8
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#8
		NEXT_COL16n
@ ----------------------------------------

PPU16_90_0_0_n:
@ case 10010000
@ mode : 10010000 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 4, Pix opaque : 4, Pix transp : 0
		ldmia	R11!,{R0,R1}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R1,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_91_0_0_n:
@ case 10010001
@ mode : 10010001 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 4, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_92_0_0_n:
@ case 10010010
@ mode : 10010010 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 4, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_93_0_0_n:
@ case 10010011
@ mode : 10010011 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 4, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_94_0_0_n:
@ case 10010100
@ mode : 10010100 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_95_0_0_n:
@ case 10010101
@ mode : 10010101 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_96_0_0_n:
@ case 10010110
@ mode : 10010110 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 4, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_97_0_0_n:
@ case 10010111
@ mode : 10010111 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 4, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
		NEXT_COL16n
@ ----------------------------------------

PPU16_98_0_0_n:
@ case 10011000
@ mode : 10011000 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 2
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_99_0_0_n:
@ case 10011001
@ mode : 10011001 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 2
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_9A_0_0_n:
@ case 10011010
@ mode : 10011010 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 2
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_9B_0_0_n:
@ case 10011011
@ mode : 10011011 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 2
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
		NEXT_COL16n
@ ----------------------------------------

PPU16_9C_0_0_n:
@ case 10011100
@ mode : 10011100 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 3
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_9D_0_0_n:
@ case 10011101
@ mode : 10011101 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 3
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_9E_0_0_n:
@ case 10011110
@ mode : 10011110 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 4
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#10
		strh	R4,[R12],#-10
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_9F_0_0_n:
@ case 10011111
@ mode : 10011111 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 5
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#12
		strh	R4,[R12],#-12
		NEXT_COL16n
@ ----------------------------------------

PPU16_A0_0_0_n:
@ case 10100000
@ mode : 10100000 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 3, Pix opaque : 5, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0,R1}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R1,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_A1_0_0_n:
@ case 10100001
@ mode : 10100001 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 3, Pix opaque : 4, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_A2_0_0_n:
@ case 10100010
@ mode : 10100010 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 3, Pix opaque : 3, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_A3_0_0_n:
@ case 10100011
@ mode : 10100011 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 3, Pix opaque : 3, Pix transp : 2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_A4_0_0_n:
@ case 10100100
@ mode : 10100100 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 3, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_A5_0_0_n:
@ case 10100101
@ mode : 10100101 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 3, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_A6_0_0_n:
@ case 10100110
@ mode : 10100110 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 3, Pix opaque : 2, Pix transp : 2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_A7_0_0_n:
@ case 10100111
@ mode : 10100111 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 3, Pix opaque : 2, Pix transp : 3
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
		NEXT_COL16n
@ ----------------------------------------

PPU16_A8_0_0_n:
@ case 10101000
@ mode : 10101000 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_A9_0_0_n:
@ case 10101001
@ mode : 10101001 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_AA_0_0_n:
@ case 10101010
@ mode : 10101010 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_AB_0_0_n:
@ case 10101011
@ mode : 10101011 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
		NEXT_COL16n
@ ----------------------------------------

PPU16_AC_0_0_n:
@ case 10101100
@ mode : 10101100 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 3, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_AD_0_0_n:
@ case 10101101
@ mode : 10101101 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 3, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_AE_0_0_n:
@ case 10101110
@ mode : 10101110 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 3, Pix opaque : 1, Pix transp : 3
		ldrh	R0,[R11],#8
		strh	R0,[R12],#-8
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_AF_0_0_n:
@ case 10101111
@ mode : 10101111 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 3, Pix opaque : 1, Pix transp : 4
		ldrh	R0,[R11],#10
		strh	R0,[R12],#-10
		NEXT_COL16n
@ ----------------------------------------

PPU16_B0_0_0_n:
@ case 10110000
@ mode : 10110000 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
	@ Pos : 4, Pix opaque : 4, Pix transp : 0
		ldmia	R11!,{R0,R1}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R1,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_B1_0_0_n:
@ case 10110001
@ mode : 10110001 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
	@ Pos : 4, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_B2_0_0_n:
@ case 10110010
@ mode : 10110010 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
	@ Pos : 4, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_B3_0_0_n:
@ case 10110011
@ mode : 10110011 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
	@ Pos : 4, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_B4_0_0_n:
@ case 10110100
@ mode : 10110100 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_B5_0_0_n:
@ case 10110101
@ mode : 10110101 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_B6_0_0_n:
@ case 10110110
@ mode : 10110110 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
	@ Pos : 4, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_B7_0_0_n:
@ case 10110111
@ mode : 10110111 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
	@ Pos : 4, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
		NEXT_COL16n
@ ----------------------------------------

PPU16_B8_0_0_n:
@ case 10111000
@ mode : 10111000 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 3
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#8
		strh	R0,[R12],#-8
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_B9_0_0_n:
@ case 10111001
@ mode : 10111001 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 3
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#8
		strh	R0,[R12],#-8
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_BA_0_0_n:
@ case 10111010
@ mode : 10111010 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 3
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#8
		strh	R0,[R12],#-8
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_BB_0_0_n:
@ case 10111011
@ mode : 10111011 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 3
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#8
		strh	R0,[R12],#-8
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
		NEXT_COL16n
@ ----------------------------------------

PPU16_BC_0_0_n:
@ case 10111100
@ mode : 10111100 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 4
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#10
		strh	R0,[R12],#-10
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_BD_0_0_n:
@ case 10111101
@ mode : 10111101 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 4
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#10
		strh	R0,[R12],#-10
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_BE_0_0_n:
@ case 10111110
@ mode : 10111110 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 5
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#12
		strh	R0,[R12],#-12
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_BF_0_0_n:
@ case 10111111
@ mode : 10111111 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 6
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#14
		strh	R0,[R12],#-14
		NEXT_COL16n
@ ----------------------------------------

PPU16_C0_0_0_n:
@ case 11000000
@ mode : 11000000 => first pix:2
	@ Pos : 2, Pix opaque : 6, Pix transp : 0
		add	R11,R11,#4
		sub	R12,R12,#4
		ldmia	R11!,{R0,R1,R2}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		orr	R1,R1,R2,lsl #16
		mov	R2,R2,lsr #16
		mov	R3,R1,ror #16
		mov	R1,R0,ror #16
		mov	R0,R3
		stmda	R12!,{R0,R1}
		strh	R2,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_C1_0_0_n:
@ case 11000001
@ mode : 11000001 => first pix:2
	@ Pos : 2, Pix opaque : 5, Pix transp : 1
		add	R11,R11,#4
		sub	R12,R12,#4
		ldmia	R11!,{R0,R1}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		orr	R1,R1,R4,lsl #16
		mov	R3,R1,ror #16
		mov	R1,R0,ror #16
		mov	R0,R3
		stmda	R12!,{R0,R1}
		NEXT_COL16n
@ ----------------------------------------

PPU16_C2_0_0_n:
@ case 11000010
@ mode : 11000010 => first pix:2
	@ Pos : 2, Pix opaque : 4, Pix transp : 1
		add	R11,R11,#4
		sub	R12,R12,#4
		ldmia	R11!,{R0,R1}
		add	R11,R11,#2
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R1,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_C3_0_0_n:
@ case 11000011
@ mode : 11000011 => first pix:2
	@ Pos : 2, Pix opaque : 4, Pix transp : 2
		add	R11,R11,#4
		sub	R12,R12,#4
		ldmia	R11!,{R0,R1}
		add	R11,R11,#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R1,[R12,#2]
		sub	R12,R12,#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_C4_0_0_n:
@ case 11000100
@ mode : 11000100 => first pix:2
	@ Pos : 2, Pix opaque : 3, Pix transp : 1
		add	R11,R11,#4
		sub	R12,R12,#4
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_C5_0_0_n:
@ case 11000101
@ mode : 11000101 => first pix:2
	@ Pos : 2, Pix opaque : 3, Pix transp : 1
		add	R11,R11,#4
		sub	R12,R12,#4
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_C6_0_0_n:
@ case 11000110
@ mode : 11000110 => first pix:2
	@ Pos : 2, Pix opaque : 3, Pix transp : 2
		add	R11,R11,#4
		sub	R12,R12,#4
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#6
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-2
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_C7_0_0_n:
@ case 11000111
@ mode : 11000111 => first pix:2
	@ Pos : 2, Pix opaque : 3, Pix transp : 3
		add	R11,R11,#4
		sub	R12,R12,#4
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#8
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_C8_0_0_n:
@ case 11001000
@ mode : 11001000 => first pix:2
	@ Pos : 2, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#4
		sub	R12,R12,#4
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_C9_0_0_n:
@ case 11001001
@ mode : 11001001 => first pix:2
	@ Pos : 2, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#4
		sub	R12,R12,#4
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_CA_0_0_n:
@ case 11001010
@ mode : 11001010 => first pix:2
	@ Pos : 2, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#4
		sub	R12,R12,#4
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_CB_0_0_n:
@ case 11001011
@ mode : 11001011 => first pix:2
	@ Pos : 2, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#4
		sub	R12,R12,#4
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
		NEXT_COL16n
@ ----------------------------------------

PPU16_CC_0_0_n:
@ case 11001100
@ mode : 11001100 => first pix:2
	@ Pos : 2, Pix opaque : 2, Pix transp : 2
		add	R11,R11,#4
		sub	R12,R12,#4
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_CD_0_0_n:
@ case 11001101
@ mode : 11001101 => first pix:2
	@ Pos : 2, Pix opaque : 2, Pix transp : 2
		add	R11,R11,#4
		sub	R12,R12,#4
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_CE_0_0_n:
@ case 11001110
@ mode : 11001110 => first pix:2
	@ Pos : 2, Pix opaque : 2, Pix transp : 3
		add	R11,R11,#4
		sub	R12,R12,#4
		ldmia	R11!,{R0}
		add	R11,R11,#6
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_CF_0_0_n:
@ case 11001111
@ mode : 11001111 => first pix:2
	@ Pos : 2, Pix opaque : 2, Pix transp : 4
		add	R11,R11,#4
		sub	R12,R12,#4
		ldmia	R11!,{R0}
		add	R11,R11,#8
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#8
		NEXT_COL16n
@ ----------------------------------------

PPU16_D0_0_0_n:
@ case 11010000
@ mode : 11010000 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#4
		sub	R12,R12,#4
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 4, Pix opaque : 4, Pix transp : 0
		ldmia	R11!,{R0,R1}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R1,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_D1_0_0_n:
@ case 11010001
@ mode : 11010001 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#4
		sub	R12,R12,#4
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 4, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_D2_0_0_n:
@ case 11010010
@ mode : 11010010 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#4
		sub	R12,R12,#4
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 4, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_D3_0_0_n:
@ case 11010011
@ mode : 11010011 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#4
		sub	R12,R12,#4
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 4, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_D4_0_0_n:
@ case 11010100
@ mode : 11010100 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#4
		sub	R12,R12,#4
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_D5_0_0_n:
@ case 11010101
@ mode : 11010101 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#4
		sub	R12,R12,#4
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_D6_0_0_n:
@ case 11010110
@ mode : 11010110 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#4
		sub	R12,R12,#4
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 4, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_D7_0_0_n:
@ case 11010111
@ mode : 11010111 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#4
		sub	R12,R12,#4
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 4, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
		NEXT_COL16n
@ ----------------------------------------

PPU16_D8_0_0_n:
@ case 11011000
@ mode : 11011000 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#4
		sub	R12,R12,#4
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_D9_0_0_n:
@ case 11011001
@ mode : 11011001 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#4
		sub	R12,R12,#4
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_DA_0_0_n:
@ case 11011010
@ mode : 11011010 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#4
		sub	R12,R12,#4
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_DB_0_0_n:
@ case 11011011
@ mode : 11011011 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#4
		sub	R12,R12,#4
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
		NEXT_COL16n
@ ----------------------------------------

PPU16_DC_0_0_n:
@ case 11011100
@ mode : 11011100 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 3
		add	R11,R11,#4
		sub	R12,R12,#4
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_DD_0_0_n:
@ case 11011101
@ mode : 11011101 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 3
		add	R11,R11,#4
		sub	R12,R12,#4
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_DE_0_0_n:
@ case 11011110
@ mode : 11011110 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 4
		add	R11,R11,#4
		sub	R12,R12,#4
		ldrh	R4,[R11],#10
		strh	R4,[R12],#-10
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_DF_0_0_n:
@ case 11011111
@ mode : 11011111 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 5
		add	R11,R11,#4
		sub	R12,R12,#4
		ldrh	R4,[R11],#12
		strh	R4,[R12],#-12
		NEXT_COL16n
@ ----------------------------------------

PPU16_E0_0_0_n:
@ case 11100000
@ mode : 11100000 => first pix:3
	@ Pos : 3, Pix opaque : 5, Pix transp : 0
		add	R11,R11,#6
		sub	R12,R12,#6
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0,R1}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R1,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_E1_0_0_n:
@ case 11100001
@ mode : 11100001 => first pix:3
	@ Pos : 3, Pix opaque : 4, Pix transp : 1
		add	R11,R11,#6
		sub	R12,R12,#6
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_E2_0_0_n:
@ case 11100010
@ mode : 11100010 => first pix:3
	@ Pos : 3, Pix opaque : 3, Pix transp : 1
		add	R11,R11,#6
		sub	R12,R12,#6
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_E3_0_0_n:
@ case 11100011
@ mode : 11100011 => first pix:3
	@ Pos : 3, Pix opaque : 3, Pix transp : 2
		add	R11,R11,#6
		sub	R12,R12,#6
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_E4_0_0_n:
@ case 11100100
@ mode : 11100100 => first pix:3
	@ Pos : 3, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#6
		sub	R12,R12,#6
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_E5_0_0_n:
@ case 11100101
@ mode : 11100101 => first pix:3
	@ Pos : 3, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#6
		sub	R12,R12,#6
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_E6_0_0_n:
@ case 11100110
@ mode : 11100110 => first pix:3
	@ Pos : 3, Pix opaque : 2, Pix transp : 2
		add	R11,R11,#6
		sub	R12,R12,#6
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_E7_0_0_n:
@ case 11100111
@ mode : 11100111 => first pix:3
	@ Pos : 3, Pix opaque : 2, Pix transp : 3
		add	R11,R11,#6
		sub	R12,R12,#6
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
		NEXT_COL16n
@ ----------------------------------------

PPU16_E8_0_0_n:
@ case 11101000
@ mode : 11101000 => first pix:3
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#6
		sub	R12,R12,#6
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_E9_0_0_n:
@ case 11101001
@ mode : 11101001 => first pix:3
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#6
		sub	R12,R12,#6
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_EA_0_0_n:
@ case 11101010
@ mode : 11101010 => first pix:3
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#6
		sub	R12,R12,#6
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_EB_0_0_n:
@ case 11101011
@ mode : 11101011 => first pix:3
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#6
		sub	R12,R12,#6
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
		NEXT_COL16n
@ ----------------------------------------

PPU16_EC_0_0_n:
@ case 11101100
@ mode : 11101100 => first pix:3
	@ Pos : 3, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#6
		sub	R12,R12,#6
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_ED_0_0_n:
@ case 11101101
@ mode : 11101101 => first pix:3
	@ Pos : 3, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#6
		sub	R12,R12,#6
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_EE_0_0_n:
@ case 11101110
@ mode : 11101110 => first pix:3
	@ Pos : 3, Pix opaque : 1, Pix transp : 3
		add	R11,R11,#6
		sub	R12,R12,#6
		ldrh	R0,[R11],#8
		strh	R0,[R12],#-8
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_EF_0_0_n:
@ case 11101111
@ mode : 11101111 => first pix:3
	@ Pos : 3, Pix opaque : 1, Pix transp : 4
		add	R11,R11,#6
		sub	R12,R12,#6
		ldrh	R0,[R11],#10
		strh	R0,[R12],#-10
		NEXT_COL16n
@ ----------------------------------------

PPU16_F0_0_0_n:
@ case 11110000
@ mode : 11110000 => first pix:4
	@ Pos : 4, Pix opaque : 4, Pix transp : 0
		add	R11,R11,#8
		sub	R12,R12,#8
		ldmia	R11!,{R0,R1}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R1,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_F1_0_0_n:
@ case 11110001
@ mode : 11110001 => first pix:4
	@ Pos : 4, Pix opaque : 3, Pix transp : 1
		add	R11,R11,#8
		sub	R12,R12,#8
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_F2_0_0_n:
@ case 11110010
@ mode : 11110010 => first pix:4
	@ Pos : 4, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#8
		sub	R12,R12,#8
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_F3_0_0_n:
@ case 11110011
@ mode : 11110011 => first pix:4
	@ Pos : 4, Pix opaque : 2, Pix transp : 2
		add	R11,R11,#8
		sub	R12,R12,#8
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		sub	R12,R12,#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_F4_0_0_n:
@ case 11110100
@ mode : 11110100 => first pix:4
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#8
		sub	R12,R12,#8
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_F5_0_0_n:
@ case 11110101
@ mode : 11110101 => first pix:4
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#8
		sub	R12,R12,#8
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_F6_0_0_n:
@ case 11110110
@ mode : 11110110 => first pix:4
	@ Pos : 4, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#8
		sub	R12,R12,#8
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_F7_0_0_n:
@ case 11110111
@ mode : 11110111 => first pix:4
	@ Pos : 4, Pix opaque : 1, Pix transp : 3
		add	R11,R11,#8
		sub	R12,R12,#8
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
		NEXT_COL16n
@ ----------------------------------------

PPU16_F8_0_0_n:
@ case 11111000
@ mode : 11111000 => first pix:5
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		add	R11,R11,#10
		sub	R12,R12,#10
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_F9_0_0_n:
@ case 11111001
@ mode : 11111001 => first pix:5
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#10
		sub	R12,R12,#10
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_FA_0_0_n:
@ case 11111010
@ mode : 11111010 => first pix:5
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#10
		sub	R12,R12,#10
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_FB_0_0_n:
@ case 11111011
@ mode : 11111011 => first pix:5
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#10
		sub	R12,R12,#10
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
		NEXT_COL16n
@ ----------------------------------------

PPU16_FC_0_0_n:
@ case 11111100
@ mode : 11111100 => first pix:6
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		add	R11,R11,#12
		sub	R12,R12,#12
		ldmia	R11!,{R0}
		strh	R0,[R12],#-4
		mov	R0,R0,lsr #16
		strh	R0,[R12,#2]
		NEXT_COL16n
@ ----------------------------------------

PPU16_FD_0_0_n:
@ case 11111101
@ mode : 11111101 => first pix:6
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#12
		sub	R12,R12,#12
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_FE_0_0_n:
@ case 11111110
@ mode : 11111110 => first pix:7
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		add	R11,R11,#14
		sub	R12,R12,#14
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_FF_0_0_n:
@ case 11111111
		add		R11,R11,#16
		sub		R12,R12,#16
		NEXT_COL16n
@ ----------------------------------------
jumptable_ppu1600n:
		.long		PPU16_00_0_0_n
		.long		PPU16_01_0_0_n
		.long		PPU16_02_0_0_n
		.long		PPU16_03_0_0_n
		.long		PPU16_04_0_0_n
		.long		PPU16_05_0_0_n
		.long		PPU16_06_0_0_n
		.long		PPU16_07_0_0_n
		.long		PPU16_08_0_0_n
		.long		PPU16_09_0_0_n
		.long		PPU16_0A_0_0_n
		.long		PPU16_0B_0_0_n
		.long		PPU16_0C_0_0_n
		.long		PPU16_0D_0_0_n
		.long		PPU16_0E_0_0_n
		.long		PPU16_0F_0_0_n
		.long		PPU16_10_0_0_n
		.long		PPU16_11_0_0_n
		.long		PPU16_12_0_0_n
		.long		PPU16_13_0_0_n
		.long		PPU16_14_0_0_n
		.long		PPU16_15_0_0_n
		.long		PPU16_16_0_0_n
		.long		PPU16_17_0_0_n
		.long		PPU16_18_0_0_n
		.long		PPU16_19_0_0_n
		.long		PPU16_1A_0_0_n
		.long		PPU16_1B_0_0_n
		.long		PPU16_1C_0_0_n
		.long		PPU16_1D_0_0_n
		.long		PPU16_1E_0_0_n
		.long		PPU16_1F_0_0_n
		.long		PPU16_20_0_0_n
		.long		PPU16_21_0_0_n
		.long		PPU16_22_0_0_n
		.long		PPU16_23_0_0_n
		.long		PPU16_24_0_0_n
		.long		PPU16_25_0_0_n
		.long		PPU16_26_0_0_n
		.long		PPU16_27_0_0_n
		.long		PPU16_28_0_0_n
		.long		PPU16_29_0_0_n
		.long		PPU16_2A_0_0_n
		.long		PPU16_2B_0_0_n
		.long		PPU16_2C_0_0_n
		.long		PPU16_2D_0_0_n
		.long		PPU16_2E_0_0_n
		.long		PPU16_2F_0_0_n
		.long		PPU16_30_0_0_n
		.long		PPU16_31_0_0_n
		.long		PPU16_32_0_0_n
		.long		PPU16_33_0_0_n
		.long		PPU16_34_0_0_n
		.long		PPU16_35_0_0_n
		.long		PPU16_36_0_0_n
		.long		PPU16_37_0_0_n
		.long		PPU16_38_0_0_n
		.long		PPU16_39_0_0_n
		.long		PPU16_3A_0_0_n
		.long		PPU16_3B_0_0_n
		.long		PPU16_3C_0_0_n
		.long		PPU16_3D_0_0_n
		.long		PPU16_3E_0_0_n
		.long		PPU16_3F_0_0_n
		.long		PPU16_40_0_0_n
		.long		PPU16_41_0_0_n
		.long		PPU16_42_0_0_n
		.long		PPU16_43_0_0_n
		.long		PPU16_44_0_0_n
		.long		PPU16_45_0_0_n
		.long		PPU16_46_0_0_n
		.long		PPU16_47_0_0_n
		.long		PPU16_48_0_0_n
		.long		PPU16_49_0_0_n
		.long		PPU16_4A_0_0_n
		.long		PPU16_4B_0_0_n
		.long		PPU16_4C_0_0_n
		.long		PPU16_4D_0_0_n
		.long		PPU16_4E_0_0_n
		.long		PPU16_4F_0_0_n
		.long		PPU16_50_0_0_n
		.long		PPU16_51_0_0_n
		.long		PPU16_52_0_0_n
		.long		PPU16_53_0_0_n
		.long		PPU16_54_0_0_n
		.long		PPU16_55_0_0_n
		.long		PPU16_56_0_0_n
		.long		PPU16_57_0_0_n
		.long		PPU16_58_0_0_n
		.long		PPU16_59_0_0_n
		.long		PPU16_5A_0_0_n
		.long		PPU16_5B_0_0_n
		.long		PPU16_5C_0_0_n
		.long		PPU16_5D_0_0_n
		.long		PPU16_5E_0_0_n
		.long		PPU16_5F_0_0_n
		.long		PPU16_60_0_0_n
		.long		PPU16_61_0_0_n
		.long		PPU16_62_0_0_n
		.long		PPU16_63_0_0_n
		.long		PPU16_64_0_0_n
		.long		PPU16_65_0_0_n
		.long		PPU16_66_0_0_n
		.long		PPU16_67_0_0_n
		.long		PPU16_68_0_0_n
		.long		PPU16_69_0_0_n
		.long		PPU16_6A_0_0_n
		.long		PPU16_6B_0_0_n
		.long		PPU16_6C_0_0_n
		.long		PPU16_6D_0_0_n
		.long		PPU16_6E_0_0_n
		.long		PPU16_6F_0_0_n
		.long		PPU16_70_0_0_n
		.long		PPU16_71_0_0_n
		.long		PPU16_72_0_0_n
		.long		PPU16_73_0_0_n
		.long		PPU16_74_0_0_n
		.long		PPU16_75_0_0_n
		.long		PPU16_76_0_0_n
		.long		PPU16_77_0_0_n
		.long		PPU16_78_0_0_n
		.long		PPU16_79_0_0_n
		.long		PPU16_7A_0_0_n
		.long		PPU16_7B_0_0_n
		.long		PPU16_7C_0_0_n
		.long		PPU16_7D_0_0_n
		.long		PPU16_7E_0_0_n
		.long		PPU16_7F_0_0_n
		.long		PPU16_80_0_0_n
		.long		PPU16_81_0_0_n
		.long		PPU16_82_0_0_n
		.long		PPU16_83_0_0_n
		.long		PPU16_84_0_0_n
		.long		PPU16_85_0_0_n
		.long		PPU16_86_0_0_n
		.long		PPU16_87_0_0_n
		.long		PPU16_88_0_0_n
		.long		PPU16_89_0_0_n
		.long		PPU16_8A_0_0_n
		.long		PPU16_8B_0_0_n
		.long		PPU16_8C_0_0_n
		.long		PPU16_8D_0_0_n
		.long		PPU16_8E_0_0_n
		.long		PPU16_8F_0_0_n
		.long		PPU16_90_0_0_n
		.long		PPU16_91_0_0_n
		.long		PPU16_92_0_0_n
		.long		PPU16_93_0_0_n
		.long		PPU16_94_0_0_n
		.long		PPU16_95_0_0_n
		.long		PPU16_96_0_0_n
		.long		PPU16_97_0_0_n
		.long		PPU16_98_0_0_n
		.long		PPU16_99_0_0_n
		.long		PPU16_9A_0_0_n
		.long		PPU16_9B_0_0_n
		.long		PPU16_9C_0_0_n
		.long		PPU16_9D_0_0_n
		.long		PPU16_9E_0_0_n
		.long		PPU16_9F_0_0_n
		.long		PPU16_A0_0_0_n
		.long		PPU16_A1_0_0_n
		.long		PPU16_A2_0_0_n
		.long		PPU16_A3_0_0_n
		.long		PPU16_A4_0_0_n
		.long		PPU16_A5_0_0_n
		.long		PPU16_A6_0_0_n
		.long		PPU16_A7_0_0_n
		.long		PPU16_A8_0_0_n
		.long		PPU16_A9_0_0_n
		.long		PPU16_AA_0_0_n
		.long		PPU16_AB_0_0_n
		.long		PPU16_AC_0_0_n
		.long		PPU16_AD_0_0_n
		.long		PPU16_AE_0_0_n
		.long		PPU16_AF_0_0_n
		.long		PPU16_B0_0_0_n
		.long		PPU16_B1_0_0_n
		.long		PPU16_B2_0_0_n
		.long		PPU16_B3_0_0_n
		.long		PPU16_B4_0_0_n
		.long		PPU16_B5_0_0_n
		.long		PPU16_B6_0_0_n
		.long		PPU16_B7_0_0_n
		.long		PPU16_B8_0_0_n
		.long		PPU16_B9_0_0_n
		.long		PPU16_BA_0_0_n
		.long		PPU16_BB_0_0_n
		.long		PPU16_BC_0_0_n
		.long		PPU16_BD_0_0_n
		.long		PPU16_BE_0_0_n
		.long		PPU16_BF_0_0_n
		.long		PPU16_C0_0_0_n
		.long		PPU16_C1_0_0_n
		.long		PPU16_C2_0_0_n
		.long		PPU16_C3_0_0_n
		.long		PPU16_C4_0_0_n
		.long		PPU16_C5_0_0_n
		.long		PPU16_C6_0_0_n
		.long		PPU16_C7_0_0_n
		.long		PPU16_C8_0_0_n
		.long		PPU16_C9_0_0_n
		.long		PPU16_CA_0_0_n
		.long		PPU16_CB_0_0_n
		.long		PPU16_CC_0_0_n
		.long		PPU16_CD_0_0_n
		.long		PPU16_CE_0_0_n
		.long		PPU16_CF_0_0_n
		.long		PPU16_D0_0_0_n
		.long		PPU16_D1_0_0_n
		.long		PPU16_D2_0_0_n
		.long		PPU16_D3_0_0_n
		.long		PPU16_D4_0_0_n
		.long		PPU16_D5_0_0_n
		.long		PPU16_D6_0_0_n
		.long		PPU16_D7_0_0_n
		.long		PPU16_D8_0_0_n
		.long		PPU16_D9_0_0_n
		.long		PPU16_DA_0_0_n
		.long		PPU16_DB_0_0_n
		.long		PPU16_DC_0_0_n
		.long		PPU16_DD_0_0_n
		.long		PPU16_DE_0_0_n
		.long		PPU16_DF_0_0_n
		.long		PPU16_E0_0_0_n
		.long		PPU16_E1_0_0_n
		.long		PPU16_E2_0_0_n
		.long		PPU16_E3_0_0_n
		.long		PPU16_E4_0_0_n
		.long		PPU16_E5_0_0_n
		.long		PPU16_E6_0_0_n
		.long		PPU16_E7_0_0_n
		.long		PPU16_E8_0_0_n
		.long		PPU16_E9_0_0_n
		.long		PPU16_EA_0_0_n
		.long		PPU16_EB_0_0_n
		.long		PPU16_EC_0_0_n
		.long		PPU16_ED_0_0_n
		.long		PPU16_EE_0_0_n
		.long		PPU16_EF_0_0_n
		.long		PPU16_F0_0_0_n
		.long		PPU16_F1_0_0_n
		.long		PPU16_F2_0_0_n
		.long		PPU16_F3_0_0_n
		.long		PPU16_F4_0_0_n
		.long		PPU16_F5_0_0_n
		.long		PPU16_F6_0_0_n
		.long		PPU16_F7_0_0_n
		.long		PPU16_F8_0_0_n
		.long		PPU16_F9_0_0_n
		.long		PPU16_FA_0_0_n
		.long		PPU16_FB_0_0_n
		.long		PPU16_FC_0_0_n
		.long		PPU16_FD_0_0_n
		.long		PPU16_FE_0_0_n
		.long		PPU16_FF_0_0_n


PPU16_00_1_0_n:
@ case 00000000
@ mode : 00000000 => first pix:0
	@ Pos : 0, Pix opaque : 8, Pix transp : 0
		ldmia	R11!,{R0,R1,R2,R3}
		stmia	R12!,{R0,R1,R2,R3}
		NEXT_COL16n
@ ----------------------------------------

PPU16_01_1_0_n:
@ case 00000001
@ mode : 00000001 => first pix:0
	@ Pos : 0, Pix opaque : 7, Pix transp : 1
		ldmia	R11!,{R0,R1,R2}
		ldrh	R4,[R11],#4
		stmia	R12!,{R0,R1,R2}
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_02_1_0_n:
@ case 00000010
@ mode : 00000010 => first pix:0
	@ Pos : 0, Pix opaque : 6, Pix transp : 1
		ldmia	R11!,{R0,R1,R2}
		add	R11,R11,#2
		stmia	R12!,{R0,R1,R2}
		add	R12,R12,#2
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_03_1_0_n:
@ case 00000011
@ mode : 00000011 => first pix:0
	@ Pos : 0, Pix opaque : 6, Pix transp : 2
		ldmia	R11!,{R0,R1,R2}
		add	R11,R11,#4
		stmia	R12!,{R0,R1,R2}
		add	R12,R12,#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_04_1_0_n:
@ case 00000100
@ mode : 00000100 => first pix:0
	@ Pos : 0, Pix opaque : 5, Pix transp : 1
		ldmia	R11!,{R0,R1}
		ldrh	R4,[R11],#4
		stmia	R12!,{R0,R1}
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		stmia	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_05_1_0_n:
@ case 00000101
@ mode : 00000101 => first pix:0
	@ Pos : 0, Pix opaque : 5, Pix transp : 1
		ldmia	R11!,{R0,R1}
		ldrh	R4,[R11],#4
		stmia	R12!,{R0,R1}
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_06_1_0_n:
@ case 00000110
@ mode : 00000110 => first pix:0
	@ Pos : 0, Pix opaque : 5, Pix transp : 2
		ldmia	R11!,{R0,R1}
		ldrh	R4,[R11],#6
		stmia	R12!,{R0,R1}
		strh	R4,[R12],#6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_07_1_0_n:
@ case 00000111
@ mode : 00000111 => first pix:0
	@ Pos : 0, Pix opaque : 5, Pix transp : 3
		ldmia	R11!,{R0,R1}
		ldrh	R4,[R11],#8
		stmia	R12!,{R0,R1}
		strh	R4,[R12],#8
		NEXT_COL16n
@ ----------------------------------------

PPU16_08_1_0_n:
@ case 00001000
@ mode : 00001000 => first pix:0
	@ Pos : 0, Pix opaque : 4, Pix transp : 1
		ldmia	R11!,{R0,R1}
		add	R11,R11,#2
		stmia	R12!,{R0,R1}
		add	R12,R12,#2
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		stmia	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_09_1_0_n:
@ case 00001001
@ mode : 00001001 => first pix:0
	@ Pos : 0, Pix opaque : 4, Pix transp : 1
		ldmia	R11!,{R0,R1}
		add	R11,R11,#2
		stmia	R12!,{R0,R1}
		add	R12,R12,#2
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_0A_1_0_n:
@ case 00001010
@ mode : 00001010 => first pix:0
	@ Pos : 0, Pix opaque : 4, Pix transp : 1
		ldmia	R11!,{R0,R1}
		add	R11,R11,#2
		stmia	R12!,{R0,R1}
		add	R12,R12,#2
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_0B_1_0_n:
@ case 00001011
@ mode : 00001011 => first pix:0
	@ Pos : 0, Pix opaque : 4, Pix transp : 1
		ldmia	R11!,{R0,R1}
		add	R11,R11,#2
		stmia	R12!,{R0,R1}
		add	R12,R12,#2
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_0C_1_0_n:
@ case 00001100
@ mode : 00001100 => first pix:0
	@ Pos : 0, Pix opaque : 4, Pix transp : 2
		ldmia	R11!,{R0,R1}
		add	R11,R11,#4
		stmia	R12!,{R0,R1}
		add	R12,R12,#4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		stmia	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_0D_1_0_n:
@ case 00001101
@ mode : 00001101 => first pix:0
	@ Pos : 0, Pix opaque : 4, Pix transp : 2
		ldmia	R11!,{R0,R1}
		add	R11,R11,#4
		stmia	R12!,{R0,R1}
		add	R12,R12,#4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_0E_1_0_n:
@ case 00001110
@ mode : 00001110 => first pix:0
	@ Pos : 0, Pix opaque : 4, Pix transp : 3
		ldmia	R11!,{R0,R1}
		add	R11,R11,#6
		stmia	R12!,{R0,R1}
		add	R12,R12,#6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_0F_1_0_n:
@ case 00001111
@ mode : 00001111 => first pix:0
	@ Pos : 0, Pix opaque : 4, Pix transp : 4
		ldmia	R11!,{R0,R1}
		add	R11,R11,#8
		stmia	R12!,{R0,R1}
		add	R12,R12,#8
		NEXT_COL16n
@ ----------------------------------------

PPU16_10_1_0_n:
@ case 00010000
@ mode : 00010000 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		stmia	R12!,{R0}
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 4, Pix transp : 0
		ldmia	R11!,{R0,R1}
		stmia	R12!,{R0,R1}
		NEXT_COL16n
@ ----------------------------------------

PPU16_11_1_0_n:
@ case 00010001
@ mode : 00010001 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		stmia	R12!,{R0}
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		stmia	R12!,{R0}
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_12_1_0_n:
@ case 00010010
@ mode : 00010010 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		stmia	R12!,{R0}
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_13_1_0_n:
@ case 00010011
@ mode : 00010011 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		stmia	R12!,{R0}
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		stmia	R12!,{R0}
		add	R12,R12,#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_14_1_0_n:
@ case 00010100
@ mode : 00010100 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		stmia	R12!,{R0}
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		stmia	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_15_1_0_n:
@ case 00010101
@ mode : 00010101 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		stmia	R12!,{R0}
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_16_1_0_n:
@ case 00010110
@ mode : 00010110 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		stmia	R12!,{R0}
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_17_1_0_n:
@ case 00010111
@ mode : 00010111 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		stmia	R12!,{R0}
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
		NEXT_COL16n
@ ----------------------------------------

PPU16_18_1_0_n:
@ case 00011000
@ mode : 00011000 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#6
		stmia	R12!,{R0}
		strh	R4,[R12],#6
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		stmia	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_19_1_0_n:
@ case 00011001
@ mode : 00011001 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#6
		stmia	R12!,{R0}
		strh	R4,[R12],#6
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_1A_1_0_n:
@ case 00011010
@ mode : 00011010 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#6
		stmia	R12!,{R0}
		strh	R4,[R12],#6
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_1B_1_0_n:
@ case 00011011
@ mode : 00011011 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#6
		stmia	R12!,{R0}
		strh	R4,[R12],#6
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_1C_1_0_n:
@ case 00011100
@ mode : 00011100 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 3
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#8
		stmia	R12!,{R0}
		strh	R4,[R12],#8
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		stmia	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_1D_1_0_n:
@ case 00011101
@ mode : 00011101 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 3
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#8
		stmia	R12!,{R0}
		strh	R4,[R12],#8
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_1E_1_0_n:
@ case 00011110
@ mode : 00011110 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 4
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#10
		stmia	R12!,{R0}
		strh	R4,[R12],#10
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_1F_1_0_n:
@ case 00011111
@ mode : 00011111 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 5
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#12
		stmia	R12!,{R0}
		strh	R4,[R12],#12
		NEXT_COL16n
@ ----------------------------------------

PPU16_20_1_0_n:
@ case 00100000
@ mode : 00100000 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 3, Pix opaque : 5, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0,R1}
		stmia	R12!,{R0,R1}
		NEXT_COL16n
@ ----------------------------------------

PPU16_21_1_0_n:
@ case 00100001
@ mode : 00100001 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 3, Pix opaque : 4, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		stmia	R12!,{R0}
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_22_1_0_n:
@ case 00100010
@ mode : 00100010 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 3, Pix opaque : 3, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		add	R11,R11,#2
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_23_1_0_n:
@ case 00100011
@ mode : 00100011 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 3, Pix opaque : 3, Pix transp : 2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		stmia	R12!,{R0}
		add	R12,R12,#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_24_1_0_n:
@ case 00100100
@ mode : 00100100 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 3, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		stmia	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_25_1_0_n:
@ case 00100101
@ mode : 00100101 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 3, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_26_1_0_n:
@ case 00100110
@ mode : 00100110 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 3, Pix opaque : 2, Pix transp : 2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_27_1_0_n:
@ case 00100111
@ mode : 00100111 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 3, Pix opaque : 2, Pix transp : 3
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
		NEXT_COL16n
@ ----------------------------------------

PPU16_28_1_0_n:
@ case 00101000
@ mode : 00101000 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		stmia	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_29_1_0_n:
@ case 00101001
@ mode : 00101001 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_2A_1_0_n:
@ case 00101010
@ mode : 00101010 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_2B_1_0_n:
@ case 00101011
@ mode : 00101011 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_2C_1_0_n:
@ case 00101100
@ mode : 00101100 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 3, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		stmia	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_2D_1_0_n:
@ case 00101101
@ mode : 00101101 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 3, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_2E_1_0_n:
@ case 00101110
@ mode : 00101110 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 3, Pix opaque : 1, Pix transp : 3
		ldrh	R0,[R11],#8
		strh	R0,[R12],#8
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_2F_1_0_n:
@ case 00101111
@ mode : 00101111 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 3, Pix opaque : 1, Pix transp : 4
		ldrh	R0,[R11],#10
		strh	R0,[R12],#10
		NEXT_COL16n
@ ----------------------------------------

PPU16_30_1_0_n:
@ case 00110000
@ mode : 00110000 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		stmia	R12!,{R0}
		add	R12,R12,#4
	@ Pos : 4, Pix opaque : 4, Pix transp : 0
		ldmia	R11!,{R0,R1}
		stmia	R12!,{R0,R1}
		NEXT_COL16n
@ ----------------------------------------

PPU16_31_1_0_n:
@ case 00110001
@ mode : 00110001 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		stmia	R12!,{R0}
		add	R12,R12,#4
	@ Pos : 4, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		stmia	R12!,{R0}
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_32_1_0_n:
@ case 00110010
@ mode : 00110010 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		stmia	R12!,{R0}
		add	R12,R12,#4
	@ Pos : 4, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_33_1_0_n:
@ case 00110011
@ mode : 00110011 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		stmia	R12!,{R0}
		add	R12,R12,#4
	@ Pos : 4, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		stmia	R12!,{R0}
		add	R12,R12,#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_34_1_0_n:
@ case 00110100
@ mode : 00110100 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		stmia	R12!,{R0}
		add	R12,R12,#4
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		stmia	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_35_1_0_n:
@ case 00110101
@ mode : 00110101 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		stmia	R12!,{R0}
		add	R12,R12,#4
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_36_1_0_n:
@ case 00110110
@ mode : 00110110 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		stmia	R12!,{R0}
		add	R12,R12,#4
	@ Pos : 4, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_37_1_0_n:
@ case 00110111
@ mode : 00110111 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		stmia	R12!,{R0}
		add	R12,R12,#4
	@ Pos : 4, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
		NEXT_COL16n
@ ----------------------------------------

PPU16_38_1_0_n:
@ case 00111000
@ mode : 00111000 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 3
		ldmia	R11!,{R0}
		add	R11,R11,#6
		stmia	R12!,{R0}
		add	R12,R12,#6
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		stmia	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_39_1_0_n:
@ case 00111001
@ mode : 00111001 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 3
		ldmia	R11!,{R0}
		add	R11,R11,#6
		stmia	R12!,{R0}
		add	R12,R12,#6
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_3A_1_0_n:
@ case 00111010
@ mode : 00111010 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 3
		ldmia	R11!,{R0}
		add	R11,R11,#6
		stmia	R12!,{R0}
		add	R12,R12,#6
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_3B_1_0_n:
@ case 00111011
@ mode : 00111011 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 3
		ldmia	R11!,{R0}
		add	R11,R11,#6
		stmia	R12!,{R0}
		add	R12,R12,#6
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_3C_1_0_n:
@ case 00111100
@ mode : 00111100 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 4
		ldmia	R11!,{R0}
		add	R11,R11,#8
		stmia	R12!,{R0}
		add	R12,R12,#8
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		stmia	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_3D_1_0_n:
@ case 00111101
@ mode : 00111101 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 4
		ldmia	R11!,{R0}
		add	R11,R11,#8
		stmia	R12!,{R0}
		add	R12,R12,#8
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_3E_1_0_n:
@ case 00111110
@ mode : 00111110 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 5
		ldmia	R11!,{R0}
		add	R11,R11,#10
		stmia	R12!,{R0}
		add	R12,R12,#10
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_3F_1_0_n:
@ case 00111111
@ mode : 00111111 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 6
		ldmia	R11!,{R0}
		add	R11,R11,#12
		stmia	R12!,{R0}
		add	R12,R12,#12
		NEXT_COL16n
@ ----------------------------------------

PPU16_40_1_0_n:
@ case 01000000
@ mode : 01000000 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 6, Pix transp : 0
		ldmia	R11!,{R0,R1,R2}
		stmia	R12!,{R0,R1,R2}
		NEXT_COL16n
@ ----------------------------------------

PPU16_41_1_0_n:
@ case 01000001
@ mode : 01000001 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 5, Pix transp : 1
		ldmia	R11!,{R0,R1}
		ldrh	R4,[R11],#4
		stmia	R12!,{R0,R1}
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_42_1_0_n:
@ case 01000010
@ mode : 01000010 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 4, Pix transp : 1
		ldmia	R11!,{R0,R1}
		add	R11,R11,#2
		stmia	R12!,{R0,R1}
		add	R12,R12,#2
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_43_1_0_n:
@ case 01000011
@ mode : 01000011 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 4, Pix transp : 2
		ldmia	R11!,{R0,R1}
		add	R11,R11,#4
		stmia	R12!,{R0,R1}
		add	R12,R12,#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_44_1_0_n:
@ case 01000100
@ mode : 01000100 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		stmia	R12!,{R0}
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		stmia	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_45_1_0_n:
@ case 01000101
@ mode : 01000101 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		stmia	R12!,{R0}
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_46_1_0_n:
@ case 01000110
@ mode : 01000110 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 3, Pix transp : 2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#6
		stmia	R12!,{R0}
		strh	R4,[R12],#6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_47_1_0_n:
@ case 01000111
@ mode : 01000111 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 3, Pix transp : 3
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#8
		stmia	R12!,{R0}
		strh	R4,[R12],#8
		NEXT_COL16n
@ ----------------------------------------

PPU16_48_1_0_n:
@ case 01001000
@ mode : 01001000 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		stmia	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_49_1_0_n:
@ case 01001001
@ mode : 01001001 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_4A_1_0_n:
@ case 01001010
@ mode : 01001010 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_4B_1_0_n:
@ case 01001011
@ mode : 01001011 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_4C_1_0_n:
@ case 01001100
@ mode : 01001100 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		stmia	R12!,{R0}
		add	R12,R12,#4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		stmia	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_4D_1_0_n:
@ case 01001101
@ mode : 01001101 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		stmia	R12!,{R0}
		add	R12,R12,#4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_4E_1_0_n:
@ case 01001110
@ mode : 01001110 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 2, Pix transp : 3
		ldmia	R11!,{R0}
		add	R11,R11,#6
		stmia	R12!,{R0}
		add	R12,R12,#6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_4F_1_0_n:
@ case 01001111
@ mode : 01001111 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 2, Pix transp : 4
		ldmia	R11!,{R0}
		add	R11,R11,#8
		stmia	R12!,{R0}
		add	R12,R12,#8
		NEXT_COL16n
@ ----------------------------------------

PPU16_50_1_0_n:
@ case 01010000
@ mode : 01010000 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 4, Pix transp : 0
		ldmia	R11!,{R0,R1}
		stmia	R12!,{R0,R1}
		NEXT_COL16n
@ ----------------------------------------

PPU16_51_1_0_n:
@ case 01010001
@ mode : 01010001 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		stmia	R12!,{R0}
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_52_1_0_n:
@ case 01010010
@ mode : 01010010 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_53_1_0_n:
@ case 01010011
@ mode : 01010011 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		stmia	R12!,{R0}
		add	R12,R12,#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_54_1_0_n:
@ case 01010100
@ mode : 01010100 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		stmia	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_55_1_0_n:
@ case 01010101
@ mode : 01010101 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_56_1_0_n:
@ case 01010110
@ mode : 01010110 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_57_1_0_n:
@ case 01010111
@ mode : 01010111 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
		NEXT_COL16n
@ ----------------------------------------

PPU16_58_1_0_n:
@ case 01011000
@ mode : 01011000 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		stmia	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_59_1_0_n:
@ case 01011001
@ mode : 01011001 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_5A_1_0_n:
@ case 01011010
@ mode : 01011010 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_5B_1_0_n:
@ case 01011011
@ mode : 01011011 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_5C_1_0_n:
@ case 01011100
@ mode : 01011100 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		stmia	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_5D_1_0_n:
@ case 01011101
@ mode : 01011101 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_5E_1_0_n:
@ case 01011110
@ mode : 01011110 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 1, Pix transp : 4
		ldrh	R4,[R11],#10
		strh	R4,[R12],#10
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_5F_1_0_n:
@ case 01011111
@ mode : 01011111 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 1, Pix transp : 5
		ldrh	R4,[R11],#12
		strh	R4,[R12],#12
		NEXT_COL16n
@ ----------------------------------------

PPU16_60_1_0_n:
@ case 01100000
@ mode : 01100000 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 3, Pix opaque : 5, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0,R1}
		stmia	R12!,{R0,R1}
		NEXT_COL16n
@ ----------------------------------------

PPU16_61_1_0_n:
@ case 01100001
@ mode : 01100001 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 3, Pix opaque : 4, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		stmia	R12!,{R0}
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_62_1_0_n:
@ case 01100010
@ mode : 01100010 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 3, Pix opaque : 3, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		add	R11,R11,#2
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_63_1_0_n:
@ case 01100011
@ mode : 01100011 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 3, Pix opaque : 3, Pix transp : 2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		stmia	R12!,{R0}
		add	R12,R12,#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_64_1_0_n:
@ case 01100100
@ mode : 01100100 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 3, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		stmia	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_65_1_0_n:
@ case 01100101
@ mode : 01100101 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 3, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_66_1_0_n:
@ case 01100110
@ mode : 01100110 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 3, Pix opaque : 2, Pix transp : 2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_67_1_0_n:
@ case 01100111
@ mode : 01100111 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 3, Pix opaque : 2, Pix transp : 3
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
		NEXT_COL16n
@ ----------------------------------------

PPU16_68_1_0_n:
@ case 01101000
@ mode : 01101000 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		stmia	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_69_1_0_n:
@ case 01101001
@ mode : 01101001 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_6A_1_0_n:
@ case 01101010
@ mode : 01101010 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_6B_1_0_n:
@ case 01101011
@ mode : 01101011 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_6C_1_0_n:
@ case 01101100
@ mode : 01101100 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 3, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		stmia	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_6D_1_0_n:
@ case 01101101
@ mode : 01101101 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 3, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_6E_1_0_n:
@ case 01101110
@ mode : 01101110 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 3, Pix opaque : 1, Pix transp : 3
		ldrh	R0,[R11],#8
		strh	R0,[R12],#8
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_6F_1_0_n:
@ case 01101111
@ mode : 01101111 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 3, Pix opaque : 1, Pix transp : 4
		ldrh	R0,[R11],#10
		strh	R0,[R12],#10
		NEXT_COL16n
@ ----------------------------------------

PPU16_70_1_0_n:
@ case 01110000
@ mode : 01110000 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
	@ Pos : 4, Pix opaque : 4, Pix transp : 0
		ldmia	R11!,{R0,R1}
		stmia	R12!,{R0,R1}
		NEXT_COL16n
@ ----------------------------------------

PPU16_71_1_0_n:
@ case 01110001
@ mode : 01110001 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
	@ Pos : 4, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		stmia	R12!,{R0}
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_72_1_0_n:
@ case 01110010
@ mode : 01110010 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
	@ Pos : 4, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_73_1_0_n:
@ case 01110011
@ mode : 01110011 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
	@ Pos : 4, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		stmia	R12!,{R0}
		add	R12,R12,#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_74_1_0_n:
@ case 01110100
@ mode : 01110100 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		stmia	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_75_1_0_n:
@ case 01110101
@ mode : 01110101 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_76_1_0_n:
@ case 01110110
@ mode : 01110110 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
	@ Pos : 4, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_77_1_0_n:
@ case 01110111
@ mode : 01110111 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
	@ Pos : 4, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
		NEXT_COL16n
@ ----------------------------------------

PPU16_78_1_0_n:
@ case 01111000
@ mode : 01111000 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 4
		ldrh	R4,[R11],#10
		strh	R4,[R12],#10
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		stmia	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_79_1_0_n:
@ case 01111001
@ mode : 01111001 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 4
		ldrh	R4,[R11],#10
		strh	R4,[R12],#10
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_7A_1_0_n:
@ case 01111010
@ mode : 01111010 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 4
		ldrh	R4,[R11],#10
		strh	R4,[R12],#10
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_7B_1_0_n:
@ case 01111011
@ mode : 01111011 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 4
		ldrh	R4,[R11],#10
		strh	R4,[R12],#10
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_7C_1_0_n:
@ case 01111100
@ mode : 01111100 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 5
		ldrh	R4,[R11],#12
		strh	R4,[R12],#12
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		stmia	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_7D_1_0_n:
@ case 01111101
@ mode : 01111101 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 5
		ldrh	R4,[R11],#12
		strh	R4,[R12],#12
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_7E_1_0_n:
@ case 01111110
@ mode : 01111110 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 6
		ldrh	R4,[R11],#14
		strh	R4,[R12],#14
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_7F_1_0_n:
@ case 01111111
@ mode : 01111111 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 7
		ldrh	R4,[R11],#16
		strh	R4,[R12],#16
		NEXT_COL16n
@ ----------------------------------------


PPU16_80_1_0_n:
@ case 10000000
@ mode : 10000000 => first pix:1
	@ Pos : 1, Pix opaque : 7, Pix transp : 0
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0,R1,R2}
		stmia	R12!,{R0,R1,R2}
		NEXT_COL16n
@ ----------------------------------------

PPU16_81_1_0_n:
@ case 10000001
@ mode : 10000001 => first pix:1
	@ Pos : 1, Pix opaque : 6, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0,R1}
		ldrh	R4,[R11],#4
		stmia	R12!,{R0,R1}
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_82_1_0_n:
@ case 10000010
@ mode : 10000010 => first pix:1
	@ Pos : 1, Pix opaque : 5, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0,R1}
		add	R11,R11,#2
		stmia	R12!,{R0,R1}
		add	R12,R12,#2
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_83_1_0_n:
@ case 10000011
@ mode : 10000011 => first pix:1
	@ Pos : 1, Pix opaque : 5, Pix transp : 2
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0,R1}
		add	R11,R11,#4
		stmia	R12!,{R0,R1}
		add	R12,R12,#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_84_1_0_n:
@ case 10000100
@ mode : 10000100 => first pix:1
	@ Pos : 1, Pix opaque : 4, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		stmia	R12!,{R0}
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		stmia	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_85_1_0_n:
@ case 10000101
@ mode : 10000101 => first pix:1
	@ Pos : 1, Pix opaque : 4, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		stmia	R12!,{R0}
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_86_1_0_n:
@ case 10000110
@ mode : 10000110 => first pix:1
	@ Pos : 1, Pix opaque : 4, Pix transp : 2
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#6
		stmia	R12!,{R0}
		strh	R4,[R12],#6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_87_1_0_n:
@ case 10000111
@ mode : 10000111 => first pix:1
	@ Pos : 1, Pix opaque : 4, Pix transp : 3
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#8
		stmia	R12!,{R0}
		strh	R4,[R12],#8
		NEXT_COL16n
@ ----------------------------------------

PPU16_88_1_0_n:
@ case 10001000
@ mode : 10001000 => first pix:1
	@ Pos : 1, Pix opaque : 3, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		add	R11,R11,#2
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		stmia	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_89_1_0_n:
@ case 10001001
@ mode : 10001001 => first pix:1
	@ Pos : 1, Pix opaque : 3, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		add	R11,R11,#2
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_8A_1_0_n:
@ case 10001010
@ mode : 10001010 => first pix:1
	@ Pos : 1, Pix opaque : 3, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		add	R11,R11,#2
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_8B_1_0_n:
@ case 10001011
@ mode : 10001011 => first pix:1
	@ Pos : 1, Pix opaque : 3, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		add	R11,R11,#2
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_8C_1_0_n:
@ case 10001100
@ mode : 10001100 => first pix:1
	@ Pos : 1, Pix opaque : 3, Pix transp : 2
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		stmia	R12!,{R0}
		add	R12,R12,#4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		stmia	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_8D_1_0_n:
@ case 10001101
@ mode : 10001101 => first pix:1
	@ Pos : 1, Pix opaque : 3, Pix transp : 2
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		stmia	R12!,{R0}
		add	R12,R12,#4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_8E_1_0_n:
@ case 10001110
@ mode : 10001110 => first pix:1
	@ Pos : 1, Pix opaque : 3, Pix transp : 3
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		add	R11,R11,#6
		stmia	R12!,{R0}
		add	R12,R12,#6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_8F_1_0_n:
@ case 10001111
@ mode : 10001111 => first pix:1
	@ Pos : 1, Pix opaque : 3, Pix transp : 4
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		add	R11,R11,#8
		stmia	R12!,{R0}
		add	R12,R12,#8
		NEXT_COL16n
@ ----------------------------------------

PPU16_90_1_0_n:
@ case 10010000
@ mode : 10010000 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 4, Pix transp : 0
		ldmia	R11!,{R0,R1}
		stmia	R12!,{R0,R1}
		NEXT_COL16n
@ ----------------------------------------

PPU16_91_1_0_n:
@ case 10010001
@ mode : 10010001 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		stmia	R12!,{R0}
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_92_1_0_n:
@ case 10010010
@ mode : 10010010 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_93_1_0_n:
@ case 10010011
@ mode : 10010011 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		stmia	R12!,{R0}
		add	R12,R12,#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_94_1_0_n:
@ case 10010100
@ mode : 10010100 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		stmia	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_95_1_0_n:
@ case 10010101
@ mode : 10010101 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_96_1_0_n:
@ case 10010110
@ mode : 10010110 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_97_1_0_n:
@ case 10010111
@ mode : 10010111 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
		NEXT_COL16n
@ ----------------------------------------

PPU16_98_1_0_n:
@ case 10011000
@ mode : 10011000 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 2
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		stmia	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_99_1_0_n:
@ case 10011001
@ mode : 10011001 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 2
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_9A_1_0_n:
@ case 10011010
@ mode : 10011010 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 2
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_9B_1_0_n:
@ case 10011011
@ mode : 10011011 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 2
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_9C_1_0_n:
@ case 10011100
@ mode : 10011100 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 3
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		stmia	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_9D_1_0_n:
@ case 10011101
@ mode : 10011101 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 3
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_9E_1_0_n:
@ case 10011110
@ mode : 10011110 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 4
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#10
		strh	R4,[R12],#10
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_9F_1_0_n:
@ case 10011111
@ mode : 10011111 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 5
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#12
		strh	R4,[R12],#12
		NEXT_COL16n
@ ----------------------------------------

PPU16_A0_1_0_n:
@ case 10100000
@ mode : 10100000 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 3, Pix opaque : 5, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0,R1}
		stmia	R12!,{R0,R1}
		NEXT_COL16n
@ ----------------------------------------

PPU16_A1_1_0_n:
@ case 10100001
@ mode : 10100001 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 3, Pix opaque : 4, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		stmia	R12!,{R0}
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_A2_1_0_n:
@ case 10100010
@ mode : 10100010 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 3, Pix opaque : 3, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		add	R11,R11,#2
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_A3_1_0_n:
@ case 10100011
@ mode : 10100011 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 3, Pix opaque : 3, Pix transp : 2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		stmia	R12!,{R0}
		add	R12,R12,#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_A4_1_0_n:
@ case 10100100
@ mode : 10100100 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 3, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		stmia	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_A5_1_0_n:
@ case 10100101
@ mode : 10100101 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 3, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_A6_1_0_n:
@ case 10100110
@ mode : 10100110 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 3, Pix opaque : 2, Pix transp : 2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_A7_1_0_n:
@ case 10100111
@ mode : 10100111 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 3, Pix opaque : 2, Pix transp : 3
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
		NEXT_COL16n
@ ----------------------------------------

PPU16_A8_1_0_n:
@ case 10101000
@ mode : 10101000 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		stmia	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_A9_1_0_n:
@ case 10101001
@ mode : 10101001 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_AA_1_0_n:
@ case 10101010
@ mode : 10101010 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_AB_1_0_n:
@ case 10101011
@ mode : 10101011 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_AC_1_0_n:
@ case 10101100
@ mode : 10101100 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 3, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		stmia	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_AD_1_0_n:
@ case 10101101
@ mode : 10101101 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 3, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_AE_1_0_n:
@ case 10101110
@ mode : 10101110 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 3, Pix opaque : 1, Pix transp : 3
		ldrh	R0,[R11],#8
		strh	R0,[R12],#8
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_AF_1_0_n:
@ case 10101111
@ mode : 10101111 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 3, Pix opaque : 1, Pix transp : 4
		ldrh	R0,[R11],#10
		strh	R0,[R12],#10
		NEXT_COL16n
@ ----------------------------------------

PPU16_B0_1_0_n:
@ case 10110000
@ mode : 10110000 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
	@ Pos : 4, Pix opaque : 4, Pix transp : 0
		ldmia	R11!,{R0,R1}
		stmia	R12!,{R0,R1}
		NEXT_COL16n
@ ----------------------------------------

PPU16_B1_1_0_n:
@ case 10110001
@ mode : 10110001 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
	@ Pos : 4, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		stmia	R12!,{R0}
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_B2_1_0_n:
@ case 10110010
@ mode : 10110010 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
	@ Pos : 4, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_B3_1_0_n:
@ case 10110011
@ mode : 10110011 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
	@ Pos : 4, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		stmia	R12!,{R0}
		add	R12,R12,#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_B4_1_0_n:
@ case 10110100
@ mode : 10110100 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		stmia	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_B5_1_0_n:
@ case 10110101
@ mode : 10110101 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_B6_1_0_n:
@ case 10110110
@ mode : 10110110 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
	@ Pos : 4, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_B7_1_0_n:
@ case 10110111
@ mode : 10110111 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
	@ Pos : 4, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
		NEXT_COL16n
@ ----------------------------------------

PPU16_B8_1_0_n:
@ case 10111000
@ mode : 10111000 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 3
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#8
		strh	R0,[R12],#8
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		stmia	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_B9_1_0_n:
@ case 10111001
@ mode : 10111001 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 3
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#8
		strh	R0,[R12],#8
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_BA_1_0_n:
@ case 10111010
@ mode : 10111010 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 3
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#8
		strh	R0,[R12],#8
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_BB_1_0_n:
@ case 10111011
@ mode : 10111011 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 3
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#8
		strh	R0,[R12],#8
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_BC_1_0_n:
@ case 10111100
@ mode : 10111100 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 4
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#10
		strh	R0,[R12],#10
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		stmia	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_BD_1_0_n:
@ case 10111101
@ mode : 10111101 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 4
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#10
		strh	R0,[R12],#10
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_BE_1_0_n:
@ case 10111110
@ mode : 10111110 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 5
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#12
		strh	R0,[R12],#12
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_BF_1_0_n:
@ case 10111111
@ mode : 10111111 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 6
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#14
		strh	R0,[R12],#14
		NEXT_COL16n
@ ----------------------------------------

PPU16_C0_1_0_n:
@ case 11000000
@ mode : 11000000 => first pix:2
	@ Pos : 2, Pix opaque : 6, Pix transp : 0
		add	R11,R11,#4
		add	R12,R12,#4
		ldmia	R11!,{R0,R1,R2}
		stmia	R12!,{R0,R1,R2}
		NEXT_COL16n
@ ----------------------------------------

PPU16_C1_1_0_n:
@ case 11000001
@ mode : 11000001 => first pix:2
	@ Pos : 2, Pix opaque : 5, Pix transp : 1
		add	R11,R11,#4
		add	R12,R12,#4
		ldmia	R11!,{R0,R1}
		ldrh	R4,[R11],#4
		stmia	R12!,{R0,R1}
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_C2_1_0_n:
@ case 11000010
@ mode : 11000010 => first pix:2
	@ Pos : 2, Pix opaque : 4, Pix transp : 1
		add	R11,R11,#4
		add	R12,R12,#4
		ldmia	R11!,{R0,R1}
		add	R11,R11,#2
		stmia	R12!,{R0,R1}
		add	R12,R12,#2
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_C3_1_0_n:
@ case 11000011
@ mode : 11000011 => first pix:2
	@ Pos : 2, Pix opaque : 4, Pix transp : 2
		add	R11,R11,#4
		add	R12,R12,#4
		ldmia	R11!,{R0,R1}
		add	R11,R11,#4
		stmia	R12!,{R0,R1}
		add	R12,R12,#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_C4_1_0_n:
@ case 11000100
@ mode : 11000100 => first pix:2
	@ Pos : 2, Pix opaque : 3, Pix transp : 1
		add	R11,R11,#4
		add	R12,R12,#4
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		stmia	R12!,{R0}
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		stmia	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_C5_1_0_n:
@ case 11000101
@ mode : 11000101 => first pix:2
	@ Pos : 2, Pix opaque : 3, Pix transp : 1
		add	R11,R11,#4
		add	R12,R12,#4
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		stmia	R12!,{R0}
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_C6_1_0_n:
@ case 11000110
@ mode : 11000110 => first pix:2
	@ Pos : 2, Pix opaque : 3, Pix transp : 2
		add	R11,R11,#4
		add	R12,R12,#4
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#6
		stmia	R12!,{R0}
		strh	R4,[R12],#6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_C7_1_0_n:
@ case 11000111
@ mode : 11000111 => first pix:2
	@ Pos : 2, Pix opaque : 3, Pix transp : 3
		add	R11,R11,#4
		add	R12,R12,#4
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#8
		stmia	R12!,{R0}
		strh	R4,[R12],#8
		NEXT_COL16n
@ ----------------------------------------

PPU16_C8_1_0_n:
@ case 11001000
@ mode : 11001000 => first pix:2
	@ Pos : 2, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#4
		add	R12,R12,#4
		ldmia	R11!,{R0}
		add	R11,R11,#2
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		stmia	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_C9_1_0_n:
@ case 11001001
@ mode : 11001001 => first pix:2
	@ Pos : 2, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#4
		add	R12,R12,#4
		ldmia	R11!,{R0}
		add	R11,R11,#2
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_CA_1_0_n:
@ case 11001010
@ mode : 11001010 => first pix:2
	@ Pos : 2, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#4
		add	R12,R12,#4
		ldmia	R11!,{R0}
		add	R11,R11,#2
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_CB_1_0_n:
@ case 11001011
@ mode : 11001011 => first pix:2
	@ Pos : 2, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#4
		add	R12,R12,#4
		ldmia	R11!,{R0}
		add	R11,R11,#2
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_CC_1_0_n:
@ case 11001100
@ mode : 11001100 => first pix:2
	@ Pos : 2, Pix opaque : 2, Pix transp : 2
		add	R11,R11,#4
		add	R12,R12,#4
		ldmia	R11!,{R0}
		add	R11,R11,#4
		stmia	R12!,{R0}
		add	R12,R12,#4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		stmia	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_CD_1_0_n:
@ case 11001101
@ mode : 11001101 => first pix:2
	@ Pos : 2, Pix opaque : 2, Pix transp : 2
		add	R11,R11,#4
		add	R12,R12,#4
		ldmia	R11!,{R0}
		add	R11,R11,#4
		stmia	R12!,{R0}
		add	R12,R12,#4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_CE_1_0_n:
@ case 11001110
@ mode : 11001110 => first pix:2
	@ Pos : 2, Pix opaque : 2, Pix transp : 3
		add	R11,R11,#4
		add	R12,R12,#4
		ldmia	R11!,{R0}
		add	R11,R11,#6
		stmia	R12!,{R0}
		add	R12,R12,#6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_CF_1_0_n:
@ case 11001111
@ mode : 11001111 => first pix:2
	@ Pos : 2, Pix opaque : 2, Pix transp : 4
		add	R11,R11,#4
		add	R12,R12,#4
		ldmia	R11!,{R0}
		add	R11,R11,#8
		stmia	R12!,{R0}
		add	R12,R12,#8
		NEXT_COL16n
@ ----------------------------------------

PPU16_D0_1_0_n:
@ case 11010000
@ mode : 11010000 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#4
		add	R12,R12,#4
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 4, Pix transp : 0
		ldmia	R11!,{R0,R1}
		stmia	R12!,{R0,R1}
		NEXT_COL16n
@ ----------------------------------------

PPU16_D1_1_0_n:
@ case 11010001
@ mode : 11010001 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#4
		add	R12,R12,#4
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		stmia	R12!,{R0}
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_D2_1_0_n:
@ case 11010010
@ mode : 11010010 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#4
		add	R12,R12,#4
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_D3_1_0_n:
@ case 11010011
@ mode : 11010011 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#4
		add	R12,R12,#4
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		stmia	R12!,{R0}
		add	R12,R12,#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_D4_1_0_n:
@ case 11010100
@ mode : 11010100 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#4
		add	R12,R12,#4
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		stmia	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_D5_1_0_n:
@ case 11010101
@ mode : 11010101 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#4
		add	R12,R12,#4
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_D6_1_0_n:
@ case 11010110
@ mode : 11010110 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#4
		add	R12,R12,#4
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_D7_1_0_n:
@ case 11010111
@ mode : 11010111 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#4
		add	R12,R12,#4
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
		NEXT_COL16n
@ ----------------------------------------

PPU16_D8_1_0_n:
@ case 11011000
@ mode : 11011000 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#4
		add	R12,R12,#4
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		stmia	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_D9_1_0_n:
@ case 11011001
@ mode : 11011001 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#4
		add	R12,R12,#4
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_DA_1_0_n:
@ case 11011010
@ mode : 11011010 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#4
		add	R12,R12,#4
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_DB_1_0_n:
@ case 11011011
@ mode : 11011011 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#4
		add	R12,R12,#4
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_DC_1_0_n:
@ case 11011100
@ mode : 11011100 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 3
		add	R11,R11,#4
		add	R12,R12,#4
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		stmia	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_DD_1_0_n:
@ case 11011101
@ mode : 11011101 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 3
		add	R11,R11,#4
		add	R12,R12,#4
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_DE_1_0_n:
@ case 11011110
@ mode : 11011110 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 4
		add	R11,R11,#4
		add	R12,R12,#4
		ldrh	R4,[R11],#10
		strh	R4,[R12],#10
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_DF_1_0_n:
@ case 11011111
@ mode : 11011111 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 5
		add	R11,R11,#4
		add	R12,R12,#4
		ldrh	R4,[R11],#12
		strh	R4,[R12],#12
		NEXT_COL16n
@ ----------------------------------------

PPU16_E0_1_0_n:
@ case 11100000
@ mode : 11100000 => first pix:3
	@ Pos : 3, Pix opaque : 5, Pix transp : 0
		add	R11,R11,#6
		add	R12,R12,#6
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0,R1}
		stmia	R12!,{R0,R1}
		NEXT_COL16n
@ ----------------------------------------

PPU16_E1_1_0_n:
@ case 11100001
@ mode : 11100001 => first pix:3
	@ Pos : 3, Pix opaque : 4, Pix transp : 1
		add	R11,R11,#6
		add	R12,R12,#6
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		stmia	R12!,{R0}
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_E2_1_0_n:
@ case 11100010
@ mode : 11100010 => first pix:3
	@ Pos : 3, Pix opaque : 3, Pix transp : 1
		add	R11,R11,#6
		add	R12,R12,#6
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		add	R11,R11,#2
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_E3_1_0_n:
@ case 11100011
@ mode : 11100011 => first pix:3
	@ Pos : 3, Pix opaque : 3, Pix transp : 2
		add	R11,R11,#6
		add	R12,R12,#6
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		stmia	R12!,{R0}
		add	R12,R12,#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_E4_1_0_n:
@ case 11100100
@ mode : 11100100 => first pix:3
	@ Pos : 3, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#6
		add	R12,R12,#6
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		stmia	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_E5_1_0_n:
@ case 11100101
@ mode : 11100101 => first pix:3
	@ Pos : 3, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#6
		add	R12,R12,#6
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_E6_1_0_n:
@ case 11100110
@ mode : 11100110 => first pix:3
	@ Pos : 3, Pix opaque : 2, Pix transp : 2
		add	R11,R11,#6
		add	R12,R12,#6
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_E7_1_0_n:
@ case 11100111
@ mode : 11100111 => first pix:3
	@ Pos : 3, Pix opaque : 2, Pix transp : 3
		add	R11,R11,#6
		add	R12,R12,#6
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
		NEXT_COL16n
@ ----------------------------------------

PPU16_E8_1_0_n:
@ case 11101000
@ mode : 11101000 => first pix:3
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#6
		add	R12,R12,#6
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		stmia	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_E9_1_0_n:
@ case 11101001
@ mode : 11101001 => first pix:3
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#6
		add	R12,R12,#6
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_EA_1_0_n:
@ case 11101010
@ mode : 11101010 => first pix:3
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#6
		add	R12,R12,#6
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_EB_1_0_n:
@ case 11101011
@ mode : 11101011 => first pix:3
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#6
		add	R12,R12,#6
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_EC_1_0_n:
@ case 11101100
@ mode : 11101100 => first pix:3
	@ Pos : 3, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#6
		add	R12,R12,#6
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		stmia	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_ED_1_0_n:
@ case 11101101
@ mode : 11101101 => first pix:3
	@ Pos : 3, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#6
		add	R12,R12,#6
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_EE_1_0_n:
@ case 11101110
@ mode : 11101110 => first pix:3
	@ Pos : 3, Pix opaque : 1, Pix transp : 3
		add	R11,R11,#6
		add	R12,R12,#6
		ldrh	R0,[R11],#8
		strh	R0,[R12],#8
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_EF_1_0_n:
@ case 11101111
@ mode : 11101111 => first pix:3
	@ Pos : 3, Pix opaque : 1, Pix transp : 4
		add	R11,R11,#6
		add	R12,R12,#6
		ldrh	R0,[R11],#10
		strh	R0,[R12],#10
		NEXT_COL16n
@ ----------------------------------------

PPU16_F0_1_0_n:
@ case 11110000
@ mode : 11110000 => first pix:4
	@ Pos : 4, Pix opaque : 4, Pix transp : 0
		add	R11,R11,#8
		add	R12,R12,#8
		ldmia	R11!,{R0,R1}
		stmia	R12!,{R0,R1}
		NEXT_COL16n
@ ----------------------------------------

PPU16_F1_1_0_n:
@ case 11110001
@ mode : 11110001 => first pix:4
	@ Pos : 4, Pix opaque : 3, Pix transp : 1
		add	R11,R11,#8
		add	R12,R12,#8
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		stmia	R12!,{R0}
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_F2_1_0_n:
@ case 11110010
@ mode : 11110010 => first pix:4
	@ Pos : 4, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#8
		add	R12,R12,#8
		ldmia	R11!,{R0}
		add	R11,R11,#2
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_F3_1_0_n:
@ case 11110011
@ mode : 11110011 => first pix:4
	@ Pos : 4, Pix opaque : 2, Pix transp : 2
		add	R11,R11,#8
		add	R12,R12,#8
		ldmia	R11!,{R0}
		add	R11,R11,#4
		stmia	R12!,{R0}
		add	R12,R12,#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_F4_1_0_n:
@ case 11110100
@ mode : 11110100 => first pix:4
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#8
		add	R12,R12,#8
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		stmia	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_F5_1_0_n:
@ case 11110101
@ mode : 11110101 => first pix:4
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#8
		add	R12,R12,#8
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_F6_1_0_n:
@ case 11110110
@ mode : 11110110 => first pix:4
	@ Pos : 4, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#8
		add	R12,R12,#8
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_F7_1_0_n:
@ case 11110111
@ mode : 11110111 => first pix:4
	@ Pos : 4, Pix opaque : 1, Pix transp : 3
		add	R11,R11,#8
		add	R12,R12,#8
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
		NEXT_COL16n
@ ----------------------------------------

PPU16_F8_1_0_n:
@ case 11111000
@ mode : 11111000 => first pix:5
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		add	R11,R11,#10
		add	R12,R12,#10
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		stmia	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_F9_1_0_n:
@ case 11111001
@ mode : 11111001 => first pix:5
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#10
		add	R12,R12,#10
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_FA_1_0_n:
@ case 11111010
@ mode : 11111010 => first pix:5
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#10
		add	R12,R12,#10
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_FB_1_0_n:
@ case 11111011
@ mode : 11111011 => first pix:5
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#10
		add	R12,R12,#10
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_FC_1_0_n:
@ case 11111100
@ mode : 11111100 => first pix:6
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		add	R11,R11,#12
		add	R12,R12,#12
		ldmia	R11!,{R0}
		stmia	R12!,{R0}
		NEXT_COL16n
@ ----------------------------------------

PPU16_FD_1_0_n:
@ case 11111101
@ mode : 11111101 => first pix:6
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#12
		add	R12,R12,#12
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_FE_1_0_n:
@ case 11111110
@ mode : 11111110 => first pix:7
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		add	R11,R11,#14
		add	R12,R12,#14
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_FF_1_0_n:
@ case 11111111
		add		R11,R11,#16
		add		R12,R12,#16
		NEXT_COL16n
@ ----------------------------------------
jumptable_ppu1610n:
		.long		PPU16_00_1_0_n
		.long		PPU16_01_1_0_n
		.long		PPU16_02_1_0_n
		.long		PPU16_03_1_0_n
		.long		PPU16_04_1_0_n
		.long		PPU16_05_1_0_n
		.long		PPU16_06_1_0_n
		.long		PPU16_07_1_0_n
		.long		PPU16_08_1_0_n
		.long		PPU16_09_1_0_n
		.long		PPU16_0A_1_0_n
		.long		PPU16_0B_1_0_n
		.long		PPU16_0C_1_0_n
		.long		PPU16_0D_1_0_n
		.long		PPU16_0E_1_0_n
		.long		PPU16_0F_1_0_n
		.long		PPU16_10_1_0_n
		.long		PPU16_11_1_0_n
		.long		PPU16_12_1_0_n
		.long		PPU16_13_1_0_n
		.long		PPU16_14_1_0_n
		.long		PPU16_15_1_0_n
		.long		PPU16_16_1_0_n
		.long		PPU16_17_1_0_n
		.long		PPU16_18_1_0_n
		.long		PPU16_19_1_0_n
		.long		PPU16_1A_1_0_n
		.long		PPU16_1B_1_0_n
		.long		PPU16_1C_1_0_n
		.long		PPU16_1D_1_0_n
		.long		PPU16_1E_1_0_n
		.long		PPU16_1F_1_0_n
		.long		PPU16_20_1_0_n
		.long		PPU16_21_1_0_n
		.long		PPU16_22_1_0_n
		.long		PPU16_23_1_0_n
		.long		PPU16_24_1_0_n
		.long		PPU16_25_1_0_n
		.long		PPU16_26_1_0_n
		.long		PPU16_27_1_0_n
		.long		PPU16_28_1_0_n
		.long		PPU16_29_1_0_n
		.long		PPU16_2A_1_0_n
		.long		PPU16_2B_1_0_n
		.long		PPU16_2C_1_0_n
		.long		PPU16_2D_1_0_n
		.long		PPU16_2E_1_0_n
		.long		PPU16_2F_1_0_n
		.long		PPU16_30_1_0_n
		.long		PPU16_31_1_0_n
		.long		PPU16_32_1_0_n
		.long		PPU16_33_1_0_n
		.long		PPU16_34_1_0_n
		.long		PPU16_35_1_0_n
		.long		PPU16_36_1_0_n
		.long		PPU16_37_1_0_n
		.long		PPU16_38_1_0_n
		.long		PPU16_39_1_0_n
		.long		PPU16_3A_1_0_n
		.long		PPU16_3B_1_0_n
		.long		PPU16_3C_1_0_n
		.long		PPU16_3D_1_0_n
		.long		PPU16_3E_1_0_n
		.long		PPU16_3F_1_0_n
		.long		PPU16_40_1_0_n
		.long		PPU16_41_1_0_n
		.long		PPU16_42_1_0_n
		.long		PPU16_43_1_0_n
		.long		PPU16_44_1_0_n
		.long		PPU16_45_1_0_n
		.long		PPU16_46_1_0_n
		.long		PPU16_47_1_0_n
		.long		PPU16_48_1_0_n
		.long		PPU16_49_1_0_n
		.long		PPU16_4A_1_0_n
		.long		PPU16_4B_1_0_n
		.long		PPU16_4C_1_0_n
		.long		PPU16_4D_1_0_n
		.long		PPU16_4E_1_0_n
		.long		PPU16_4F_1_0_n
		.long		PPU16_50_1_0_n
		.long		PPU16_51_1_0_n
		.long		PPU16_52_1_0_n
		.long		PPU16_53_1_0_n
		.long		PPU16_54_1_0_n
		.long		PPU16_55_1_0_n
		.long		PPU16_56_1_0_n
		.long		PPU16_57_1_0_n
		.long		PPU16_58_1_0_n
		.long		PPU16_59_1_0_n
		.long		PPU16_5A_1_0_n
		.long		PPU16_5B_1_0_n
		.long		PPU16_5C_1_0_n
		.long		PPU16_5D_1_0_n
		.long		PPU16_5E_1_0_n
		.long		PPU16_5F_1_0_n
		.long		PPU16_60_1_0_n
		.long		PPU16_61_1_0_n
		.long		PPU16_62_1_0_n
		.long		PPU16_63_1_0_n
		.long		PPU16_64_1_0_n
		.long		PPU16_65_1_0_n
		.long		PPU16_66_1_0_n
		.long		PPU16_67_1_0_n
		.long		PPU16_68_1_0_n
		.long		PPU16_69_1_0_n
		.long		PPU16_6A_1_0_n
		.long		PPU16_6B_1_0_n
		.long		PPU16_6C_1_0_n
		.long		PPU16_6D_1_0_n
		.long		PPU16_6E_1_0_n
		.long		PPU16_6F_1_0_n
		.long		PPU16_70_1_0_n
		.long		PPU16_71_1_0_n
		.long		PPU16_72_1_0_n
		.long		PPU16_73_1_0_n
		.long		PPU16_74_1_0_n
		.long		PPU16_75_1_0_n
		.long		PPU16_76_1_0_n
		.long		PPU16_77_1_0_n
		.long		PPU16_78_1_0_n
		.long		PPU16_79_1_0_n
		.long		PPU16_7A_1_0_n
		.long		PPU16_7B_1_0_n
		.long		PPU16_7C_1_0_n
		.long		PPU16_7D_1_0_n
		.long		PPU16_7E_1_0_n
		.long		PPU16_7F_1_0_n
		.long		PPU16_80_1_0_n
		.long		PPU16_81_1_0_n
		.long		PPU16_82_1_0_n
		.long		PPU16_83_1_0_n
		.long		PPU16_84_1_0_n
		.long		PPU16_85_1_0_n
		.long		PPU16_86_1_0_n
		.long		PPU16_87_1_0_n
		.long		PPU16_88_1_0_n
		.long		PPU16_89_1_0_n
		.long		PPU16_8A_1_0_n
		.long		PPU16_8B_1_0_n
		.long		PPU16_8C_1_0_n
		.long		PPU16_8D_1_0_n
		.long		PPU16_8E_1_0_n
		.long		PPU16_8F_1_0_n
		.long		PPU16_90_1_0_n
		.long		PPU16_91_1_0_n
		.long		PPU16_92_1_0_n
		.long		PPU16_93_1_0_n
		.long		PPU16_94_1_0_n
		.long		PPU16_95_1_0_n
		.long		PPU16_96_1_0_n
		.long		PPU16_97_1_0_n
		.long		PPU16_98_1_0_n
		.long		PPU16_99_1_0_n
		.long		PPU16_9A_1_0_n
		.long		PPU16_9B_1_0_n
		.long		PPU16_9C_1_0_n
		.long		PPU16_9D_1_0_n
		.long		PPU16_9E_1_0_n
		.long		PPU16_9F_1_0_n
		.long		PPU16_A0_1_0_n
		.long		PPU16_A1_1_0_n
		.long		PPU16_A2_1_0_n
		.long		PPU16_A3_1_0_n
		.long		PPU16_A4_1_0_n
		.long		PPU16_A5_1_0_n
		.long		PPU16_A6_1_0_n
		.long		PPU16_A7_1_0_n
		.long		PPU16_A8_1_0_n
		.long		PPU16_A9_1_0_n
		.long		PPU16_AA_1_0_n
		.long		PPU16_AB_1_0_n
		.long		PPU16_AC_1_0_n
		.long		PPU16_AD_1_0_n
		.long		PPU16_AE_1_0_n
		.long		PPU16_AF_1_0_n
		.long		PPU16_B0_1_0_n
		.long		PPU16_B1_1_0_n
		.long		PPU16_B2_1_0_n
		.long		PPU16_B3_1_0_n
		.long		PPU16_B4_1_0_n
		.long		PPU16_B5_1_0_n
		.long		PPU16_B6_1_0_n
		.long		PPU16_B7_1_0_n
		.long		PPU16_B8_1_0_n
		.long		PPU16_B9_1_0_n
		.long		PPU16_BA_1_0_n
		.long		PPU16_BB_1_0_n
		.long		PPU16_BC_1_0_n
		.long		PPU16_BD_1_0_n
		.long		PPU16_BE_1_0_n
		.long		PPU16_BF_1_0_n
		.long		PPU16_C0_1_0_n
		.long		PPU16_C1_1_0_n
		.long		PPU16_C2_1_0_n
		.long		PPU16_C3_1_0_n
		.long		PPU16_C4_1_0_n
		.long		PPU16_C5_1_0_n
		.long		PPU16_C6_1_0_n
		.long		PPU16_C7_1_0_n
		.long		PPU16_C8_1_0_n
		.long		PPU16_C9_1_0_n
		.long		PPU16_CA_1_0_n
		.long		PPU16_CB_1_0_n
		.long		PPU16_CC_1_0_n
		.long		PPU16_CD_1_0_n
		.long		PPU16_CE_1_0_n
		.long		PPU16_CF_1_0_n
		.long		PPU16_D0_1_0_n
		.long		PPU16_D1_1_0_n
		.long		PPU16_D2_1_0_n
		.long		PPU16_D3_1_0_n
		.long		PPU16_D4_1_0_n
		.long		PPU16_D5_1_0_n
		.long		PPU16_D6_1_0_n
		.long		PPU16_D7_1_0_n
		.long		PPU16_D8_1_0_n
		.long		PPU16_D9_1_0_n
		.long		PPU16_DA_1_0_n
		.long		PPU16_DB_1_0_n
		.long		PPU16_DC_1_0_n
		.long		PPU16_DD_1_0_n
		.long		PPU16_DE_1_0_n
		.long		PPU16_DF_1_0_n
		.long		PPU16_E0_1_0_n
		.long		PPU16_E1_1_0_n
		.long		PPU16_E2_1_0_n
		.long		PPU16_E3_1_0_n
		.long		PPU16_E4_1_0_n
		.long		PPU16_E5_1_0_n
		.long		PPU16_E6_1_0_n
		.long		PPU16_E7_1_0_n
		.long		PPU16_E8_1_0_n
		.long		PPU16_E9_1_0_n
		.long		PPU16_EA_1_0_n
		.long		PPU16_EB_1_0_n
		.long		PPU16_EC_1_0_n
		.long		PPU16_ED_1_0_n
		.long		PPU16_EE_1_0_n
		.long		PPU16_EF_1_0_n
		.long		PPU16_F0_1_0_n
		.long		PPU16_F1_1_0_n
		.long		PPU16_F2_1_0_n
		.long		PPU16_F3_1_0_n
		.long		PPU16_F4_1_0_n
		.long		PPU16_F5_1_0_n
		.long		PPU16_F6_1_0_n
		.long		PPU16_F7_1_0_n
		.long		PPU16_F8_1_0_n
		.long		PPU16_F9_1_0_n
		.long		PPU16_FA_1_0_n
		.long		PPU16_FB_1_0_n
		.long		PPU16_FC_1_0_n
		.long		PPU16_FD_1_0_n
		.long		PPU16_FE_1_0_n
		.long		PPU16_FF_1_0_n


PPU16_00_0_1_n:
@ case 00000000
@ mode : 00000000 => first pix:0
	@ Pos : 0, Pix opaque : 8, Pix transp : 0
		ldmia	R11!,{R0,R1,R2,R3}
		sub	R12,R12,#2		@ Swap reg R0,R1,R2,R3
		mov	R4,R0,ror #16
		mov	R0,R3,ror #16
		mov	R3,R4
		mov	R4,R1,ror #16
		mov	R1,R2,ror #16
		mov	R2,R4
		stmda	R12!,{R0,R1,R2,R3}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_01_0_1_n:
@ case 00000001
@ mode : 00000001 => first pix:0
	@ Pos : 0, Pix opaque : 7, Pix transp : 1
		ldmia	R11!,{R0,R1,R2}
		ldrh	R4,[R11],#4
		sub	R12,R12,#2
		@ Swap reg R0,R1,R2
		mov	R3,R0,ror #16
		mov	R0,R2,ror #16
		mov	R2,R3
		mov	R1,R1,ror #16
		stmda	R12!,{R0,R1,R2}
		strh	R4,[R12,#2]
		sub	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_02_0_1_n:
@ case 00000010
@ mode : 00000010 => first pix:0
	@ Pos : 0, Pix opaque : 6, Pix transp : 1
		ldmia	R11!,{R0,R1,R2}
		add	R11,R11,#2
		sub	R12,R12,#2
		@ Swap reg R0,R1,R2
		mov	R3,R0,ror #16
		mov	R0,R2,ror #16
		mov	R2,R3
		mov	R1,R1,ror #16
		stmda	R12!,{R0,R1,R2}
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_03_0_1_n:
@ case 00000011
@ mode : 00000011 => first pix:0
	@ Pos : 0, Pix opaque : 6, Pix transp : 2
		ldmia	R11!,{R0,R1,R2}
		add	R11,R11,#4
		sub	R12,R12,#2
		@ Swap reg R0,R1,R2
		mov	R3,R0,ror #16
		mov	R0,R2,ror #16
		mov	R2,R3
		mov	R1,R1,ror #16
		stmda	R12!,{R0,R1,R2}
		add	R12,R12,#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_04_0_1_n:
@ case 00000100
@ mode : 00000100 => first pix:0
	@ Pos : 0, Pix opaque : 5, Pix transp : 1
		ldmia	R11!,{R0,R1}
		ldrh	R4,[R11],#4
		sub	R12,R12,#2
		@ Swap reg R0,R1
		mov	R3,R0,ror #16
		mov	R0,R1,ror #16
		mov	R1,R3
		stmda	R12!,{R0,R1}
		strh	R4,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_05_0_1_n:
@ case 00000101
@ mode : 00000101 => first pix:0
	@ Pos : 0, Pix opaque : 5, Pix transp : 1
		ldmia	R11!,{R0,R1}
		ldrh	R4,[R11],#4
		sub	R12,R12,#2
		@ Swap reg R0,R1
		mov	R3,R0,ror #16
		mov	R0,R1,ror #16
		mov	R1,R3
		stmda	R12!,{R0,R1}
		strh	R4,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_06_0_1_n:
@ case 00000110
@ mode : 00000110 => first pix:0
	@ Pos : 0, Pix opaque : 5, Pix transp : 2
		ldmia	R11!,{R0,R1}
		ldrh	R4,[R11],#6
		sub	R12,R12,#2
		@ Swap reg R0,R1
		mov	R3,R0,ror #16
		mov	R0,R1,ror #16
		mov	R1,R3
		stmda	R12!,{R0,R1}
		strh	R4,[R12,#2]
		sub	R12,R12,#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_07_0_1_n:
@ case 00000111
@ mode : 00000111 => first pix:0
	@ Pos : 0, Pix opaque : 5, Pix transp : 3
		ldmia	R11!,{R0,R1}
		ldrh	R4,[R11],#8
		sub	R12,R12,#2
		@ Swap reg R0,R1
		mov	R3,R0,ror #16
		mov	R0,R1,ror #16
		mov	R1,R3
		stmda	R12!,{R0,R1}
		strh	R4,[R12,#2]
		sub	R12,R12,#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_08_0_1_n:
@ case 00001000
@ mode : 00001000 => first pix:0
	@ Pos : 0, Pix opaque : 4, Pix transp : 1
		ldmia	R11!,{R0,R1}
		add	R11,R11,#2
		sub	R12,R12,#2
		@ Swap reg R0,R1
		mov	R3,R0,ror #16
		mov	R0,R1,ror #16
		mov	R1,R3
		stmda	R12!,{R0,R1}
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_09_0_1_n:
@ case 00001001
@ mode : 00001001 => first pix:0
	@ Pos : 0, Pix opaque : 4, Pix transp : 1
		ldmia	R11!,{R0,R1}
		add	R11,R11,#2
		sub	R12,R12,#2
		@ Swap reg R0,R1
		mov	R3,R0,ror #16
		mov	R0,R1,ror #16
		mov	R1,R3
		stmda	R12!,{R0,R1}
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_0A_0_1_n:
@ case 00001010
@ mode : 00001010 => first pix:0
	@ Pos : 0, Pix opaque : 4, Pix transp : 1
		ldmia	R11!,{R0,R1}
		add	R11,R11,#2
		sub	R12,R12,#2
		@ Swap reg R0,R1
		mov	R3,R0,ror #16
		mov	R0,R1,ror #16
		mov	R1,R3
		stmda	R12!,{R0,R1}
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_0B_0_1_n:
@ case 00001011
@ mode : 00001011 => first pix:0
	@ Pos : 0, Pix opaque : 4, Pix transp : 1
		ldmia	R11!,{R0,R1}
		add	R11,R11,#2
		sub	R12,R12,#2
		@ Swap reg R0,R1
		mov	R3,R0,ror #16
		mov	R0,R1,ror #16
		mov	R1,R3
		stmda	R12!,{R0,R1}
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
		NEXT_COL16n
@ ----------------------------------------

PPU16_0C_0_1_n:
@ case 00001100
@ mode : 00001100 => first pix:0
	@ Pos : 0, Pix opaque : 4, Pix transp : 2
		ldmia	R11!,{R0,R1}
		add	R11,R11,#4
		sub	R12,R12,#2
		@ Swap reg R0,R1
		mov	R3,R0,ror #16
		mov	R0,R1,ror #16
		mov	R1,R3
		stmda	R12!,{R0,R1}
		add	R12,R12,#-2
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_0D_0_1_n:
@ case 00001101
@ mode : 00001101 => first pix:0
	@ Pos : 0, Pix opaque : 4, Pix transp : 2
		ldmia	R11!,{R0,R1}
		add	R11,R11,#4
		sub	R12,R12,#2
		@ Swap reg R0,R1
		mov	R3,R0,ror #16
		mov	R0,R1,ror #16
		mov	R1,R3
		stmda	R12!,{R0,R1}
		add	R12,R12,#-2
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_0E_0_1_n:
@ case 00001110
@ mode : 00001110 => first pix:0
	@ Pos : 0, Pix opaque : 4, Pix transp : 3
		ldmia	R11!,{R0,R1}
		add	R11,R11,#6
		sub	R12,R12,#2
		@ Swap reg R0,R1
		mov	R3,R0,ror #16
		mov	R0,R1,ror #16
		mov	R1,R3
		stmda	R12!,{R0,R1}
		add	R12,R12,#-4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_0F_0_1_n:
@ case 00001111
@ mode : 00001111 => first pix:0
	@ Pos : 0, Pix opaque : 4, Pix transp : 4
		ldmia	R11!,{R0,R1}
		add	R11,R11,#8
		sub	R12,R12,#2
		@ Swap reg R0,R1
		mov	R3,R0,ror #16
		mov	R0,R1,ror #16
		mov	R1,R3
		stmda	R12!,{R0,R1}
		add	R12,R12,#-6
		NEXT_COL16n
@ ----------------------------------------

PPU16_10_0_1_n:
@ case 00010000
@ mode : 00010000 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R4,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 4, Pix opaque : 4, Pix transp : 0
		ldmia	R11!,{R0,R1}
		sub	R12,R12,#2
		@ Swap reg R0,R1
		mov	R3,R0,ror #16
		mov	R0,R1,ror #16
		mov	R1,R3
		stmda	R12!,{R0,R1}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_11_0_1_n:
@ case 00010001
@ mode : 00010001 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R4,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 4, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R4,[R12,#2]
		sub	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_12_0_1_n:
@ case 00010010
@ mode : 00010010 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R4,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 4, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_13_0_1_n:
@ case 00010011
@ mode : 00010011 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R4,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 4, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_14_0_1_n:
@ case 00010100
@ mode : 00010100 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R4,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_15_0_1_n:
@ case 00010101
@ mode : 00010101 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R4,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_16_0_1_n:
@ case 00010110
@ mode : 00010110 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R4,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 4, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_17_0_1_n:
@ case 00010111
@ mode : 00010111 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R4,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 4, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
		NEXT_COL16n
@ ----------------------------------------

PPU16_18_0_1_n:
@ case 00011000
@ mode : 00011000 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#6
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R4,[R12,#2]
		sub	R12,R12,#4
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_19_0_1_n:
@ case 00011001
@ mode : 00011001 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#6
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R4,[R12,#2]
		sub	R12,R12,#4
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_1A_0_1_n:
@ case 00011010
@ mode : 00011010 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#6
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R4,[R12,#2]
		sub	R12,R12,#4
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_1B_0_1_n:
@ case 00011011
@ mode : 00011011 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#6
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R4,[R12,#2]
		sub	R12,R12,#4
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
		NEXT_COL16n
@ ----------------------------------------

PPU16_1C_0_1_n:
@ case 00011100
@ mode : 00011100 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 3
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#8
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R4,[R12,#2]
		sub	R12,R12,#6
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_1D_0_1_n:
@ case 00011101
@ mode : 00011101 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 3
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#8
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R4,[R12,#2]
		sub	R12,R12,#6
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_1E_0_1_n:
@ case 00011110
@ mode : 00011110 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 4
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#10
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R4,[R12,#2]
		sub	R12,R12,#8
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_1F_0_1_n:
@ case 00011111
@ mode : 00011111 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 5
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#12
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R4,[R12,#2]
		sub	R12,R12,#10
		NEXT_COL16n
@ ----------------------------------------

PPU16_20_0_1_n:
@ case 00100000
@ mode : 00100000 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 3, Pix opaque : 5, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0,R1}
		sub	R12,R12,#2
		@ Swap reg R0,R1
		mov	R3,R0,ror #16
		mov	R0,R1,ror #16
		mov	R1,R3
		stmda	R12!,{R0,R1}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_21_0_1_n:
@ case 00100001
@ mode : 00100001 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 3, Pix opaque : 4, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R4,[R12,#2]
		sub	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_22_0_1_n:
@ case 00100010
@ mode : 00100010 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 3, Pix opaque : 3, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		add	R11,R11,#2
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_23_0_1_n:
@ case 00100011
@ mode : 00100011 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 3, Pix opaque : 3, Pix transp : 2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_24_0_1_n:
@ case 00100100
@ mode : 00100100 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 3, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_25_0_1_n:
@ case 00100101
@ mode : 00100101 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 3, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_26_0_1_n:
@ case 00100110
@ mode : 00100110 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 3, Pix opaque : 2, Pix transp : 2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_27_0_1_n:
@ case 00100111
@ mode : 00100111 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 3, Pix opaque : 2, Pix transp : 3
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
		NEXT_COL16n
@ ----------------------------------------

PPU16_28_0_1_n:
@ case 00101000
@ mode : 00101000 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_29_0_1_n:
@ case 00101001
@ mode : 00101001 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_2A_0_1_n:
@ case 00101010
@ mode : 00101010 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_2B_0_1_n:
@ case 00101011
@ mode : 00101011 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
		NEXT_COL16n
@ ----------------------------------------

PPU16_2C_0_1_n:
@ case 00101100
@ mode : 00101100 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 3, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_2D_0_1_n:
@ case 00101101
@ mode : 00101101 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 3, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_2E_0_1_n:
@ case 00101110
@ mode : 00101110 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 3, Pix opaque : 1, Pix transp : 3
		ldrh	R0,[R11],#8
		strh	R0,[R12],#-8
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_2F_0_1_n:
@ case 00101111
@ mode : 00101111 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 3, Pix opaque : 1, Pix transp : 4
		ldrh	R0,[R11],#10
		strh	R0,[R12],#-10
		NEXT_COL16n
@ ----------------------------------------

PPU16_30_0_1_n:
@ case 00110000
@ mode : 00110000 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-2
	@ Pos : 4, Pix opaque : 4, Pix transp : 0
		ldmia	R11!,{R0,R1}
		sub	R12,R12,#2
		@ Swap reg R0,R1
		mov	R3,R0,ror #16
		mov	R0,R1,ror #16
		mov	R1,R3
		stmda	R12!,{R0,R1}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_31_0_1_n:
@ case 00110001
@ mode : 00110001 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-2
	@ Pos : 4, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R4,[R12,#2]
		sub	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_32_0_1_n:
@ case 00110010
@ mode : 00110010 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-2
	@ Pos : 4, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_33_0_1_n:
@ case 00110011
@ mode : 00110011 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-2
	@ Pos : 4, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_34_0_1_n:
@ case 00110100
@ mode : 00110100 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-2
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_35_0_1_n:
@ case 00110101
@ mode : 00110101 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-2
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_36_0_1_n:
@ case 00110110
@ mode : 00110110 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-2
	@ Pos : 4, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_37_0_1_n:
@ case 00110111
@ mode : 00110111 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-2
	@ Pos : 4, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
		NEXT_COL16n
@ ----------------------------------------

PPU16_38_0_1_n:
@ case 00111000
@ mode : 00111000 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 3
		ldmia	R11!,{R0}
		add	R11,R11,#6
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-4
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_39_0_1_n:
@ case 00111001
@ mode : 00111001 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 3
		ldmia	R11!,{R0}
		add	R11,R11,#6
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-4
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_3A_0_1_n:
@ case 00111010
@ mode : 00111010 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 3
		ldmia	R11!,{R0}
		add	R11,R11,#6
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-4
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_3B_0_1_n:
@ case 00111011
@ mode : 00111011 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 3
		ldmia	R11!,{R0}
		add	R11,R11,#6
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-4
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
		NEXT_COL16n
@ ----------------------------------------

PPU16_3C_0_1_n:
@ case 00111100
@ mode : 00111100 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 4
		ldmia	R11!,{R0}
		add	R11,R11,#8
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-6
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_3D_0_1_n:
@ case 00111101
@ mode : 00111101 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 4
		ldmia	R11!,{R0}
		add	R11,R11,#8
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-6
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_3E_0_1_n:
@ case 00111110
@ mode : 00111110 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 5
		ldmia	R11!,{R0}
		add	R11,R11,#10
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-8
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_3F_0_1_n:
@ case 00111111
@ mode : 00111111 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 6
		ldmia	R11!,{R0}
		add	R11,R11,#12
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-10
		NEXT_COL16n
@ ----------------------------------------

PPU16_40_0_1_n:
@ case 01000000
@ mode : 01000000 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 6, Pix transp : 0
		ldmia	R11!,{R0,R1,R2}
		sub	R12,R12,#2
		@ Swap reg R0,R1,R2
		mov	R3,R0,ror #16
		mov	R0,R2,ror #16
		mov	R2,R3
		mov	R1,R1,ror #16
		stmda	R12!,{R0,R1,R2}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_41_0_1_n:
@ case 01000001
@ mode : 01000001 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 5, Pix transp : 1
		ldmia	R11!,{R0,R1}
		ldrh	R4,[R11],#4
		sub	R12,R12,#2
		@ Swap reg R0,R1
		mov	R3,R0,ror #16
		mov	R0,R1,ror #16
		mov	R1,R3
		stmda	R12!,{R0,R1}
		strh	R4,[R12,#2]
		sub	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_42_0_1_n:
@ case 01000010
@ mode : 01000010 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 4, Pix transp : 1
		ldmia	R11!,{R0,R1}
		add	R11,R11,#2
		sub	R12,R12,#2
		@ Swap reg R0,R1
		mov	R3,R0,ror #16
		mov	R0,R1,ror #16
		mov	R1,R3
		stmda	R12!,{R0,R1}
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_43_0_1_n:
@ case 01000011
@ mode : 01000011 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 4, Pix transp : 2
		ldmia	R11!,{R0,R1}
		add	R11,R11,#4
		sub	R12,R12,#2
		@ Swap reg R0,R1
		mov	R3,R0,ror #16
		mov	R0,R1,ror #16
		mov	R1,R3
		stmda	R12!,{R0,R1}
		add	R12,R12,#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_44_0_1_n:
@ case 01000100
@ mode : 01000100 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R4,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_45_0_1_n:
@ case 01000101
@ mode : 01000101 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R4,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_46_0_1_n:
@ case 01000110
@ mode : 01000110 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 3, Pix transp : 2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#6
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R4,[R12,#2]
		sub	R12,R12,#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_47_0_1_n:
@ case 01000111
@ mode : 01000111 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 3, Pix transp : 3
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#8
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R4,[R12,#2]
		sub	R12,R12,#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_48_0_1_n:
@ case 01001000
@ mode : 01001000 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_49_0_1_n:
@ case 01001001
@ mode : 01001001 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_4A_0_1_n:
@ case 01001010
@ mode : 01001010 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_4B_0_1_n:
@ case 01001011
@ mode : 01001011 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
		NEXT_COL16n
@ ----------------------------------------

PPU16_4C_0_1_n:
@ case 01001100
@ mode : 01001100 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-2
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_4D_0_1_n:
@ case 01001101
@ mode : 01001101 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-2
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_4E_0_1_n:
@ case 01001110
@ mode : 01001110 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 2, Pix transp : 3
		ldmia	R11!,{R0}
		add	R11,R11,#6
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_4F_0_1_n:
@ case 01001111
@ mode : 01001111 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 2, Pix transp : 4
		ldmia	R11!,{R0}
		add	R11,R11,#8
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-6
		NEXT_COL16n
@ ----------------------------------------

PPU16_50_0_1_n:
@ case 01010000
@ mode : 01010000 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 4, Pix opaque : 4, Pix transp : 0
		ldmia	R11!,{R0,R1}
		sub	R12,R12,#2
		@ Swap reg R0,R1
		mov	R3,R0,ror #16
		mov	R0,R1,ror #16
		mov	R1,R3
		stmda	R12!,{R0,R1}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_51_0_1_n:
@ case 01010001
@ mode : 01010001 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 4, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R4,[R12,#2]
		sub	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_52_0_1_n:
@ case 01010010
@ mode : 01010010 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 4, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_53_0_1_n:
@ case 01010011
@ mode : 01010011 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 4, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_54_0_1_n:
@ case 01010100
@ mode : 01010100 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_55_0_1_n:
@ case 01010101
@ mode : 01010101 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_56_0_1_n:
@ case 01010110
@ mode : 01010110 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 4, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_57_0_1_n:
@ case 01010111
@ mode : 01010111 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 4, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
		NEXT_COL16n
@ ----------------------------------------

PPU16_58_0_1_n:
@ case 01011000
@ mode : 01011000 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_59_0_1_n:
@ case 01011001
@ mode : 01011001 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_5A_0_1_n:
@ case 01011010
@ mode : 01011010 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_5B_0_1_n:
@ case 01011011
@ mode : 01011011 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
		NEXT_COL16n
@ ----------------------------------------

PPU16_5C_0_1_n:
@ case 01011100
@ mode : 01011100 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_5D_0_1_n:
@ case 01011101
@ mode : 01011101 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_5E_0_1_n:
@ case 01011110
@ mode : 01011110 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 1, Pix transp : 4
		ldrh	R4,[R11],#10
		strh	R4,[R12],#-10
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_5F_0_1_n:
@ case 01011111
@ mode : 01011111 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 2, Pix opaque : 1, Pix transp : 5
		ldrh	R4,[R11],#12
		strh	R4,[R12],#-12
		NEXT_COL16n
@ ----------------------------------------

PPU16_60_0_1_n:
@ case 01100000
@ mode : 01100000 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 3, Pix opaque : 5, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0,R1}
		sub	R12,R12,#2
		@ Swap reg R0,R1
		mov	R3,R0,ror #16
		mov	R0,R1,ror #16
		mov	R1,R3
		stmda	R12!,{R0,R1}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_61_0_1_n:
@ case 01100001
@ mode : 01100001 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 3, Pix opaque : 4, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R4,[R12,#2]
		sub	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_62_0_1_n:
@ case 01100010
@ mode : 01100010 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 3, Pix opaque : 3, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		add	R11,R11,#2
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_63_0_1_n:
@ case 01100011
@ mode : 01100011 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 3, Pix opaque : 3, Pix transp : 2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_64_0_1_n:
@ case 01100100
@ mode : 01100100 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 3, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_65_0_1_n:
@ case 01100101
@ mode : 01100101 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 3, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_66_0_1_n:
@ case 01100110
@ mode : 01100110 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 3, Pix opaque : 2, Pix transp : 2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_67_0_1_n:
@ case 01100111
@ mode : 01100111 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 3, Pix opaque : 2, Pix transp : 3
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
		NEXT_COL16n
@ ----------------------------------------

PPU16_68_0_1_n:
@ case 01101000
@ mode : 01101000 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_69_0_1_n:
@ case 01101001
@ mode : 01101001 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_6A_0_1_n:
@ case 01101010
@ mode : 01101010 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_6B_0_1_n:
@ case 01101011
@ mode : 01101011 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
		NEXT_COL16n
@ ----------------------------------------

PPU16_6C_0_1_n:
@ case 01101100
@ mode : 01101100 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 3, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_6D_0_1_n:
@ case 01101101
@ mode : 01101101 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 3, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_6E_0_1_n:
@ case 01101110
@ mode : 01101110 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 3, Pix opaque : 1, Pix transp : 3
		ldrh	R0,[R11],#8
		strh	R0,[R12],#-8
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_6F_0_1_n:
@ case 01101111
@ mode : 01101111 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 3, Pix opaque : 1, Pix transp : 4
		ldrh	R0,[R11],#10
		strh	R0,[R12],#-10
		NEXT_COL16n
@ ----------------------------------------

PPU16_70_0_1_n:
@ case 01110000
@ mode : 01110000 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
	@ Pos : 4, Pix opaque : 4, Pix transp : 0
		ldmia	R11!,{R0,R1}
		sub	R12,R12,#2
		@ Swap reg R0,R1
		mov	R3,R0,ror #16
		mov	R0,R1,ror #16
		mov	R1,R3
		stmda	R12!,{R0,R1}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_71_0_1_n:
@ case 01110001
@ mode : 01110001 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
	@ Pos : 4, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R4,[R12,#2]
		sub	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_72_0_1_n:
@ case 01110010
@ mode : 01110010 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
	@ Pos : 4, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_73_0_1_n:
@ case 01110011
@ mode : 01110011 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
	@ Pos : 4, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_74_0_1_n:
@ case 01110100
@ mode : 01110100 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_75_0_1_n:
@ case 01110101
@ mode : 01110101 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_76_0_1_n:
@ case 01110110
@ mode : 01110110 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
	@ Pos : 4, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_77_0_1_n:
@ case 01110111
@ mode : 01110111 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
	@ Pos : 4, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
		NEXT_COL16n
@ ----------------------------------------

PPU16_78_0_1_n:
@ case 01111000
@ mode : 01111000 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 4
		ldrh	R4,[R11],#10
		strh	R4,[R12],#-10
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_79_0_1_n:
@ case 01111001
@ mode : 01111001 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 4
		ldrh	R4,[R11],#10
		strh	R4,[R12],#-10
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_7A_0_1_n:
@ case 01111010
@ mode : 01111010 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 4
		ldrh	R4,[R11],#10
		strh	R4,[R12],#-10
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_7B_0_1_n:
@ case 01111011
@ mode : 01111011 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 4
		ldrh	R4,[R11],#10
		strh	R4,[R12],#-10
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
		NEXT_COL16n
@ ----------------------------------------

PPU16_7C_0_1_n:
@ case 01111100
@ mode : 01111100 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 5
		ldrh	R4,[R11],#12
		strh	R4,[R12],#-12
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_7D_0_1_n:
@ case 01111101
@ mode : 01111101 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 5
		ldrh	R4,[R11],#12
		strh	R4,[R12],#-12
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_7E_0_1_n:
@ case 01111110
@ mode : 01111110 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 6
		ldrh	R4,[R11],#14
		strh	R4,[R12],#-14
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_7F_0_1_n:
@ case 01111111
@ mode : 01111111 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 7
		ldrh	R4,[R11],#16
		strh	R4,[R12],#-16
		NEXT_COL16n
@ ----------------------------------------


PPU16_80_0_1_n:
@ case 10000000
@ mode : 10000000 => first pix:1
	@ Pos : 1, Pix opaque : 7, Pix transp : 0
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0,R1,R2}
		sub	R12,R12,#2
		@ Swap reg R0,R1,R2
		mov	R3,R0,ror #16
		mov	R0,R2,ror #16
		mov	R2,R3
		mov	R1,R1,ror #16
		stmda	R12!,{R0,R1,R2}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_81_0_1_n:
@ case 10000001
@ mode : 10000001 => first pix:1
	@ Pos : 1, Pix opaque : 6, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0,R1}
		ldrh	R4,[R11],#4
		sub	R12,R12,#2
		@ Swap reg R0,R1
		mov	R3,R0,ror #16
		mov	R0,R1,ror #16
		mov	R1,R3
		stmda	R12!,{R0,R1}
		strh	R4,[R12,#2]
		sub	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_82_0_1_n:
@ case 10000010
@ mode : 10000010 => first pix:1
	@ Pos : 1, Pix opaque : 5, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0,R1}
		add	R11,R11,#2
		sub	R12,R12,#2
		@ Swap reg R0,R1
		mov	R3,R0,ror #16
		mov	R0,R1,ror #16
		mov	R1,R3
		stmda	R12!,{R0,R1}
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_83_0_1_n:
@ case 10000011
@ mode : 10000011 => first pix:1
	@ Pos : 1, Pix opaque : 5, Pix transp : 2
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0,R1}
		add	R11,R11,#4
		sub	R12,R12,#2
		@ Swap reg R0,R1
		mov	R3,R0,ror #16
		mov	R0,R1,ror #16
		mov	R1,R3
		stmda	R12!,{R0,R1}
		add	R12,R12,#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_84_0_1_n:
@ case 10000100
@ mode : 10000100 => first pix:1
	@ Pos : 1, Pix opaque : 4, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R4,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_85_0_1_n:
@ case 10000101
@ mode : 10000101 => first pix:1
	@ Pos : 1, Pix opaque : 4, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R4,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_86_0_1_n:
@ case 10000110
@ mode : 10000110 => first pix:1
	@ Pos : 1, Pix opaque : 4, Pix transp : 2
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#6
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R4,[R12,#2]
		sub	R12,R12,#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_87_0_1_n:
@ case 10000111
@ mode : 10000111 => first pix:1
	@ Pos : 1, Pix opaque : 4, Pix transp : 3
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#8
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R4,[R12,#2]
		sub	R12,R12,#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_88_0_1_n:
@ case 10001000
@ mode : 10001000 => first pix:1
	@ Pos : 1, Pix opaque : 3, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		add	R11,R11,#2
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_89_0_1_n:
@ case 10001001
@ mode : 10001001 => first pix:1
	@ Pos : 1, Pix opaque : 3, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		add	R11,R11,#2
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_8A_0_1_n:
@ case 10001010
@ mode : 10001010 => first pix:1
	@ Pos : 1, Pix opaque : 3, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		add	R11,R11,#2
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_8B_0_1_n:
@ case 10001011
@ mode : 10001011 => first pix:1
	@ Pos : 1, Pix opaque : 3, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		add	R11,R11,#2
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
		NEXT_COL16n
@ ----------------------------------------

PPU16_8C_0_1_n:
@ case 10001100
@ mode : 10001100 => first pix:1
	@ Pos : 1, Pix opaque : 3, Pix transp : 2
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-2
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_8D_0_1_n:
@ case 10001101
@ mode : 10001101 => first pix:1
	@ Pos : 1, Pix opaque : 3, Pix transp : 2
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-2
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_8E_0_1_n:
@ case 10001110
@ mode : 10001110 => first pix:1
	@ Pos : 1, Pix opaque : 3, Pix transp : 3
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		add	R11,R11,#6
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_8F_0_1_n:
@ case 10001111
@ mode : 10001111 => first pix:1
	@ Pos : 1, Pix opaque : 3, Pix transp : 4
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		add	R11,R11,#8
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-6
		NEXT_COL16n
@ ----------------------------------------

PPU16_90_0_1_n:
@ case 10010000
@ mode : 10010000 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 4, Pix opaque : 4, Pix transp : 0
		ldmia	R11!,{R0,R1}
		sub	R12,R12,#2
		@ Swap reg R0,R1
		mov	R3,R0,ror #16
		mov	R0,R1,ror #16
		mov	R1,R3
		stmda	R12!,{R0,R1}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_91_0_1_n:
@ case 10010001
@ mode : 10010001 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 4, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R4,[R12,#2]
		sub	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_92_0_1_n:
@ case 10010010
@ mode : 10010010 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 4, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_93_0_1_n:
@ case 10010011
@ mode : 10010011 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 4, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_94_0_1_n:
@ case 10010100
@ mode : 10010100 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_95_0_1_n:
@ case 10010101
@ mode : 10010101 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_96_0_1_n:
@ case 10010110
@ mode : 10010110 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 4, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_97_0_1_n:
@ case 10010111
@ mode : 10010111 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 4, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
		NEXT_COL16n
@ ----------------------------------------

PPU16_98_0_1_n:
@ case 10011000
@ mode : 10011000 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 2
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_99_0_1_n:
@ case 10011001
@ mode : 10011001 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 2
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_9A_0_1_n:
@ case 10011010
@ mode : 10011010 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 2
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_9B_0_1_n:
@ case 10011011
@ mode : 10011011 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 2
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
		NEXT_COL16n
@ ----------------------------------------

PPU16_9C_0_1_n:
@ case 10011100
@ mode : 10011100 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 3
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_9D_0_1_n:
@ case 10011101
@ mode : 10011101 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 3
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_9E_0_1_n:
@ case 10011110
@ mode : 10011110 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 4
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#10
		strh	R4,[R12],#-10
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_9F_0_1_n:
@ case 10011111
@ mode : 10011111 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 5
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#12
		strh	R4,[R12],#-12
		NEXT_COL16n
@ ----------------------------------------

PPU16_A0_0_1_n:
@ case 10100000
@ mode : 10100000 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 3, Pix opaque : 5, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0,R1}
		sub	R12,R12,#2
		@ Swap reg R0,R1
		mov	R3,R0,ror #16
		mov	R0,R1,ror #16
		mov	R1,R3
		stmda	R12!,{R0,R1}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_A1_0_1_n:
@ case 10100001
@ mode : 10100001 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 3, Pix opaque : 4, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R4,[R12,#2]
		sub	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_A2_0_1_n:
@ case 10100010
@ mode : 10100010 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 3, Pix opaque : 3, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		add	R11,R11,#2
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_A3_0_1_n:
@ case 10100011
@ mode : 10100011 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 3, Pix opaque : 3, Pix transp : 2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_A4_0_1_n:
@ case 10100100
@ mode : 10100100 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 3, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_A5_0_1_n:
@ case 10100101
@ mode : 10100101 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 3, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_A6_0_1_n:
@ case 10100110
@ mode : 10100110 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 3, Pix opaque : 2, Pix transp : 2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_A7_0_1_n:
@ case 10100111
@ mode : 10100111 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 3, Pix opaque : 2, Pix transp : 3
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
		NEXT_COL16n
@ ----------------------------------------

PPU16_A8_0_1_n:
@ case 10101000
@ mode : 10101000 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_A9_0_1_n:
@ case 10101001
@ mode : 10101001 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_AA_0_1_n:
@ case 10101010
@ mode : 10101010 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_AB_0_1_n:
@ case 10101011
@ mode : 10101011 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
		NEXT_COL16n
@ ----------------------------------------

PPU16_AC_0_1_n:
@ case 10101100
@ mode : 10101100 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 3, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_AD_0_1_n:
@ case 10101101
@ mode : 10101101 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 3, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_AE_0_1_n:
@ case 10101110
@ mode : 10101110 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 3, Pix opaque : 1, Pix transp : 3
		ldrh	R0,[R11],#8
		strh	R0,[R12],#-8
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_AF_0_1_n:
@ case 10101111
@ mode : 10101111 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 3, Pix opaque : 1, Pix transp : 4
		ldrh	R0,[R11],#10
		strh	R0,[R12],#-10
		NEXT_COL16n
@ ----------------------------------------

PPU16_B0_0_1_n:
@ case 10110000
@ mode : 10110000 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
	@ Pos : 4, Pix opaque : 4, Pix transp : 0
		ldmia	R11!,{R0,R1}
		sub	R12,R12,#2
		@ Swap reg R0,R1
		mov	R3,R0,ror #16
		mov	R0,R1,ror #16
		mov	R1,R3
		stmda	R12!,{R0,R1}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_B1_0_1_n:
@ case 10110001
@ mode : 10110001 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
	@ Pos : 4, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R4,[R12,#2]
		sub	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_B2_0_1_n:
@ case 10110010
@ mode : 10110010 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
	@ Pos : 4, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_B3_0_1_n:
@ case 10110011
@ mode : 10110011 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
	@ Pos : 4, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_B4_0_1_n:
@ case 10110100
@ mode : 10110100 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_B5_0_1_n:
@ case 10110101
@ mode : 10110101 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_B6_0_1_n:
@ case 10110110
@ mode : 10110110 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
	@ Pos : 4, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_B7_0_1_n:
@ case 10110111
@ mode : 10110111 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
	@ Pos : 4, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
		NEXT_COL16n
@ ----------------------------------------

PPU16_B8_0_1_n:
@ case 10111000
@ mode : 10111000 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 3
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#8
		strh	R0,[R12],#-8
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_B9_0_1_n:
@ case 10111001
@ mode : 10111001 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 3
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#8
		strh	R0,[R12],#-8
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_BA_0_1_n:
@ case 10111010
@ mode : 10111010 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 3
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#8
		strh	R0,[R12],#-8
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_BB_0_1_n:
@ case 10111011
@ mode : 10111011 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 3
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#8
		strh	R0,[R12],#-8
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
		NEXT_COL16n
@ ----------------------------------------

PPU16_BC_0_1_n:
@ case 10111100
@ mode : 10111100 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 4
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#10
		strh	R0,[R12],#-10
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_BD_0_1_n:
@ case 10111101
@ mode : 10111101 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 4
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#10
		strh	R0,[R12],#-10
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_BE_0_1_n:
@ case 10111110
@ mode : 10111110 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 5
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#12
		strh	R0,[R12],#-12
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_BF_0_1_n:
@ case 10111111
@ mode : 10111111 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 6
		add	R11,R11,#2
		sub	R12,R12,#2
		ldrh	R0,[R11],#14
		strh	R0,[R12],#-14
		NEXT_COL16n
@ ----------------------------------------

PPU16_C0_0_1_n:
@ case 11000000
@ mode : 11000000 => first pix:2
	@ Pos : 2, Pix opaque : 6, Pix transp : 0
		add	R11,R11,#4
		sub	R12,R12,#4
		ldmia	R11!,{R0,R1,R2}
		sub	R12,R12,#2
		@ Swap reg R0,R1,R2
		mov	R3,R0,ror #16
		mov	R0,R2,ror #16
		mov	R2,R3
		mov	R1,R1,ror #16
		stmda	R12!,{R0,R1,R2}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_C1_0_1_n:
@ case 11000001
@ mode : 11000001 => first pix:2
	@ Pos : 2, Pix opaque : 5, Pix transp : 1
		add	R11,R11,#4
		sub	R12,R12,#4
		ldmia	R11!,{R0,R1}
		ldrh	R4,[R11],#4
		sub	R12,R12,#2
		@ Swap reg R0,R1
		mov	R3,R0,ror #16
		mov	R0,R1,ror #16
		mov	R1,R3
		stmda	R12!,{R0,R1}
		strh	R4,[R12,#2]
		sub	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_C2_0_1_n:
@ case 11000010
@ mode : 11000010 => first pix:2
	@ Pos : 2, Pix opaque : 4, Pix transp : 1
		add	R11,R11,#4
		sub	R12,R12,#4
		ldmia	R11!,{R0,R1}
		add	R11,R11,#2
		sub	R12,R12,#2
		@ Swap reg R0,R1
		mov	R3,R0,ror #16
		mov	R0,R1,ror #16
		mov	R1,R3
		stmda	R12!,{R0,R1}
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_C3_0_1_n:
@ case 11000011
@ mode : 11000011 => first pix:2
	@ Pos : 2, Pix opaque : 4, Pix transp : 2
		add	R11,R11,#4
		sub	R12,R12,#4
		ldmia	R11!,{R0,R1}
		add	R11,R11,#4
		sub	R12,R12,#2
		@ Swap reg R0,R1
		mov	R3,R0,ror #16
		mov	R0,R1,ror #16
		mov	R1,R3
		stmda	R12!,{R0,R1}
		add	R12,R12,#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_C4_0_1_n:
@ case 11000100
@ mode : 11000100 => first pix:2
	@ Pos : 2, Pix opaque : 3, Pix transp : 1
		add	R11,R11,#4
		sub	R12,R12,#4
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R4,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_C5_0_1_n:
@ case 11000101
@ mode : 11000101 => first pix:2
	@ Pos : 2, Pix opaque : 3, Pix transp : 1
		add	R11,R11,#4
		sub	R12,R12,#4
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R4,[R12,#2]
		sub	R12,R12,#2
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_C6_0_1_n:
@ case 11000110
@ mode : 11000110 => first pix:2
	@ Pos : 2, Pix opaque : 3, Pix transp : 2
		add	R11,R11,#4
		sub	R12,R12,#4
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#6
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R4,[R12,#2]
		sub	R12,R12,#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_C7_0_1_n:
@ case 11000111
@ mode : 11000111 => first pix:2
	@ Pos : 2, Pix opaque : 3, Pix transp : 3
		add	R11,R11,#4
		sub	R12,R12,#4
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#8
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R4,[R12,#2]
		sub	R12,R12,#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_C8_0_1_n:
@ case 11001000
@ mode : 11001000 => first pix:2
	@ Pos : 2, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#4
		sub	R12,R12,#4
		ldmia	R11!,{R0}
		add	R11,R11,#2
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_C9_0_1_n:
@ case 11001001
@ mode : 11001001 => first pix:2
	@ Pos : 2, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#4
		sub	R12,R12,#4
		ldmia	R11!,{R0}
		add	R11,R11,#2
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_CA_0_1_n:
@ case 11001010
@ mode : 11001010 => first pix:2
	@ Pos : 2, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#4
		sub	R12,R12,#4
		ldmia	R11!,{R0}
		add	R11,R11,#2
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_CB_0_1_n:
@ case 11001011
@ mode : 11001011 => first pix:2
	@ Pos : 2, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#4
		sub	R12,R12,#4
		ldmia	R11!,{R0}
		add	R11,R11,#2
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
		NEXT_COL16n
@ ----------------------------------------

PPU16_CC_0_1_n:
@ case 11001100
@ mode : 11001100 => first pix:2
	@ Pos : 2, Pix opaque : 2, Pix transp : 2
		add	R11,R11,#4
		sub	R12,R12,#4
		ldmia	R11!,{R0}
		add	R11,R11,#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-2
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_CD_0_1_n:
@ case 11001101
@ mode : 11001101 => first pix:2
	@ Pos : 2, Pix opaque : 2, Pix transp : 2
		add	R11,R11,#4
		sub	R12,R12,#4
		ldmia	R11!,{R0}
		add	R11,R11,#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-2
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_CE_0_1_n:
@ case 11001110
@ mode : 11001110 => first pix:2
	@ Pos : 2, Pix opaque : 2, Pix transp : 3
		add	R11,R11,#4
		sub	R12,R12,#4
		ldmia	R11!,{R0}
		add	R11,R11,#6
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_CF_0_1_n:
@ case 11001111
@ mode : 11001111 => first pix:2
	@ Pos : 2, Pix opaque : 2, Pix transp : 4
		add	R11,R11,#4
		sub	R12,R12,#4
		ldmia	R11!,{R0}
		add	R11,R11,#8
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-6
		NEXT_COL16n
@ ----------------------------------------

PPU16_D0_0_1_n:
@ case 11010000
@ mode : 11010000 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#4
		sub	R12,R12,#4
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 4, Pix opaque : 4, Pix transp : 0
		ldmia	R11!,{R0,R1}
		sub	R12,R12,#2
		@ Swap reg R0,R1
		mov	R3,R0,ror #16
		mov	R0,R1,ror #16
		mov	R1,R3
		stmda	R12!,{R0,R1}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_D1_0_1_n:
@ case 11010001
@ mode : 11010001 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#4
		sub	R12,R12,#4
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 4, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R4,[R12,#2]
		sub	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_D2_0_1_n:
@ case 11010010
@ mode : 11010010 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#4
		sub	R12,R12,#4
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 4, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_D3_0_1_n:
@ case 11010011
@ mode : 11010011 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#4
		sub	R12,R12,#4
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 4, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_D4_0_1_n:
@ case 11010100
@ mode : 11010100 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#4
		sub	R12,R12,#4
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_D5_0_1_n:
@ case 11010101
@ mode : 11010101 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#4
		sub	R12,R12,#4
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_D6_0_1_n:
@ case 11010110
@ mode : 11010110 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#4
		sub	R12,R12,#4
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 4, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_D7_0_1_n:
@ case 11010111
@ mode : 11010111 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#4
		sub	R12,R12,#4
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 4, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
		NEXT_COL16n
@ ----------------------------------------

PPU16_D8_0_1_n:
@ case 11011000
@ mode : 11011000 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#4
		sub	R12,R12,#4
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_D9_0_1_n:
@ case 11011001
@ mode : 11011001 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#4
		sub	R12,R12,#4
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_DA_0_1_n:
@ case 11011010
@ mode : 11011010 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#4
		sub	R12,R12,#4
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_DB_0_1_n:
@ case 11011011
@ mode : 11011011 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#4
		sub	R12,R12,#4
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
		NEXT_COL16n
@ ----------------------------------------

PPU16_DC_0_1_n:
@ case 11011100
@ mode : 11011100 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 3
		add	R11,R11,#4
		sub	R12,R12,#4
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_DD_0_1_n:
@ case 11011101
@ mode : 11011101 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 3
		add	R11,R11,#4
		sub	R12,R12,#4
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_DE_0_1_n:
@ case 11011110
@ mode : 11011110 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 4
		add	R11,R11,#4
		sub	R12,R12,#4
		ldrh	R4,[R11],#10
		strh	R4,[R12],#-10
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_DF_0_1_n:
@ case 11011111
@ mode : 11011111 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 5
		add	R11,R11,#4
		sub	R12,R12,#4
		ldrh	R4,[R11],#12
		strh	R4,[R12],#-12
		NEXT_COL16n
@ ----------------------------------------

PPU16_E0_0_1_n:
@ case 11100000
@ mode : 11100000 => first pix:3
	@ Pos : 3, Pix opaque : 5, Pix transp : 0
		add	R11,R11,#6
		sub	R12,R12,#6
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0,R1}
		sub	R12,R12,#2
		@ Swap reg R0,R1
		mov	R3,R0,ror #16
		mov	R0,R1,ror #16
		mov	R1,R3
		stmda	R12!,{R0,R1}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_E1_0_1_n:
@ case 11100001
@ mode : 11100001 => first pix:3
	@ Pos : 3, Pix opaque : 4, Pix transp : 1
		add	R11,R11,#6
		sub	R12,R12,#6
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R4,[R12,#2]
		sub	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_E2_0_1_n:
@ case 11100010
@ mode : 11100010 => first pix:3
	@ Pos : 3, Pix opaque : 3, Pix transp : 1
		add	R11,R11,#6
		sub	R12,R12,#6
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		add	R11,R11,#2
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_E3_0_1_n:
@ case 11100011
@ mode : 11100011 => first pix:3
	@ Pos : 3, Pix opaque : 3, Pix transp : 2
		add	R11,R11,#6
		sub	R12,R12,#6
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_E4_0_1_n:
@ case 11100100
@ mode : 11100100 => first pix:3
	@ Pos : 3, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#6
		sub	R12,R12,#6
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_E5_0_1_n:
@ case 11100101
@ mode : 11100101 => first pix:3
	@ Pos : 3, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#6
		sub	R12,R12,#6
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_E6_0_1_n:
@ case 11100110
@ mode : 11100110 => first pix:3
	@ Pos : 3, Pix opaque : 2, Pix transp : 2
		add	R11,R11,#6
		sub	R12,R12,#6
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_E7_0_1_n:
@ case 11100111
@ mode : 11100111 => first pix:3
	@ Pos : 3, Pix opaque : 2, Pix transp : 3
		add	R11,R11,#6
		sub	R12,R12,#6
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
		NEXT_COL16n
@ ----------------------------------------

PPU16_E8_0_1_n:
@ case 11101000
@ mode : 11101000 => first pix:3
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#6
		sub	R12,R12,#6
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_E9_0_1_n:
@ case 11101001
@ mode : 11101001 => first pix:3
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#6
		sub	R12,R12,#6
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_EA_0_1_n:
@ case 11101010
@ mode : 11101010 => first pix:3
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#6
		sub	R12,R12,#6
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_EB_0_1_n:
@ case 11101011
@ mode : 11101011 => first pix:3
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#6
		sub	R12,R12,#6
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
		NEXT_COL16n
@ ----------------------------------------

PPU16_EC_0_1_n:
@ case 11101100
@ mode : 11101100 => first pix:3
	@ Pos : 3, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#6
		sub	R12,R12,#6
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_ED_0_1_n:
@ case 11101101
@ mode : 11101101 => first pix:3
	@ Pos : 3, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#6
		sub	R12,R12,#6
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_EE_0_1_n:
@ case 11101110
@ mode : 11101110 => first pix:3
	@ Pos : 3, Pix opaque : 1, Pix transp : 3
		add	R11,R11,#6
		sub	R12,R12,#6
		ldrh	R0,[R11],#8
		strh	R0,[R12],#-8
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_EF_0_1_n:
@ case 11101111
@ mode : 11101111 => first pix:3
	@ Pos : 3, Pix opaque : 1, Pix transp : 4
		add	R11,R11,#6
		sub	R12,R12,#6
		ldrh	R0,[R11],#10
		strh	R0,[R12],#-10
		NEXT_COL16n
@ ----------------------------------------

PPU16_F0_0_1_n:
@ case 11110000
@ mode : 11110000 => first pix:4
	@ Pos : 4, Pix opaque : 4, Pix transp : 0
		add	R11,R11,#8
		sub	R12,R12,#8
		ldmia	R11!,{R0,R1}
		sub	R12,R12,#2
		@ Swap reg R0,R1
		mov	R3,R0,ror #16
		mov	R0,R1,ror #16
		mov	R1,R3
		stmda	R12!,{R0,R1}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_F1_0_1_n:
@ case 11110001
@ mode : 11110001 => first pix:4
	@ Pos : 4, Pix opaque : 3, Pix transp : 1
		add	R11,R11,#8
		sub	R12,R12,#8
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		strh	R4,[R12,#2]
		sub	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_F2_0_1_n:
@ case 11110010
@ mode : 11110010 => first pix:4
	@ Pos : 4, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#8
		sub	R12,R12,#8
		ldmia	R11!,{R0}
		add	R11,R11,#2
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_F3_0_1_n:
@ case 11110011
@ mode : 11110011 => first pix:4
	@ Pos : 4, Pix opaque : 2, Pix transp : 2
		add	R11,R11,#8
		sub	R12,R12,#8
		ldmia	R11!,{R0}
		add	R11,R11,#4
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_F4_0_1_n:
@ case 11110100
@ mode : 11110100 => first pix:4
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#8
		sub	R12,R12,#8
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_F5_0_1_n:
@ case 11110101
@ mode : 11110101 => first pix:4
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#8
		sub	R12,R12,#8
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_F6_0_1_n:
@ case 11110110
@ mode : 11110110 => first pix:4
	@ Pos : 4, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#8
		sub	R12,R12,#8
		ldrh	R4,[R11],#6
		strh	R4,[R12],#-6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_F7_0_1_n:
@ case 11110111
@ mode : 11110111 => first pix:4
	@ Pos : 4, Pix opaque : 1, Pix transp : 3
		add	R11,R11,#8
		sub	R12,R12,#8
		ldrh	R4,[R11],#8
		strh	R4,[R12],#-8
		NEXT_COL16n
@ ----------------------------------------

PPU16_F8_0_1_n:
@ case 11111000
@ mode : 11111000 => first pix:5
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		add	R11,R11,#10
		sub	R12,R12,#10
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldmia	R11!,{R0}
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_F9_0_1_n:
@ case 11111001
@ mode : 11111001 => first pix:5
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#10
		sub	R12,R12,#10
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_FA_0_1_n:
@ case 11111010
@ mode : 11111010 => first pix:5
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#10
		sub	R12,R12,#10
		ldrh	R0,[R11],#4
		strh	R0,[R12],#-4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_FB_0_1_n:
@ case 11111011
@ mode : 11111011 => first pix:5
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#10
		sub	R12,R12,#10
		ldrh	R0,[R11],#6
		strh	R0,[R12],#-6
		NEXT_COL16n
@ ----------------------------------------

PPU16_FC_0_1_n:
@ case 11111100
@ mode : 11111100 => first pix:6
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		add	R11,R11,#12
		sub	R12,R12,#12
		ldmia	R11!,{R0}
		sub	R12,R12,#2
		@ Swap reg R0
		mov	R0,R0,ror #16
		stmda	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_FD_0_1_n:
@ case 11111101
@ mode : 11111101 => first pix:6
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#12
		sub	R12,R12,#12
		ldrh	R4,[R11],#4
		strh	R4,[R12],#-4
		NEXT_COL16n
@ ----------------------------------------

PPU16_FE_0_1_n:
@ case 11111110
@ mode : 11111110 => first pix:7
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		add	R11,R11,#14
		sub	R12,R12,#14
		ldrh	R0,[R11],#2
		strh	R0,[R12],#-2
		NEXT_COL16n
@ ----------------------------------------

PPU16_FF_0_1_n:
@ case 11111111
		add		R11,R11,#16
		sub		R12,R12,#16
		NEXT_COL16n
@ ----------------------------------------
jumptable_ppu1601n:
		.long		PPU16_00_0_1_n
		.long		PPU16_01_0_1_n
		.long		PPU16_02_0_1_n
		.long		PPU16_03_0_1_n
		.long		PPU16_04_0_1_n
		.long		PPU16_05_0_1_n
		.long		PPU16_06_0_1_n
		.long		PPU16_07_0_1_n
		.long		PPU16_08_0_1_n
		.long		PPU16_09_0_1_n
		.long		PPU16_0A_0_1_n
		.long		PPU16_0B_0_1_n
		.long		PPU16_0C_0_1_n
		.long		PPU16_0D_0_1_n
		.long		PPU16_0E_0_1_n
		.long		PPU16_0F_0_1_n
		.long		PPU16_10_0_1_n
		.long		PPU16_11_0_1_n
		.long		PPU16_12_0_1_n
		.long		PPU16_13_0_1_n
		.long		PPU16_14_0_1_n
		.long		PPU16_15_0_1_n
		.long		PPU16_16_0_1_n
		.long		PPU16_17_0_1_n
		.long		PPU16_18_0_1_n
		.long		PPU16_19_0_1_n
		.long		PPU16_1A_0_1_n
		.long		PPU16_1B_0_1_n
		.long		PPU16_1C_0_1_n
		.long		PPU16_1D_0_1_n
		.long		PPU16_1E_0_1_n
		.long		PPU16_1F_0_1_n
		.long		PPU16_20_0_1_n
		.long		PPU16_21_0_1_n
		.long		PPU16_22_0_1_n
		.long		PPU16_23_0_1_n
		.long		PPU16_24_0_1_n
		.long		PPU16_25_0_1_n
		.long		PPU16_26_0_1_n
		.long		PPU16_27_0_1_n
		.long		PPU16_28_0_1_n
		.long		PPU16_29_0_1_n
		.long		PPU16_2A_0_1_n
		.long		PPU16_2B_0_1_n
		.long		PPU16_2C_0_1_n
		.long		PPU16_2D_0_1_n
		.long		PPU16_2E_0_1_n
		.long		PPU16_2F_0_1_n
		.long		PPU16_30_0_1_n
		.long		PPU16_31_0_1_n
		.long		PPU16_32_0_1_n
		.long		PPU16_33_0_1_n
		.long		PPU16_34_0_1_n
		.long		PPU16_35_0_1_n
		.long		PPU16_36_0_1_n
		.long		PPU16_37_0_1_n
		.long		PPU16_38_0_1_n
		.long		PPU16_39_0_1_n
		.long		PPU16_3A_0_1_n
		.long		PPU16_3B_0_1_n
		.long		PPU16_3C_0_1_n
		.long		PPU16_3D_0_1_n
		.long		PPU16_3E_0_1_n
		.long		PPU16_3F_0_1_n
		.long		PPU16_40_0_1_n
		.long		PPU16_41_0_1_n
		.long		PPU16_42_0_1_n
		.long		PPU16_43_0_1_n
		.long		PPU16_44_0_1_n
		.long		PPU16_45_0_1_n
		.long		PPU16_46_0_1_n
		.long		PPU16_47_0_1_n
		.long		PPU16_48_0_1_n
		.long		PPU16_49_0_1_n
		.long		PPU16_4A_0_1_n
		.long		PPU16_4B_0_1_n
		.long		PPU16_4C_0_1_n
		.long		PPU16_4D_0_1_n
		.long		PPU16_4E_0_1_n
		.long		PPU16_4F_0_1_n
		.long		PPU16_50_0_1_n
		.long		PPU16_51_0_1_n
		.long		PPU16_52_0_1_n
		.long		PPU16_53_0_1_n
		.long		PPU16_54_0_1_n
		.long		PPU16_55_0_1_n
		.long		PPU16_56_0_1_n
		.long		PPU16_57_0_1_n
		.long		PPU16_58_0_1_n
		.long		PPU16_59_0_1_n
		.long		PPU16_5A_0_1_n
		.long		PPU16_5B_0_1_n
		.long		PPU16_5C_0_1_n
		.long		PPU16_5D_0_1_n
		.long		PPU16_5E_0_1_n
		.long		PPU16_5F_0_1_n
		.long		PPU16_60_0_1_n
		.long		PPU16_61_0_1_n
		.long		PPU16_62_0_1_n
		.long		PPU16_63_0_1_n
		.long		PPU16_64_0_1_n
		.long		PPU16_65_0_1_n
		.long		PPU16_66_0_1_n
		.long		PPU16_67_0_1_n
		.long		PPU16_68_0_1_n
		.long		PPU16_69_0_1_n
		.long		PPU16_6A_0_1_n
		.long		PPU16_6B_0_1_n
		.long		PPU16_6C_0_1_n
		.long		PPU16_6D_0_1_n
		.long		PPU16_6E_0_1_n
		.long		PPU16_6F_0_1_n
		.long		PPU16_70_0_1_n
		.long		PPU16_71_0_1_n
		.long		PPU16_72_0_1_n
		.long		PPU16_73_0_1_n
		.long		PPU16_74_0_1_n
		.long		PPU16_75_0_1_n
		.long		PPU16_76_0_1_n
		.long		PPU16_77_0_1_n
		.long		PPU16_78_0_1_n
		.long		PPU16_79_0_1_n
		.long		PPU16_7A_0_1_n
		.long		PPU16_7B_0_1_n
		.long		PPU16_7C_0_1_n
		.long		PPU16_7D_0_1_n
		.long		PPU16_7E_0_1_n
		.long		PPU16_7F_0_1_n
		.long		PPU16_80_0_1_n
		.long		PPU16_81_0_1_n
		.long		PPU16_82_0_1_n
		.long		PPU16_83_0_1_n
		.long		PPU16_84_0_1_n
		.long		PPU16_85_0_1_n
		.long		PPU16_86_0_1_n
		.long		PPU16_87_0_1_n
		.long		PPU16_88_0_1_n
		.long		PPU16_89_0_1_n
		.long		PPU16_8A_0_1_n
		.long		PPU16_8B_0_1_n
		.long		PPU16_8C_0_1_n
		.long		PPU16_8D_0_1_n
		.long		PPU16_8E_0_1_n
		.long		PPU16_8F_0_1_n
		.long		PPU16_90_0_1_n
		.long		PPU16_91_0_1_n
		.long		PPU16_92_0_1_n
		.long		PPU16_93_0_1_n
		.long		PPU16_94_0_1_n
		.long		PPU16_95_0_1_n
		.long		PPU16_96_0_1_n
		.long		PPU16_97_0_1_n
		.long		PPU16_98_0_1_n
		.long		PPU16_99_0_1_n
		.long		PPU16_9A_0_1_n
		.long		PPU16_9B_0_1_n
		.long		PPU16_9C_0_1_n
		.long		PPU16_9D_0_1_n
		.long		PPU16_9E_0_1_n
		.long		PPU16_9F_0_1_n
		.long		PPU16_A0_0_1_n
		.long		PPU16_A1_0_1_n
		.long		PPU16_A2_0_1_n
		.long		PPU16_A3_0_1_n
		.long		PPU16_A4_0_1_n
		.long		PPU16_A5_0_1_n
		.long		PPU16_A6_0_1_n
		.long		PPU16_A7_0_1_n
		.long		PPU16_A8_0_1_n
		.long		PPU16_A9_0_1_n
		.long		PPU16_AA_0_1_n
		.long		PPU16_AB_0_1_n
		.long		PPU16_AC_0_1_n
		.long		PPU16_AD_0_1_n
		.long		PPU16_AE_0_1_n
		.long		PPU16_AF_0_1_n
		.long		PPU16_B0_0_1_n
		.long		PPU16_B1_0_1_n
		.long		PPU16_B2_0_1_n
		.long		PPU16_B3_0_1_n
		.long		PPU16_B4_0_1_n
		.long		PPU16_B5_0_1_n
		.long		PPU16_B6_0_1_n
		.long		PPU16_B7_0_1_n
		.long		PPU16_B8_0_1_n
		.long		PPU16_B9_0_1_n
		.long		PPU16_BA_0_1_n
		.long		PPU16_BB_0_1_n
		.long		PPU16_BC_0_1_n
		.long		PPU16_BD_0_1_n
		.long		PPU16_BE_0_1_n
		.long		PPU16_BF_0_1_n
		.long		PPU16_C0_0_1_n
		.long		PPU16_C1_0_1_n
		.long		PPU16_C2_0_1_n
		.long		PPU16_C3_0_1_n
		.long		PPU16_C4_0_1_n
		.long		PPU16_C5_0_1_n
		.long		PPU16_C6_0_1_n
		.long		PPU16_C7_0_1_n
		.long		PPU16_C8_0_1_n
		.long		PPU16_C9_0_1_n
		.long		PPU16_CA_0_1_n
		.long		PPU16_CB_0_1_n
		.long		PPU16_CC_0_1_n
		.long		PPU16_CD_0_1_n
		.long		PPU16_CE_0_1_n
		.long		PPU16_CF_0_1_n
		.long		PPU16_D0_0_1_n
		.long		PPU16_D1_0_1_n
		.long		PPU16_D2_0_1_n
		.long		PPU16_D3_0_1_n
		.long		PPU16_D4_0_1_n
		.long		PPU16_D5_0_1_n
		.long		PPU16_D6_0_1_n
		.long		PPU16_D7_0_1_n
		.long		PPU16_D8_0_1_n
		.long		PPU16_D9_0_1_n
		.long		PPU16_DA_0_1_n
		.long		PPU16_DB_0_1_n
		.long		PPU16_DC_0_1_n
		.long		PPU16_DD_0_1_n
		.long		PPU16_DE_0_1_n
		.long		PPU16_DF_0_1_n
		.long		PPU16_E0_0_1_n
		.long		PPU16_E1_0_1_n
		.long		PPU16_E2_0_1_n
		.long		PPU16_E3_0_1_n
		.long		PPU16_E4_0_1_n
		.long		PPU16_E5_0_1_n
		.long		PPU16_E6_0_1_n
		.long		PPU16_E7_0_1_n
		.long		PPU16_E8_0_1_n
		.long		PPU16_E9_0_1_n
		.long		PPU16_EA_0_1_n
		.long		PPU16_EB_0_1_n
		.long		PPU16_EC_0_1_n
		.long		PPU16_ED_0_1_n
		.long		PPU16_EE_0_1_n
		.long		PPU16_EF_0_1_n
		.long		PPU16_F0_0_1_n
		.long		PPU16_F1_0_1_n
		.long		PPU16_F2_0_1_n
		.long		PPU16_F3_0_1_n
		.long		PPU16_F4_0_1_n
		.long		PPU16_F5_0_1_n
		.long		PPU16_F6_0_1_n
		.long		PPU16_F7_0_1_n
		.long		PPU16_F8_0_1_n
		.long		PPU16_F9_0_1_n
		.long		PPU16_FA_0_1_n
		.long		PPU16_FB_0_1_n
		.long		PPU16_FC_0_1_n
		.long		PPU16_FD_0_1_n
		.long		PPU16_FE_0_1_n
		.long		PPU16_FF_0_1_n


PPU16_00_1_1_n:
@ case 00000000
@ mode : 00000000 => first pix:0
	@ Pos : 0, Pix opaque : 8, Pix transp : 0
		ldmia	R11!,{R0,R1,R2,R3}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		orr	R1,R1,R2,lsl #16
		mov	R2,R2,lsr #16
		orr	R2,R2,R3,lsl #16
		mov	R3,R3,lsr #16
		stmia	R12!,{R0,R1,R2}
		strh	R3,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_01_1_1_n:
@ case 00000001
@ mode : 00000001 => first pix:0
	@ Pos : 0, Pix opaque : 7, Pix transp : 1
		ldmia	R11!,{R0,R1,R2}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		orr	R1,R1,R2,lsl #16
		mov	R2,R2,lsr #16
		orr	R2,R2,R4,lsl #16
		stmia	R12!,{R0,R1,R2}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_02_1_1_n:
@ case 00000010
@ mode : 00000010 => first pix:0
	@ Pos : 0, Pix opaque : 6, Pix transp : 1
		ldmia	R11!,{R0,R1,R2}
		add	R11,R11,#2
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		orr	R1,R1,R2,lsl #16
		mov	R2,R2,lsr #16
		stmia	R12!,{R0,R1}
		strh	R2,[R12],#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_03_1_1_n:
@ case 00000011
@ mode : 00000011 => first pix:0
	@ Pos : 0, Pix opaque : 6, Pix transp : 2
		ldmia	R11!,{R0,R1,R2}
		add	R11,R11,#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		orr	R1,R1,R2,lsl #16
		mov	R2,R2,lsr #16
		stmia	R12!,{R0,R1}
		strh	R2,[R12],#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_04_1_1_n:
@ case 00000100
@ mode : 00000100 => first pix:0
	@ Pos : 0, Pix opaque : 5, Pix transp : 1
		ldmia	R11!,{R0,R1}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		orr	R1,R1,R4,lsl #16
		stmia	R12!,{R0,R1}
		add	R12,R12,#2
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_05_1_1_n:
@ case 00000101
@ mode : 00000101 => first pix:0
	@ Pos : 0, Pix opaque : 5, Pix transp : 1
		ldmia	R11!,{R0,R1}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		orr	R1,R1,R4,lsl #16
		stmia	R12!,{R0,R1}
		add	R12,R12,#2
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_06_1_1_n:
@ case 00000110
@ mode : 00000110 => first pix:0
	@ Pos : 0, Pix opaque : 5, Pix transp : 2
		ldmia	R11!,{R0,R1}
		ldrh	R4,[R11],#6
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		orr	R1,R1,R4,lsl #16
		stmia	R12!,{R0,R1}
		add	R12,R12,#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_07_1_1_n:
@ case 00000111
@ mode : 00000111 => first pix:0
	@ Pos : 0, Pix opaque : 5, Pix transp : 3
		ldmia	R11!,{R0,R1}
		ldrh	R4,[R11],#8
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		orr	R1,R1,R4,lsl #16
		stmia	R12!,{R0,R1}
		add	R12,R12,#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_08_1_1_n:
@ case 00001000
@ mode : 00001000 => first pix:0
	@ Pos : 0, Pix opaque : 4, Pix transp : 1
		ldmia	R11!,{R0,R1}
		add	R11,R11,#2
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		stmia	R12!,{R0}
		strh	R1,[R12],#4
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_09_1_1_n:
@ case 00001001
@ mode : 00001001 => first pix:0
	@ Pos : 0, Pix opaque : 4, Pix transp : 1
		ldmia	R11!,{R0,R1}
		add	R11,R11,#2
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		stmia	R12!,{R0}
		strh	R1,[R12],#4
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_0A_1_1_n:
@ case 00001010
@ mode : 00001010 => first pix:0
	@ Pos : 0, Pix opaque : 4, Pix transp : 1
		ldmia	R11!,{R0,R1}
		add	R11,R11,#2
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		stmia	R12!,{R0}
		strh	R1,[R12],#4
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_0B_1_1_n:
@ case 00001011
@ mode : 00001011 => first pix:0
	@ Pos : 0, Pix opaque : 4, Pix transp : 1
		ldmia	R11!,{R0,R1}
		add	R11,R11,#2
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		stmia	R12!,{R0}
		strh	R1,[R12],#4
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_0C_1_1_n:
@ case 00001100
@ mode : 00001100 => first pix:0
	@ Pos : 0, Pix opaque : 4, Pix transp : 2
		ldmia	R11!,{R0,R1}
		add	R11,R11,#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		stmia	R12!,{R0}
		strh	R1,[R12],#6
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_0D_1_1_n:
@ case 00001101
@ mode : 00001101 => first pix:0
	@ Pos : 0, Pix opaque : 4, Pix transp : 2
		ldmia	R11!,{R0,R1}
		add	R11,R11,#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		stmia	R12!,{R0}
		strh	R1,[R12],#6
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_0E_1_1_n:
@ case 00001110
@ mode : 00001110 => first pix:0
	@ Pos : 0, Pix opaque : 4, Pix transp : 3
		ldmia	R11!,{R0,R1}
		add	R11,R11,#6
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		stmia	R12!,{R0}
		strh	R1,[R12],#8
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_0F_1_1_n:
@ case 00001111
@ mode : 00001111 => first pix:0
	@ Pos : 0, Pix opaque : 4, Pix transp : 4
		ldmia	R11!,{R0,R1}
		add	R11,R11,#8
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		stmia	R12!,{R0}
		strh	R1,[R12],#10
		NEXT_COL16n
@ ----------------------------------------

PPU16_10_1_1_n:
@ case 00010000
@ mode : 00010000 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 4, Pix opaque : 4, Pix transp : 0
		ldmia	R11!,{R0,R1}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		stmia	R12!,{R0}
		strh	R1,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_11_1_1_n:
@ case 00010001
@ mode : 00010001 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 4, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		stmia	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_12_1_1_n:
@ case 00010010
@ mode : 00010010 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 4, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_13_1_1_n:
@ case 00010011
@ mode : 00010011 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 4, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_14_1_1_n:
@ case 00010100
@ mode : 00010100 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_15_1_1_n:
@ case 00010101
@ mode : 00010101 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_16_1_1_n:
@ case 00010110
@ mode : 00010110 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 4, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_17_1_1_n:
@ case 00010111
@ mode : 00010111 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 4, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
		NEXT_COL16n
@ ----------------------------------------

PPU16_18_1_1_n:
@ case 00011000
@ mode : 00011000 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#6
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		stmia	R12!,{R0}
		add	R12,R12,#4
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_19_1_1_n:
@ case 00011001
@ mode : 00011001 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#6
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		stmia	R12!,{R0}
		add	R12,R12,#4
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_1A_1_1_n:
@ case 00011010
@ mode : 00011010 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#6
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		stmia	R12!,{R0}
		add	R12,R12,#4
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_1B_1_1_n:
@ case 00011011
@ mode : 00011011 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#6
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		stmia	R12!,{R0}
		add	R12,R12,#4
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_1C_1_1_n:
@ case 00011100
@ mode : 00011100 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 3
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#8
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		stmia	R12!,{R0}
		add	R12,R12,#6
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_1D_1_1_n:
@ case 00011101
@ mode : 00011101 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 3
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#8
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		stmia	R12!,{R0}
		add	R12,R12,#6
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_1E_1_1_n:
@ case 00011110
@ mode : 00011110 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 4
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#10
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		stmia	R12!,{R0}
		add	R12,R12,#8
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_1F_1_1_n:
@ case 00011111
@ mode : 00011111 => first pix:0
	@ Pos : 0, Pix opaque : 3, Pix transp : 5
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#12
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		stmia	R12!,{R0}
		add	R12,R12,#10
		NEXT_COL16n
@ ----------------------------------------

PPU16_20_1_1_n:
@ case 00100000
@ mode : 00100000 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#4
	@ Pos : 3, Pix opaque : 5, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0,R1}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		stmia	R12!,{R0}
		strh	R1,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_21_1_1_n:
@ case 00100001
@ mode : 00100001 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#4
	@ Pos : 3, Pix opaque : 4, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		stmia	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_22_1_1_n:
@ case 00100010
@ mode : 00100010 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#4
	@ Pos : 3, Pix opaque : 3, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_23_1_1_n:
@ case 00100011
@ mode : 00100011 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#4
	@ Pos : 3, Pix opaque : 3, Pix transp : 2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_24_1_1_n:
@ case 00100100
@ mode : 00100100 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#4
	@ Pos : 3, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_25_1_1_n:
@ case 00100101
@ mode : 00100101 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#4
	@ Pos : 3, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_26_1_1_n:
@ case 00100110
@ mode : 00100110 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#4
	@ Pos : 3, Pix opaque : 2, Pix transp : 2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_27_1_1_n:
@ case 00100111
@ mode : 00100111 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#4
	@ Pos : 3, Pix opaque : 2, Pix transp : 3
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
		NEXT_COL16n
@ ----------------------------------------

PPU16_28_1_1_n:
@ case 00101000
@ mode : 00101000 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#4
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_29_1_1_n:
@ case 00101001
@ mode : 00101001 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#4
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_2A_1_1_n:
@ case 00101010
@ mode : 00101010 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#4
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_2B_1_1_n:
@ case 00101011
@ mode : 00101011 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#4
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_2C_1_1_n:
@ case 00101100
@ mode : 00101100 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#4
	@ Pos : 3, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_2D_1_1_n:
@ case 00101101
@ mode : 00101101 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#4
	@ Pos : 3, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_2E_1_1_n:
@ case 00101110
@ mode : 00101110 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#4
	@ Pos : 3, Pix opaque : 1, Pix transp : 3
		ldrh	R0,[R11],#8
		strh	R0,[R12],#8
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_2F_1_1_n:
@ case 00101111
@ mode : 00101111 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#4
	@ Pos : 3, Pix opaque : 1, Pix transp : 4
		ldrh	R0,[R11],#10
		strh	R0,[R12],#10
		NEXT_COL16n
@ ----------------------------------------

PPU16_30_1_1_n:
@ case 00110000
@ mode : 00110000 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#6
	@ Pos : 4, Pix opaque : 4, Pix transp : 0
		ldmia	R11!,{R0,R1}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		stmia	R12!,{R0}
		strh	R1,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_31_1_1_n:
@ case 00110001
@ mode : 00110001 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#6
	@ Pos : 4, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		stmia	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_32_1_1_n:
@ case 00110010
@ mode : 00110010 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#6
	@ Pos : 4, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_33_1_1_n:
@ case 00110011
@ mode : 00110011 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#6
	@ Pos : 4, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_34_1_1_n:
@ case 00110100
@ mode : 00110100 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#6
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_35_1_1_n:
@ case 00110101
@ mode : 00110101 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#6
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_36_1_1_n:
@ case 00110110
@ mode : 00110110 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#6
	@ Pos : 4, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_37_1_1_n:
@ case 00110111
@ mode : 00110111 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#6
	@ Pos : 4, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
		NEXT_COL16n
@ ----------------------------------------

PPU16_38_1_1_n:
@ case 00111000
@ mode : 00111000 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 3
		ldmia	R11!,{R0}
		add	R11,R11,#6
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#8
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_39_1_1_n:
@ case 00111001
@ mode : 00111001 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 3
		ldmia	R11!,{R0}
		add	R11,R11,#6
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#8
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_3A_1_1_n:
@ case 00111010
@ mode : 00111010 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 3
		ldmia	R11!,{R0}
		add	R11,R11,#6
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#8
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_3B_1_1_n:
@ case 00111011
@ mode : 00111011 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 3
		ldmia	R11!,{R0}
		add	R11,R11,#6
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#8
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_3C_1_1_n:
@ case 00111100
@ mode : 00111100 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 4
		ldmia	R11!,{R0}
		add	R11,R11,#8
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#10
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_3D_1_1_n:
@ case 00111101
@ mode : 00111101 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 4
		ldmia	R11!,{R0}
		add	R11,R11,#8
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#10
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_3E_1_1_n:
@ case 00111110
@ mode : 00111110 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 5
		ldmia	R11!,{R0}
		add	R11,R11,#10
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#12
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_3F_1_1_n:
@ case 00111111
@ mode : 00111111 => first pix:0
	@ Pos : 0, Pix opaque : 2, Pix transp : 6
		ldmia	R11!,{R0}
		add	R11,R11,#12
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#14
		NEXT_COL16n
@ ----------------------------------------

PPU16_40_1_1_n:
@ case 01000000
@ mode : 01000000 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 6, Pix transp : 0
		ldmia	R11!,{R0,R1,R2}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		orr	R1,R1,R2,lsl #16
		mov	R2,R2,lsr #16
		stmia	R12!,{R0,R1}
		strh	R2,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_41_1_1_n:
@ case 01000001
@ mode : 01000001 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 5, Pix transp : 1
		ldmia	R11!,{R0,R1}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		orr	R1,R1,R4,lsl #16
		stmia	R12!,{R0,R1}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_42_1_1_n:
@ case 01000010
@ mode : 01000010 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 4, Pix transp : 1
		ldmia	R11!,{R0,R1}
		add	R11,R11,#2
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		stmia	R12!,{R0}
		strh	R1,[R12],#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_43_1_1_n:
@ case 01000011
@ mode : 01000011 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 4, Pix transp : 2
		ldmia	R11!,{R0,R1}
		add	R11,R11,#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		stmia	R12!,{R0}
		strh	R1,[R12],#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_44_1_1_n:
@ case 01000100
@ mode : 01000100 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_45_1_1_n:
@ case 01000101
@ mode : 01000101 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_46_1_1_n:
@ case 01000110
@ mode : 01000110 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 3, Pix transp : 2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#6
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		stmia	R12!,{R0}
		add	R12,R12,#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_47_1_1_n:
@ case 01000111
@ mode : 01000111 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 3, Pix transp : 3
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#8
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		stmia	R12!,{R0}
		add	R12,R12,#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_48_1_1_n:
@ case 01001000
@ mode : 01001000 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#4
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_49_1_1_n:
@ case 01001001
@ mode : 01001001 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#4
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_4A_1_1_n:
@ case 01001010
@ mode : 01001010 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#4
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_4B_1_1_n:
@ case 01001011
@ mode : 01001011 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#4
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_4C_1_1_n:
@ case 01001100
@ mode : 01001100 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#6
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_4D_1_1_n:
@ case 01001101
@ mode : 01001101 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#6
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_4E_1_1_n:
@ case 01001110
@ mode : 01001110 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 2, Pix transp : 3
		ldmia	R11!,{R0}
		add	R11,R11,#6
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#8
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_4F_1_1_n:
@ case 01001111
@ mode : 01001111 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 2, Pix transp : 4
		ldmia	R11!,{R0}
		add	R11,R11,#8
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#10
		NEXT_COL16n
@ ----------------------------------------

PPU16_50_1_1_n:
@ case 01010000
@ mode : 01010000 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 4, Pix transp : 0
		ldmia	R11!,{R0,R1}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		stmia	R12!,{R0}
		strh	R1,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_51_1_1_n:
@ case 01010001
@ mode : 01010001 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		stmia	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_52_1_1_n:
@ case 01010010
@ mode : 01010010 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_53_1_1_n:
@ case 01010011
@ mode : 01010011 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_54_1_1_n:
@ case 01010100
@ mode : 01010100 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_55_1_1_n:
@ case 01010101
@ mode : 01010101 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_56_1_1_n:
@ case 01010110
@ mode : 01010110 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_57_1_1_n:
@ case 01010111
@ mode : 01010111 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
		NEXT_COL16n
@ ----------------------------------------

PPU16_58_1_1_n:
@ case 01011000
@ mode : 01011000 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_59_1_1_n:
@ case 01011001
@ mode : 01011001 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_5A_1_1_n:
@ case 01011010
@ mode : 01011010 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_5B_1_1_n:
@ case 01011011
@ mode : 01011011 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_5C_1_1_n:
@ case 01011100
@ mode : 01011100 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_5D_1_1_n:
@ case 01011101
@ mode : 01011101 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_5E_1_1_n:
@ case 01011110
@ mode : 01011110 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 1, Pix transp : 4
		ldrh	R4,[R11],#10
		strh	R4,[R12],#10
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_5F_1_1_n:
@ case 01011111
@ mode : 01011111 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 2, Pix opaque : 1, Pix transp : 5
		ldrh	R4,[R11],#12
		strh	R4,[R12],#12
		NEXT_COL16n
@ ----------------------------------------

PPU16_60_1_1_n:
@ case 01100000
@ mode : 01100000 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 3, Pix opaque : 5, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0,R1}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		stmia	R12!,{R0}
		strh	R1,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_61_1_1_n:
@ case 01100001
@ mode : 01100001 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 3, Pix opaque : 4, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		stmia	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_62_1_1_n:
@ case 01100010
@ mode : 01100010 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 3, Pix opaque : 3, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_63_1_1_n:
@ case 01100011
@ mode : 01100011 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 3, Pix opaque : 3, Pix transp : 2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_64_1_1_n:
@ case 01100100
@ mode : 01100100 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 3, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_65_1_1_n:
@ case 01100101
@ mode : 01100101 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 3, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_66_1_1_n:
@ case 01100110
@ mode : 01100110 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 3, Pix opaque : 2, Pix transp : 2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_67_1_1_n:
@ case 01100111
@ mode : 01100111 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 3, Pix opaque : 2, Pix transp : 3
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
		NEXT_COL16n
@ ----------------------------------------

PPU16_68_1_1_n:
@ case 01101000
@ mode : 01101000 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_69_1_1_n:
@ case 01101001
@ mode : 01101001 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_6A_1_1_n:
@ case 01101010
@ mode : 01101010 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_6B_1_1_n:
@ case 01101011
@ mode : 01101011 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_6C_1_1_n:
@ case 01101100
@ mode : 01101100 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 3, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_6D_1_1_n:
@ case 01101101
@ mode : 01101101 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 3, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_6E_1_1_n:
@ case 01101110
@ mode : 01101110 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 3, Pix opaque : 1, Pix transp : 3
		ldrh	R0,[R11],#8
		strh	R0,[R12],#8
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_6F_1_1_n:
@ case 01101111
@ mode : 01101111 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 3, Pix opaque : 1, Pix transp : 4
		ldrh	R0,[R11],#10
		strh	R0,[R12],#10
		NEXT_COL16n
@ ----------------------------------------

PPU16_70_1_1_n:
@ case 01110000
@ mode : 01110000 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
	@ Pos : 4, Pix opaque : 4, Pix transp : 0
		ldmia	R11!,{R0,R1}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		stmia	R12!,{R0}
		strh	R1,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_71_1_1_n:
@ case 01110001
@ mode : 01110001 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
	@ Pos : 4, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		stmia	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_72_1_1_n:
@ case 01110010
@ mode : 01110010 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
	@ Pos : 4, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_73_1_1_n:
@ case 01110011
@ mode : 01110011 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
	@ Pos : 4, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_74_1_1_n:
@ case 01110100
@ mode : 01110100 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_75_1_1_n:
@ case 01110101
@ mode : 01110101 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_76_1_1_n:
@ case 01110110
@ mode : 01110110 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
	@ Pos : 4, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_77_1_1_n:
@ case 01110111
@ mode : 01110111 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
	@ Pos : 4, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
		NEXT_COL16n
@ ----------------------------------------

PPU16_78_1_1_n:
@ case 01111000
@ mode : 01111000 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 4
		ldrh	R4,[R11],#10
		strh	R4,[R12],#10
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_79_1_1_n:
@ case 01111001
@ mode : 01111001 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 4
		ldrh	R4,[R11],#10
		strh	R4,[R12],#10
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_7A_1_1_n:
@ case 01111010
@ mode : 01111010 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 4
		ldrh	R4,[R11],#10
		strh	R4,[R12],#10
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_7B_1_1_n:
@ case 01111011
@ mode : 01111011 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 4
		ldrh	R4,[R11],#10
		strh	R4,[R12],#10
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_7C_1_1_n:
@ case 01111100
@ mode : 01111100 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 5
		ldrh	R4,[R11],#12
		strh	R4,[R12],#12
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_7D_1_1_n:
@ case 01111101
@ mode : 01111101 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 5
		ldrh	R4,[R11],#12
		strh	R4,[R12],#12
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_7E_1_1_n:
@ case 01111110
@ mode : 01111110 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 6
		ldrh	R4,[R11],#14
		strh	R4,[R12],#14
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_7F_1_1_n:
@ case 01111111
@ mode : 01111111 => first pix:0
	@ Pos : 0, Pix opaque : 1, Pix transp : 7
		ldrh	R4,[R11],#16
		strh	R4,[R12],#16
		NEXT_COL16n
@ ----------------------------------------


PPU16_80_1_1_n:
@ case 10000000
@ mode : 10000000 => first pix:1
	@ Pos : 1, Pix opaque : 7, Pix transp : 0
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0,R1,R2}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		orr	R1,R1,R2,lsl #16
		mov	R2,R2,lsr #16
		stmia	R12!,{R0,R1}
		strh	R2,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_81_1_1_n:
@ case 10000001
@ mode : 10000001 => first pix:1
	@ Pos : 1, Pix opaque : 6, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0,R1}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		orr	R1,R1,R4,lsl #16
		stmia	R12!,{R0,R1}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_82_1_1_n:
@ case 10000010
@ mode : 10000010 => first pix:1
	@ Pos : 1, Pix opaque : 5, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0,R1}
		add	R11,R11,#2
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		stmia	R12!,{R0}
		strh	R1,[R12],#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_83_1_1_n:
@ case 10000011
@ mode : 10000011 => first pix:1
	@ Pos : 1, Pix opaque : 5, Pix transp : 2
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0,R1}
		add	R11,R11,#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		stmia	R12!,{R0}
		strh	R1,[R12],#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_84_1_1_n:
@ case 10000100
@ mode : 10000100 => first pix:1
	@ Pos : 1, Pix opaque : 4, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_85_1_1_n:
@ case 10000101
@ mode : 10000101 => first pix:1
	@ Pos : 1, Pix opaque : 4, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_86_1_1_n:
@ case 10000110
@ mode : 10000110 => first pix:1
	@ Pos : 1, Pix opaque : 4, Pix transp : 2
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#6
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		stmia	R12!,{R0}
		add	R12,R12,#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_87_1_1_n:
@ case 10000111
@ mode : 10000111 => first pix:1
	@ Pos : 1, Pix opaque : 4, Pix transp : 3
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#8
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		stmia	R12!,{R0}
		add	R12,R12,#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_88_1_1_n:
@ case 10001000
@ mode : 10001000 => first pix:1
	@ Pos : 1, Pix opaque : 3, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#4
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_89_1_1_n:
@ case 10001001
@ mode : 10001001 => first pix:1
	@ Pos : 1, Pix opaque : 3, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#4
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_8A_1_1_n:
@ case 10001010
@ mode : 10001010 => first pix:1
	@ Pos : 1, Pix opaque : 3, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#4
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_8B_1_1_n:
@ case 10001011
@ mode : 10001011 => first pix:1
	@ Pos : 1, Pix opaque : 3, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#4
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_8C_1_1_n:
@ case 10001100
@ mode : 10001100 => first pix:1
	@ Pos : 1, Pix opaque : 3, Pix transp : 2
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#6
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_8D_1_1_n:
@ case 10001101
@ mode : 10001101 => first pix:1
	@ Pos : 1, Pix opaque : 3, Pix transp : 2
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#6
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_8E_1_1_n:
@ case 10001110
@ mode : 10001110 => first pix:1
	@ Pos : 1, Pix opaque : 3, Pix transp : 3
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		add	R11,R11,#6
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#8
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_8F_1_1_n:
@ case 10001111
@ mode : 10001111 => first pix:1
	@ Pos : 1, Pix opaque : 3, Pix transp : 4
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		add	R11,R11,#8
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#10
		NEXT_COL16n
@ ----------------------------------------

PPU16_90_1_1_n:
@ case 10010000
@ mode : 10010000 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 4, Pix transp : 0
		ldmia	R11!,{R0,R1}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		stmia	R12!,{R0}
		strh	R1,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_91_1_1_n:
@ case 10010001
@ mode : 10010001 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		stmia	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_92_1_1_n:
@ case 10010010
@ mode : 10010010 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_93_1_1_n:
@ case 10010011
@ mode : 10010011 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_94_1_1_n:
@ case 10010100
@ mode : 10010100 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_95_1_1_n:
@ case 10010101
@ mode : 10010101 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_96_1_1_n:
@ case 10010110
@ mode : 10010110 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_97_1_1_n:
@ case 10010111
@ mode : 10010111 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
		NEXT_COL16n
@ ----------------------------------------

PPU16_98_1_1_n:
@ case 10011000
@ mode : 10011000 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 2
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_99_1_1_n:
@ case 10011001
@ mode : 10011001 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 2
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_9A_1_1_n:
@ case 10011010
@ mode : 10011010 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 2
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_9B_1_1_n:
@ case 10011011
@ mode : 10011011 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 2
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_9C_1_1_n:
@ case 10011100
@ mode : 10011100 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 3
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_9D_1_1_n:
@ case 10011101
@ mode : 10011101 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 3
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_9E_1_1_n:
@ case 10011110
@ mode : 10011110 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 4
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#10
		strh	R4,[R12],#10
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_9F_1_1_n:
@ case 10011111
@ mode : 10011111 => first pix:1
	@ Pos : 1, Pix opaque : 2, Pix transp : 5
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#12
		strh	R4,[R12],#12
		NEXT_COL16n
@ ----------------------------------------

PPU16_A0_1_1_n:
@ case 10100000
@ mode : 10100000 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 3, Pix opaque : 5, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0,R1}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		stmia	R12!,{R0}
		strh	R1,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_A1_1_1_n:
@ case 10100001
@ mode : 10100001 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 3, Pix opaque : 4, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		stmia	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_A2_1_1_n:
@ case 10100010
@ mode : 10100010 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 3, Pix opaque : 3, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_A3_1_1_n:
@ case 10100011
@ mode : 10100011 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 3, Pix opaque : 3, Pix transp : 2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_A4_1_1_n:
@ case 10100100
@ mode : 10100100 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 3, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_A5_1_1_n:
@ case 10100101
@ mode : 10100101 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 3, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_A6_1_1_n:
@ case 10100110
@ mode : 10100110 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 3, Pix opaque : 2, Pix transp : 2
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_A7_1_1_n:
@ case 10100111
@ mode : 10100111 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 3, Pix opaque : 2, Pix transp : 3
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
		NEXT_COL16n
@ ----------------------------------------

PPU16_A8_1_1_n:
@ case 10101000
@ mode : 10101000 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_A9_1_1_n:
@ case 10101001
@ mode : 10101001 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_AA_1_1_n:
@ case 10101010
@ mode : 10101010 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_AB_1_1_n:
@ case 10101011
@ mode : 10101011 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_AC_1_1_n:
@ case 10101100
@ mode : 10101100 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 3, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_AD_1_1_n:
@ case 10101101
@ mode : 10101101 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 3, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_AE_1_1_n:
@ case 10101110
@ mode : 10101110 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 3, Pix opaque : 1, Pix transp : 3
		ldrh	R0,[R11],#8
		strh	R0,[R12],#8
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_AF_1_1_n:
@ case 10101111
@ mode : 10101111 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 3, Pix opaque : 1, Pix transp : 4
		ldrh	R0,[R11],#10
		strh	R0,[R12],#10
		NEXT_COL16n
@ ----------------------------------------

PPU16_B0_1_1_n:
@ case 10110000
@ mode : 10110000 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
	@ Pos : 4, Pix opaque : 4, Pix transp : 0
		ldmia	R11!,{R0,R1}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		stmia	R12!,{R0}
		strh	R1,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_B1_1_1_n:
@ case 10110001
@ mode : 10110001 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
	@ Pos : 4, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		stmia	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_B2_1_1_n:
@ case 10110010
@ mode : 10110010 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
	@ Pos : 4, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_B3_1_1_n:
@ case 10110011
@ mode : 10110011 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
	@ Pos : 4, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_B4_1_1_n:
@ case 10110100
@ mode : 10110100 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_B5_1_1_n:
@ case 10110101
@ mode : 10110101 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_B6_1_1_n:
@ case 10110110
@ mode : 10110110 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
	@ Pos : 4, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_B7_1_1_n:
@ case 10110111
@ mode : 10110111 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
	@ Pos : 4, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
		NEXT_COL16n
@ ----------------------------------------

PPU16_B8_1_1_n:
@ case 10111000
@ mode : 10111000 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 3
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#8
		strh	R0,[R12],#8
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_B9_1_1_n:
@ case 10111001
@ mode : 10111001 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 3
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#8
		strh	R0,[R12],#8
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_BA_1_1_n:
@ case 10111010
@ mode : 10111010 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 3
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#8
		strh	R0,[R12],#8
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_BB_1_1_n:
@ case 10111011
@ mode : 10111011 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 3
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#8
		strh	R0,[R12],#8
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_BC_1_1_n:
@ case 10111100
@ mode : 10111100 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 4
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#10
		strh	R0,[R12],#10
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_BD_1_1_n:
@ case 10111101
@ mode : 10111101 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 4
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#10
		strh	R0,[R12],#10
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_BE_1_1_n:
@ case 10111110
@ mode : 10111110 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 5
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#12
		strh	R0,[R12],#12
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_BF_1_1_n:
@ case 10111111
@ mode : 10111111 => first pix:1
	@ Pos : 1, Pix opaque : 1, Pix transp : 6
		add	R11,R11,#2
		add	R12,R12,#2
		ldrh	R0,[R11],#14
		strh	R0,[R12],#14
		NEXT_COL16n
@ ----------------------------------------

PPU16_C0_1_1_n:
@ case 11000000
@ mode : 11000000 => first pix:2
	@ Pos : 2, Pix opaque : 6, Pix transp : 0
		add	R11,R11,#4
		add	R12,R12,#4
		ldmia	R11!,{R0,R1,R2}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		orr	R1,R1,R2,lsl #16
		mov	R2,R2,lsr #16
		stmia	R12!,{R0,R1}
		strh	R2,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_C1_1_1_n:
@ case 11000001
@ mode : 11000001 => first pix:2
	@ Pos : 2, Pix opaque : 5, Pix transp : 1
		add	R11,R11,#4
		add	R12,R12,#4
		ldmia	R11!,{R0,R1}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		orr	R1,R1,R4,lsl #16
		stmia	R12!,{R0,R1}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_C2_1_1_n:
@ case 11000010
@ mode : 11000010 => first pix:2
	@ Pos : 2, Pix opaque : 4, Pix transp : 1
		add	R11,R11,#4
		add	R12,R12,#4
		ldmia	R11!,{R0,R1}
		add	R11,R11,#2
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		stmia	R12!,{R0}
		strh	R1,[R12],#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_C3_1_1_n:
@ case 11000011
@ mode : 11000011 => first pix:2
	@ Pos : 2, Pix opaque : 4, Pix transp : 2
		add	R11,R11,#4
		add	R12,R12,#4
		ldmia	R11!,{R0,R1}
		add	R11,R11,#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		stmia	R12!,{R0}
		strh	R1,[R12],#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_C4_1_1_n:
@ case 11000100
@ mode : 11000100 => first pix:2
	@ Pos : 2, Pix opaque : 3, Pix transp : 1
		add	R11,R11,#4
		add	R12,R12,#4
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_C5_1_1_n:
@ case 11000101
@ mode : 11000101 => first pix:2
	@ Pos : 2, Pix opaque : 3, Pix transp : 1
		add	R11,R11,#4
		add	R12,R12,#4
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		stmia	R12!,{R0}
		add	R12,R12,#2
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_C6_1_1_n:
@ case 11000110
@ mode : 11000110 => first pix:2
	@ Pos : 2, Pix opaque : 3, Pix transp : 2
		add	R11,R11,#4
		add	R12,R12,#4
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#6
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		stmia	R12!,{R0}
		add	R12,R12,#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_C7_1_1_n:
@ case 11000111
@ mode : 11000111 => first pix:2
	@ Pos : 2, Pix opaque : 3, Pix transp : 3
		add	R11,R11,#4
		add	R12,R12,#4
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#8
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		stmia	R12!,{R0}
		add	R12,R12,#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_C8_1_1_n:
@ case 11001000
@ mode : 11001000 => first pix:2
	@ Pos : 2, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#4
		add	R12,R12,#4
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#4
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_C9_1_1_n:
@ case 11001001
@ mode : 11001001 => first pix:2
	@ Pos : 2, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#4
		add	R12,R12,#4
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#4
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_CA_1_1_n:
@ case 11001010
@ mode : 11001010 => first pix:2
	@ Pos : 2, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#4
		add	R12,R12,#4
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#4
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_CB_1_1_n:
@ case 11001011
@ mode : 11001011 => first pix:2
	@ Pos : 2, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#4
		add	R12,R12,#4
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#4
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_CC_1_1_n:
@ case 11001100
@ mode : 11001100 => first pix:2
	@ Pos : 2, Pix opaque : 2, Pix transp : 2
		add	R11,R11,#4
		add	R12,R12,#4
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#6
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_CD_1_1_n:
@ case 11001101
@ mode : 11001101 => first pix:2
	@ Pos : 2, Pix opaque : 2, Pix transp : 2
		add	R11,R11,#4
		add	R12,R12,#4
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#6
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_CE_1_1_n:
@ case 11001110
@ mode : 11001110 => first pix:2
	@ Pos : 2, Pix opaque : 2, Pix transp : 3
		add	R11,R11,#4
		add	R12,R12,#4
		ldmia	R11!,{R0}
		add	R11,R11,#6
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#8
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_CF_1_1_n:
@ case 11001111
@ mode : 11001111 => first pix:2
	@ Pos : 2, Pix opaque : 2, Pix transp : 4
		add	R11,R11,#4
		add	R12,R12,#4
		ldmia	R11!,{R0}
		add	R11,R11,#8
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#10
		NEXT_COL16n
@ ----------------------------------------

PPU16_D0_1_1_n:
@ case 11010000
@ mode : 11010000 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#4
		add	R12,R12,#4
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 4, Pix transp : 0
		ldmia	R11!,{R0,R1}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		stmia	R12!,{R0}
		strh	R1,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_D1_1_1_n:
@ case 11010001
@ mode : 11010001 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#4
		add	R12,R12,#4
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 3, Pix transp : 1
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		stmia	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_D2_1_1_n:
@ case 11010010
@ mode : 11010010 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#4
		add	R12,R12,#4
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 2, Pix transp : 1
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_D3_1_1_n:
@ case 11010011
@ mode : 11010011 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#4
		add	R12,R12,#4
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 2, Pix transp : 2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_D4_1_1_n:
@ case 11010100
@ mode : 11010100 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#4
		add	R12,R12,#4
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_D5_1_1_n:
@ case 11010101
@ mode : 11010101 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#4
		add	R12,R12,#4
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_D6_1_1_n:
@ case 11010110
@ mode : 11010110 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#4
		add	R12,R12,#4
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 1, Pix transp : 2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_D7_1_1_n:
@ case 11010111
@ mode : 11010111 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#4
		add	R12,R12,#4
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 4, Pix opaque : 1, Pix transp : 3
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
		NEXT_COL16n
@ ----------------------------------------

PPU16_D8_1_1_n:
@ case 11011000
@ mode : 11011000 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#4
		add	R12,R12,#4
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_D9_1_1_n:
@ case 11011001
@ mode : 11011001 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#4
		add	R12,R12,#4
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_DA_1_1_n:
@ case 11011010
@ mode : 11011010 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#4
		add	R12,R12,#4
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_DB_1_1_n:
@ case 11011011
@ mode : 11011011 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#4
		add	R12,R12,#4
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_DC_1_1_n:
@ case 11011100
@ mode : 11011100 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 3
		add	R11,R11,#4
		add	R12,R12,#4
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_DD_1_1_n:
@ case 11011101
@ mode : 11011101 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 3
		add	R11,R11,#4
		add	R12,R12,#4
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_DE_1_1_n:
@ case 11011110
@ mode : 11011110 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 4
		add	R11,R11,#4
		add	R12,R12,#4
		ldrh	R4,[R11],#10
		strh	R4,[R12],#10
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_DF_1_1_n:
@ case 11011111
@ mode : 11011111 => first pix:2
	@ Pos : 2, Pix opaque : 1, Pix transp : 5
		add	R11,R11,#4
		add	R12,R12,#4
		ldrh	R4,[R11],#12
		strh	R4,[R12],#12
		NEXT_COL16n
@ ----------------------------------------

PPU16_E0_1_1_n:
@ case 11100000
@ mode : 11100000 => first pix:3
	@ Pos : 3, Pix opaque : 5, Pix transp : 0
		add	R11,R11,#6
		add	R12,R12,#6
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0,R1}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		stmia	R12!,{R0}
		strh	R1,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_E1_1_1_n:
@ case 11100001
@ mode : 11100001 => first pix:3
	@ Pos : 3, Pix opaque : 4, Pix transp : 1
		add	R11,R11,#6
		add	R12,R12,#6
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		stmia	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_E2_1_1_n:
@ case 11100010
@ mode : 11100010 => first pix:3
	@ Pos : 3, Pix opaque : 3, Pix transp : 1
		add	R11,R11,#6
		add	R12,R12,#6
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_E3_1_1_n:
@ case 11100011
@ mode : 11100011 => first pix:3
	@ Pos : 3, Pix opaque : 3, Pix transp : 2
		add	R11,R11,#6
		add	R12,R12,#6
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_E4_1_1_n:
@ case 11100100
@ mode : 11100100 => first pix:3
	@ Pos : 3, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#6
		add	R12,R12,#6
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_E5_1_1_n:
@ case 11100101
@ mode : 11100101 => first pix:3
	@ Pos : 3, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#6
		add	R12,R12,#6
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_E6_1_1_n:
@ case 11100110
@ mode : 11100110 => first pix:3
	@ Pos : 3, Pix opaque : 2, Pix transp : 2
		add	R11,R11,#6
		add	R12,R12,#6
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_E7_1_1_n:
@ case 11100111
@ mode : 11100111 => first pix:3
	@ Pos : 3, Pix opaque : 2, Pix transp : 3
		add	R11,R11,#6
		add	R12,R12,#6
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
		NEXT_COL16n
@ ----------------------------------------

PPU16_E8_1_1_n:
@ case 11101000
@ mode : 11101000 => first pix:3
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#6
		add	R12,R12,#6
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_E9_1_1_n:
@ case 11101001
@ mode : 11101001 => first pix:3
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#6
		add	R12,R12,#6
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_EA_1_1_n:
@ case 11101010
@ mode : 11101010 => first pix:3
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#6
		add	R12,R12,#6
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_EB_1_1_n:
@ case 11101011
@ mode : 11101011 => first pix:3
	@ Pos : 3, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#6
		add	R12,R12,#6
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_EC_1_1_n:
@ case 11101100
@ mode : 11101100 => first pix:3
	@ Pos : 3, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#6
		add	R12,R12,#6
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_ED_1_1_n:
@ case 11101101
@ mode : 11101101 => first pix:3
	@ Pos : 3, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#6
		add	R12,R12,#6
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_EE_1_1_n:
@ case 11101110
@ mode : 11101110 => first pix:3
	@ Pos : 3, Pix opaque : 1, Pix transp : 3
		add	R11,R11,#6
		add	R12,R12,#6
		ldrh	R0,[R11],#8
		strh	R0,[R12],#8
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_EF_1_1_n:
@ case 11101111
@ mode : 11101111 => first pix:3
	@ Pos : 3, Pix opaque : 1, Pix transp : 4
		add	R11,R11,#6
		add	R12,R12,#6
		ldrh	R0,[R11],#10
		strh	R0,[R12],#10
		NEXT_COL16n
@ ----------------------------------------

PPU16_F0_1_1_n:
@ case 11110000
@ mode : 11110000 => first pix:4
	@ Pos : 4, Pix opaque : 4, Pix transp : 0
		add	R11,R11,#8
		add	R12,R12,#8
		ldmia	R11!,{R0,R1}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R1,lsl #16
		mov	R1,R1,lsr #16
		stmia	R12!,{R0}
		strh	R1,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_F1_1_1_n:
@ case 11110001
@ mode : 11110001 => first pix:4
	@ Pos : 4, Pix opaque : 3, Pix transp : 1
		add	R11,R11,#8
		add	R12,R12,#8
		ldmia	R11!,{R0}
		ldrh	R4,[R11],#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		orr	R0,R0,R4,lsl #16
		stmia	R12!,{R0}
		add	R12,R12,#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_F2_1_1_n:
@ case 11110010
@ mode : 11110010 => first pix:4
	@ Pos : 4, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#8
		add	R12,R12,#8
		ldmia	R11!,{R0}
		add	R11,R11,#2
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_F3_1_1_n:
@ case 11110011
@ mode : 11110011 => first pix:4
	@ Pos : 4, Pix opaque : 2, Pix transp : 2
		add	R11,R11,#8
		add	R12,R12,#8
		ldmia	R11!,{R0}
		add	R11,R11,#4
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_F4_1_1_n:
@ case 11110100
@ mode : 11110100 => first pix:4
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#8
		add	R12,R12,#8
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		ldmia	R11!,{R0}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_F5_1_1_n:
@ case 11110101
@ mode : 11110101 => first pix:4
	@ Pos : 4, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#8
		add	R12,R12,#8
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_F6_1_1_n:
@ case 11110110
@ mode : 11110110 => first pix:4
	@ Pos : 4, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#8
		add	R12,R12,#8
		ldrh	R4,[R11],#6
		strh	R4,[R12],#6
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_F7_1_1_n:
@ case 11110111
@ mode : 11110111 => first pix:4
	@ Pos : 4, Pix opaque : 1, Pix transp : 3
		add	R11,R11,#8
		add	R12,R12,#8
		ldrh	R4,[R11],#8
		strh	R4,[R12],#8
		NEXT_COL16n
@ ----------------------------------------

PPU16_F8_1_1_n:
@ case 11111000
@ mode : 11111000 => first pix:5
	@ Pos : 5, Pix opaque : 3, Pix transp : 0
		add	R11,R11,#10
		add	R12,R12,#10
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldmia	R11!,{R0}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_F9_1_1_n:
@ case 11111001
@ mode : 11111001 => first pix:5
	@ Pos : 5, Pix opaque : 2, Pix transp : 1
		add	R11,R11,#10
		add	R12,R12,#10
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_FA_1_1_n:
@ case 11111010
@ mode : 11111010 => first pix:5
	@ Pos : 5, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#10
		add	R12,R12,#10
		ldrh	R0,[R11],#4
		strh	R0,[R12],#4
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_FB_1_1_n:
@ case 11111011
@ mode : 11111011 => first pix:5
	@ Pos : 5, Pix opaque : 1, Pix transp : 2
		add	R11,R11,#10
		add	R12,R12,#10
		ldrh	R0,[R11],#6
		strh	R0,[R12],#6
		NEXT_COL16n
@ ----------------------------------------

PPU16_FC_1_1_n:
@ case 11111100
@ mode : 11111100 => first pix:6
	@ Pos : 6, Pix opaque : 2, Pix transp : 0
		add	R11,R11,#12
		add	R12,R12,#12
		ldmia	R11!,{R0}
		strh	R0,[R12],#2
		mov	R0,R0,lsr #16
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_FD_1_1_n:
@ case 11111101
@ mode : 11111101 => first pix:6
	@ Pos : 6, Pix opaque : 1, Pix transp : 1
		add	R11,R11,#12
		add	R12,R12,#12
		ldrh	R4,[R11],#4
		strh	R4,[R12],#4
		NEXT_COL16n
@ ----------------------------------------

PPU16_FE_1_1_n:
@ case 11111110
@ mode : 11111110 => first pix:7
	@ Pos : 7, Pix opaque : 1, Pix transp : 0
		add	R11,R11,#14
		add	R12,R12,#14
		ldrh	R0,[R11],#2
		strh	R0,[R12],#2
		NEXT_COL16n
@ ----------------------------------------

PPU16_FF_1_1_n:
@ case 11111111
		add		R11,R11,#16
		add		R12,R12,#16
		NEXT_COL16n
@ ----------------------------------------
jumptable_ppu1611n:
		.long		PPU16_00_1_1_n
		.long		PPU16_01_1_1_n
		.long		PPU16_02_1_1_n
		.long		PPU16_03_1_1_n
		.long		PPU16_04_1_1_n
		.long		PPU16_05_1_1_n
		.long		PPU16_06_1_1_n
		.long		PPU16_07_1_1_n
		.long		PPU16_08_1_1_n
		.long		PPU16_09_1_1_n
		.long		PPU16_0A_1_1_n
		.long		PPU16_0B_1_1_n
		.long		PPU16_0C_1_1_n
		.long		PPU16_0D_1_1_n
		.long		PPU16_0E_1_1_n
		.long		PPU16_0F_1_1_n
		.long		PPU16_10_1_1_n
		.long		PPU16_11_1_1_n
		.long		PPU16_12_1_1_n
		.long		PPU16_13_1_1_n
		.long		PPU16_14_1_1_n
		.long		PPU16_15_1_1_n
		.long		PPU16_16_1_1_n
		.long		PPU16_17_1_1_n
		.long		PPU16_18_1_1_n
		.long		PPU16_19_1_1_n
		.long		PPU16_1A_1_1_n
		.long		PPU16_1B_1_1_n
		.long		PPU16_1C_1_1_n
		.long		PPU16_1D_1_1_n
		.long		PPU16_1E_1_1_n
		.long		PPU16_1F_1_1_n
		.long		PPU16_20_1_1_n
		.long		PPU16_21_1_1_n
		.long		PPU16_22_1_1_n
		.long		PPU16_23_1_1_n
		.long		PPU16_24_1_1_n
		.long		PPU16_25_1_1_n
		.long		PPU16_26_1_1_n
		.long		PPU16_27_1_1_n
		.long		PPU16_28_1_1_n
		.long		PPU16_29_1_1_n
		.long		PPU16_2A_1_1_n
		.long		PPU16_2B_1_1_n
		.long		PPU16_2C_1_1_n
		.long		PPU16_2D_1_1_n
		.long		PPU16_2E_1_1_n
		.long		PPU16_2F_1_1_n
		.long		PPU16_30_1_1_n
		.long		PPU16_31_1_1_n
		.long		PPU16_32_1_1_n
		.long		PPU16_33_1_1_n
		.long		PPU16_34_1_1_n
		.long		PPU16_35_1_1_n
		.long		PPU16_36_1_1_n
		.long		PPU16_37_1_1_n
		.long		PPU16_38_1_1_n
		.long		PPU16_39_1_1_n
		.long		PPU16_3A_1_1_n
		.long		PPU16_3B_1_1_n
		.long		PPU16_3C_1_1_n
		.long		PPU16_3D_1_1_n
		.long		PPU16_3E_1_1_n
		.long		PPU16_3F_1_1_n
		.long		PPU16_40_1_1_n
		.long		PPU16_41_1_1_n
		.long		PPU16_42_1_1_n
		.long		PPU16_43_1_1_n
		.long		PPU16_44_1_1_n
		.long		PPU16_45_1_1_n
		.long		PPU16_46_1_1_n
		.long		PPU16_47_1_1_n
		.long		PPU16_48_1_1_n
		.long		PPU16_49_1_1_n
		.long		PPU16_4A_1_1_n
		.long		PPU16_4B_1_1_n
		.long		PPU16_4C_1_1_n
		.long		PPU16_4D_1_1_n
		.long		PPU16_4E_1_1_n
		.long		PPU16_4F_1_1_n
		.long		PPU16_50_1_1_n
		.long		PPU16_51_1_1_n
		.long		PPU16_52_1_1_n
		.long		PPU16_53_1_1_n
		.long		PPU16_54_1_1_n
		.long		PPU16_55_1_1_n
		.long		PPU16_56_1_1_n
		.long		PPU16_57_1_1_n
		.long		PPU16_58_1_1_n
		.long		PPU16_59_1_1_n
		.long		PPU16_5A_1_1_n
		.long		PPU16_5B_1_1_n
		.long		PPU16_5C_1_1_n
		.long		PPU16_5D_1_1_n
		.long		PPU16_5E_1_1_n
		.long		PPU16_5F_1_1_n
		.long		PPU16_60_1_1_n
		.long		PPU16_61_1_1_n
		.long		PPU16_62_1_1_n
		.long		PPU16_63_1_1_n
		.long		PPU16_64_1_1_n
		.long		PPU16_65_1_1_n
		.long		PPU16_66_1_1_n
		.long		PPU16_67_1_1_n
		.long		PPU16_68_1_1_n
		.long		PPU16_69_1_1_n
		.long		PPU16_6A_1_1_n
		.long		PPU16_6B_1_1_n
		.long		PPU16_6C_1_1_n
		.long		PPU16_6D_1_1_n
		.long		PPU16_6E_1_1_n
		.long		PPU16_6F_1_1_n
		.long		PPU16_70_1_1_n
		.long		PPU16_71_1_1_n
		.long		PPU16_72_1_1_n
		.long		PPU16_73_1_1_n
		.long		PPU16_74_1_1_n
		.long		PPU16_75_1_1_n
		.long		PPU16_76_1_1_n
		.long		PPU16_77_1_1_n
		.long		PPU16_78_1_1_n
		.long		PPU16_79_1_1_n
		.long		PPU16_7A_1_1_n
		.long		PPU16_7B_1_1_n
		.long		PPU16_7C_1_1_n
		.long		PPU16_7D_1_1_n
		.long		PPU16_7E_1_1_n
		.long		PPU16_7F_1_1_n
		.long		PPU16_80_1_1_n
		.long		PPU16_81_1_1_n
		.long		PPU16_82_1_1_n
		.long		PPU16_83_1_1_n
		.long		PPU16_84_1_1_n
		.long		PPU16_85_1_1_n
		.long		PPU16_86_1_1_n
		.long		PPU16_87_1_1_n
		.long		PPU16_88_1_1_n
		.long		PPU16_89_1_1_n
		.long		PPU16_8A_1_1_n
		.long		PPU16_8B_1_1_n
		.long		PPU16_8C_1_1_n
		.long		PPU16_8D_1_1_n
		.long		PPU16_8E_1_1_n
		.long		PPU16_8F_1_1_n
		.long		PPU16_90_1_1_n
		.long		PPU16_91_1_1_n
		.long		PPU16_92_1_1_n
		.long		PPU16_93_1_1_n
		.long		PPU16_94_1_1_n
		.long		PPU16_95_1_1_n
		.long		PPU16_96_1_1_n
		.long		PPU16_97_1_1_n
		.long		PPU16_98_1_1_n
		.long		PPU16_99_1_1_n
		.long		PPU16_9A_1_1_n
		.long		PPU16_9B_1_1_n
		.long		PPU16_9C_1_1_n
		.long		PPU16_9D_1_1_n
		.long		PPU16_9E_1_1_n
		.long		PPU16_9F_1_1_n
		.long		PPU16_A0_1_1_n
		.long		PPU16_A1_1_1_n
		.long		PPU16_A2_1_1_n
		.long		PPU16_A3_1_1_n
		.long		PPU16_A4_1_1_n
		.long		PPU16_A5_1_1_n
		.long		PPU16_A6_1_1_n
		.long		PPU16_A7_1_1_n
		.long		PPU16_A8_1_1_n
		.long		PPU16_A9_1_1_n
		.long		PPU16_AA_1_1_n
		.long		PPU16_AB_1_1_n
		.long		PPU16_AC_1_1_n
		.long		PPU16_AD_1_1_n
		.long		PPU16_AE_1_1_n
		.long		PPU16_AF_1_1_n
		.long		PPU16_B0_1_1_n
		.long		PPU16_B1_1_1_n
		.long		PPU16_B2_1_1_n
		.long		PPU16_B3_1_1_n
		.long		PPU16_B4_1_1_n
		.long		PPU16_B5_1_1_n
		.long		PPU16_B6_1_1_n
		.long		PPU16_B7_1_1_n
		.long		PPU16_B8_1_1_n
		.long		PPU16_B9_1_1_n
		.long		PPU16_BA_1_1_n
		.long		PPU16_BB_1_1_n
		.long		PPU16_BC_1_1_n
		.long		PPU16_BD_1_1_n
		.long		PPU16_BE_1_1_n
		.long		PPU16_BF_1_1_n
		.long		PPU16_C0_1_1_n
		.long		PPU16_C1_1_1_n
		.long		PPU16_C2_1_1_n
		.long		PPU16_C3_1_1_n
		.long		PPU16_C4_1_1_n
		.long		PPU16_C5_1_1_n
		.long		PPU16_C6_1_1_n
		.long		PPU16_C7_1_1_n
		.long		PPU16_C8_1_1_n
		.long		PPU16_C9_1_1_n
		.long		PPU16_CA_1_1_n
		.long		PPU16_CB_1_1_n
		.long		PPU16_CC_1_1_n
		.long		PPU16_CD_1_1_n
		.long		PPU16_CE_1_1_n
		.long		PPU16_CF_1_1_n
		.long		PPU16_D0_1_1_n
		.long		PPU16_D1_1_1_n
		.long		PPU16_D2_1_1_n
		.long		PPU16_D3_1_1_n
		.long		PPU16_D4_1_1_n
		.long		PPU16_D5_1_1_n
		.long		PPU16_D6_1_1_n
		.long		PPU16_D7_1_1_n
		.long		PPU16_D8_1_1_n
		.long		PPU16_D9_1_1_n
		.long		PPU16_DA_1_1_n
		.long		PPU16_DB_1_1_n
		.long		PPU16_DC_1_1_n
		.long		PPU16_DD_1_1_n
		.long		PPU16_DE_1_1_n
		.long		PPU16_DF_1_1_n
		.long		PPU16_E0_1_1_n
		.long		PPU16_E1_1_1_n
		.long		PPU16_E2_1_1_n
		.long		PPU16_E3_1_1_n
		.long		PPU16_E4_1_1_n
		.long		PPU16_E5_1_1_n
		.long		PPU16_E6_1_1_n
		.long		PPU16_E7_1_1_n
		.long		PPU16_E8_1_1_n
		.long		PPU16_E9_1_1_n
		.long		PPU16_EA_1_1_n
		.long		PPU16_EB_1_1_n
		.long		PPU16_EC_1_1_n
		.long		PPU16_ED_1_1_n
		.long		PPU16_EE_1_1_n
		.long		PPU16_EF_1_1_n
		.long		PPU16_F0_1_1_n
		.long		PPU16_F1_1_1_n
		.long		PPU16_F2_1_1_n
		.long		PPU16_F3_1_1_n
		.long		PPU16_F4_1_1_n
		.long		PPU16_F5_1_1_n
		.long		PPU16_F6_1_1_n
		.long		PPU16_F7_1_1_n
		.long		PPU16_F8_1_1_n
		.long		PPU16_F9_1_1_n
		.long		PPU16_FA_1_1_n
		.long		PPU16_FB_1_1_n
		.long		PPU16_FC_1_1_n
		.long		PPU16_FD_1_1_n
		.long		PPU16_FE_1_1_n
		.long		PPU16_FF_1_1_n

