	.arch armv5t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 18, 2
	.code	16
	.file	"ppu.cpp"
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.text
.Ltext0:
	.align	2
	.code	16
	.thumb_func
	.type	_ZL13REGISTER_4212v, %function
_ZL13REGISTER_4212v:
	.fnstart
.LFB6:
	.file 1 "Z:/AntSnes/snes9x_asm_optimized/ppu.h"
	.loc 1 269 0
	.save	{r7, lr}
	push	{r7, lr}
.LCFI0:
	add	r7, sp, #0
.LCFI1:
	.loc 1 270 0
	ldr	r3, .L7
	mov	r2, #0
	strb	r2, [r3]
	.loc 1 271 0
	ldr	r3, .L7+4
	ldr	r2, [r3, #52]
	ldr	r1, .L7+8
	ldr	r3, .L7+12
	ldrh	r3, [r1, r3]
	add	r3, r3, #1
	cmp	r2, r3
	blt	.L2
	ldr	r3, .L7+4
	ldr	r2, [r3, #52]
	ldr	r1, .L7+8
	ldr	r3, .L7+12
	ldrh	r3, [r1, r3]
	add	r3, r3, #4
	cmp	r2, r3
	bge	.L2
	.loc 1 273 0
	ldr	r3, .L7
	mov	r2, #1
	strb	r2, [r3]
.L2:
	.loc 1 275 0
	ldr	r3, .L7+4
	ldr	r2, [r3, #28]
	ldr	r3, .L7+16
	ldr	r3, [r3, #8]
	cmp	r2, r3
	blt	.L3
	mov	r3, #64
	b	.L4
.L3:
	mov	r3, #0
.L4:
	ldr	r2, .L7
	ldrb	r2, [r2]
	mov	r1, r2
	add	r2, r3, #0
	add	r3, r1, #0
	orr	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	lsl	r3, r3, #24
	lsr	r2, r3, #24
	ldr	r3, .L7
	strb	r2, [r3]
	.loc 1 276 0
	ldr	r3, .L7+4
	ldr	r2, [r3, #52]
	ldr	r1, .L7+8
	ldr	r3, .L7+12
	ldrh	r3, [r1, r3]
	add	r3, r3, #1
	cmp	r2, r3
	blt	.L5
	.loc 1 277 0
	ldr	r3, .L7
	ldrb	r2, [r3]
	mov	r3, #128
	neg	r3, r3
	orr	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r2, r3, #24
	ldr	r3, .L7
	strb	r2, [r3]
.L5:
	.loc 1 279 0
	ldr	r3, .L7
	ldrb	r3, [r3]
	.loc 1 280 0
	mov	r0, r3
	mov	sp, r7
	@ sp needed for prologue
	pop	{r7, pc}
.L8:
	.align	2
.L7:
	.word	GetBank
	.word	CPU
	.word	PPU
	.word	2154
	.word	Settings
.LFE6:
	.cantunwind
	.fnend
	.size	_ZL13REGISTER_4212v, .-_ZL13REGISTER_4212v
	.align	2
	.code	16
	.thumb_func
	.type	_ZL12FLUSH_REDRAWv, %function
_ZL12FLUSH_REDRAWv:
	.fnstart
.LFB7:
	.loc 1 283 0
	.save	{r7, lr}
	push	{r7, lr}
.LCFI2:
	.setfp r7, sp, #0
	add	r7, sp, #0
.LCFI3:
	.loc 1 284 0
	ldr	r2, .L12
	ldr	r3, .L12+4
	ldr	r2, [r2, r3]
	ldr	r1, .L12
	ldr	r3, .L12+8
	ldr	r3, [r1, r3]
	cmp	r2, r3
	beq	.L11
	.loc 1 285 0
	bl	S9xUpdateScreen
.L11:
	.loc 1 286 0
	mov	sp, r7
	@ sp needed for prologue
	pop	{r7, pc}
.L13:
	.align	2
.L12:
	.word	IPPU
	.word	3652
	.word	3656
.LFE7:
	.fnend
	.size	_ZL12FLUSH_REDRAWv, .-_ZL12FLUSH_REDRAWv
	.align	2
	.code	16
	.thumb_func
	.type	_ZL13REGISTER_2104h, %function
_ZL13REGISTER_2104h:
	.fnstart
.LFB8:
	.loc 1 289 0
	.save	{r7, lr}
	push	{r7, lr}
.LCFI4:
	.pad #16
	sub	sp, sp, #16
.LCFI5:
	.setfp r7, sp, #0
	add	r7, sp, #0
.LCFI6:
	mov	r2, r0
	add	r3, r7, #7
	strb	r2, [r3]
.LBB2:
	.loc 1 290 0
	ldr	r2, .L26
	ldr	r3, .L26+4
	ldrh	r2, [r2, r3]
	ldr	r3, .L26+8
	cmp	r2, r3
	bls	.LCB142
	b	.L25	@long jump
.LCB142:
.L15:
	.loc 1 293 0
	ldr	r2, .L26
	ldr	r3, .L26+4
	ldrh	r3, [r2, r3]
	lsl	r2, r3, #1
	ldr	r1, .L26
	ldr	r3, .L26+12
	ldrb	r3, [r1, r3]
	mov	r1, r3
	mov	r3, #1
	and	r3, r3, r1
	add	r3, r2, r3
	str	r3, [r7, #8]
	.loc 1 295 0
	ldr	r1, [r7, #8]
	ldr	r2, .L26
	ldr	r3, .L26+16
	add	r2, r1, r2
	add	r3, r2, r3
	ldrb	r3, [r3, #2]
	add	r2, r7, #7
	ldrb	r2, [r2]
	cmp	r2, r3
	bne	.LCB165
	b	.L17	@long jump
.LCB165:
	.loc 1 297 0
	bl	_ZL12FLUSH_REDRAWv
	.loc 1 298 0
	ldr	r1, [r7, #8]
	ldr	r2, .L26
	ldr	r3, .L26+16
	add	r2, r1, r2
	add	r3, r2, r3
	add	r2, r7, #7
	ldrb	r2, [r2]
	strb	r2, [r3, #2]
	.loc 1 299 0
	ldr	r3, .L26+20
	mov	r2, #1
	strb	r2, [r3, #5]
	.loc 1 300 0
	ldr	r2, [r7, #8]
	mov	r3, #128
	lsl	r3, r3, #2
	and	r3, r3, r2
	cmp	r3, #0
	bne	.LCB183
	b	.L18	@long jump
.LCB183:
.LBB3:
	.loc 1 303 0
	ldr	r2, [r7, #8]
	mov	r3, #31
	and	r3, r3, r2
	lsl	r2, r3, #2
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #2
	mov	r1, #144
	lsl	r1, r1, #2
	add	r2, r3, r1
	ldr	r3, .L26
	add	r3, r2, r3
	add	r3, r3, #2
	str	r3, [r7, #12]
	.loc 1 305 0
	ldr	r3, [r7, #12]
	ldrh	r3, [r3]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	mov	r2, #255
	and	r3, r3, r2
	add	r2, r7, #7
	ldrb	r1, [r2]
	mov	r2, #1
	and	r1, r1, r2
	ldr	r2, .L26+24
	lsl	r1, r1, #1
	ldrh	r2, [r1, r2]
	mov	r1, r2
	add	r2, r3, #0
	add	r3, r1, #0
	orr	r3, r3, r2
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [r7, #12]
	strh	r2, [r3]
	.loc 1 306 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	mov	r2, #2
	and	r3, r3, r2
	ldr	r2, [r7, #12]
	strb	r3, [r2, #10]
	ldr	r3, [r7, #12]
	add	r3, r3, #12
	str	r3, [r7, #12]
	.loc 1 307 0
	ldr	r3, [r7, #12]
	ldrh	r3, [r3]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	mov	r2, #255
	and	r3, r3, r2
	add	r2, r7, #7
	ldrb	r2, [r2]
	asr	r1, r2, #2
	mov	r2, #1
	and	r1, r1, r2
	ldr	r2, .L26+24
	lsl	r1, r1, #1
	ldrh	r2, [r1, r2]
	mov	r1, r2
	add	r2, r3, #0
	add	r3, r1, #0
	orr	r3, r3, r2
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [r7, #12]
	strh	r2, [r3]
	.loc 1 308 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	mov	r2, #8
	and	r3, r3, r2
	ldr	r2, [r7, #12]
	strb	r3, [r2, #10]
	ldr	r3, [r7, #12]
	add	r3, r3, #12
	str	r3, [r7, #12]
	.loc 1 309 0
	ldr	r3, [r7, #12]
	ldrh	r3, [r3]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	mov	r2, #255
	and	r3, r3, r2
	add	r2, r7, #7
	ldrb	r2, [r2]
	asr	r1, r2, #4
	mov	r2, #1
	and	r1, r1, r2
	ldr	r2, .L26+24
	lsl	r1, r1, #1
	ldrh	r2, [r1, r2]
	mov	r1, r2
	add	r2, r3, #0
	add	r3, r1, #0
	orr	r3, r3, r2
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [r7, #12]
	strh	r2, [r3]
	.loc 1 310 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	mov	r2, #32
	and	r3, r3, r2
	ldr	r2, [r7, #12]
	strb	r3, [r2, #10]
	ldr	r3, [r7, #12]
	add	r3, r3, #12
	str	r3, [r7, #12]
	.loc 1 311 0
	ldr	r3, [r7, #12]
	ldrh	r3, [r3]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	mov	r2, #255
	and	r3, r3, r2
	add	r2, r7, #7
	ldrb	r2, [r2]
	asr	r1, r2, #6
	mov	r2, #1
	and	r1, r1, r2
	ldr	r2, .L26+24
	lsl	r1, r1, #1
	ldrh	r2, [r1, r2]
	mov	r1, r2
	add	r2, r3, #0
	add	r3, r1, #0
	orr	r3, r3, r2
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [r7, #12]
	strh	r2, [r3]
	.loc 1 312 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	mov	r2, #128
	and	r3, r3, r2
	ldr	r2, [r7, #12]
	strb	r3, [r2, #10]
	b	.L17
.L18:
.LBE3:
	.loc 1 316 0
	ldr	r2, [r7, #8]
	mov	r3, #1
	and	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	bne	.LCB331
	b	.L19	@long jump
.LCB331:
	.loc 1 318 0
	ldr	r2, [r7, #8]
	mov	r3, #2
	and	r3, r3, r2
	cmp	r3, #0
	bne	.LCB336
	b	.L20	@long jump
.LCB336:
	.loc 1 320 0
	ldr	r2, .L26
	ldr	r3, .L26+4
	ldrh	r3, [r2, r3]
	asr	r3, r3, #1
	str	r3, [r7, #8]
	.loc 1 322 0
	ldr	r0, [r7, #8]
	ldr	r1, [r7, #8]
	ldr	r2, .L26
	mov	ip, r2
	mov	r2, #144
	lsl	r2, r2, #2
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #2
	add	r3, r3, ip
	add	r3, r3, r2
	ldrh	r3, [r3, #6]
	mov	r2, r3
	mov	r3, #255
	and	r2, r2, r3
	ldr	r3, .L26
	mov	ip, r3
	mov	r1, #144
	lsl	r1, r1, #2
	mov	r3, r0
	lsl	r3, r3, #1
	add	r3, r3, r0
	lsl	r3, r3, #2
	add	r3, r3, ip
	add	r3, r3, r1
	strh	r2, [r3, #6]
	.loc 1 323 0
	ldr	r1, [r7, #8]
	ldr	r0, [r7, #8]
	ldr	r2, .L26
	mov	ip, r2
	mov	r2, #144
	lsl	r2, r2, #2
	mov	r3, r0
	lsl	r3, r3, #1
	add	r3, r3, r0
	lsl	r3, r3, #2
	add	r3, r3, ip
	add	r3, r3, r2
	ldrh	r3, [r3, #6]
	mov	r2, r3
	add	r3, r7, #7
	ldrb	r0, [r3]
	mov	r3, #1
	and	r3, r3, r0
	lsl	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	orr	r3, r3, r2
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	lsr	r0, r3, #16
	ldr	r3, .L26
	mov	ip, r3
	mov	r2, #144
	lsl	r2, r2, #2
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #2
	add	r3, r3, ip
	add	r3, r3, r2
	add	r2, r0, #0
	strh	r2, [r3, #6]
	.loc 1 324 0
	ldr	r0, [r7, #8]
	add	r3, r7, #7
	ldrb	r3, [r3]
	asr	r3, r3, #1
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	mov	r2, r3
	mov	r3, #7
	and	r2, r2, r3
	ldr	r1, .L26
	mov	ip, r1
	mov	r1, #146
	lsl	r1, r1, #2
	mov	r3, r0
	lsl	r3, r3, #1
	add	r3, r3, r0
	lsl	r3, r3, #2
	add	r3, r3, ip
	add	r3, r3, r1
	strb	r2, [r3, #3]
	.loc 1 325 0
	ldr	r0, [r7, #8]
	add	r3, r7, #7
	ldrb	r3, [r3]
	asr	r3, r3, #4
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	mov	r2, r3
	mov	r3, #3
	and	r2, r2, r3
	ldr	r3, .L26
	mov	ip, r3
	mov	r1, #146
	lsl	r1, r1, #2
	mov	r3, r0
	lsl	r3, r3, #1
	add	r3, r3, r0
	lsl	r3, r3, #2
	add	r3, r3, ip
	add	r3, r3, r1
	strb	r2, [r3, #2]
	.loc 1 326 0
	ldr	r0, [r7, #8]
	add	r3, r7, #7
	ldrb	r3, [r3]
	asr	r3, r3, #6
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	mov	r2, r3
	mov	r3, #1
	and	r2, r2, r3
	ldr	r1, .L26
	mov	ip, r1
	mov	r1, #144
	lsl	r1, r1, #2
	mov	r3, r0
	lsl	r3, r3, #1
	add	r3, r3, r0
	lsl	r3, r3, #2
	add	r3, r3, ip
	add	r3, r3, r1
	strb	r2, [r3, #9]
	.loc 1 327 0
	ldr	r1, [r7, #8]
	add	r3, r7, #7
	ldrb	r3, [r3]
	lsr	r3, r3, #7
	lsl	r3, r3, #24
	lsr	r0, r3, #24
	ldr	r2, .L26
	mov	ip, r2
	mov	r2, #144
	lsl	r2, r2, #2
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #2
	add	r3, r3, ip
	add	r3, r3, r2
	add	r2, r0, #0
	strb	r2, [r3, #8]
	.loc 1 332 0
	b	.L17
.L20:
	ldr	r2, .L26
	ldr	r3, .L26+4
	ldrh	r3, [r2, r3]
	asr	r1, r3, #1
	add	r3, r7, #7
	ldrb	r0, [r3]
	ldr	r3, .L26
	mov	ip, r3
	mov	r2, #144
	lsl	r2, r2, #2
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #2
	add	r3, r3, ip
	add	r3, r3, r2
	add	r2, r0, #0
	strh	r2, [r3, #4]
	b	.L17
.L19:
	.loc 1 337 0
	ldr	r2, [r7, #8]
	mov	r3, #2
	and	r3, r3, r2
	cmp	r3, #0
	beq	.L22
	.loc 1 341 0
	ldr	r2, .L26
	ldr	r3, .L26+4
	ldrh	r3, [r2, r3]
	asr	r3, r3, #1
	str	r3, [r7, #8]
	ldr	r3, [r7, #8]
	mov	r0, r3
	mov	r1, r3
	ldr	r2, .L26
	mov	ip, r2
	mov	r2, #144
	lsl	r2, r2, #2
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #2
	add	r3, r3, ip
	add	r3, r3, r2
	ldrh	r3, [r3, #6]
	mov	r2, r3
	mov	r3, #128
	lsl	r3, r3, #1
	and	r2, r2, r3
	ldr	r3, .L26
	mov	ip, r3
	mov	r1, #144
	lsl	r1, r1, #2
	mov	r3, r0
	lsl	r3, r3, #1
	add	r3, r3, r0
	lsl	r3, r3, #2
	add	r3, r3, ip
	add	r3, r3, r1
	strh	r2, [r3, #6]
	.loc 1 342 0
	ldr	r1, [r7, #8]
	ldr	r0, [r7, #8]
	ldr	r2, .L26
	mov	ip, r2
	mov	r2, #144
	lsl	r2, r2, #2
	mov	r3, r0
	lsl	r3, r3, #1
	add	r3, r3, r0
	lsl	r3, r3, #2
	add	r3, r3, ip
	add	r3, r3, r2
	ldrh	r2, [r3, #6]
	add	r3, r7, #7
	ldrb	r3, [r3]
	orr	r3, r3, r2
	lsl	r3, r3, #16
	lsr	r0, r3, #16
	ldr	r3, .L26
	mov	ip, r3
	mov	r2, #144
	lsl	r2, r2, #2
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #2
	add	r3, r3, ip
	add	r3, r3, r2
	add	r2, r0, #0
	strh	r2, [r3, #6]
	b	.L17
.L27:
	.align	2
.L26:
	.word	PPU
	.word	2116
	.word	271
	.word	2118
	.word	2168
	.word	IPPU
	.word	SignExtend
.L22:
	.loc 1 347 0
	ldr	r2, .L28
	ldr	r3, .L28+4
	ldrh	r3, [r2, r3]
	asr	r3, r3, #1
	str	r3, [r7, #8]
	ldr	r3, [r7, #8]
	mov	r0, r3
	mov	r1, r3
	ldr	r2, .L28
	mov	ip, r2
	mov	r2, #144
	lsl	r2, r2, #2
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #2
	add	r3, r3, ip
	add	r3, r3, r2
	ldrh	r3, [r3, #2]
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	mov	r3, #255
	lsl	r3, r3, #8
	and	r2, r2, r3
	ldr	r3, .L28
	mov	ip, r3
	mov	r1, #144
	lsl	r1, r1, #2
	mov	r3, r0
	lsl	r3, r3, #1
	add	r3, r3, r0
	lsl	r3, r3, #2
	add	r3, r3, ip
	add	r3, r3, r1
	strh	r2, [r3, #2]
	.loc 1 348 0
	ldr	r1, [r7, #8]
	ldr	r0, [r7, #8]
	ldr	r2, .L28
	mov	ip, r2
	mov	r2, #144
	lsl	r2, r2, #2
	mov	r3, r0
	lsl	r3, r3, #1
	add	r3, r3, r0
	lsl	r3, r3, #2
	add	r3, r3, ip
	add	r3, r3, r2
	ldrh	r2, [r3, #2]
	add	r3, r7, #7
	ldrb	r3, [r3]
	orr	r3, r3, r2
	lsl	r3, r3, #16
	lsr	r0, r3, #16
	ldr	r3, .L28
	mov	ip, r3
	mov	r2, #144
	lsl	r2, r2, #2
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #2
	add	r3, r3, ip
	add	r3, r3, r2
	add	r2, r0, #0
	strh	r2, [r3, #2]
.L17:
	.loc 1 353 0
	ldr	r2, .L28
	ldr	r3, .L28+8
	ldrb	r2, [r2, r3]
	mov	r3, #1
	eor	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r1, r3, #24
	ldr	r2, .L28
	ldr	r3, .L28+8
	strb	r1, [r2, r3]
	.loc 1 354 0
	ldr	r2, .L28
	ldr	r3, .L28+8
	ldrb	r3, [r2, r3]
	mov	r2, r3
	mov	r3, #1
	and	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r2, r3, #24
	mov	r3, #1
	eor	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	beq	.L23
	.loc 1 355 0
	ldr	r2, .L28
	ldr	r3, .L28+4
	ldrh	r3, [r2, r3]
	add	r3, r3, #1
	lsl	r3, r3, #16
	lsr	r1, r3, #16
	ldr	r2, .L28
	ldr	r3, .L28+4
	strh	r1, [r2, r3]
.L23:
	.loc 1 357 0
	ldr	r3, .L28+12
	ldr	r3, [r3, #20]
	ldr	r1, .L28+16
	add	r3, r3, r1
	add	r2, r7, #7
	ldrb	r2, [r2]
	strb	r2, [r3]
	b	.L24
.L25:
	.loc 1 291 0
	mov	r8, r8
.L24:
.LBE2:
	.loc 1 358 0
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed for prologue
	pop	{r7, pc}
.L29:
	.align	2
.L28:
	.word	PPU
	.word	2116
	.word	2118
	.word	Memory
	.word	8452
.LFE8:
	.fnend
	.size	_ZL13REGISTER_2104h, .-_ZL13REGISTER_2104h
	.align	2
	.code	16
	.thumb_func
	.type	_ZL13REGISTER_2118h, %function
_ZL13REGISTER_2118h:
	.fnstart
.LFB9:
	.loc 1 361 0
	.save	{r7, lr}
	push	{r7, lr}
.LCFI7:
	sub	sp, sp, #16
.LCFI8:
	add	r7, sp, #0
.LCFI9:
	mov	r2, r0
	add	r3, r7, #7
	strb	r2, [r3]
.LBB4:
	.loc 1 363 0
	ldr	r3, .L35
	ldrh	r3, [r3, #10]
	cmp	r3, #0
	beq	.L31
.LBB5:
	.loc 1 365 0
	ldr	r3, .L35
	ldrh	r2, [r3, #6]
	ldr	r3, .L35
	ldrh	r3, [r3, #8]
	and	r3, r3, r2
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	str	r3, [r7, #12]
	.loc 1 368 0
	ldr	r3, .L35
	ldrh	r3, [r3, #6]
	mov	r2, r3
	ldr	r3, .L35
	ldrh	r3, [r3, #8]
	mvn	r3, r3
	and	r3, r3, r2
	mov	r2, r3
	ldr	r3, .L35
	ldrh	r3, [r3, #12]
	ldr	r1, [r7, #12]
	mov	r0, r1
	lsr	r0, r0, r3
	mov	r3, r0
	add	r2, r2, r3
	ldr	r3, .L35
	ldrh	r3, [r3, #10]
	sub	r3, r3, #1
	mov	r1, r3
	ldr	r3, [r7, #12]
	and	r3, r3, r1
	lsl	r3, r3, #3
	add	r3, r2, r3
	lsl	r3, r3, #1
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	str	r3, [r7, #8]
	.loc 1 369 0
	ldr	r3, .L35+4
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #8]
	add	r3, r2, r3
	add	r2, r7, #7
	ldrb	r2, [r2]
	strb	r2, [r3]
	b	.L32
.L31:
.LBE5:
	.loc 1 373 0
	ldr	r3, .L35+4
	ldr	r2, [r3, #8]
	ldr	r3, .L35
	ldrh	r3, [r3, #6]
	lsl	r3, r3, #1
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	str	r3, [r7, #8]
	ldr	r3, [r7, #8]
	add	r3, r2, r3
	add	r2, r7, #7
	ldrb	r2, [r2]
	strb	r2, [r3]
.L32:
	.loc 1 375 0
	ldr	r3, .L35+8
	ldr	r2, [r3, #40]
	ldr	r3, [r7, #8]
	lsr	r3, r3, #4
	add	r3, r2, r3
	mov	r2, #0
	strb	r2, [r3]
	.loc 1 376 0
	ldr	r3, .L35+8
	ldr	r2, [r3, #44]
	ldr	r3, [r7, #8]
	lsr	r3, r3, #5
	add	r3, r2, r3
	mov	r2, #0
	strb	r2, [r3]
	.loc 1 377 0
	ldr	r3, .L35+8
	ldr	r2, [r3, #48]
	ldr	r3, [r7, #8]
	lsr	r3, r3, #6
	add	r3, r2, r3
	mov	r2, #0
	strb	r2, [r3]
	.loc 1 378 0
	ldr	r3, .L35
	ldrb	r3, [r3, #4]
	cmp	r3, #0
	bne	.L34
	.loc 1 388 0
	ldr	r3, .L35
	ldrh	r2, [r3, #6]
	ldr	r3, .L35
	ldrb	r3, [r3, #5]
	add	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, .L35
	strh	r2, [r3, #6]
.L34:
.LBE4:
	.loc 1 391 0
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed for prologue
	pop	{r7, pc}
.L36:
	.align	2
.L35:
	.word	PPU
	.word	Memory
	.word	IPPU
.LFE9:
	.cantunwind
	.fnend
	.size	_ZL13REGISTER_2118h, .-_ZL13REGISTER_2118h
	.align	2
	.code	16
	.thumb_func
	.type	_ZL13REGISTER_2119h, %function
_ZL13REGISTER_2119h:
	.fnstart
.LFB12:
	.loc 1 422 0
	.save	{r7, lr}
	push	{r7, lr}
.LCFI10:
	sub	sp, sp, #16
.LCFI11:
	add	r7, sp, #0
.LCFI12:
	mov	r2, r0
	add	r3, r7, #7
	strb	r2, [r3]
.LBB6:
	.loc 1 424 0
	ldr	r3, .L42
	ldrh	r3, [r3, #10]
	cmp	r3, #0
	beq	.L38
.LBB7:
	.loc 1 426 0
	ldr	r3, .L42
	ldrh	r2, [r3, #6]
	ldr	r3, .L42
	ldrh	r3, [r3, #8]
	and	r3, r3, r2
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	str	r3, [r7, #12]
	.loc 1 429 0
	ldr	r3, .L42
	ldrh	r3, [r3, #6]
	mov	r2, r3
	ldr	r3, .L42
	ldrh	r3, [r3, #8]
	mvn	r3, r3
	and	r3, r3, r2
	mov	r2, r3
	ldr	r3, .L42
	ldrh	r3, [r3, #12]
	ldr	r1, [r7, #12]
	mov	r0, r1
	lsr	r0, r0, r3
	mov	r3, r0
	add	r2, r2, r3
	ldr	r3, .L42
	ldrh	r3, [r3, #10]
	sub	r3, r3, #1
	mov	r1, r3
	ldr	r3, [r7, #12]
	and	r3, r3, r1
	lsl	r3, r3, #3
	add	r3, r2, r3
	lsl	r3, r3, #1
	add	r3, r3, #1
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	str	r3, [r7, #8]
	.loc 1 430 0
	ldr	r3, .L42+4
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #8]
	add	r3, r2, r3
	add	r2, r7, #7
	ldrb	r2, [r2]
	strb	r2, [r3]
	b	.L39
.L38:
.LBE7:
	.loc 1 434 0
	ldr	r3, .L42+4
	ldr	r2, [r3, #8]
	ldr	r3, .L42
	ldrh	r3, [r3, #6]
	lsl	r3, r3, #1
	add	r3, r3, #1
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	str	r3, [r7, #8]
	ldr	r3, [r7, #8]
	add	r3, r2, r3
	add	r2, r7, #7
	ldrb	r2, [r2]
	strb	r2, [r3]
.L39:
	.loc 1 436 0
	ldr	r3, .L42+8
	ldr	r2, [r3, #40]
	ldr	r3, [r7, #8]
	lsr	r3, r3, #4
	add	r3, r2, r3
	mov	r2, #0
	strb	r2, [r3]
	.loc 1 437 0
	ldr	r3, .L42+8
	ldr	r2, [r3, #44]
	ldr	r3, [r7, #8]
	lsr	r3, r3, #5
	add	r3, r2, r3
	mov	r2, #0
	strb	r2, [r3]
	.loc 1 438 0
	ldr	r3, .L42+8
	ldr	r2, [r3, #48]
	ldr	r3, [r7, #8]
	lsr	r3, r3, #6
	add	r3, r2, r3
	mov	r2, #0
	strb	r2, [r3]
	.loc 1 439 0
	ldr	r3, .L42
	ldrb	r3, [r3, #4]
	cmp	r3, #0
	beq	.L41
	.loc 1 449 0
	ldr	r3, .L42
	ldrh	r2, [r3, #6]
	ldr	r3, .L42
	ldrb	r3, [r3, #5]
	add	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, .L42
	strh	r2, [r3, #6]
.L41:
.LBE6:
	.loc 1 452 0
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed for prologue
	pop	{r7, pc}
.L43:
	.align	2
.L42:
	.word	PPU
	.word	Memory
	.word	IPPU
.LFE12:
	.cantunwind
	.fnend
	.size	_ZL13REGISTER_2119h, .-_ZL13REGISTER_2119h
	.align	2
	.code	16
	.thumb_func
	.type	_ZL13REGISTER_2122h, %function
_ZL13REGISTER_2122h:
	.fnstart
.LFB15:
	.loc 1 482 0
	.save	{r4, r7, lr}
	push	{r4, r7, lr}
.LCFI13:
	.pad #12
	sub	sp, sp, #12
.LCFI14:
	.setfp r7, sp, #0
	add	r7, sp, #0
.LCFI15:
	mov	r2, r0
	add	r3, r7, #7
	strb	r2, [r3]
	.loc 1 485 0
	ldr	r2, .L51
	mov	r3, #62
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	bne	.LCB1008
	b	.L45	@long jump
.LCB1008:
	.loc 1 487 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #127
	and	r2, r2, r3
	ldr	r1, .L51
	ldr	r3, .L51+4
	ldrb	r3, [r1, r3]
	mov	r1, r3
	ldr	r3, .L51
	add	r1, r1, #32
	lsl	r1, r1, #1
	ldrh	r3, [r1, r3]
	asr	r3, r3, #8
	cmp	r2, r3
	bne	.LCB1023
	b	.L46	@long jump
.LCB1023:
	.loc 1 489 0
	ldr	r2, .L51+8
	mov	r3, #114
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	beq	.L47
	ldr	r2, .L51+8
	mov	r3, #140
	lsl	r3, r3, #1
	ldr	r2, [r2, r3]
	mov	r3, #8
	and	r3, r3, r2
	cmp	r3, #0
	bne	.L47
	.loc 1 490 0
	bl	_ZL12FLUSH_REDRAWv
.L47:
	.loc 1 492 0
	ldr	r2, .L51
	ldr	r3, .L51+4
	ldrb	r3, [r2, r3]
	mov	r1, r3
	ldr	r2, .L51
	ldr	r3, .L51+4
	ldrb	r3, [r2, r3]
	mov	r2, r3
	ldr	r3, .L51
	add	r2, r2, #32
	lsl	r2, r2, #1
	ldrh	r3, [r2, r3]
	mov	r2, #255
	and	r3, r3, r2
	ldr	r2, .L51
	add	r1, r1, #32
	lsl	r1, r1, #1
	strh	r3, [r1, r2]
	.loc 1 493 0
	ldr	r2, .L51
	ldr	r3, .L51+4
	ldrb	r3, [r2, r3]
	mov	r2, r3
	ldr	r1, .L51
	ldr	r3, .L51+4
	ldrb	r3, [r1, r3]
	mov	r1, r3
	ldr	r3, .L51
	add	r1, r1, #32
	lsl	r1, r1, #1
	ldrh	r3, [r1, r3]
	mov	r1, r3
	add	r3, r7, #7
	ldrb	r0, [r3]
	mov	r3, #127
	and	r3, r3, r0
	lsl	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	orr	r3, r3, r1
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	lsr	r1, r3, #16
	ldr	r3, .L51
	add	r2, r2, #32
	lsl	r2, r2, #1
	strh	r1, [r2, r3]
	.loc 1 494 0
	ldr	r3, .L51+12
	mov	r2, #1
	strb	r2, [r3]
	.loc 1 495 0
	ldr	r2, .L51+8
	mov	r3, #114
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	beq	.L46
	.loc 1 497 0
	ldr	r2, .L51
	ldr	r3, .L51+4
	ldrb	r3, [r2, r3]
	mov	r2, r3
	ldr	r1, .L51+12
	mov	r3, #196
	lsl	r3, r3, #4
	ldr	r1, [r1, r3]
	add	r3, r7, #7
	ldrb	r3, [r3]
	asr	r3, r3, #2
	mov	r0, r3
	mov	r3, #31
	and	r3, r3, r0
	add	r3, r1, r3
	ldrb	r3, [r3]
	mov	r1, r3
	ldr	r3, .L51+12
	mov	r0, #132
	lsl	r0, r0, #2
	add	r2, r2, r0
	lsl	r2, r2, #2
	str	r1, [r2, r3]
	.loc 1 498 0
	ldr	r2, .L51
	ldr	r3, .L51+4
	ldrb	r3, [r2, r3]
	mov	r2, r3
	ldr	r1, .L51+12
	mov	r3, #196
	lsl	r3, r3, #4
	ldr	r1, [r1, r3]
	ldr	r0, .L51
	ldr	r3, .L51+4
	ldrb	r3, [r0, r3]
	mov	r0, r3
	ldr	r3, .L51
	add	r0, r0, #32
	lsl	r0, r0, #1
	ldrh	r3, [r0, r3]
	asr	r3, r3, #5
	mov	r0, r3
	mov	r3, #31
	and	r3, r3, r0
	add	r3, r1, r3
	ldrb	r3, [r3]
	mov	r1, r3
	ldr	r3, .L51+12
	add	r2, r2, #17
	add	r2, r2, #255
	lsl	r2, r2, #2
	str	r1, [r2, r3]
	.loc 1 499 0
	ldr	r2, .L51
	ldr	r3, .L51+4
	ldrb	r3, [r2, r3]
	mov	r1, r3
	ldr	r2, .L51
	ldr	r3, .L51+4
	ldrb	r3, [r2, r3]
	mov	r2, r3
	ldr	r3, .L51+12
	add	r2, r2, #16
	lsl	r2, r2, #2
	ldr	r3, [r2, r3]
	lsl	r3, r3, #11
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r0, .L51
	ldr	r3, .L51+4
	ldrb	r3, [r0, r3]
	mov	r0, r3
	ldr	r3, .L51+12
	add	r0, r0, #17
	add	r0, r0, #255
	lsl	r0, r0, #2
	ldr	r3, [r0, r3]
	lsl	r3, r3, #6
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	orr	r3, r3, r2
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r0, .L51
	ldr	r3, .L51+4
	ldrb	r3, [r0, r3]
	mov	r0, r3
	ldr	r3, .L51+12
	mov	r4, #132
	lsl	r4, r4, #2
	add	r0, r0, r4
	lsl	r0, r0, #2
	ldr	r3, [r0, r3]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	orr	r3, r3, r2
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, .L51+12
	mov	r0, #196
	lsl	r0, r0, #3
	add	r1, r1, r0
	lsl	r1, r1, #1
	add	r3, r1, r3
	strh	r2, [r3, #4]
.L46:
	.loc 1 504 0
	ldr	r2, .L51
	ldr	r3, .L51+4
	ldrb	r3, [r2, r3]
	add	r3, r3, #1
	lsl	r3, r3, #24
	lsr	r1, r3, #24
	ldr	r2, .L51
	ldr	r3, .L51+4
	strb	r1, [r2, r3]
	b	.L48
.L45:
	.loc 1 508 0
	ldr	r2, .L51
	ldr	r3, .L51+4
	ldrb	r3, [r2, r3]
	mov	r2, r3
	ldr	r3, .L51
	add	r2, r2, #32
	lsl	r2, r2, #1
	ldrh	r3, [r2, r3]
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	add	r2, r7, #7
	ldrb	r2, [r2]
	cmp	r2, r3
	bne	.LCB1228
	b	.L48	@long jump
.LCB1228:
	.loc 1 510 0
	ldr	r2, .L51+8
	mov	r3, #114
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	beq	.L49
	ldr	r2, .L51+8
	mov	r3, #140
	lsl	r3, r3, #1
	ldr	r2, [r2, r3]
	mov	r3, #8
	and	r3, r3, r2
	cmp	r3, #0
	bne	.L49
	.loc 1 511 0
	bl	_ZL12FLUSH_REDRAWv
.L49:
	.loc 1 513 0
	ldr	r2, .L51
	ldr	r3, .L51+4
	ldrb	r3, [r2, r3]
	mov	r1, r3
	ldr	r2, .L51
	ldr	r3, .L51+4
	ldrb	r3, [r2, r3]
	mov	r2, r3
	ldr	r3, .L51
	add	r2, r2, #32
	lsl	r2, r2, #1
	ldrh	r3, [r2, r3]
	mov	r2, #254
	lsl	r2, r2, #7
	and	r3, r3, r2
	ldr	r2, .L51
	add	r1, r1, #32
	lsl	r1, r1, #1
	strh	r3, [r1, r2]
	.loc 1 514 0
	ldr	r2, .L51
	ldr	r3, .L51+4
	ldrb	r3, [r2, r3]
	mov	r2, r3
	ldr	r1, .L51
	ldr	r3, .L51+4
	ldrb	r3, [r1, r3]
	mov	r1, r3
	ldr	r3, .L51
	add	r1, r1, #32
	lsl	r1, r1, #1
	ldrh	r1, [r1, r3]
	add	r3, r7, #7
	ldrb	r3, [r3]
	orr	r3, r3, r1
	lsl	r3, r3, #16
	lsr	r1, r3, #16
	ldr	r3, .L51
	add	r2, r2, #32
	lsl	r2, r2, #1
	strh	r1, [r2, r3]
	.loc 1 515 0
	ldr	r3, .L51+12
	mov	r2, #1
	strb	r2, [r3]
	.loc 1 516 0
	ldr	r2, .L51+8
	mov	r3, #114
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	beq	.L48
	.loc 1 518 0
	ldr	r2, .L51
	ldr	r3, .L51+4
	ldrb	r3, [r2, r3]
	mov	r2, r3
	ldr	r1, .L51+12
	mov	r3, #196
	lsl	r3, r3, #4
	ldr	r1, [r1, r3]
	add	r3, r7, #7
	ldrb	r0, [r3]
	mov	r3, #31
	and	r3, r3, r0
	add	r3, r1, r3
	ldrb	r3, [r3]
	mov	r1, r3
	ldr	r3, .L51+12
	add	r2, r2, #16
	lsl	r2, r2, #2
	str	r1, [r2, r3]
	.loc 1 519 0
	ldr	r2, .L51
	ldr	r3, .L51+4
	ldrb	r3, [r2, r3]
	mov	r2, r3
	ldr	r1, .L51+12
	mov	r3, #196
	lsl	r3, r3, #4
	ldr	r1, [r1, r3]
	ldr	r0, .L51
	ldr	r3, .L51+4
	ldrb	r3, [r0, r3]
	mov	r0, r3
	ldr	r3, .L51
	add	r0, r0, #32
	lsl	r0, r0, #1
	ldrh	r3, [r0, r3]
	asr	r3, r3, #5
	mov	r0, r3
	mov	r3, #31
	and	r3, r3, r0
	add	r3, r1, r3
	ldrb	r3, [r3]
	mov	r1, r3
	ldr	r3, .L51+12
	add	r2, r2, #17
	add	r2, r2, #255
	lsl	r2, r2, #2
	str	r1, [r2, r3]
	.loc 1 520 0
	ldr	r2, .L51
	ldr	r3, .L51+4
	ldrb	r3, [r2, r3]
	mov	r1, r3
	ldr	r2, .L51
	ldr	r3, .L51+4
	ldrb	r3, [r2, r3]
	mov	r2, r3
	ldr	r3, .L51+12
	add	r2, r2, #16
	lsl	r2, r2, #2
	ldr	r3, [r2, r3]
	lsl	r3, r3, #11
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r0, .L51
	ldr	r3, .L51+4
	ldrb	r3, [r0, r3]
	mov	r0, r3
	ldr	r3, .L51+12
	add	r0, r0, #17
	add	r0, r0, #255
	lsl	r0, r0, #2
	ldr	r3, [r0, r3]
	lsl	r3, r3, #6
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	orr	r3, r3, r2
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r0, .L51
	ldr	r3, .L51+4
	ldrb	r3, [r0, r3]
	mov	r0, r3
	ldr	r3, .L51+12
	mov	r4, #132
	lsl	r4, r4, #2
	add	r0, r0, r4
	lsl	r0, r0, #2
	ldr	r3, [r0, r3]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	orr	r3, r3, r2
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, .L51+12
	mov	r0, #196
	lsl	r0, r0, #3
	add	r1, r1, r0
	lsl	r1, r1, #1
	add	r3, r1, r3
	strh	r2, [r3, #4]
.L48:
	.loc 1 526 0
	ldr	r2, .L51
	mov	r3, #62
	ldrb	r2, [r2, r3]
	mov	r3, #1
	eor	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r1, r3, #24
	ldr	r2, .L51
	mov	r3, #62
	strb	r1, [r2, r3]
	.loc 1 528 0
	mov	sp, r7
	add	sp, sp, #12
	@ sp needed for prologue
	pop	{r4, r7, pc}
.L52:
	.align	2
.L51:
	.word	PPU
	.word	2148
	.word	Settings
	.word	IPPU
.LFE15:
	.fnend
	.size	_ZL13REGISTER_2122h, .-_ZL13REGISTER_2122h
	.align	2
	.code	16
	.thumb_func
	.type	_ZL13REGISTER_2180h, %function
_ZL13REGISTER_2180h:
	.fnstart
.LFB16:
	.loc 1 531 0
	.save	{r7, lr}
	push	{r7, lr}
.LCFI16:
	sub	sp, sp, #8
.LCFI17:
	add	r7, sp, #0
.LCFI18:
	mov	r2, r0
	add	r3, r7, #7
	strb	r2, [r3]
	.loc 1 532 0
	ldr	r3, .L55
	ldr	r2, [r3]
	ldr	r1, .L55+4
	ldr	r3, .L55+8
	ldr	r3, [r1, r3]
	add	r2, r2, r3
	add	r1, r7, #7
	ldrb	r1, [r1]
	strb	r1, [r2]
	add	r1, r3, #1
	ldr	r2, .L55+4
	ldr	r3, .L55+8
	str	r1, [r2, r3]
	.loc 1 533 0
	ldr	r2, .L55+4
	ldr	r3, .L55+8
	ldr	r3, [r2, r3]
	lsl	r3, r3, #15
	lsr	r1, r3, #15
	ldr	r2, .L55+4
	ldr	r3, .L55+8
	str	r1, [r2, r3]
	.loc 1 534 0
	ldr	r3, .L55
	ldr	r3, [r3, #20]
	mov	r2, #134
	lsl	r2, r2, #6
	add	r3, r3, r2
	add	r2, r7, #7
	ldrb	r2, [r2]
	strb	r2, [r3]
	.loc 1 535 0
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed for prologue
	pop	{r7, pc}
.L56:
	.align	2
.L55:
	.word	Memory
	.word	PPU
	.word	2156
.LFE16:
	.cantunwind
	.fnend
	.size	_ZL13REGISTER_2180h, .-_ZL13REGISTER_2180h
	.align	2
	.code	16
	.thumb_func
	.type	_ZL16CLEAR_IRQ_SOURCEj, %function
_ZL16CLEAR_IRQ_SOURCEj:
	.fnstart
.LFB17:
	.file 2 "Z:/AntSnes/snes9x_asm_optimized/cpuexec.h"
	.loc 2 101 0
	.save	{r7, lr}
	push	{r7, lr}
.LCFI19:
	sub	sp, sp, #8
.LCFI20:
	add	r7, sp, #0
.LCFI21:
	str	r0, [r7, #4]
	.loc 2 102 0
	ldr	r3, .L60
	ldrb	r2, [r3, #6]
	ldr	r3, [r7, #4]
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	mvn	r3, r3
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	and	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r2, r3, #24
	ldr	r3, .L60
	strb	r2, [r3, #6]
	.loc 2 103 0
	ldr	r3, .L60
	ldrb	r3, [r3, #6]
	cmp	r3, #0
	bne	.L59
	.loc 2 104 0
	ldr	r3, .L60
	ldr	r2, [r3]
	ldr	r3, .L60+4
	and	r2, r2, r3
	ldr	r3, .L60
	str	r2, [r3]
.L59:
	.loc 2 105 0
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed for prologue
	pop	{r7, pc}
.L61:
	.align	2
.L60:
	.word	CPU
	.word	-2049
.LFE17:
	.cantunwind
	.fnend
	.size	_ZL16CLEAR_IRQ_SOURCEj, .-_ZL16CLEAR_IRQ_SOURCEj
	.global	__aeabi_idiv
	.align	2
	.global	_Z15S9xUpdateHTimerv
	.hidden	_Z15S9xUpdateHTimerv
	.code	16
	.thumb_func
	.type	_Z15S9xUpdateHTimerv, %function
_Z15S9xUpdateHTimerv:
	.fnstart
.LFB28:
	.file 3 "Z:/AntSnes/snes9x_asm_optimized/ppu.cpp"
	.loc 3 68 0
	.save	{r7, lr}
	push	{r7, lr}
.LCFI22:
	add	r7, sp, #0
.LCFI23:
	.loc 3 69 0
	ldr	r2, .L76
	ldr	r3, .L76+4
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	bne	.LCB1536
	b	.L75	@long jump
.LCB1536:
	.loc 3 74 0
	ldr	r2, .L76
	ldr	r3, .L76+8
	ldrh	r3, [r2, r3]
	mov	r2, r3
	ldr	r3, .L76+12
	ldr	r3, [r3, #4]
	mul	r3, r2
	mov	r0, r3
	mov	r1, #171
	lsl	r1, r1, #1
	bl	__aeabi_idiv
	mov	r3, r0
	lsl	r3, r3, #16
	lsr	r1, r3, #16
	ldr	r2, .L76
	ldr	r3, .L76+16
	strh	r1, [r2, r3]
	.loc 3 75 0
	ldr	r2, .L76
	ldr	r3, .L76+16
	ldrh	r3, [r2, r3]
	lsl	r3, r3, #16
	asr	r2, r3, #16
	ldr	r3, .L76+12
	ldr	r3, [r3, #4]
	cmp	r2, r3
	beq	.L64
	ldr	r2, .L76
	ldr	r3, .L76+16
	ldrh	r3, [r2, r3]
	lsl	r3, r3, #16
	asr	r2, r3, #16
	ldr	r3, .L76+12
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L65
.L64:
	.loc 3 78 0
	ldr	r2, .L76
	ldr	r3, .L76+16
	ldrh	r3, [r2, r3]
	sub	r3, r3, #1
	lsl	r3, r3, #16
	lsr	r1, r3, #16
	ldr	r2, .L76
	ldr	r3, .L76+16
	strh	r1, [r2, r3]
.L65:
	.loc 3 81 0
	ldr	r2, .L76
	ldr	r3, .L76+20
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	beq	.L66
	ldr	r3, .L76+24
	ldr	r2, [r3, #52]
	ldr	r1, .L76
	ldr	r3, .L76+28
	ldrh	r3, [r1, r3]
	cmp	r2, r3
	bne	.L75
.L66:
	.loc 3 83 0
	ldr	r2, .L76
	ldr	r3, .L76+16
	ldrh	r3, [r2, r3]
	lsl	r3, r3, #16
	asr	r2, r3, #16
	ldr	r3, .L76+24
	ldr	r3, [r3, #28]
	cmp	r2, r3
	bge	.L67
	.loc 3 86 0
	ldr	r2, .L76+24
	mov	r3, #85
	ldrb	r3, [r2, r3]
	cmp	r3, #1
	beq	.L68
	ldr	r2, .L76+24
	mov	r3, #85
	ldrb	r3, [r2, r3]
	cmp	r3, #3
	bne	.L69
.L68:
	.loc 3 89 0
	ldr	r2, .L76+24
	mov	r3, #85
	mov	r1, #1
	strb	r1, [r2, r3]
	.loc 3 90 0
	ldr	r3, .L76+12
	ldr	r2, [r3, #4]
	ldr	r3, .L76+24
	str	r2, [r3, #48]
	.loc 3 86 0
	mov	r8, r8
	b	.L75
.L69:
	.loc 3 94 0
	ldr	r2, .L76+24
	mov	r3, #85
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 3 95 0
	ldr	r3, .L76+12
	ldr	r2, [r3, #8]
	ldr	r3, .L76+24
	str	r2, [r3, #48]
	b	.L75
.L67:
	.loc 3 100 0
	ldr	r2, .L76+24
	mov	r3, #85
	ldrb	r3, [r2, r3]
	cmp	r3, #2
	beq	.L71
	ldr	r2, .L76+24
	mov	r3, #85
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	bne	.L72
.L71:
	.loc 3 103 0
	ldr	r2, .L76
	ldr	r3, .L76+16
	ldrh	r3, [r2, r3]
	lsl	r3, r3, #16
	asr	r2, r3, #16
	ldr	r3, .L76+12
	ldr	r3, [r3, #8]
	cmp	r2, r3
	ble	.L73
	.loc 3 107 0
	ldr	r3, .L76+12
	ldr	r2, [r3, #8]
	ldr	r3, .L76+24
	str	r2, [r3, #48]
	.loc 3 108 0
	ldr	r2, .L76+24
	mov	r3, #85
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 3 100 0
	b	.L75
.L73:
	.loc 3 112 0
	ldr	r2, .L76
	ldr	r3, .L76+16
	ldrh	r3, [r2, r3]
	lsl	r3, r3, #16
	asr	r2, r3, #16
	ldr	r3, .L76+24
	str	r2, [r3, #48]
	.loc 3 113 0
	ldr	r2, .L76+24
	mov	r3, #85
	mov	r1, #2
	strb	r1, [r2, r3]
	.loc 3 100 0
	b	.L75
.L72:
	.loc 3 118 0
	ldr	r2, .L76+24
	mov	r3, #85
	mov	r1, #3
	strb	r1, [r2, r3]
	.loc 3 119 0
	ldr	r2, .L76
	ldr	r3, .L76+16
	ldrh	r3, [r2, r3]
	lsl	r3, r3, #16
	asr	r2, r3, #16
	ldr	r3, .L76+24
	str	r2, [r3, #48]
.L75:
	.loc 3 124 0
	mov	sp, r7
	@ sp needed for prologue
	pop	{r7, pc}
.L77:
	.align	2
.L76:
	.word	PPU
	.word	2715
	.word	2124
	.word	Settings
	.word	2716
	.word	2714
	.word	CPU
	.word	2122
.LFE28:
	.cantunwind
	.fnend
	.size	_Z15S9xUpdateHTimerv, .-_Z15S9xUpdateHTimerv
	.align	2
	.global	S9xFixColourBrightness
	.hidden	S9xFixColourBrightness
	.code	16
	.thumb_func
	.type	S9xFixColourBrightness, %function
S9xFixColourBrightness:
	.fnstart
.LFB29:
	.loc 3 129 0
	.save	{r4, r7, lr}
	push	{r4, r7, lr}
.LCFI24:
	sub	sp, sp, #12
.LCFI25:
	add	r7, sp, #0
.LCFI26:
.LBB8:
	.loc 3 130 0
	ldr	r3, .L83
	ldrb	r3, [r3, #2]
	lsl	r2, r3, #5
	ldr	r3, .L83+4
	add	r3, r2, r3
	mov	r1, r3
	ldr	r2, .L83+8
	mov	r3, #196
	lsl	r3, r3, #4
	str	r1, [r2, r3]
	.loc 3 131 0
	ldr	r2, .L83+12
	mov	r3, #114
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	bne	.LCB1743
	b	.L82	@long jump
.LCB1743:
.LBB9:
	.loc 3 133 0
	mov	r3, #0
	str	r3, [r7, #4]
	b	.L80
.L81:
	.loc 3 135 0
	ldr	r2, [r7, #4]
	ldr	r1, .L83+8
	mov	r3, #196
	lsl	r3, r3, #4
	ldr	r1, [r1, r3]
	ldr	r0, [r7, #4]
	ldr	r3, .L83
	add	r0, r0, #32
	lsl	r0, r0, #1
	ldrh	r3, [r0, r3]
	mov	r0, r3
	mov	r3, #31
	and	r3, r3, r0
	add	r3, r1, r3
	ldrb	r3, [r3]
	mov	r1, r3
	ldr	r3, .L83+8
	add	r2, r2, #16
	lsl	r2, r2, #2
	str	r1, [r2, r3]
	.loc 3 136 0
	ldr	r2, [r7, #4]
	ldr	r1, .L83+8
	mov	r3, #196
	lsl	r3, r3, #4
	ldr	r1, [r1, r3]
	ldr	r0, [r7, #4]
	ldr	r3, .L83
	add	r0, r0, #32
	lsl	r0, r0, #1
	ldrh	r3, [r0, r3]
	asr	r3, r3, #5
	mov	r0, r3
	mov	r3, #31
	and	r3, r3, r0
	add	r3, r1, r3
	ldrb	r3, [r3]
	mov	r1, r3
	ldr	r3, .L83+8
	add	r2, r2, #17
	add	r2, r2, #255
	lsl	r2, r2, #2
	str	r1, [r2, r3]
	.loc 3 137 0
	ldr	r2, [r7, #4]
	ldr	r1, .L83+8
	mov	r3, #196
	lsl	r3, r3, #4
	ldr	r1, [r1, r3]
	ldr	r0, [r7, #4]
	ldr	r3, .L83
	add	r0, r0, #32
	lsl	r0, r0, #1
	ldrh	r3, [r0, r3]
	asr	r3, r3, #10
	mov	r0, r3
	mov	r3, #31
	and	r3, r3, r0
	add	r3, r1, r3
	ldrb	r3, [r3]
	mov	r1, r3
	ldr	r3, .L83+8
	mov	r0, #132
	lsl	r0, r0, #2
	add	r2, r2, r0
	lsl	r2, r2, #2
	str	r1, [r2, r3]
	.loc 3 138 0
	ldr	r1, [r7, #4]
	ldr	r2, [r7, #4]
	ldr	r3, .L83+8
	add	r2, r2, #16
	lsl	r2, r2, #2
	ldr	r3, [r2, r3]
	lsl	r3, r3, #11
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r0, [r7, #4]
	ldr	r3, .L83+8
	add	r0, r0, #17
	add	r0, r0, #255
	lsl	r0, r0, #2
	ldr	r3, [r0, r3]
	lsl	r3, r3, #6
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	orr	r3, r3, r2
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r0, [r7, #4]
	ldr	r3, .L83+8
	mov	r4, #132
	lsl	r4, r4, #2
	add	r0, r0, r4
	lsl	r0, r0, #2
	ldr	r3, [r0, r3]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	orr	r3, r3, r2
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, .L83+8
	mov	r0, #196
	lsl	r0, r0, #3
	add	r1, r1, r0
	lsl	r1, r1, #1
	add	r3, r1, r3
	strh	r2, [r3, #4]
	.loc 3 133 0
	ldr	r3, [r7, #4]
	add	r3, r3, #1
	str	r3, [r7, #4]
.L80:
	ldr	r3, [r7, #4]
	mov	r2, #255
	lsr	r0, r3, #31
	asr	r1, r2, #31
	mov	r4, r0
	cmp	r2, r3
	adc	r4, r4, r1
	mov	r3, r4
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	bne	.L81
.L82:
.LBE9:
.LBE8:
	.loc 3 142 0
	mov	sp, r7
	add	sp, sp, #12
	@ sp needed for prologue
	pop	{r4, r7, pc}
.L84:
	.align	2
.L83:
	.word	PPU
	.word	mul_brightness
	.word	IPPU
	.word	Settings
.LFE29:
	.cantunwind
	.fnend
	.size	S9xFixColourBrightness, .-S9xFixColourBrightness
	.align	2
	.global	S9xSetPPU
	.hidden	S9xSetPPU
	.code	16
	.thumb_func
	.type	S9xSetPPU, %function
S9xSetPPU:
	.fnstart
.LFB30:
	.loc 3 149 0
	.save	{r7, lr}
	push	{r7, lr}
.LCFI27:
	.pad #16
	sub	sp, sp, #16
.LCFI28:
	.setfp r7, sp, #0
	add	r7, sp, #0
.LCFI29:
	mov	r2, r1
	add	r3, r7, #7
	add	r1, r0, #0
	strb	r1, [r3]
	add	r3, r7, #4
	strh	r2, [r3]
.LBB10:
	.loc 3 150 0
	add	r3, r7, #4
	ldrh	r2, [r3]
	ldr	r3, .L291
	cmp	r2, r3
	bls	.LCB1913
	bl	.L86	@far jump
.LCB1913:
	.loc 3 152 0
	add	r3, r7, #4
	ldrh	r3, [r3]
	ldr	r1, .L291+4
	add	r3, r3, r1
	cmp	r3, #131
	bls	.LCB1919
	bl	.L244	@far jump
.LCB1919:
	lsl	r2, r3, #2
	ldr	r3, .L291+8
	add	r3, r2, r3
	ldr	r3, [r3]
	mov	pc, r3
	.section	.rodata
	.align	2
.L153:
	.word	.L88
	.word	.L89
	.word	.L90
	.word	.L91
	.word	.L92
	.word	.L93
	.word	.L94
	.word	.L95
	.word	.L96
	.word	.L97
	.word	.L98
	.word	.L99
	.word	.L100
	.word	.L101
	.word	.L102
	.word	.L103
	.word	.L104
	.word	.L105
	.word	.L106
	.word	.L107
	.word	.L108
	.word	.L109
	.word	.L110
	.word	.L111
	.word	.L112
	.word	.L113
	.word	.L114
	.word	.L115
	.word	.L116
	.word	.L117
	.word	.L118
	.word	.L119
	.word	.L120
	.word	.L121
	.word	.L122
	.word	.L123
	.word	.L124
	.word	.L125
	.word	.L126
	.word	.L127
	.word	.L128
	.word	.L129
	.word	.L130
	.word	.L131
	.word	.L132
	.word	.L133
	.word	.L134
	.word	.L135
	.word	.L136
	.word	.L137
	.word	.L138
	.word	.L139
	.word	.L245
	.word	.L245
	.word	.L245
	.word	.L245
	.word	.L245
	.word	.L245
	.word	.L245
	.word	.L245
	.word	.L245
	.word	.L245
	.word	.L245
	.word	.L245
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L148
	.word	.L149
	.word	.L150
	.word	.L151
	.word	.L152
	.text
.L88:
	.loc 3 156 0
	ldr	r3, .L291+12
	ldr	r3, [r3, #20]
	mov	r2, #132
	lsl	r2, r2, #6
	add	r3, r3, r2
	ldrb	r3, [r3]
	add	r2, r7, #7
	ldrb	r2, [r2]
	cmp	r2, r3
	bne	.LCB1940
	bl	.L246	@far jump
.LCB1940:
	.loc 3 158 0
	bl	_ZL12FLUSH_REDRAWv
	.loc 3 159 0
	ldr	r3, .L291+16
	ldrb	r3, [r3, #2]
	mov	r2, r3
	add	r3, r7, #7
	ldrb	r1, [r3]
	mov	r3, #15
	and	r3, r3, r1
	cmp	r2, r3
	beq	.L155
	.loc 3 161 0
	ldr	r3, .L291+20
	mov	r2, #1
	strb	r2, [r3]
	.loc 3 162 0
	ldr	r3, .L291+20
	mov	r2, #1
	strb	r2, [r3, #7]
	.loc 3 163 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	mov	r2, #15
	and	r3, r3, r2
	ldr	r2, .L291+16
	strb	r3, [r2, #2]
	.loc 3 164 0
	bl	S9xFixColourBrightness
	.loc 3 165 0
	ldr	r3, .L291+16
	ldrb	r2, [r3, #2]
	ldr	r3, .L291+20
	ldrb	r3, [r3, #3]
	cmp	r2, r3
	bls	.L155
	.loc 3 166 0
	ldr	r3, .L291+16
	ldrb	r2, [r3, #2]
	ldr	r3, .L291+20
	strb	r2, [r3, #3]
.L155:
	.loc 3 168 0
	ldr	r3, .L291+12
	ldr	r3, [r3, #20]
	mov	r1, #132
	lsl	r1, r1, #6
	add	r3, r3, r1
	ldrb	r3, [r3]
	mov	r2, r3
	add	r3, r7, #7
	ldrb	r3, [r3]
	eor	r2, r2, r3
	mov	r3, #128
	and	r3, r3, r2
	cmp	r3, #0
	bne	.LCB1989
	bl	.L247	@far jump
.LCB1989:
	.loc 3 170 0
	ldr	r3, .L291+20
	mov	r2, #1
	strb	r2, [r3]
	.loc 3 171 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	lsr	r3, r3, #7
	lsl	r3, r3, #24
	lsr	r1, r3, #24
	ldr	r2, .L291+16
	ldr	r3, .L291+24
	strb	r1, [r2, r3]
	.loc 3 174 0
	bl	.L220	@ far jump
.L89:
	.loc 3 178 0
	ldr	r3, .L291+12
	ldr	r3, [r3, #20]
	ldr	r2, .L291+28
	add	r3, r3, r2
	ldrb	r3, [r3]
	add	r2, r7, #7
	ldrb	r2, [r2]
	cmp	r2, r3
	bne	.LCB2013
	bl	.L248	@far jump
.LCB2013:
	.loc 3 180 0
	bl	_ZL12FLUSH_REDRAWv
	.loc 3 181 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	lsl	r3, r3, #14
	lsl	r3, r3, #16
	lsr	r1, r3, #16
	ldr	r2, .L291+16
	ldr	r3, .L291+32
	strh	r1, [r2, r3]
	.loc 3 182 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	asr	r3, r3, #3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	mov	r2, #3
	and	r3, r3, r2
	lsl	r3, r3, #13
	lsl	r3, r3, #16
	lsr	r1, r3, #16
	ldr	r2, .L291+16
	mov	r3, #173
	lsl	r3, r3, #4
	strh	r1, [r2, r3]
	.loc 3 183 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	lsr	r3, r3, #5
	lsl	r3, r3, #24
	lsr	r1, r3, #24
	ldr	r2, .L291+16
	ldr	r3, .L291+36
	strb	r1, [r2, r3]
	.loc 3 184 0
	ldr	r3, .L291+20
	mov	r2, #1
	strb	r2, [r3, #5]
	.loc 3 186 0
	bl	.L220	@ far jump
.L90:
	.loc 3 190 0
	add	r3, r7, #7
	ldrb	r1, [r3]
	ldr	r2, .L291+16
	ldr	r3, .L291+40
	strh	r1, [r2, r3]
	.loc 3 191 0
	ldr	r2, .L291+16
	ldr	r3, .L291+44
	mov	r1, #2
	strb	r1, [r2, r3]
	.loc 3 192 0
	ldr	r2, .L291+16
	ldr	r3, .L291+48
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 3 193 0
	ldr	r2, .L291+16
	ldr	r3, .L291+40
	ldrh	r1, [r2, r3]
	ldr	r2, .L291+16
	ldr	r3, .L291+52
	strh	r1, [r2, r3]
	.loc 3 194 0
	ldr	r2, .L291+16
	ldr	r3, .L291+56
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	bne	.LCB2075
	bl	.L249	@far jump
.LCB2075:
	.loc 3 196 0
	ldr	r2, .L291+16
	ldr	r3, .L291+40
	ldrh	r3, [r2, r3]
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	mov	r2, r3
	mov	r3, #127
	and	r2, r2, r3
	ldr	r1, .L291+16
	mov	r3, #144
	lsl	r3, r3, #2
	strb	r2, [r1, r3]
	.loc 3 201 0
	bl	.L220	@ far jump
.L91:
	.loc 3 206 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	lsl	r3, r3, #24
	asr	r3, r3, #24
	lsr	r1, r3, #31
	ldr	r2, .L291+16
	ldr	r3, .L291+56
	strb	r1, [r2, r3]
	ldr	r2, .L291+16
	ldr	r3, .L291+56
	ldrb	r3, [r2, r3]
	sub	r2, r3, #1
	sbc	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	beq	.L158
	.loc 3 208 0
	ldr	r2, .L291+16
	ldr	r3, .L291+40
	ldrh	r3, [r2, r3]
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	mov	r2, r3
	mov	r3, #127
	and	r2, r2, r3
	ldr	r1, .L291+16
	mov	r3, #144
	lsl	r3, r3, #2
	strb	r2, [r1, r3]
.L158:
	.loc 3 215 0
	ldr	r2, .L291+16
	ldr	r3, .L291+44
	ldrb	r3, [r2, r3]
	mov	r2, r3
	mov	r3, #2
	and	r3, r3, r2
	cmp	r3, #0
	beq	.L159
	.loc 3 217 0
	ldr	r2, .L291+16
	ldr	r3, .L291+40
	ldrh	r3, [r2, r3]
	mov	r2, #255
	and	r3, r3, r2
	ldr	r1, .L291+16
	ldr	r2, .L291+40
	strh	r3, [r1, r2]
	.loc 3 218 0
	ldr	r2, .L291+16
	ldr	r3, .L291+40
	ldrh	r3, [r2, r3]
	mov	r2, r3
	add	r3, r7, #7
	ldrb	r1, [r3]
	mov	r3, #1
	and	r3, r3, r1
	lsl	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	orr	r3, r3, r2
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	lsr	r1, r3, #16
	ldr	r2, .L291+16
	ldr	r3, .L291+40
	strh	r1, [r2, r3]
.L159:
	.loc 3 220 0
	ldr	r2, .L291+16
	ldr	r3, .L291+44
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 3 221 0
	ldr	r2, .L291+16
	ldr	r3, .L291+48
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 3 222 0
	ldr	r2, .L291+16
	ldr	r3, .L291+40
	ldrh	r1, [r2, r3]
	ldr	r2, .L291+16
	ldr	r3, .L291+52
	strh	r1, [r2, r3]
	.loc 3 223 0
	bl	.L220	@ far jump
.L92:
	.loc 3 227 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	mov	r0, r3
	bl	_ZL13REGISTER_2104h
	.loc 3 228 0
	bl	.L220	@ far jump
.L93:
	.loc 3 233 0
	ldr	r3, .L291+12
	ldr	r3, [r3, #20]
	ldr	r1, .L291+60
	add	r3, r3, r1
	ldrb	r3, [r3]
	add	r2, r7, #7
	ldrb	r2, [r2]
	cmp	r2, r3
	bne	.LCB2193
	bl	.L250	@far jump
.LCB2193:
	.loc 3 235 0
	bl	_ZL12FLUSH_REDRAWv
	.loc 3 236 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	asr	r3, r3, #4
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	mov	r2, #1
	and	r3, r3, r2
	ldr	r2, .L291+16
	strb	r3, [r2, #20]
	.loc 3 237 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	asr	r3, r3, #5
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	mov	r2, #1
	and	r3, r3, r2
	ldr	r1, .L291+16
	mov	r2, #32
	strb	r3, [r1, r2]
	.loc 3 238 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	asr	r3, r3, #6
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	mov	r2, #1
	and	r3, r3, r2
	ldr	r1, .L291+16
	mov	r2, #44
	strb	r3, [r1, r2]
	.loc 3 239 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	lsr	r3, r3, #7
	lsl	r3, r3, #24
	lsr	r1, r3, #24
	ldr	r2, .L291+16
	mov	r3, #56
	strb	r1, [r2, r3]
	.loc 3 240 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	mov	r2, #7
	and	r3, r3, r2
	ldr	r2, .L291+16
	strb	r3, [r2]
	.loc 3 242 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #15
	and	r3, r3, r2
	sub	r3, r3, #9
	neg	r2, r3
	adc	r2, r2, r3
	ldr	r3, .L291+16
	strb	r2, [r3, #1]
	.loc 3 247 0
	bl	.L220	@ far jump
.L94:
	.loc 3 251 0
	ldr	r3, .L291+12
	ldr	r3, [r3, #20]
	ldr	r2, .L291+64
	add	r3, r3, r2
	ldrb	r3, [r3]
	add	r2, r7, #7
	ldrb	r2, [r2]
	cmp	r2, r3
	bne	.LCB2258
	bl	.L251	@far jump
.LCB2258:
	.loc 3 253 0
	bl	_ZL12FLUSH_REDRAWv
	.loc 3 258 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	asr	r3, r3, #4
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	add	r3, r3, #1
	lsl	r3, r3, #24
	lsr	r1, r3, #24
	ldr	r2, .L291+16
	ldr	r3, .L291+68
	strb	r1, [r2, r3]
	.loc 3 259 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #1
	and	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	beq	.L162
	ldr	r2, .L291+16
	ldr	r3, .L291+68
	ldrb	r3, [r2, r3]
	cmp	r3, #1
	bls	.L162
	mov	r3, #1
	b	.L163
.L162:
	mov	r3, #0
.L163:
	mov	r1, r3
	ldr	r2, .L291+16
	ldr	r3, .L291+72
	strb	r1, [r2, r3]
	.loc 3 260 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #2
	and	r3, r3, r2
	cmp	r3, #0
	beq	.L164
	ldr	r2, .L291+16
	ldr	r3, .L291+68
	ldrb	r3, [r2, r3]
	cmp	r3, #1
	bls	.L164
	mov	r3, #1
	b	.L165
.L164:
	mov	r3, #0
.L165:
	mov	r1, r3
	ldr	r2, .L291+16
	mov	r3, #170
	lsl	r3, r3, #4
	strb	r1, [r2, r3]
	.loc 3 261 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #4
	and	r3, r3, r2
	cmp	r3, #0
	beq	.L166
	ldr	r2, .L291+16
	ldr	r3, .L291+68
	ldrb	r3, [r2, r3]
	cmp	r3, #1
	bls	.L166
	mov	r3, #1
	b	.L167
.L292:
	.align	2
.L291:
	.word	8579
	.word	-8448
	.word	.L153
	.word	Memory
	.word	PPU
	.word	IPPU
	.word	2161
	.word	8449
	.word	2166
	.word	2164
	.word	2116
	.word	2118
	.word	2169
	.word	2152
	.word	2114
	.word	8453
	.word	8454
	.word	2718
	.word	2719
.L166:
	mov	r3, #0
.L167:
	mov	r1, r3
	ldr	r2, .L293
	ldr	r3, .L293+4
	strb	r1, [r2, r3]
	.loc 3 262 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #8
	and	r3, r3, r2
	cmp	r3, #0
	beq	.L168
	ldr	r2, .L293
	ldr	r3, .L293+8
	ldrb	r3, [r2, r3]
	cmp	r3, #1
	bls	.L168
	mov	r3, #1
	b	.L169
.L168:
	mov	r3, #0
.L169:
	mov	r1, r3
	ldr	r2, .L293
	ldr	r3, .L293+12
	strb	r1, [r2, r3]
	.loc 3 264 0
	bl	.L220	@ far jump
.L95:
	.loc 3 266 0
	ldr	r3, .L293+16
	ldr	r3, [r3, #20]
	ldr	r1, .L293+20
	add	r3, r3, r1
	ldrb	r3, [r3]
	add	r2, r7, #7
	ldrb	r2, [r2]
	cmp	r2, r3
	bne	.LCB2402
	bl	.L252	@far jump
.LCB2402:
	.loc 3 268 0
	bl	_ZL12FLUSH_REDRAWv
	.loc 3 269 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	mov	r2, #3
	and	r3, r3, r2
	ldr	r2, .L293
	strh	r3, [r2, #24]
	.loc 3 270 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	mov	r2, #124
	and	r3, r3, r2
	lsl	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, .L293
	strh	r2, [r3, #14]
	.loc 3 272 0
	bl	.L220	@ far jump
.L96:
	.loc 3 275 0
	ldr	r3, .L293+16
	ldr	r3, [r3, #20]
	ldr	r2, .L293+24
	add	r3, r3, r2
	ldrb	r3, [r3]
	add	r2, r7, #7
	ldrb	r2, [r2]
	cmp	r2, r3
	bne	.LCB2431
	bl	.L253	@far jump
.LCB2431:
	.loc 3 277 0
	bl	_ZL12FLUSH_REDRAWv
	.loc 3 278 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	mov	r2, #3
	and	r3, r3, r2
	ldr	r2, .L293
	strh	r3, [r2, #36]
	.loc 3 279 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	mov	r2, #124
	and	r3, r3, r2
	lsl	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, .L293
	strh	r2, [r3, #26]
	.loc 3 281 0
	bl	.L220	@ far jump
.L97:
	.loc 3 284 0
	ldr	r3, .L293+16
	ldr	r3, [r3, #20]
	ldr	r1, .L293+28
	add	r3, r3, r1
	ldrb	r3, [r3]
	add	r2, r7, #7
	ldrb	r2, [r2]
	cmp	r2, r3
	bne	.LCB2460
	bl	.L254	@far jump
.LCB2460:
	.loc 3 286 0
	bl	_ZL12FLUSH_REDRAWv
	.loc 3 287 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	mov	r2, #3
	and	r3, r3, r2
	ldr	r2, .L293
	strh	r3, [r2, #48]
	.loc 3 288 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	mov	r2, #124
	and	r3, r3, r2
	lsl	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, .L293
	strh	r2, [r3, #38]
	.loc 3 290 0
	bl	.L220	@ far jump
.L98:
	.loc 3 293 0
	ldr	r3, .L293+16
	ldr	r3, [r3, #20]
	ldr	r2, .L293+32
	add	r3, r3, r2
	ldrb	r3, [r3]
	add	r2, r7, #7
	ldrb	r2, [r2]
	cmp	r2, r3
	bne	.LCB2489
	bl	.L255	@far jump
.LCB2489:
	.loc 3 295 0
	bl	_ZL12FLUSH_REDRAWv
	.loc 3 296 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	mov	r2, #3
	and	r3, r3, r2
	ldr	r2, .L293
	strh	r3, [r2, #60]
	.loc 3 297 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	mov	r2, #124
	and	r3, r3, r2
	lsl	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, .L293
	strh	r2, [r3, #50]
	.loc 3 299 0
	bl	.L220	@ far jump
.L99:
	.loc 3 302 0
	ldr	r3, .L293+16
	ldr	r3, [r3, #20]
	ldr	r1, .L293+36
	add	r3, r3, r1
	ldrb	r3, [r3]
	add	r2, r7, #7
	ldrb	r2, [r2]
	cmp	r2, r3
	bne	.LCB2518
	bl	.L256	@far jump
.LCB2518:
	.loc 3 304 0
	bl	_ZL12FLUSH_REDRAWv
	.loc 3 305 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	mov	r2, #7
	and	r3, r3, r2
	lsl	r3, r3, #12
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, .L293
	strh	r2, [r3, #22]
	.loc 3 306 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	asr	r3, r3, #4
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	mov	r2, #7
	and	r3, r3, r2
	lsl	r3, r3, #12
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, .L293
	strh	r2, [r3, #34]
	.loc 3 308 0
	bl	.L220	@ far jump
.L100:
	.loc 3 311 0
	ldr	r3, .L293+16
	ldr	r3, [r3, #20]
	ldr	r2, .L293+40
	add	r3, r3, r2
	ldrb	r3, [r3]
	add	r2, r7, #7
	ldrb	r2, [r2]
	cmp	r2, r3
	bne	.LCB2553
	bl	.L257	@far jump
.LCB2553:
	.loc 3 313 0
	bl	_ZL12FLUSH_REDRAWv
	.loc 3 314 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	mov	r2, #7
	and	r3, r3, r2
	lsl	r3, r3, #12
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, .L293
	strh	r2, [r3, #46]
	.loc 3 315 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	asr	r3, r3, #4
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	mov	r2, #7
	and	r3, r3, r2
	lsl	r3, r3, #12
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, .L293
	strh	r2, [r3, #58]
	.loc 3 317 0
	bl	.L220	@ far jump
.L101:
	.loc 3 321 0
	ldr	r3, .L293
	ldrh	r3, [r3, #18]
	lsr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	mov	r2, r3
	add	r3, r7, #7
	ldrb	r3, [r3]
	lsl	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	orr	r3, r3, r2
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, .L293
	strh	r2, [r3, #18]
	.loc 3 322 0
	bl	.L220	@ far jump
.L102:
	.loc 3 326 0
	ldr	r3, .L293
	ldrh	r3, [r3, #16]
	lsr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	mov	r2, r3
	add	r3, r7, #7
	ldrb	r3, [r3]
	lsl	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	orr	r3, r3, r2
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, .L293
	strh	r2, [r3, #16]
	.loc 3 327 0
	bl	.L220	@ far jump
.L103:
	.loc 3 330 0
	ldr	r3, .L293
	ldrh	r3, [r3, #30]
	lsr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	mov	r2, r3
	add	r3, r7, #7
	ldrb	r3, [r3]
	lsl	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	orr	r3, r3, r2
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, .L293
	strh	r2, [r3, #30]
	.loc 3 331 0
	bl	.L220	@ far jump
.L104:
	.loc 3 335 0
	ldr	r3, .L293
	ldrh	r3, [r3, #28]
	lsr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	mov	r2, r3
	add	r3, r7, #7
	ldrb	r3, [r3]
	lsl	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	orr	r3, r3, r2
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, .L293
	strh	r2, [r3, #28]
	.loc 3 336 0
	bl	.L220	@ far jump
.L105:
	.loc 3 340 0
	ldr	r3, .L293
	ldrh	r3, [r3, #42]
	lsr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	mov	r2, r3
	add	r3, r7, #7
	ldrb	r3, [r3]
	lsl	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	orr	r3, r3, r2
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, .L293
	strh	r2, [r3, #42]
	.loc 3 341 0
	bl	.L220	@ far jump
.L106:
	.loc 3 345 0
	ldr	r3, .L293
	ldrh	r3, [r3, #40]
	lsr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	mov	r2, r3
	add	r3, r7, #7
	ldrb	r3, [r3]
	lsl	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	orr	r3, r3, r2
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, .L293
	strh	r2, [r3, #40]
	.loc 3 346 0
	bl	.L220	@ far jump
.L107:
	.loc 3 350 0
	ldr	r3, .L293
	ldrh	r3, [r3, #54]
	lsr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	mov	r2, r3
	add	r3, r7, #7
	ldrb	r3, [r3]
	lsl	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	orr	r3, r3, r2
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, .L293
	strh	r2, [r3, #54]
	.loc 3 351 0
	bl	.L220	@ far jump
.L108:
	.loc 3 355 0
	ldr	r3, .L293
	ldrh	r3, [r3, #52]
	lsr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	mov	r2, r3
	add	r3, r7, #7
	ldrb	r3, [r3]
	lsl	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	orr	r3, r3, r2
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, .L293
	strh	r2, [r3, #52]
	.loc 3 356 0
	bl	.L220	@ far jump
.L109:
	.loc 3 360 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	lsl	r3, r3, #24
	asr	r3, r3, #24
	lsr	r2, r3, #31
	ldr	r3, .L293
	strb	r2, [r3, #4]
	.loc 3 361 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #3
	and	r3, r3, r2
	cmp	r3, #1
	beq	.L178
	cmp	r3, #1
	bgt	.L181
	cmp	r3, #0
	beq	.L177
	b	.L176
.L181:
	cmp	r3, #2
	beq	.L179
	cmp	r3, #3
	beq	.L180
	b	.L176
.L177:
	.loc 3 364 0
	ldr	r3, .L293
	mov	r2, #1
	strb	r2, [r3, #5]
	.loc 3 365 0
	b	.L176
.L178:
	.loc 3 367 0
	ldr	r3, .L293
	mov	r2, #32
	strb	r2, [r3, #5]
	.loc 3 368 0
	b	.L176
.L179:
	.loc 3 370 0
	ldr	r2, .L293
	mov	r3, #128
	neg	r3, r3
	strb	r3, [r2, #5]
	.loc 3 371 0
	b	.L176
.L294:
	.align	2
.L293:
	.word	PPU
	.word	2721
	.word	2718
	.word	2722
	.word	Memory
	.word	8455
	.word	8456
	.word	8457
	.word	8458
	.word	8459
	.word	8460
.L180:
	.loc 3 373 0
	ldr	r2, .L295
	mov	r3, #128
	neg	r3, r3
	strb	r3, [r2, #5]
.L176:
	.loc 3 380 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #12
	and	r3, r3, r2
	cmp	r3, #0
	beq	.L182
.LBB11:
	.loc 3 388 0
	ldr	r3, .L295
	mov	r2, #1
	strb	r2, [r3, #5]
	.loc 3 389 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #12
	and	r3, r3, r2
	asr	r2, r3, #2
	mov	r3, r7
	add	r3, r3, #11
	strb	r2, [r3]
	.loc 3 390 0
	mov	r3, r7
	add	r3, r3, #11
	ldrb	r2, [r3]
	ldr	r3, .L295+4
	lsl	r2, r2, #1
	ldrh	r2, [r2, r3]
	ldr	r3, .L295
	strh	r2, [r3, #10]
	.loc 3 391 0
	mov	r3, r7
	add	r3, r3, #11
	ldrb	r2, [r3]
	ldr	r3, .L295+4
	lsl	r2, r2, #1
	ldrh	r3, [r2, r3]
	lsl	r3, r3, #3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	sub	r3, r3, #1
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, .L295
	strh	r2, [r3, #8]
	.loc 3 392 0
	mov	r3, r7
	add	r3, r3, #11
	ldrb	r2, [r3]
	ldr	r3, .L295+8
	lsl	r2, r2, #1
	ldrh	r2, [r2, r3]
	ldr	r3, .L295
	strh	r2, [r3, #12]
.LBE11:
	.loc 3 396 0
	bl	.L220	@ far jump
.L182:
	.loc 3 395 0
	ldr	r3, .L295
	mov	r2, #0
	strh	r2, [r3, #10]
	.loc 3 396 0
	bl	.L220	@ far jump
.L110:
	.loc 3 400 0
	ldr	r3, .L295
	ldrh	r3, [r3, #6]
	mov	r2, #255
	lsl	r2, r2, #8
	and	r3, r3, r2
	ldr	r2, .L295
	strh	r3, [r2, #6]
	.loc 3 401 0
	ldr	r3, .L295
	ldrh	r2, [r3, #6]
	add	r3, r7, #7
	ldrb	r3, [r3]
	orr	r3, r3, r2
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, .L295
	strh	r2, [r3, #6]
	.loc 3 402 0
	ldr	r2, .L295+12
	mov	r3, #52
	mov	r1, #1
	strb	r1, [r2, r3]
	.loc 3 403 0
	bl	.L220	@ far jump
.L111:
	.loc 3 407 0
	ldr	r3, .L295
	ldrh	r3, [r3, #6]
	mov	r2, #255
	and	r3, r3, r2
	ldr	r2, .L295
	strh	r3, [r2, #6]
	.loc 3 408 0
	ldr	r3, .L295
	ldrh	r3, [r3, #6]
	mov	r2, r3
	add	r3, r7, #7
	ldrb	r3, [r3]
	lsl	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	orr	r3, r3, r2
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, .L295
	strh	r2, [r3, #6]
	.loc 3 409 0
	ldr	r2, .L295+12
	mov	r3, #52
	mov	r1, #1
	strb	r1, [r2, r3]
	.loc 3 410 0
	bl	.L220	@ far jump
.L112:
	.loc 3 414 0
	ldr	r2, .L295+12
	mov	r3, #52
	mov	r1, #1
	strb	r1, [r2, r3]
	.loc 3 415 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	mov	r0, r3
	bl	_ZL13REGISTER_2118h
	.loc 3 416 0
	bl	.L220	@ far jump
.L113:
	.loc 3 420 0
	ldr	r2, .L295+12
	mov	r3, #52
	mov	r1, #1
	strb	r1, [r2, r3]
	.loc 3 421 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	mov	r0, r3
	bl	_ZL13REGISTER_2119h
	.loc 3 422 0
	bl	.L220	@ far jump
.L114:
	.loc 3 426 0
	ldr	r3, .L295+16
	ldr	r3, [r3, #20]
	ldr	r1, .L295+20
	add	r3, r3, r1
	ldrb	r3, [r3]
	add	r2, r7, #7
	ldrb	r2, [r2]
	cmp	r2, r3
	bne	.LCB2974
	bl	.L258	@far jump
.LCB2974:
	.loc 3 428 0
	bl	_ZL12FLUSH_REDRAWv
	.loc 3 429 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	asr	r3, r3, #6
	lsl	r3, r3, #24
	lsr	r1, r3, #24
	ldr	r2, .L295
	ldr	r3, .L295+24
	strb	r1, [r2, r3]
	.loc 3 430 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #2
	and	r3, r3, r2
	asr	r3, r3, #1
	lsl	r3, r3, #24
	lsr	r1, r3, #24
	ldr	r2, .L295
	ldr	r3, .L295+28
	strb	r1, [r2, r3]
	.loc 3 431 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	mov	r2, #1
	and	r3, r3, r2
	ldr	r1, .L295
	ldr	r2, .L295+32
	strb	r3, [r1, r2]
	.loc 3 433 0
	bl	.L220	@ far jump
.L115:
	.loc 3 436 0
	ldr	r2, .L295
	ldr	r3, .L295+36
	ldrh	r3, [r2, r3]
	lsl	r3, r3, #16
	asr	r3, r3, #16
	asr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	mov	r2, #255
	and	r3, r3, r2
	add	r2, r7, #7
	ldrb	r2, [r2]
	lsl	r2, r2, #8
	lsl	r2, r2, #16
	lsr	r1, r2, #16
	add	r2, r3, #0
	add	r3, r1, #0
	orr	r3, r3, r2
	lsl	r3, r3, #16
	lsr	r1, r3, #16
	ldr	r2, .L295
	ldr	r3, .L295+36
	strh	r1, [r2, r3]
	.loc 3 437 0
	ldr	r2, .L295
	ldr	r3, .L295+40
	mov	r1, #1
	strb	r1, [r2, r3]
	.loc 3 438 0
	bl	.L220	@ far jump
.L116:
	.loc 3 441 0
	ldr	r2, .L295
	ldr	r3, .L295+44
	ldrh	r3, [r2, r3]
	lsl	r3, r3, #16
	asr	r3, r3, #16
	asr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	mov	r2, #255
	and	r3, r3, r2
	add	r2, r7, #7
	ldrb	r2, [r2]
	lsl	r2, r2, #8
	lsl	r2, r2, #16
	lsr	r1, r2, #16
	add	r2, r3, #0
	add	r3, r1, #0
	orr	r3, r3, r2
	lsl	r3, r3, #16
	lsr	r1, r3, #16
	ldr	r2, .L295
	ldr	r3, .L295+44
	strh	r1, [r2, r3]
	.loc 3 442 0
	ldr	r2, .L295
	ldr	r3, .L295+40
	mov	r1, #1
	strb	r1, [r2, r3]
	.loc 3 443 0
	bl	.L220	@ far jump
.L117:
	.loc 3 446 0
	ldr	r2, .L295
	ldr	r3, .L295+48
	ldrh	r3, [r2, r3]
	lsl	r3, r3, #16
	asr	r3, r3, #16
	asr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	mov	r2, #255
	and	r3, r3, r2
	add	r2, r7, #7
	ldrb	r2, [r2]
	lsl	r2, r2, #8
	lsl	r2, r2, #16
	lsr	r1, r2, #16
	add	r2, r3, #0
	add	r3, r1, #0
	orr	r3, r3, r2
	lsl	r3, r3, #16
	lsr	r1, r3, #16
	ldr	r2, .L295
	ldr	r3, .L295+48
	strh	r1, [r2, r3]
	.loc 3 447 0
	bl	.L220	@ far jump
.L118:
	.loc 3 450 0
	ldr	r2, .L295
	ldr	r3, .L295+52
	ldrh	r3, [r2, r3]
	lsl	r3, r3, #16
	asr	r3, r3, #16
	asr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	mov	r2, #255
	and	r3, r3, r2
	add	r2, r7, #7
	ldrb	r2, [r2]
	lsl	r2, r2, #8
	lsl	r2, r2, #16
	lsr	r1, r2, #16
	add	r2, r3, #0
	add	r3, r1, #0
	orr	r3, r3, r2
	lsl	r3, r3, #16
	lsr	r1, r3, #16
	ldr	r2, .L295
	ldr	r3, .L295+52
	strh	r1, [r2, r3]
	.loc 3 451 0
	bl	.L220	@ far jump
.L119:
	.loc 3 454 0
	ldr	r2, .L295
	ldr	r3, .L295+56
	ldrh	r3, [r2, r3]
	lsl	r3, r3, #16
	asr	r3, r3, #16
	asr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	mov	r2, #255
	and	r3, r3, r2
	add	r2, r7, #7
	ldrb	r2, [r2]
	lsl	r2, r2, #8
	lsl	r2, r2, #16
	lsr	r1, r2, #16
	add	r2, r3, #0
	add	r3, r1, #0
	orr	r3, r3, r2
	lsl	r3, r3, #16
	lsr	r1, r3, #16
	ldr	r2, .L295
	ldr	r3, .L295+56
	strh	r1, [r2, r3]
	.loc 3 455 0
	bl	.L220	@ far jump
.L120:
	.loc 3 458 0
	ldr	r2, .L295
	mov	r3, #134
	lsl	r3, r3, #4
	ldrh	r3, [r2, r3]
	lsl	r3, r3, #16
	asr	r3, r3, #16
	asr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	mov	r2, #255
	and	r3, r3, r2
	add	r2, r7, #7
	ldrb	r2, [r2]
	lsl	r2, r2, #8
	lsl	r2, r2, #16
	lsr	r1, r2, #16
	add	r2, r3, #0
	add	r3, r1, #0
	orr	r3, r3, r2
	lsl	r3, r3, #16
	lsr	r1, r3, #16
	ldr	r2, .L295
	mov	r3, #134
	lsl	r3, r3, #4
	strh	r1, [r2, r3]
	.loc 3 459 0
	bl	.L220	@ far jump
.L121:
	.loc 3 463 0
	ldr	r2, .L295
	mov	r3, #62
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 3 464 0
	ldr	r2, .L295
	ldr	r3, .L295+60
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 3 465 0
	ldr	r2, .L295
	add	r1, r7, #7
	ldr	r3, .L295+64
	ldrb	r1, [r1]
	strb	r1, [r2, r3]
	.loc 3 466 0
	bl	.L220	@ far jump
.L122:
	.loc 3 469 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	mov	r0, r3
	bl	_ZL13REGISTER_2122h
	.loc 3 470 0
	bl	.L220	@ far jump
.L296:
	.align	2
.L295:
	.word	PPU
	.word	_ZZ9S9xSetPPUE8IncCount
	.word	_ZZ9S9xSetPPUE5Shift
	.word	IPPU
	.word	Memory
	.word	8474
	.word	2725
	.word	2724
	.word	2723
	.word	2134
	.word	2770
	.word	2136
	.word	2138
	.word	2140
	.word	2142
	.word	2767
	.word	2148
.L123:
	.loc 3 474 0
	ldr	r3, .L297
	ldr	r3, [r3, #20]
	ldr	r2, .L297+4
	add	r3, r3, r2
	ldrb	r3, [r3]
	add	r2, r7, #7
	ldrb	r2, [r2]
	cmp	r2, r3
	bne	.LCB3244
	bl	.L259	@far jump
.LCB3244:
	.loc 3 476 0
	ldr	r2, .L297+8
	mov	r3, #140
	lsl	r3, r3, #1
	ldr	r2, [r2, r3]
	mov	r3, #2
	and	r3, r3, r2
	cmp	r3, #0
	beq	.LCB3252
	bl	.L260	@far jump
.LCB3252:
.L186:
	.loc 3 477 0
	bl	_ZL12FLUSH_REDRAWv
	.loc 3 478 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #2
	and	r3, r3, r2
	mov	r1, r3
	sub	r3, r1, #1
	sbc	r1, r1, r3
	ldr	r2, .L297+12
	ldr	r3, .L297+16
	strb	r1, [r2, r3]
	.loc 3 479 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #32
	and	r3, r3, r2
	mov	r1, r3
	sub	r3, r1, #1
	sbc	r1, r1, r3
	ldr	r2, .L297+12
	ldr	r3, .L297+20
	strb	r1, [r2, r3]
	.loc 3 480 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #8
	and	r3, r3, r2
	mov	r1, r3
	sub	r3, r1, #1
	sbc	r1, r1, r3
	ldr	r2, .L297+12
	ldr	r3, .L297+24
	strb	r1, [r2, r3]
	.loc 3 481 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	lsl	r3, r3, #24
	asr	r3, r3, #24
	lsr	r1, r3, #31
	ldr	r2, .L297+12
	ldr	r3, .L297+28
	strb	r1, [r2, r3]
	.loc 3 482 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #1
	and	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r2, r3, #24
	mov	r3, #1
	eor	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	mov	r1, r3
	ldr	r2, .L297+12
	ldr	r3, .L297+32
	strb	r1, [r2, r3]
	.loc 3 483 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #16
	and	r3, r3, r2
	neg	r1, r3
	adc	r1, r1, r3
	ldr	r2, .L297+12
	ldr	r3, .L297+36
	strb	r1, [r2, r3]
	.loc 3 484 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #4
	and	r3, r3, r2
	neg	r1, r3
	adc	r1, r1, r3
	ldr	r2, .L297+12
	ldr	r3, .L297+40
	strb	r1, [r2, r3]
	.loc 3 485 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #64
	and	r3, r3, r2
	neg	r1, r3
	adc	r1, r1, r3
	ldr	r2, .L297+12
	ldr	r3, .L297+44
	strb	r1, [r2, r3]
	.loc 3 486 0
	ldr	r2, .L297+12
	ldr	r3, .L297+48
	mov	r1, #1
	strb	r1, [r2, r3]
	.loc 3 498 0
	bl	.L220	@ far jump
.L124:
	.loc 3 501 0
	ldr	r3, .L297
	ldr	r3, [r3, #20]
	ldr	r1, .L297+52
	add	r3, r3, r1
	ldrb	r3, [r3]
	add	r2, r7, #7
	ldrb	r2, [r2]
	cmp	r2, r3
	bne	.LCB3344
	bl	.L261	@far jump
.LCB3344:
	.loc 3 503 0
	ldr	r2, .L297+8
	mov	r3, #140
	lsl	r3, r3, #1
	ldr	r2, [r2, r3]
	mov	r3, #2
	and	r3, r3, r2
	cmp	r3, #0
	beq	.LCB3352
	bl	.L262	@far jump
.LCB3352:
.L189:
	.loc 3 504 0
	bl	_ZL12FLUSH_REDRAWv
	.loc 3 505 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #2
	and	r3, r3, r2
	mov	r1, r3
	sub	r3, r1, #1
	sbc	r1, r1, r3
	ldr	r2, .L297+12
	ldr	r3, .L297+56
	strb	r1, [r2, r3]
	.loc 3 506 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #32
	and	r3, r3, r2
	mov	r1, r3
	sub	r3, r1, #1
	sbc	r1, r1, r3
	ldr	r2, .L297+12
	ldr	r3, .L297+60
	strb	r1, [r2, r3]
	.loc 3 507 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #8
	and	r3, r3, r2
	mov	r1, r3
	sub	r3, r1, #1
	sbc	r1, r1, r3
	ldr	r2, .L297+12
	ldr	r3, .L297+64
	strb	r1, [r2, r3]
	.loc 3 508 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	lsl	r3, r3, #24
	asr	r3, r3, #24
	lsr	r1, r3, #31
	ldr	r2, .L297+12
	ldr	r3, .L297+68
	strb	r1, [r2, r3]
	.loc 3 509 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #1
	and	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r2, r3, #24
	mov	r3, #1
	eor	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	mov	r1, r3
	ldr	r2, .L297+12
	ldr	r3, .L297+72
	strb	r1, [r2, r3]
	.loc 3 510 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #16
	and	r3, r3, r2
	neg	r1, r3
	adc	r1, r1, r3
	ldr	r2, .L297+12
	ldr	r3, .L297+76
	strb	r1, [r2, r3]
	.loc 3 511 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #4
	and	r3, r3, r2
	neg	r1, r3
	adc	r1, r1, r3
	ldr	r2, .L297+12
	ldr	r3, .L297+80
	strb	r1, [r2, r3]
	.loc 3 512 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #64
	and	r3, r3, r2
	neg	r1, r3
	adc	r1, r1, r3
	ldr	r2, .L297+12
	ldr	r3, .L297+84
	strb	r1, [r2, r3]
	.loc 3 513 0
	ldr	r2, .L297+12
	ldr	r3, .L297+48
	mov	r1, #1
	strb	r1, [r2, r3]
	.loc 3 525 0
	bl	.L220	@ far jump
.L125:
	.loc 3 528 0
	ldr	r3, .L297
	ldr	r3, [r3, #20]
	ldr	r2, .L297+88
	add	r3, r3, r2
	ldrb	r3, [r3]
	add	r2, r7, #7
	ldrb	r2, [r2]
	cmp	r2, r3
	bne	.LCB3444
	bl	.L263	@far jump
.LCB3444:
	.loc 3 530 0
	ldr	r2, .L297+8
	mov	r3, #140
	lsl	r3, r3, #1
	ldr	r2, [r2, r3]
	mov	r3, #2
	and	r3, r3, r2
	cmp	r3, #0
	beq	.LCB3452
	bl	.L264	@far jump
.LCB3452:
.L191:
	.loc 3 531 0
	bl	_ZL12FLUSH_REDRAWv
	.loc 3 532 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #2
	and	r3, r3, r2
	mov	r1, r3
	sub	r3, r1, #1
	sbc	r1, r1, r3
	ldr	r2, .L297+12
	ldr	r3, .L297+92
	strb	r1, [r2, r3]
	.loc 3 533 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #32
	and	r3, r3, r2
	mov	r1, r3
	sub	r3, r1, #1
	sbc	r1, r1, r3
	ldr	r2, .L297+12
	ldr	r3, .L297+96
	strb	r1, [r2, r3]
	.loc 3 534 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #8
	and	r3, r3, r2
	mov	r1, r3
	sub	r3, r1, #1
	sbc	r1, r1, r3
	ldr	r2, .L297+12
	mov	r3, #172
	lsl	r3, r3, #4
	strb	r1, [r2, r3]
	.loc 3 535 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	lsl	r3, r3, #24
	asr	r3, r3, #24
	lsr	r1, r3, #31
	ldr	r2, .L297+12
	ldr	r3, .L297+100
	strb	r1, [r2, r3]
	.loc 3 536 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #1
	and	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r2, r3, #24
	mov	r3, #1
	eor	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	mov	r1, r3
	ldr	r2, .L297+12
	ldr	r3, .L297+104
	strb	r1, [r2, r3]
	.loc 3 537 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #16
	and	r3, r3, r2
	neg	r1, r3
	adc	r1, r1, r3
	ldr	r2, .L297+12
	ldr	r3, .L297+108
	strb	r1, [r2, r3]
	.loc 3 538 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #4
	and	r3, r3, r2
	neg	r1, r3
	adc	r1, r1, r3
	ldr	r2, .L297+12
	ldr	r3, .L297+112
	strb	r1, [r2, r3]
	.loc 3 539 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #64
	and	r3, r3, r2
	neg	r1, r3
	adc	r1, r1, r3
	ldr	r2, .L297+12
	ldr	r3, .L297+116
	strb	r1, [r2, r3]
	.loc 3 540 0
	ldr	r2, .L297+12
	ldr	r3, .L297+48
	mov	r1, #1
	strb	r1, [r2, r3]
	.loc 3 552 0
	bl	.L220	@ far jump
.L126:
	.loc 3 555 0
	ldr	r3, .L297
	ldr	r3, [r3, #20]
	ldr	r1, .L297+120
	add	r3, r3, r1
	ldrb	r3, [r3]
	add	r2, r7, #7
	ldrb	r2, [r2]
	cmp	r2, r3
	bne	.LCB3545
	bl	.L265	@far jump
.LCB3545:
	.loc 3 557 0
	ldr	r2, .L297+8
	mov	r3, #140
	lsl	r3, r3, #1
	ldr	r2, [r2, r3]
	mov	r3, #2
	and	r3, r3, r2
	cmp	r3, #0
	beq	.LCB3553
	bl	.L266	@far jump
.LCB3553:
.L193:
	.loc 3 558 0
	bl	_ZL12FLUSH_REDRAWv
	.loc 3 559 0
	ldr	r2, .L297+12
	add	r1, r7, #7
	ldr	r3, .L297+124
	ldrb	r1, [r1]
	strb	r1, [r2, r3]
	.loc 3 560 0
	ldr	r2, .L297+12
	ldr	r3, .L297+48
	mov	r1, #1
	strb	r1, [r2, r3]
	.loc 3 562 0
	bl	.L220	@ far jump
.L127:
	.loc 3 565 0
	ldr	r3, .L297
	ldr	r3, [r3, #20]
	ldr	r2, .L297+128
	add	r3, r3, r2
	ldrb	r3, [r3]
	add	r2, r7, #7
	ldrb	r2, [r2]
	cmp	r2, r3
	bne	.LCB3577
	bl	.L267	@far jump
.LCB3577:
	.loc 3 567 0
	ldr	r2, .L297+8
	mov	r3, #140
	lsl	r3, r3, #1
	ldr	r2, [r2, r3]
	mov	r3, #2
	and	r3, r3, r2
	cmp	r3, #0
	beq	.LCB3585
	bl	.L268	@far jump
.LCB3585:
.L195:
	.loc 3 568 0
	bl	_ZL12FLUSH_REDRAWv
	.loc 3 569 0
	ldr	r2, .L297+12
	add	r1, r7, #7
	ldr	r3, .L297+132
	ldrb	r1, [r1]
	strb	r1, [r2, r3]
	.loc 3 570 0
	ldr	r2, .L297+12
	ldr	r3, .L297+48
	mov	r1, #1
	strb	r1, [r2, r3]
	.loc 3 572 0
	bl	.L220	@ far jump
.L128:
	.loc 3 575 0
	ldr	r3, .L297
	ldr	r3, [r3, #20]
	ldr	r1, .L297+136
	add	r3, r3, r1
	ldrb	r3, [r3]
	add	r2, r7, #7
	ldrb	r2, [r2]
	cmp	r2, r3
	bne	.LCB3609
	bl	.L269	@far jump
.LCB3609:
	.loc 3 577 0
	ldr	r2, .L297+8
	mov	r3, #140
	lsl	r3, r3, #1
	ldr	r2, [r2, r3]
	mov	r3, #2
	and	r3, r3, r2
	cmp	r3, #0
	beq	.LCB3617
	bl	.L270	@far jump
.LCB3617:
.L197:
	.loc 3 578 0
	bl	_ZL12FLUSH_REDRAWv
	.loc 3 579 0
	ldr	r2, .L297+12
	add	r1, r7, #7
	ldr	r3, .L297+140
	ldrb	r1, [r1]
	strb	r1, [r2, r3]
	.loc 3 580 0
	ldr	r2, .L297+12
	ldr	r3, .L297+48
	mov	r1, #1
	strb	r1, [r2, r3]
	.loc 3 582 0
	bl	.L220	@ far jump
.L129:
	.loc 3 585 0
	ldr	r3, .L297
	ldr	r3, [r3, #20]
	ldr	r2, .L297+144
	add	r3, r3, r2
	ldrb	r3, [r3]
	add	r2, r7, #7
	ldrb	r2, [r2]
	cmp	r2, r3
	bne	.LCB3641
	bl	.L271	@far jump
.LCB3641:
	.loc 3 587 0
	ldr	r2, .L297+8
	mov	r3, #140
	lsl	r3, r3, #1
	ldr	r2, [r2, r3]
	mov	r3, #2
	and	r3, r3, r2
	cmp	r3, #0
	beq	.LCB3649
	bl	.L272	@far jump
.LCB3649:
.L199:
	.loc 3 588 0
	bl	_ZL12FLUSH_REDRAWv
	.loc 3 589 0
	ldr	r2, .L297+12
	add	r1, r7, #7
	ldr	r3, .L297+148
	ldrb	r1, [r1]
	strb	r1, [r2, r3]
	.loc 3 590 0
	ldr	r2, .L297+12
	ldr	r3, .L297+48
	mov	r1, #1
	strb	r1, [r2, r3]
	.loc 3 592 0
	bl	.L220	@ far jump
.L298:
	.align	2
.L297:
	.word	Memory
	.word	8483
	.word	Settings
	.word	PPU
	.word	2742
	.word	2743
	.word	2748
	.word	2749
	.word	2754
	.word	2755
	.word	2760
	.word	2761
	.word	2766
	.word	8484
	.word	2744
	.word	2745
	.word	2750
	.word	2751
	.word	2756
	.word	2757
	.word	2762
	.word	2763
	.word	8485
	.word	2746
	.word	2747
	.word	2753
	.word	2758
	.word	2759
	.word	2764
	.word	2765
	.word	8486
	.word	2726
	.word	8487
	.word	2727
	.word	8488
	.word	2728
	.word	8489
	.word	2729
.L130:
	.loc 3 595 0
	ldr	r3, .L299
	ldr	r3, [r3, #20]
	ldr	r1, .L299+4
	add	r3, r3, r1
	ldrb	r3, [r3]
	add	r2, r7, #7
	ldrb	r2, [r2]
	cmp	r2, r3
	bne	.LCB3716
	b	.L273	@long jump
.LCB3716:
	.loc 3 597 0
	ldr	r2, .L299+8
	mov	r3, #140
	lsl	r3, r3, #1
	ldr	r2, [r2, r3]
	mov	r3, #2
	and	r3, r3, r2
	cmp	r3, #0
	beq	.LCB3724
	b	.L274	@long jump
.LCB3724:
.L201:
	.loc 3 598 0
	bl	_ZL12FLUSH_REDRAWv
	.loc 3 599 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #3
	and	r2, r2, r3
	ldr	r1, .L299+12
	mov	r3, #171
	lsl	r3, r3, #4
	strb	r2, [r1, r3]
	.loc 3 600 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #12
	and	r3, r3, r2
	asr	r3, r3, #2
	lsl	r3, r3, #24
	lsr	r1, r3, #24
	ldr	r2, .L299+12
	ldr	r3, .L299+16
	strb	r1, [r2, r3]
	.loc 3 601 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #48
	and	r3, r3, r2
	asr	r3, r3, #4
	lsl	r3, r3, #24
	lsr	r1, r3, #24
	ldr	r2, .L299+12
	ldr	r3, .L299+20
	strb	r1, [r2, r3]
	.loc 3 602 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	lsr	r3, r3, #6
	lsl	r3, r3, #24
	lsr	r1, r3, #24
	ldr	r2, .L299+12
	ldr	r3, .L299+24
	strb	r1, [r2, r3]
	.loc 3 603 0
	ldr	r2, .L299+12
	ldr	r3, .L299+28
	mov	r1, #1
	strb	r1, [r2, r3]
	.loc 3 605 0
	b	.L220
.L131:
	.loc 3 608 0
	ldr	r3, .L299
	ldr	r3, [r3, #20]
	ldr	r2, .L299+32
	add	r3, r3, r2
	ldrb	r3, [r3]
	add	r2, r7, #7
	ldrb	r2, [r2]
	cmp	r2, r3
	bne	.LCB3779
	b	.L275	@long jump
.LCB3779:
	.loc 3 610 0
	ldr	r2, .L299+8
	mov	r3, #140
	lsl	r3, r3, #1
	ldr	r2, [r2, r3]
	mov	r3, #2
	and	r3, r3, r2
	cmp	r3, #0
	beq	.LCB3787
	b	.L276	@long jump
.LCB3787:
.L203:
	.loc 3 611 0
	bl	_ZL12FLUSH_REDRAWv
	.loc 3 612 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	mov	r2, #3
	and	r3, r3, r2
	ldr	r1, .L299+12
	ldr	r2, .L299+36
	strb	r3, [r1, r2]
	.loc 3 613 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #12
	and	r3, r3, r2
	asr	r3, r3, #2
	lsl	r3, r3, #24
	lsr	r1, r3, #24
	ldr	r2, .L299+12
	ldr	r3, .L299+40
	strb	r1, [r2, r3]
	.loc 3 614 0
	ldr	r2, .L299+12
	ldr	r3, .L299+28
	mov	r1, #1
	strb	r1, [r2, r3]
	.loc 3 616 0
	b	.L220
.L132:
	.loc 3 619 0
	ldr	r3, .L299
	ldr	r3, [r3, #20]
	ldr	r1, .L299+44
	add	r3, r3, r1
	ldrb	r3, [r3]
	add	r2, r7, #7
	ldrb	r2, [r2]
	cmp	r2, r3
	bne	.LCB3823
	b	.L277	@long jump
.LCB3823:
	.loc 3 621 0
	bl	_ZL12FLUSH_REDRAWv
	.loc 3 622 0
	ldr	r2, .L299+12
	ldr	r3, .L299+28
	mov	r1, #1
	strb	r1, [r2, r3]
	.loc 3 623 0
	ldr	r3, .L299
	ldr	r2, [r3, #20]
	add	r3, r7, #4
	ldrh	r3, [r3]
	add	r3, r2, r3
	add	r2, r7, #7
	ldrb	r2, [r2]
	strb	r2, [r3]
	.loc 3 624 0
	b	.L243
.L133:
	.loc 3 629 0
	ldr	r3, .L299
	ldr	r3, [r3, #20]
	ldr	r2, .L299+48
	add	r3, r3, r2
	ldrb	r3, [r3]
	add	r2, r7, #7
	ldrb	r2, [r2]
	cmp	r2, r3
	bne	.LCB3849
	b	.L278	@long jump
.LCB3849:
	.loc 3 631 0
	bl	_ZL12FLUSH_REDRAWv
	.loc 3 636 0
	ldr	r2, .L299+12
	ldr	r3, .L299+28
	mov	r1, #1
	strb	r1, [r2, r3]
	.loc 3 637 0
	ldr	r3, .L299
	ldr	r2, [r3, #20]
	add	r3, r7, #4
	ldrh	r3, [r3]
	add	r3, r2, r3
	add	r2, r7, #7
	ldrb	r2, [r2]
	strb	r2, [r3]
	.loc 3 638 0
	b	.L243
.L134:
	.loc 3 643 0
	ldr	r3, .L299
	ldr	r3, [r3, #20]
	ldr	r1, .L299+52
	add	r3, r3, r1
	ldrb	r3, [r3]
	add	r2, r7, #7
	ldrb	r2, [r2]
	cmp	r2, r3
	bne	.LCB3875
	b	.L279	@long jump
.LCB3875:
	.loc 3 645 0
	bl	_ZL12FLUSH_REDRAWv
	.loc 3 646 0
	ldr	r2, .L299+12
	ldr	r3, .L299+28
	mov	r1, #1
	strb	r1, [r2, r3]
	.loc 3 648 0
	b	.L220
.L135:
	.loc 3 651 0
	ldr	r3, .L299
	ldr	r3, [r3, #20]
	ldr	r2, .L299+56
	add	r3, r3, r2
	ldrb	r3, [r3]
	add	r2, r7, #7
	ldrb	r2, [r2]
	cmp	r2, r3
	bne	.LCB3893
	b	.L280	@long jump
.LCB3893:
	.loc 3 653 0
	bl	_ZL12FLUSH_REDRAWv
	.loc 3 654 0
	ldr	r2, .L299+12
	ldr	r3, .L299+28
	mov	r1, #1
	strb	r1, [r2, r3]
	.loc 3 656 0
	b	.L220
.L136:
	.loc 3 659 0
	ldr	r3, .L299
	ldr	r3, [r3, #20]
	ldr	r1, .L299+60
	add	r3, r3, r1
	ldrb	r3, [r3]
	add	r2, r7, #7
	ldrb	r2, [r2]
	cmp	r2, r3
	bne	.LCB3911
	b	.L281	@long jump
.LCB3911:
	.loc 3 661 0
	ldr	r2, .L299+8
	mov	r3, #140
	lsl	r3, r3, #1
	ldr	r2, [r2, r3]
	mov	r3, #4
	and	r3, r3, r2
	cmp	r3, #0
	beq	.LCB3919
	b	.L282	@long jump
.LCB3919:
.L209:
	.loc 3 662 0
	bl	_ZL12FLUSH_REDRAWv
	.loc 3 663 0
	ldr	r2, .L299+12
	ldr	r3, .L299+28
	mov	r1, #1
	strb	r1, [r2, r3]
	.loc 3 670 0
	b	.L220
.L137:
	.loc 3 673 0
	ldr	r3, .L299
	ldr	r3, [r3, #20]
	ldr	r2, .L299+64
	add	r3, r3, r2
	ldrb	r3, [r3]
	add	r2, r7, #7
	ldrb	r2, [r2]
	cmp	r2, r3
	bne	.LCB3938
	b	.L283	@long jump
.LCB3938:
	.loc 3 675 0
	ldr	r2, .L299+8
	mov	r3, #140
	lsl	r3, r3, #1
	ldr	r2, [r2, r3]
	mov	r3, #4
	and	r3, r3, r2
	cmp	r3, #0
	beq	.LCB3946
	b	.L284	@long jump
.LCB3946:
.L211:
	.loc 3 676 0
	bl	_ZL12FLUSH_REDRAWv
	.loc 3 696 0
	ldr	r3, .L299
	ldr	r3, [r3, #20]
	ldr	r1, .L299+64
	add	r3, r3, r1
	add	r2, r7, #7
	ldrb	r2, [r2]
	strb	r2, [r3]
	.loc 3 698 0
	b	.L220
.L138:
	.loc 3 700 0
	ldr	r3, .L299
	ldr	r3, [r3, #20]
	ldr	r2, .L299+68
	add	r3, r3, r2
	ldrb	r3, [r3]
	add	r2, r7, #7
	ldrb	r2, [r2]
	cmp	r2, r3
	bne	.LCB3968
	b	.L285	@long jump
.LCB3968:
.LBB12:
	.loc 3 705 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	lsl	r3, r3, #24
	asr	r3, r3, #24
	cmp	r3, #0
	bge	.L213
	.loc 3 707 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #31
	and	r3, r3, r2
	str	r3, [r7, #12]
	.loc 3 708 0
	ldr	r2, .L299+12
	ldr	r3, .L299+72
	ldrb	r3, [r2, r3]
	mov	r2, r3
	ldr	r3, [r7, #12]
	cmp	r2, r3
	beq	.L213
	ldr	r2, .L299+8
	mov	r3, #140
	lsl	r3, r3, #1
	ldr	r2, [r2, r3]
	mov	r3, #1
	and	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r2, r3, #24
	mov	r3, #1
	eor	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	beq	.L214
	bl	_ZL12FLUSH_REDRAWv
.L214:
	ldr	r3, [r7, #12]
	lsl	r3, r3, #24
	lsr	r1, r3, #24
	ldr	r2, .L299+12
	ldr	r3, .L299+72
	strb	r1, [r2, r3]
.L213:
	.loc 3 710 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #64
	and	r3, r3, r2
	cmp	r3, #0
	beq	.L215
	.loc 3 712 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #31
	and	r3, r3, r2
	str	r3, [r7, #12]
	.loc 3 713 0
	ldr	r2, .L299+12
	ldr	r3, .L299+76
	ldrb	r3, [r2, r3]
	mov	r2, r3
	ldr	r3, [r7, #12]
	cmp	r2, r3
	beq	.L215
	ldr	r2, .L299+8
	mov	r3, #140
	lsl	r3, r3, #1
	ldr	r2, [r2, r3]
	mov	r3, #1
	and	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r2, r3, #24
	mov	r3, #1
	eor	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	beq	.L216
	bl	_ZL12FLUSH_REDRAWv
.L216:
	ldr	r3, [r7, #12]
	lsl	r3, r3, #24
	lsr	r1, r3, #24
	ldr	r2, .L299+12
	ldr	r3, .L299+76
	strb	r1, [r2, r3]
.L215:
	.loc 3 715 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #32
	and	r3, r3, r2
	cmp	r3, #0
	bne	.LCB4061
	b	.L286	@long jump
.LCB4061:
	.loc 3 717 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #31
	and	r3, r3, r2
	str	r3, [r7, #12]
	.loc 3 718 0
	ldr	r2, .L299+12
	ldr	r3, .L299+80
	ldrb	r3, [r2, r3]
	mov	r2, r3
	ldr	r3, [r7, #12]
	cmp	r2, r3
	bne	.LCB4073
	b	.L287	@long jump
.LCB4073:
	ldr	r2, .L299+8
	mov	r3, #140
	lsl	r3, r3, #1
	ldr	r2, [r2, r3]
	mov	r3, #1
	and	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r2, r3, #24
	mov	r3, #1
	eor	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	beq	.L217
	bl	_ZL12FLUSH_REDRAWv
.L217:
	ldr	r3, [r7, #12]
	lsl	r3, r3, #24
	lsr	r1, r3, #24
	ldr	r2, .L299+12
	ldr	r3, .L299+80
	strb	r1, [r2, r3]
.LBE12:
	.loc 3 731 0
	b	.L220
.L139:
	.loc 3 734 0
	ldr	r3, .L299
	ldr	r3, [r3, #20]
	ldr	r1, .L299+84
	add	r3, r3, r1
	ldrb	r3, [r3]
	add	r2, r7, #7
	ldrb	r2, [r2]
	cmp	r2, r3
	bne	.LCB4110
	b	.L288	@long jump
.LCB4110:
	.loc 3 742 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #4
	and	r3, r3, r2
	cmp	r3, #0
	beq	.L219
	.loc 3 744 0
	ldr	r2, .L299+12
	ldr	r3, .L299+88
	mov	r1, #239
	strh	r1, [r2, r3]
	.loc 3 759 0
	b	.L220
.L219:
	.loc 3 750 0
	ldr	r2, .L299+12
	ldr	r3, .L299+88
	mov	r1, #224
	strh	r1, [r2, r3]
	.loc 3 759 0
	b	.L220
.L300:
	.align	2
.L299:
	.word	Memory
	.word	8490
	.word	Settings
	.word	PPU
	.word	2737
	.word	2738
	.word	2739
	.word	2766
	.word	8491
	.word	2740
	.word	2741
	.word	8492
	.word	8493
	.word	8494
	.word	8495
	.word	8496
	.word	8497
	.word	8498
	.word	2151
	.word	2150
	.word	2149
	.word	8499
	.word	2154
.L148:
	.loc 3 857 0
	ldr	r3, .L301
	ldr	r2, [r3, #20]
	add	r3, r7, #4
	ldrh	r3, [r3]
	add	r3, r2, r3
	add	r2, r7, #7
	ldrb	r2, [r2]
	strb	r2, [r3]
	.loc 3 858 0
	ldr	r3, .L301+4
	ldr	r2, [r3, #68]
	add	r3, r7, #4
	ldrh	r1, [r3]
	mov	r3, #3
	and	r3, r3, r1
	add	r3, r3, #244
	add	r3, r2, r3
	add	r2, r7, #7
	ldrb	r2, [r2]
	strb	r2, [r3]
	.loc 3 864 0
	b	.L220
.L149:
	.loc 3 866 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	mov	r0, r3
	bl	_ZL13REGISTER_2180h
	.loc 3 867 0
	b	.L220
.L150:
	.loc 3 869 0
	ldr	r2, .L301+8
	ldr	r3, .L301+12
	ldr	r2, [r2, r3]
	ldr	r3, .L301+16
	mov	r1, r2
	and	r1, r1, r3
	ldr	r2, .L301+8
	ldr	r3, .L301+12
	str	r1, [r2, r3]
	.loc 3 870 0
	ldr	r2, .L301+8
	ldr	r3, .L301+12
	ldr	r2, [r2, r3]
	add	r3, r7, #7
	ldrb	r3, [r3]
	mov	r1, r2
	orr	r1, r1, r3
	ldr	r2, .L301+8
	ldr	r3, .L301+12
	str	r1, [r2, r3]
	.loc 3 871 0
	b	.L220
.L151:
	.loc 3 873 0
	ldr	r2, .L301+8
	ldr	r3, .L301+12
	ldr	r2, [r2, r3]
	ldr	r3, .L301+20
	mov	r1, r2
	and	r1, r1, r3
	ldr	r2, .L301+8
	ldr	r3, .L301+12
	str	r1, [r2, r3]
	.loc 3 874 0
	ldr	r2, .L301+8
	ldr	r3, .L301+12
	ldr	r2, [r2, r3]
	add	r3, r7, #7
	ldrb	r3, [r3]
	lsl	r3, r3, #8
	mov	r1, r2
	orr	r1, r1, r3
	ldr	r2, .L301+8
	ldr	r3, .L301+12
	str	r1, [r2, r3]
	.loc 3 875 0
	mov	r8, r8
	b	.L220
.L152:
	.loc 3 877 0
	ldr	r2, .L301+8
	ldr	r3, .L301+12
	ldr	r3, [r2, r3]
	lsl	r3, r3, #16
	lsr	r1, r3, #16
	ldr	r2, .L301+8
	ldr	r3, .L301+12
	str	r1, [r2, r3]
	.loc 3 878 0
	ldr	r2, .L301+8
	ldr	r3, .L301+12
	ldr	r2, [r2, r3]
	add	r3, r7, #7
	ldrb	r3, [r3]
	lsl	r3, r3, #16
	mov	r1, r2
	orr	r1, r1, r3
	ldr	r2, .L301+8
	ldr	r3, .L301+12
	str	r1, [r2, r3]
	.loc 3 879 0
	ldr	r2, .L301+8
	ldr	r3, .L301+12
	ldr	r3, [r2, r3]
	lsl	r3, r3, #15
	lsr	r1, r3, #15
	ldr	r2, .L301+8
	ldr	r3, .L301+12
	str	r1, [r2, r3]
	b	.L220
.L86:
	.loc 3 897 0
	add	r3, r7, #4
	ldrh	r2, [r3]
	ldr	r3, .L301+24
	cmp	r2, r3
	bne	.L221
	ldr	r2, .L301+28
	mov	r3, #68
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	beq	.L221
	.loc 3 898 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	add	r3, r7, #4
	ldrh	r3, [r3]
	mov	r0, r2
	mov	r1, r3
	bl	_Z10S9xSetSRTCht
	.loc 3 897 0
	b	.L220
.L221:
	.loc 3 899 0
	add	r3, r7, #4
	ldrh	r2, [r3]
	ldr	r3, .L301+32
	cmp	r2, r3
	bhi	.LCB4296
	b	.L220	@long jump
.LCB4296:
	add	r3, r7, #4
	ldrh	r2, [r3]
	ldr	r3, .L301+36
	cmp	r2, r3
	bls	.LCB4301
	b	.L220	@long jump
.LCB4301:
.L222:
	.loc 3 916 0
	ldr	r2, .L301+28
	mov	r3, #80
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	bne	.LCB4307
	b	.L289	@long jump
.LCB4307:
.L223:
	.loc 3 919 0
	add	r3, r7, #4
	ldrh	r3, [r3]
	ldr	r2, .L301+40
	add	r3, r3, r2
	cmp	r3, #32
	bls	.LCB4314
	b	.L224	@long jump
.LCB4314:
	lsl	r2, r3, #2
	ldr	r3, .L301+44
	add	r3, r2, r3
	ldr	r3, [r3]
	mov	pc, r3
	.section	.rodata
	.align	2
.L237:
	.word	.L225
	.word	.L224
	.word	.L224
	.word	.L224
	.word	.L224
	.word	.L224
	.word	.L224
	.word	.L224
	.word	.L224
	.word	.L224
	.word	.L224
	.word	.L224
	.word	.L224
	.word	.L224
	.word	.L224
	.word	.L224
	.word	.L224
	.word	.L226
	.word	.L227
	.word	.L224
	.word	.L228
	.word	.L229
	.word	.L224
	.word	.L230
	.word	.L231
	.word	.L232
	.word	.L233
	.word	.L234
	.word	.L235
	.word	.L224
	.word	.L224
	.word	.L224
	.word	.L236
	.text
.L226:
	.loc 3 922 0
	ldr	r3, .L301
	ldr	r3, [r3, #20]
	ldr	r1, .L301+48
	add	r3, r3, r1
	ldrb	r2, [r3]
	add	r3, r7, #7
	ldrb	r3, [r3]
	eor	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	mov	r2, r3
	mov	r3, #32
	and	r3, r3, r2
	cmp	r3, #0
	beq	.L238
	.loc 3 924 0
	ldr	r3, .L301
	ldr	r2, [r3, #20]
	add	r3, r7, #4
	ldrh	r3, [r3]
	add	r3, r2, r3
	add	r2, r7, #7
	ldrb	r2, [r2]
	strb	r2, [r3]
	.loc 3 926 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #32
	and	r3, r3, r2
	cmp	r3, #0
	beq	.L239
	.loc 3 927 0
	bl	S9xSuperFXExec
	b	.L240
.L239:
	.loc 3 929 0
	bl	_Z12FxFlushCachev
.L240:
	b	.L241
.L238:
	.loc 3 932 0
	ldr	r3, .L301
	ldr	r2, [r3, #20]
	add	r3, r7, #4
	ldrh	r3, [r3]
	add	r3, r2, r3
	add	r2, r7, #7
	ldrb	r2, [r2]
	strb	r2, [r3]
.L241:
	.loc 3 933 0
	b	.L242
.L227:
	.loc 3 936 0
	ldr	r3, .L301
	ldr	r2, [r3, #20]
	add	r3, r7, #4
	ldrh	r3, [r3]
	add	r3, r2, r3
	add	r2, r7, #7
	ldrb	r2, [r2]
	strb	r2, [r3]
	.loc 3 937 0
	b	.L242
.L228:
	.loc 3 939 0
	ldr	r3, .L301
	ldr	r2, [r3, #20]
	add	r3, r7, #4
	ldrh	r3, [r3]
	add	r3, r2, r3
	add	r2, r7, #7
	ldrb	r2, [r2]
	strb	r2, [r3]
	.loc 3 940 0
	b	.L242
.L229:
	.loc 3 942 0
	ldr	r3, .L301
	ldr	r2, [r3, #20]
	add	r3, r7, #4
	ldrh	r3, [r3]
	add	r2, r2, r3
	add	r3, r7, #7
	ldrb	r3, [r3]
	mov	r1, #127
	and	r3, r3, r1
	strb	r3, [r2]
	.loc 3 943 0
	b	.L242
.L230:
	.loc 3 945 0
	ldr	r3, .L301
	ldr	r2, [r3, #20]
	add	r3, r7, #4
	ldrh	r3, [r3]
	add	r2, r2, r3
	add	r3, r7, #7
	ldrb	r3, [r3]
	mov	r1, #127
	and	r3, r3, r1
	strb	r3, [r2]
	.loc 3 946 0
	b	.L242
.L231:
	.loc 3 948 0
	ldr	r3, .L301
	ldr	r2, [r3, #20]
	add	r3, r7, #4
	ldrh	r3, [r3]
	add	r3, r2, r3
	add	r2, r7, #7
	ldrb	r2, [r2]
	strb	r2, [r3]
	.loc 3 949 0
	b	.L242
.L232:
	.loc 3 951 0
	ldr	r3, .L301
	ldr	r2, [r3, #20]
	add	r3, r7, #4
	ldrh	r3, [r3]
	add	r3, r2, r3
	add	r2, r7, #7
	ldrb	r2, [r2]
	strb	r2, [r3]
	.loc 3 952 0
	b	.L242
.L233:
	.loc 3 954 0
	ldr	r3, .L301
	ldr	r2, [r3, #20]
	add	r3, r7, #4
	ldrh	r3, [r3]
	add	r3, r2, r3
	add	r2, r7, #7
	ldrb	r2, [r2]
	strb	r2, [r3]
	.loc 3 955 0
	b	.L242
.L234:
	.loc 3 957 0
	ldr	r3, .L301
	ldr	r2, [r3, #20]
	add	r3, r7, #4
	ldrh	r3, [r3]
	add	r3, r2, r3
	add	r2, r7, #7
	ldrb	r2, [r2]
	strb	r2, [r3]
	.loc 3 958 0
	b	.L242
.L235:
	.loc 3 960 0
	b	.L242
.L236:
	.loc 3 962 0
	ldr	r3, .L301
	ldr	r2, [r3, #20]
	add	r3, r7, #4
	ldrh	r3, [r3]
	add	r3, r2, r3
	add	r2, r7, #7
	ldrb	r2, [r2]
	strb	r2, [r3]
	.loc 3 963 0
	b	.L242
.L225:
	.loc 3 965 0
	ldr	r3, .L301
	ldr	r2, [r3, #20]
	add	r3, r7, #4
	ldrh	r3, [r3]
	add	r3, r2, r3
	add	r2, r7, #7
	ldrb	r2, [r2]
	strb	r2, [r3]
	.loc 3 966 0
	ldr	r3, .L301
	ldr	r3, [r3, #20]
	ldr	r1, .L301+48
	add	r2, r3, r1
	ldr	r3, .L301
	ldr	r3, [r3, #20]
	ldr	r1, .L301+48
	add	r3, r3, r1
	ldrb	r1, [r3]
	mov	r3, #32
	orr	r3, r3, r1
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	strb	r3, [r2]
	.loc 3 967 0
	bl	S9xSuperFXExec
	.loc 3 968 0
	b	.L243
.L224:
	.loc 3 971 0
	ldr	r3, .L301
	ldr	r2, [r3, #20]
	add	r3, r7, #4
	ldrh	r3, [r3]
	add	r3, r2, r3
	add	r2, r7, #7
	ldrb	r2, [r2]
	strb	r2, [r3]
	.loc 3 972 0
	add	r3, r7, #4
	ldrh	r2, [r3]
	ldr	r3, .L301+52
	cmp	r2, r3
	bhi	.LCB4536
	b	.L290	@long jump
.LCB4536:
	.loc 3 974 0
	add	r3, r7, #4
	ldrh	r3, [r3]
	mov	r0, r3
	bl	_Z18FxCacheWriteAccesst
	.loc 3 978 0
	b	.L243
.L242:
	b	.L243
.L244:
	.loc 3 879 0
	mov	r8, r8
	b	.L220
.L246:
	.loc 3 174 0
	mov	r8, r8
	b	.L220
.L247:
	mov	r8, r8
	b	.L220
.L248:
	.loc 3 186 0
	mov	r8, r8
	b	.L220
.L249:
	.loc 3 201 0
	mov	r8, r8
	b	.L220
.L250:
	.loc 3 247 0
	mov	r8, r8
	b	.L220
.L251:
	.loc 3 264 0
	mov	r8, r8
	b	.L220
.L252:
	.loc 3 272 0
	mov	r8, r8
	b	.L220
.L253:
	.loc 3 281 0
	mov	r8, r8
	b	.L220
.L254:
	.loc 3 290 0
	mov	r8, r8
	b	.L220
.L255:
	.loc 3 299 0
	mov	r8, r8
	b	.L220
.L256:
	.loc 3 308 0
	mov	r8, r8
	b	.L220
.L257:
	.loc 3 317 0
	mov	r8, r8
	b	.L220
.L258:
	.loc 3 433 0
	mov	r8, r8
	b	.L220
.L259:
	.loc 3 498 0
	mov	r8, r8
	b	.L220
.L261:
	.loc 3 525 0
	mov	r8, r8
	b	.L220
.L263:
	.loc 3 552 0
	mov	r8, r8
	b	.L220
.L265:
	.loc 3 562 0
	mov	r8, r8
	b	.L220
.L267:
	.loc 3 572 0
	mov	r8, r8
	b	.L220
.L269:
	.loc 3 582 0
	mov	r8, r8
	b	.L220
.L271:
	.loc 3 592 0
	mov	r8, r8
	b	.L220
.L273:
	.loc 3 605 0
	mov	r8, r8
	b	.L220
.L275:
	.loc 3 616 0
	mov	r8, r8
	b	.L220
.L277:
	.loc 3 626 0
	mov	r8, r8
	b	.L220
.L278:
	.loc 3 640 0
	mov	r8, r8
	b	.L220
.L279:
	.loc 3 648 0
	mov	r8, r8
	b	.L220
.L280:
	.loc 3 656 0
	mov	r8, r8
	b	.L220
.L281:
	.loc 3 670 0
	mov	r8, r8
	b	.L220
.L283:
	.loc 3 698 0
	mov	r8, r8
	b	.L220
.L285:
	.loc 3 731 0
	mov	r8, r8
	b	.L220
.L286:
	mov	r8, r8
	b	.L220
.L287:
	mov	r8, r8
	b	.L220
.L302:
	.align	2
.L301:
	.word	Memory
	.word	IAPU
	.word	PPU
	.word	2156
	.word	130816
	.word	65791
	.word	10241
	.word	Settings
	.word	12287
	.word	13055
	.word	-12319
	.word	.L237
	.word	12336
	.word	12543
.L288:
	.loc 3 759 0
	mov	r8, r8
.L220:
	.loc 3 981 0
	ldr	r3, .L303
	ldr	r2, [r3, #20]
	add	r3, r7, #4
	ldrh	r3, [r3]
	add	r3, r2, r3
	add	r2, r7, #7
	ldrb	r2, [r2]
	strb	r2, [r3]
	b	.L243
.L245:
	.loc 3 764 0
	mov	r8, r8
	b	.L243
.L260:
	.loc 3 476 0
	mov	r8, r8
	b	.L243
.L262:
	.loc 3 503 0
	mov	r8, r8
	b	.L243
.L264:
	.loc 3 530 0
	mov	r8, r8
	b	.L243
.L266:
	.loc 3 557 0
	mov	r8, r8
	b	.L243
.L268:
	.loc 3 567 0
	mov	r8, r8
	b	.L243
.L270:
	.loc 3 577 0
	mov	r8, r8
	b	.L243
.L272:
	.loc 3 587 0
	mov	r8, r8
	b	.L243
.L274:
	.loc 3 597 0
	mov	r8, r8
	b	.L243
.L276:
	.loc 3 610 0
	mov	r8, r8
	b	.L243
.L282:
	.loc 3 661 0
	mov	r8, r8
	b	.L243
.L284:
	.loc 3 675 0
	mov	r8, r8
	b	.L243
.L289:
	.loc 3 917 0
	mov	r8, r8
	b	.L243
.L290:
	.loc 3 978 0
	mov	r8, r8
.L243:
.LBE10:
	.loc 3 982 0
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed for prologue
	pop	{r7, pc}
.L304:
	.align	2
.L303:
	.word	Memory
.LFE30:
	.fnend
	.size	S9xSetPPU, .-S9xSetPPU
	.align	2
	.global	S9xGetPPU
	.hidden	S9xGetPPU
	.code	16
	.thumb_func
	.type	S9xGetPPU, %function
S9xGetPPU:
	.fnstart
.LFB31:
	.loc 3 989 0
	.save	{r7, lr}
	push	{r7, lr}
.LCFI30:
	.pad #48
	sub	sp, sp, #48
.LCFI31:
	.setfp r7, sp, #0
	add	r7, sp, #0
.LCFI32:
	mov	r2, r0
	add	r3, r7, #6
	strh	r2, [r3]
.LBB13:
	.loc 3 990 0
	mov	r3, r7
	add	r3, r3, #11
	mov	r2, #0
	strb	r2, [r3]
	.loc 3 992 0
	add	r3, r7, #6
	ldrh	r2, [r3]
	ldr	r3, .L384
	cmp	r2, r3
	bls	.LCB4844
	b	.L306	@long jump
.LCB4844:
	.loc 3 994 0
	add	r3, r7, #6
	ldrh	r3, [r3]
	ldr	r0, .L384+4
	add	r3, r3, r0
	cmp	r3, #144
	bls	.LCB4850
	b	.L307	@long jump
.LCB4850:
	lsl	r2, r3, #2
	ldr	r3, .L384+8
	add	r3, r2, r3
	ldr	r3, [r3]
	mov	pc, r3
	.section	.rodata
	.align	2
.L334:
	.word	.L308
	.word	.L308
	.word	.L309
	.word	.L310
	.word	.L311
	.word	.L311
	.word	.L311
	.word	.L311
	.word	.L311
	.word	.L311
	.word	.L311
	.word	.L311
	.word	.L311
	.word	.L312
	.word	.L312
	.word	.L312
	.word	.L312
	.word	.L312
	.word	.L312
	.word	.L312
	.word	.L312
	.word	.L313
	.word	.L314
	.word	.L315
	.word	.L316
	.word	.L316
	.word	.L316
	.word	.L317
	.word	.L317
	.word	.L317
	.word	.L317
	.word	.L317
	.word	.L317
	.word	.L318
	.word	.L319
	.word	.L319
	.word	.L319
	.word	.L319
	.word	.L319
	.word	.L319
	.word	.L319
	.word	.L319
	.word	.L319
	.word	.L319
	.word	.L319
	.word	.L319
	.word	.L319
	.word	.L319
	.word	.L319
	.word	.L319
	.word	.L319
	.word	.L319
	.word	.L320
	.word	.L320
	.word	.L320
	.word	.L321
	.word	.L322
	.word	.L323
	.word	.L324
	.word	.L325
	.word	.L326
	.word	.L327
	.word	.L328
	.word	.L329
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L330
	.word	.L331
	.word	.L332
	.word	.L332
	.word	.L332
	.word	.L307
	.word	.L307
	.word	.L307
	.word	.L307
	.word	.L307
	.word	.L307
	.word	.L307
	.word	.L307
	.word	.L307
	.word	.L307
	.word	.L307
	.word	.L307
	.word	.L333
	.text
.L308:
	.loc 3 998 0
	ldr	r3, .L384+12
	ldr	r2, [r3, #20]
	add	r3, r7, #6
	ldrh	r3, [r3]
	add	r3, r2, r3
	ldrb	r3, [r3]
	bl	.L335	@ far jump
.L309:
	.loc 3 1003 0
	ldr	r2, .L384+16
	ldr	r3, .L384+20
	ldrh	r3, [r2, r3]
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	bl	.L335	@ far jump
.L310:
	.loc 3 1005 0
	ldr	r2, .L384+16
	ldr	r3, .L384+20
	ldrh	r3, [r2, r3]
	asr	r3, r3, #8
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	mov	r2, #1
	and	r3, r3, r2
	ldr	r1, .L384+16
	ldr	r2, .L384+24
	ldrb	r2, [r1, r2]
	lsl	r2, r2, #7
	lsl	r2, r2, #24
	lsr	r1, r2, #24
	add	r2, r3, #0
	add	r3, r1, #0
	orr	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	bl	.L335	@ far jump
.L311:
	.loc 3 1015 0
	ldr	r3, .L384+12
	ldr	r2, [r3, #20]
	add	r3, r7, #6
	ldrh	r3, [r3]
	add	r3, r2, r3
	ldrb	r3, [r3]
	bl	.L335	@ far jump
.L312:
	.loc 3 1027 0
	ldr	r3, .L384+12
	ldr	r2, [r3, #20]
	add	r3, r7, #6
	ldrh	r3, [r3]
	add	r3, r2, r3
	ldrb	r3, [r3]
	bl	.L335	@ far jump
.L313:
	.loc 3 1029 0
	ldr	r3, .L384+12
	ldr	r2, [r3, #20]
	add	r3, r7, #6
	ldrh	r3, [r3]
	add	r3, r2, r3
	ldrb	r3, [r3]
	bl	.L335	@ far jump
.L314:
	.loc 3 1031 0
	ldr	r3, .L384+16
	ldrh	r3, [r3, #6]
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	bl	.L335	@ far jump
.L315:
	.loc 3 1033 0
	ldr	r3, .L384+16
	ldrh	r3, [r3, #6]
	asr	r3, r3, #8
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	bl	.L335	@ far jump
.L316:
	.loc 3 1037 0
	ldr	r3, .L384+12
	ldr	r2, [r3, #20]
	add	r3, r7, #6
	ldrh	r3, [r3]
	add	r3, r2, r3
	ldrb	r3, [r3]
	b	.L335
.L317:
	.loc 3 1047 0
	ldr	r3, .L384+12
	ldr	r2, [r3, #20]
	add	r3, r7, #6
	ldrh	r3, [r3]
	add	r3, r2, r3
	ldrb	r3, [r3]
	b	.L335
.L318:
	.loc 3 1049 0
	ldr	r2, .L384+16
	ldr	r3, .L384+28
	ldrb	r3, [r2, r3]
	b	.L335
.L319:
	.loc 3 1068 0
	ldr	r3, .L384+12
	ldr	r2, [r3, #20]
	add	r3, r7, #6
	ldrh	r3, [r3]
	add	r3, r2, r3
	ldrb	r3, [r3]
	b	.L335
.L320:
	.loc 3 1074 0
	ldr	r2, .L384+16
	ldr	r3, .L384+32
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	beq	.L336
.LBB14:
	.loc 3 1076 0
	ldr	r2, .L384+16
	ldr	r3, .L384+36
	ldrh	r3, [r2, r3]
	lsl	r3, r3, #16
	asr	r3, r3, #16
	ldr	r1, .L384+16
	ldr	r2, .L384+40
	ldrh	r2, [r1, r2]
	lsl	r2, r2, #16
	asr	r2, r2, #16
	asr	r2, r2, #8
	mul	r3, r2
	str	r3, [r7, #12]
	.loc 3 1078 0
	ldr	r3, .L384+12
	ldr	r3, [r3, #20]
	ldr	r1, .L384+44
	add	r3, r3, r1
	ldr	r2, [r7, #12]
	lsl	r2, r2, #24
	lsr	r2, r2, #24
	strb	r2, [r3]
	.loc 3 1079 0
	ldr	r3, .L384+12
	ldr	r3, [r3, #20]
	ldr	r2, .L384+48
	add	r3, r3, r2
	ldr	r2, [r7, #12]
	asr	r2, r2, #8
	lsl	r2, r2, #24
	lsr	r2, r2, #24
	strb	r2, [r3]
	.loc 3 1080 0
	ldr	r3, .L384+12
	ldr	r3, [r3, #20]
	ldr	r0, .L384+52
	add	r3, r3, r0
	ldr	r2, [r7, #12]
	asr	r2, r2, #16
	lsl	r2, r2, #24
	lsr	r2, r2, #24
	strb	r2, [r3]
	.loc 3 1081 0
	ldr	r2, .L384+16
	ldr	r3, .L384+32
	mov	r1, #0
	strb	r1, [r2, r3]
.L336:
.LBE14:
	.loc 3 1086 0
	ldr	r3, .L384+12
	ldr	r2, [r3, #20]
	add	r3, r7, #6
	ldrh	r3, [r3]
	add	r3, r2, r3
	ldrb	r3, [r3]
	b	.L335
.L321:
	.loc 3 1097 0
	ldr	r2, .L384+16
	ldr	r3, .L384+56
	mov	r1, #1
	strb	r1, [r2, r3]
	.loc 3 1099 0
	ldr	r3, .L384+60
	ldr	r3, [r3, #52]
	lsl	r3, r3, #16
	lsr	r1, r3, #16
	ldr	r2, .L384+16
	ldr	r3, .L384+64
	strh	r1, [r2, r3]
	.loc 3 1100 0
	ldr	r3, .L384+60
	ldr	r2, [r3, #28]
	mov	r3, #171
	lsl	r3, r3, #1
	mul	r2, r3
	ldr	r3, .L384+68
	ldr	r3, [r3, #4]
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_idiv
	mov	r3, r0
	lsl	r3, r3, #16
	lsr	r1, r3, #16
	ldr	r2, .L384+16
	mov	r3, #133
	lsl	r3, r3, #4
	strh	r1, [r2, r3]
	.loc 3 1105 0
	ldr	r3, .L384+72
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L337
	.loc 3 1106 0
	ldr	r2, .L384+16
	ldr	r3, .L384+76
	mov	r1, #0
	strb	r1, [r2, r3]
.L337:
	.loc 3 1107 0
	mov	r3, #0
	b	.L335
.L322:
	.loc 3 1110 0
	ldr	r2, .L384+16
	ldr	r3, .L384+80
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	bne	.L338
	.loc 3 1112 0
	ldr	r2, .L384+16
	ldr	r3, .L384+20
	ldrh	r3, [r2, r3]
	lsl	r0, r3, #1
	mov	r3, r7
	add	r3, r3, #11
	ldr	r1, .L384+16
	ldr	r2, .L384+84
	add	r1, r0, r1
	add	r2, r1, r2
	ldrb	r2, [r2, #2]
	strb	r2, [r3]
	b	.L339
.L338:
	.loc 3 1116 0
	ldr	r2, .L384+16
	ldr	r3, .L384+20
	ldrh	r3, [r2, r3]
	lsl	r3, r3, #1
	add	r0, r3, #1
	mov	r3, r7
	add	r3, r3, #11
	ldr	r1, .L384+16
	ldr	r2, .L384+84
	add	r1, r0, r1
	add	r2, r1, r2
	ldrb	r2, [r2, #2]
	strb	r2, [r3]
	.loc 3 1117 0
	ldr	r2, .L384+16
	ldr	r3, .L384+20
	ldrh	r3, [r2, r3]
	add	r3, r3, #1
	lsl	r3, r3, #16
	lsr	r1, r3, #16
	ldr	r2, .L384+16
	ldr	r3, .L384+20
	strh	r1, [r2, r3]
	ldr	r2, .L384+16
	ldr	r3, .L384+20
	ldrh	r3, [r2, r3]
	ldr	r2, .L384+88
	cmp	r2, r3
	sbc	r3, r3, r3
	neg	r3, r3
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	beq	.L339
	.loc 3 1118 0
	ldr	r2, .L384+16
	ldr	r3, .L384+20
	mov	r1, #0
	strh	r1, [r2, r3]
.L339:
	.loc 3 1120 0
	ldr	r2, .L384+16
	ldr	r3, .L384+80
	ldrb	r2, [r2, r3]
	mov	r3, #1
	eor	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r1, r3, #24
	ldr	r2, .L384+16
	ldr	r3, .L384+80
	strb	r1, [r2, r3]
	.loc 3 1124 0
	mov	r3, r7
	add	r3, r3, #11
	ldrb	r3, [r3]
	b	.L335
.L323:
	.loc 3 1131 0
	ldr	r2, .L384+92
	mov	r3, #52
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	beq	.L340
	.loc 3 1132 0
	ldr	r3, .L384+12
	ldr	r2, [r3, #8]
	ldr	r3, .L384+16
	ldrh	r3, [r3, #6]
	lsl	r3, r3, #1
	add	r2, r2, r3
	mov	r3, r7
	add	r3, r3, #11
	ldrb	r2, [r2]
	strb	r2, [r3]
	b	.L341
.L340:
	.loc 3 1133 0
	ldr	r3, .L384+16
	ldrh	r3, [r3, #10]
	cmp	r3, #0
	beq	.L342
.LBB15:
	.loc 3 1135 0
	ldr	r3, .L384+16
	ldrh	r3, [r3, #6]
	sub	r3, r3, #1
	str	r3, [r7, #16]
	.loc 3 1136 0
	ldr	r3, .L384+16
	ldrh	r3, [r3, #8]
	mov	r2, r3
	ldr	r3, [r7, #16]
	and	r3, r3, r2
	str	r3, [r7, #20]
	.loc 3 1140 0
	ldr	r3, .L384+16
	ldrh	r3, [r3, #8]
	mvn	r3, r3
	mov	r2, r3
	ldr	r3, [r7, #16]
	and	r2, r2, r3
	ldr	r3, .L384+16
	ldrh	r3, [r3, #12]
	ldr	r1, [r7, #20]
	mov	r0, r1
	lsr	r0, r0, r3
	mov	r3, r0
	add	r2, r2, r3
	ldr	r3, .L384+16
	ldrh	r3, [r3, #10]
	sub	r3, r3, #1
	mov	r1, r3
	ldr	r3, [r7, #20]
	and	r3, r3, r1
	lsl	r3, r3, #3
	add	r3, r2, r3
	str	r3, [r7, #24]
	.loc 3 1141 0
	ldr	r3, .L384+12
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #24]
	lsl	r3, r3, #1
	sub	r3, r3, #2
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r2, r2, r3
	mov	r3, r7
	add	r3, r3, #11
	ldrb	r2, [r2]
	strb	r2, [r3]
	b	.L341
.L342:
.LBE15:
	.loc 3 1144 0
	ldr	r3, .L384+12
	ldr	r2, [r3, #8]
	ldr	r3, .L384+16
	ldrh	r3, [r3, #6]
	lsl	r3, r3, #1
	sub	r3, r3, #2
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r2, r2, r3
	mov	r3, r7
	add	r3, r3, #11
	ldrb	r2, [r2]
	strb	r2, [r3]
.L341:
	.loc 3 1146 0
	ldr	r3, .L384+16
	ldrb	r3, [r3, #4]
	cmp	r3, #0
	beq	.LCB5264
	b	.L380	@long jump
.LCB5264:
	.loc 3 1148 0
	ldr	r3, .L384+16
	ldrh	r2, [r3, #6]
	ldr	r3, .L384+16
	ldrb	r3, [r3, #5]
	add	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, .L384+16
	strh	r2, [r3, #6]
	.loc 3 1149 0
	ldr	r2, .L384+92
	mov	r3, #52
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 3 1151 0
	b	.L307
.L324:
	.loc 3 1157 0
	ldr	r2, .L384+92
	mov	r3, #52
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	beq	.L344
	.loc 3 1158 0
	ldr	r3, .L384+12
	ldr	r2, [r3, #8]
	ldr	r3, .L384+16
	ldrh	r3, [r3, #6]
	lsl	r3, r3, #1
	add	r3, r3, #1
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r2, r2, r3
	mov	r3, r7
	add	r3, r3, #11
	ldrb	r2, [r2]
	strb	r2, [r3]
	b	.L345
.L385:
	.align	2
.L384:
	.word	8592
	.word	-8448
	.word	.L334
	.word	Memory
	.word	PPU
	.word	2116
	.word	2114
	.word	2148
	.word	2770
	.word	2134
	.word	2136
	.word	8500
	.word	8501
	.word	8502
	.word	2132
	.word	CPU
	.word	2126
	.word	Settings
	.word	SNESGameFixes
	.word	2131
	.word	2169
	.word	2168
	.word	271
	.word	IPPU
.L344:
	.loc 3 1159 0
	ldr	r3, .L386
	ldrh	r3, [r3, #10]
	cmp	r3, #0
	beq	.L346
.LBB16:
	.loc 3 1161 0
	ldr	r3, .L386
	ldrh	r3, [r3, #6]
	sub	r3, r3, #1
	str	r3, [r7, #28]
	.loc 3 1162 0
	ldr	r3, .L386
	ldrh	r3, [r3, #8]
	mov	r2, r3
	ldr	r3, [r7, #28]
	and	r3, r3, r2
	str	r3, [r7, #32]
	.loc 3 1166 0
	ldr	r3, .L386
	ldrh	r3, [r3, #8]
	mvn	r3, r3
	mov	r2, r3
	ldr	r3, [r7, #28]
	and	r2, r2, r3
	ldr	r3, .L386
	ldrh	r3, [r3, #12]
	ldr	r1, [r7, #32]
	mov	r0, r1
	lsr	r0, r0, r3
	mov	r3, r0
	add	r2, r2, r3
	ldr	r3, .L386
	ldrh	r3, [r3, #10]
	sub	r3, r3, #1
	mov	r1, r3
	ldr	r3, [r7, #32]
	and	r3, r3, r1
	lsl	r3, r3, #3
	add	r3, r2, r3
	str	r3, [r7, #36]
	.loc 3 1167 0
	ldr	r3, .L386+4
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #36]
	lsl	r3, r3, #1
	sub	r3, r3, #1
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r2, r2, r3
	mov	r3, r7
	add	r3, r3, #11
	ldrb	r2, [r2]
	strb	r2, [r3]
	b	.L345
.L346:
.LBE16:
	.loc 3 1170 0
	ldr	r3, .L386+4
	ldr	r2, [r3, #8]
	ldr	r3, .L386
	ldrh	r3, [r3, #6]
	lsl	r3, r3, #1
	sub	r3, r3, #1
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r2, r2, r3
	mov	r3, r7
	add	r3, r3, #11
	ldrb	r2, [r2]
	strb	r2, [r3]
.L345:
	.loc 3 1171 0
	ldr	r3, .L386
	ldrb	r3, [r3, #4]
	cmp	r3, #0
	bne	.LCB5405
	b	.L381	@long jump
.LCB5405:
	.loc 3 1173 0
	ldr	r3, .L386
	ldrh	r2, [r3, #6]
	ldr	r3, .L386
	ldrb	r3, [r3, #5]
	add	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, .L386
	strh	r2, [r3, #6]
	.loc 3 1174 0
	ldr	r2, .L386+8
	mov	r3, #52
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 3 1176 0
	b	.L307
.L325:
	.loc 3 1183 0
	ldr	r2, .L386
	ldr	r3, .L386+12
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	beq	.L348
	.loc 3 1184 0
	ldr	r2, .L386
	ldr	r3, .L386+16
	ldrb	r3, [r2, r3]
	mov	r1, r3
	ldr	r2, .L386
	add	r1, r1, #32
	lsl	r1, r1, #1
	ldrh	r2, [r1, r2]
	asr	r1, r2, #8
	mov	r2, r7
	add	r2, r2, #11
	strb	r1, [r2]
	add	r3, r3, #1
	lsl	r3, r3, #24
	lsr	r1, r3, #24
	ldr	r2, .L386
	ldr	r3, .L386+16
	strb	r1, [r2, r3]
	b	.L349
.L348:
	.loc 3 1186 0
	ldr	r2, .L386
	ldr	r3, .L386+16
	ldrb	r3, [r2, r3]
	mov	r2, r3
	ldr	r3, .L386
	add	r2, r2, #32
	lsl	r2, r2, #1
	ldrh	r2, [r2, r3]
	mov	r3, r7
	add	r3, r3, #11
	strb	r2, [r3]
.L349:
	.loc 3 1188 0
	ldr	r2, .L386
	ldr	r3, .L386+12
	ldrb	r2, [r2, r3]
	mov	r3, #1
	eor	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r1, r3, #24
	ldr	r2, .L386
	ldr	r3, .L386+12
	strb	r1, [r2, r3]
	.loc 3 1189 0
	mov	r3, r7
	add	r3, r3, #11
	ldrb	r3, [r3]
	b	.L335
.L326:
	.loc 3 1196 0
	ldr	r2, .L386
	ldr	r3, .L386+20
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	beq	.L350
	.loc 3 1197 0
	ldr	r2, .L386
	mov	r3, #133
	lsl	r3, r3, #4
	ldrh	r3, [r2, r3]
	asr	r2, r3, #8
	mov	r3, r7
	add	r3, r3, #11
	strb	r2, [r3]
	b	.L351
.L350:
	.loc 3 1199 0
	ldr	r2, .L386
	mov	r3, #133
	lsl	r3, r3, #4
	ldrh	r2, [r2, r3]
	mov	r3, r7
	add	r3, r3, #11
	strb	r2, [r3]
.L351:
	.loc 3 1200 0
	ldr	r2, .L386
	ldr	r3, .L386+20
	ldrb	r2, [r2, r3]
	mov	r3, #1
	eor	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r1, r3, #24
	ldr	r2, .L386
	ldr	r3, .L386+20
	strb	r1, [r2, r3]
	.loc 3 1201 0
	b	.L307
.L327:
	.loc 3 1207 0
	ldr	r2, .L386
	ldr	r3, .L386+24
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	beq	.L352
	.loc 3 1208 0
	ldr	r2, .L386
	ldr	r3, .L386+28
	ldrh	r3, [r2, r3]
	asr	r2, r3, #8
	mov	r3, r7
	add	r3, r3, #11
	strb	r2, [r3]
	b	.L353
.L352:
	.loc 3 1210 0
	ldr	r2, .L386
	ldr	r3, .L386+28
	ldrh	r2, [r2, r3]
	mov	r3, r7
	add	r3, r3, #11
	strb	r2, [r3]
.L353:
	.loc 3 1211 0
	ldr	r2, .L386
	ldr	r3, .L386+24
	ldrb	r2, [r2, r3]
	mov	r3, #1
	eor	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r1, r3, #24
	ldr	r2, .L386
	ldr	r3, .L386+24
	strb	r1, [r2, r3]
	.loc 3 1212 0
	b	.L307
.L328:
	.loc 3 1215 0
	ldr	r3, .L386+32
	ldrb	r3, [r3, #5]
	b	.L335
.L329:
	.loc 3 1219 0
	ldr	r2, .L386
	ldr	r3, .L386+20
	mov	r1, #0
	strb	r1, [r2, r3]
	ldr	r2, .L386
	ldr	r3, .L386+20
	ldrb	r1, [r2, r3]
	ldr	r2, .L386
	ldr	r3, .L386+24
	strb	r1, [r2, r3]
	.loc 3 1220 0
	ldr	r3, .L386+36
	ldrb	r3, [r3, #29]
	cmp	r3, #0
	beq	.L354
	mov	r2, #16
	b	.L355
.L354:
	mov	r2, #0
.L355:
	ldr	r3, .L386+4
	ldr	r3, [r3, #20]
	ldr	r1, .L386+40
	add	r3, r3, r1
	ldrb	r3, [r3]
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	mov	r1, #192
	and	r3, r3, r1
	orr	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	b	.L335
.L330:
	.loc 3 1294 0
	ldr	r3, .L386+36
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L356
	.loc 3 1299 0
	ldr	r3, .L386+32
	ldrb	r3, [r3, #3]
	cmp	r3, #0
	beq	.L357
	add	r3, r7, #6
	ldrh	r2, [r3]
	ldr	r3, .L386+40
	cmp	r2, r3
	bls	.L357
	add	r3, r7, #6
	ldrh	r2, [r3]
	ldr	r3, .L386+44
	cmp	r2, r3
	bhi	.L357
	ldr	r3, .L386+48
	ldr	r3, [r3, #52]
	cmp	r3, #0
	bne	.L357
	.loc 3 1305 0
	add	r3, r7, #6
	ldrh	r2, [r3]
	mov	r3, #1
	and	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	beq	.L358
	bl	rand
	mov	r2, r0
	mov	r3, #255
	lsl	r3, r3, #8
	and	r3, r3, r2
	asr	r3, r3, #8
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	b	.L359
.L358:
	bl	rand
	mov	r3, r0
	lsl	r3, r3, #24
	lsr	r3, r3, #24
.L359:
	b	.L335
.L357:
	.loc 3 1308 0
	add	r3, r7, #6
	ldrh	r2, [r3]
	mov	r3, #3
	and	r3, r3, r2
	ldr	r2, .L386+52
	add	r3, r2, r3
	ldrb	r3, [r3, #7]
	b	.L335
.L356:
	.loc 3 1311 0
	ldr	r3, .L386+36
	ldrb	r3, [r3, #2]
	cmp	r3, #2
	beq	.L382
	cmp	r3, #2
	bgt	.L364
	cmp	r3, #0
	blt	.L360
	b	.L379
.L364:
	cmp	r3, #3
	beq	.L363
	b	.L360
.L379:
	.loc 3 1315 0
	ldr	r3, .L386+48
	mov	r2, #1
	strb	r2, [r3, #4]
	.loc 3 1316 0
	b	.L360
.L363:
	.loc 3 1320 0
	ldr	r3, .L386+48
	mov	r2, #1
	strb	r2, [r3, #4]
	b	.L360
.L382:
	.loc 3 1318 0
	mov	r8, r8
.L360:
	.loc 3 1324 0
	add	r3, r7, #6
	ldrh	r2, [r3]
	mov	r3, #3
	and	r3, r3, r2
	cmp	r3, #1
	bgt	.L365
.LBB17:
	.loc 3 1326 0
	bl	_Z7yo_randv
	mov	r3, r0
	str	r3, [r7, #40]
	.loc 3 1327 0
	ldr	r2, [r7, #40]
	mov	r3, #2
	and	r3, r3, r2
	cmp	r3, #0
	beq	.L383
	.loc 3 1329 0
	ldr	r2, [r7, #40]
	mov	r3, #4
	and	r3, r3, r2
	cmp	r3, #0
	beq	.L367
	.loc 3 1330 0
	mov	r3, #187
	b	.L335
.L367:
	.loc 3 1332 0
	ldr	r3, [r7, #40]
	asr	r3, r3, #3
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	b	.L335
.L365:
.LBE17:
.LBB18:
	.loc 3 1337 0
	bl	_Z7yo_randv
	mov	r3, r0
	str	r3, [r7, #44]
	.loc 3 1338 0
	ldr	r2, [r7, #44]
	mov	r3, #2
	and	r3, r3, r2
	cmp	r3, #0
	beq	.L368
	.loc 3 1339 0
	ldr	r3, [r7, #44]
	asr	r3, r3, #3
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	b	.L335
.L383:
.LBE18:
.LBB19:
	.loc 3 1332 0
	mov	r8, r8
.L368:
.LBE19:
	.loc 3 1341 0
	ldr	r3, .L386+4
	ldr	r2, [r3, #20]
	add	r3, r7, #6
	ldrh	r3, [r3]
	add	r3, r2, r3
	ldrb	r3, [r3]
	b	.L335
.L331:
	.loc 3 1349 0
	ldr	r3, .L386+4
	ldr	r2, [r3]
	ldr	r1, .L386
	ldr	r3, .L386+56
	ldr	r3, [r1, r3]
	add	r1, r2, r3
	mov	r2, r7
	add	r2, r2, #11
	ldrb	r1, [r1]
	strb	r1, [r2]
	add	r1, r3, #1
	ldr	r2, .L386
	ldr	r3, .L386+56
	str	r1, [r2, r3]
	.loc 3 1350 0
	ldr	r2, .L386
	ldr	r3, .L386+56
	ldr	r3, [r2, r3]
	lsl	r3, r3, #15
	lsr	r1, r3, #15
	ldr	r2, .L386
	ldr	r3, .L386+56
	str	r1, [r2, r3]
	.loc 3 1351 0
	b	.L307
.L387:
	.align	2
.L386:
	.word	PPU
	.word	Memory
	.word	IPPU
	.word	2767
	.word	2148
	.word	2130
	.word	2131
	.word	2126
	.word	SNESGameFixes
	.word	Settings
	.word	8511
	.word	8515
	.word	CPU
	.word	APU
	.word	2156
.L332:
	.loc 3 1355 0
	ldr	r3, .L388
	ldr	r2, [r3, #20]
	add	r3, r7, #6
	ldrh	r3, [r3]
	add	r3, r2, r3
	ldrb	r3, [r3]
	b	.L335
.L333:
	.loc 3 1357 0
	mov	r3, #1
	b	.L335
.L380:
	.loc 3 1151 0
	mov	r8, r8
	b	.L307
.L381:
	.loc 3 1176 0
	mov	r8, r8
.L307:
	.loc 3 1418 0
	mov	r3, r7
	add	r3, r3, #11
	ldrb	r3, [r3]
	b	.L335
.L306:
	.loc 3 1367 0
	add	r3, r7, #6
	ldrh	r2, [r3]
	ldr	r3, .L388+4
	cmp	r2, r3
	bls	.L369
	add	r3, r7, #6
	ldrh	r2, [r3]
	ldr	r3, .L388+8
	cmp	r2, r3
	bls	.L370
.L369:
	.loc 3 1369 0
	add	r3, r7, #6
	ldrh	r3, [r3]
	ldr	r2, .L388+12
	cmp	r3, r2
	beq	.L373
	mov	r2, #160
	lsl	r2, r2, #6
	cmp	r3, r2
	beq	.L374
	ldr	r2, .L388+16
	cmp	r3, r2
	bne	.L371
.L372:
	.loc 3 1372 0
	mov	r3, #32
	b	.L335
.L373:
	.loc 3 1374 0
	mov	r3, #0
	b	.L335
.L374:
	.loc 3 1377 0
	ldr	r2, .L388+20
	mov	r3, #68
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	beq	.L371
	.loc 3 1378 0
	add	r3, r7, #6
	ldrh	r3, [r3]
	mov	r0, r3
	bl	_Z10S9xGetSRTCt
	mov	r3, r0
	b	.L335
.L371:
	.loc 3 1391 0
	mov	r3, #0
	b	.L335
.L370:
	.loc 3 1395 0
	ldr	r2, .L388+20
	mov	r3, #80
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	bne	.L375
	.loc 3 1396 0
	mov	r3, #48
	b	.L335
.L375:
	.loc 3 1398 0
	ldr	r3, .L388
	ldr	r2, [r3, #20]
	add	r3, r7, #6
	ldrh	r3, [r3]
	add	r2, r2, r3
	mov	r3, r7
	add	r3, r3, #11
	ldrb	r2, [r2]
	strb	r2, [r3]
	.loc 3 1403 0
	add	r3, r7, #6
	ldrh	r2, [r3]
	ldr	r3, .L388+24
	cmp	r2, r3
	bne	.L376
	.loc 3 1405 0
	ldr	r3, .L388+28
	ldr	r2, [r3, #36]
	ldr	r3, .L388+28
	str	r2, [r3, #40]
	b	.L377
.L376:
	.loc 3 1409 0
	add	r3, r7, #6
	ldrh	r2, [r3]
	ldr	r3, .L388+32
	cmp	r2, r3
	bne	.L377
	.loc 3 1411 0
	mov	r0, #4
	bl	_ZL16CLEAR_IRQ_SOURCEj
	.loc 3 1412 0
	ldr	r3, .L388
	ldr	r3, [r3, #20]
	ldr	r0, .L388+32
	add	r2, r3, r0
	mov	r3, r7
	add	r3, r3, #11
	ldrb	r3, [r3]
	mov	r1, #127
	and	r3, r3, r1
	strb	r3, [r2]
.L377:
	.loc 3 1414 0
	mov	r3, r7
	add	r3, r3, #11
	ldrb	r3, [r3]
.L335:
.LBE13:
	.loc 3 1419 0
	mov	r0, r3
	mov	sp, r7
	add	sp, sp, #48
	@ sp needed for prologue
	pop	{r7, pc}
.L389:
	.align	2
.L388:
	.word	Memory
	.word	12287
	.word	13055
	.word	8643
	.word	8642
	.word	Settings
	.word	12336
	.word	CPU
	.word	12337
.LFE31:
	.fnend
	.size	S9xGetPPU, .-S9xGetPPU
	.global	__aeabi_idivmod
	.align	2
	.global	S9xSetCPU
	.hidden	S9xSetCPU
	.code	16
	.thumb_func
	.type	S9xSetCPU, %function
S9xSetCPU:
	.fnstart
.LFB32:
	.loc 3 1426 0
	.save	{r4, r7, lr}
	push	{r4, r7, lr}
.LCFI33:
	.pad #28
	sub	sp, sp, #28
.LCFI34:
	.setfp r7, sp, #0
	add	r7, sp, #0
.LCFI35:
	mov	r2, r1
	add	r3, r7, #7
	add	r1, r0, #0
	strb	r1, [r3]
	add	r3, r7, #4
	strh	r2, [r3]
.LBB20:
	.loc 3 1429 0
	add	r3, r7, #4
	ldrh	r2, [r3]
	ldr	r3, .L528
	cmp	r2, r3
	bhi	.L391
	.loc 3 1432 0
	ldr	r3, .L528+4
	ldr	r3, [r3, #28]
	add	r2, r3, #6
	ldr	r3, .L528+4
	str	r2, [r3, #28]
	.loc 3 1434 0
	add	r3, r7, #4
	ldrh	r2, [r3]
	ldr	r3, .L528+8
	cmp	r2, r3
	beq	.LCB6006
	bl	.L500	@far jump
.LCB6006:
.L393:
	.loc 3 1438 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #1
	and	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	bne	.LCB6015
	bl	.L501	@far jump
.LCB6015:
	ldr	r3, .L528+12
	ldr	r2, [r3, #20]
	add	r3, r7, #4
	ldrh	r3, [r3]
	add	r3, r2, r3
	ldrb	r3, [r3]
	mov	r2, r3
	mov	r3, #1
	and	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r2, r3, #24
	mov	r3, #1
	eor	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	bne	.LCB6032
	bl	.L502	@far jump
.LCB6032:
	.loc 3 1440 0
	ldr	r2, .L528+16
	ldr	r3, .L528+20
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 3 1441 0
	ldr	r2, .L528+16
	ldr	r3, .L528+24
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 3 1442 0
	ldr	r2, .L528+16
	ldr	r3, .L528+28
	mov	r1, #0
	strb	r1, [r2, r3]
	bl	.L394	@ far jump
.L391:
	.loc 3 1461 0
	add	r3, r7, #4
	ldrh	r3, [r3]
	ldr	r2, .L528+32
	cmp	r3, r2
	bne	.LCB6053
	bl	.L413	@far jump
.LCB6053:
	ldr	r2, .L528+32
	cmp	r3, r2
	ble	.LCB6056
	b	.L425	@long jump
.LCB6056:
	ldr	r2, .L528+36
	cmp	r3, r2
	bne	.LCB6059
	bl	.L417	@far jump
.LCB6059:
	ldr	r2, .L528+36
	cmp	r3, r2
	ble	.LCB6062
	b	.L426	@long jump
.LCB6062:
	ldr	r2, .L528+40
	cmp	r3, r2
	bne	.LCB6065
	bl	.L406	@far jump
.LCB6065:
	ldr	r2, .L528+40
	cmp	r3, r2
	bgt	.L427
	ldr	r2, .L528+44
	cmp	r3, r2
	bne	.LCB6071
	bl	.L399	@far jump
.LCB6071:
	ldr	r2, .L528+44
	cmp	r3, r2
	bgt	.L428
	ldr	r2, .L528+48
	cmp	r3, r2
	bgt	.L429
	ldr	r2, .L528+52
	cmp	r3, r2
	blt	.LCB6080
	bl	.L503	@far jump
.LCB6080:
	mov	r2, #132
	lsl	r2, r2, #7
	cmp	r3, r2
	bne	.LCB6084
	b	.L395	@long jump
.LCB6084:
	bl	.L394	@ far jump
.L429:
	ldr	r2, .L528+56
	cmp	r3, r2
	bne	.LCB6091
	bl	.L397	@far jump
.LCB6091:
	.loc 3 1548 0
	bl	.L394	@ far jump
.L428:
	.loc 3 1461 0
	ldr	r2, .L528+60
	cmp	r3, r2
	bne	.LCB6098
	bl	.L402	@far jump
.LCB6098:
	ldr	r2, .L528+60
	cmp	r3, r2
	bgt	.L430
	ldr	r2, .L528+64
	cmp	r3, r2
	bne	.LCB6104
	bl	.L400	@far jump
.LCB6104:
	ldr	r2, .L528+68
	cmp	r3, r2
	bne	.LCB6107
	bl	.L401	@far jump
.LCB6107:
	bl	.L394	@ far jump
.L430:
	ldr	r2, .L528+72
	cmp	r3, r2
	bne	.LCB6114
	bl	.L404	@far jump
.LCB6114:
	ldr	r2, .L528+72
	cmp	r3, r2
	ble	.LCB6117
	bl	.L405	@far jump
.LCB6117:
	bl	.L498	@ far jump
.L427:
	ldr	r2, .L528+76
	cmp	r3, r2
	bgt	.L431
	ldr	r2, .L528+80
	cmp	r3, r2
	blt	.LCB6127
	bl	.L504	@far jump
.LCB6127:
	ldr	r2, .L528+84
	cmp	r3, r2
	bne	.LCB6130
	bl	.L408	@far jump
.LCB6130:
	ldr	r2, .L528+84
	cmp	r3, r2
	bge	.LCB6133
	bl	.L505	@far jump
.LCB6133:
	ldr	r2, .L528+88
	cmp	r3, r2
	bne	.LCB6136
	bl	.L409	@far jump
.LCB6136:
	.loc 3 1688 0
	bl	.L497	@ far jump
.L431:
	.loc 3 1461 0
	ldr	r2, .L528+92
	cmp	r3, r2
	bne	.LCB6143
	bl	.L414	@far jump
.LCB6143:
	ldr	r2, .L528+92
	cmp	r3, r2
	bgt	.L432
	mov	r2, #134
	lsl	r2, r2, #7
	cmp	r3, r2
	bne	.LCB6150
	bl	.L412	@far jump
.LCB6150:
	ldr	r2, .L528+96
	cmp	r3, r2
	bne	.LCB6153
	bl	.L413	@far jump
.LCB6153:
	bl	.L394	@ far jump
.L432:
	ldr	r2, .L528+100
	cmp	r3, r2
	bne	.LCB6160
	bl	.L415	@far jump
.LCB6160:
	ldr	r2, .L528+104
	cmp	r3, r2
	bne	.LCB6163
	bl	.L416	@far jump
.LCB6163:
	bl	.L394	@ far jump
.L426:
	ldr	r2, .L528+108
	cmp	r3, r2
	bne	.LCB6170
	bl	.L420	@far jump
.LCB6170:
	ldr	r2, .L528+108
	cmp	r3, r2
	bgt	.L433
	ldr	r2, .L528+112
	cmp	r3, r2
	bne	.LCB6176
	bl	.L413	@far jump
.LCB6176:
	ldr	r2, .L528+112
	cmp	r3, r2
	bgt	.L434
	ldr	r2, .L528+116
	cmp	r3, r2
	bne	.LCB6182
	bl	.L420	@far jump
.LCB6182:
	ldr	r2, .L528+116
	cmp	r3, r2
	bgt	.L435
	ldr	r2, .L528+120
	cmp	r3, r2
	bne	.LCB6188
	bl	.L418	@far jump
.LCB6188:
	ldr	r2, .L528+124
	cmp	r3, r2
	bne	.LCB6191
	bl	.L419	@far jump
.LCB6191:
	bl	.L394	@ far jump
.L435:
	ldr	r2, .L528+128
	cmp	r3, r2
	bne	.LCB6198
	bl	.L422	@far jump
.LCB6198:
	ldr	r2, .L528+128
	cmp	r3, r2
	bge	.LCB6201
	bl	.L421	@far jump
.LCB6201:
	ldr	r2, .L528+132
	cmp	r3, r2
	bne	.LCB6204
	bl	.L412	@far jump
.LCB6204:
	bl	.L394	@ far jump
.L434:
	ldr	r2, .L528+136
	cmp	r3, r2
	bne	.LCB6211
	bl	.L416	@far jump
.LCB6211:
	ldr	r2, .L528+136
	cmp	r3, r2
	bgt	.L436
	ldr	r2, .L528+140
	cmp	r3, r2
	bne	.LCB6217
	bl	.L414	@far jump
.LCB6217:
	ldr	r2, .L528+144
	cmp	r3, r2
	bne	.LCB6220
	bl	.L415	@far jump
.LCB6220:
	bl	.L394	@ far jump
.L436:
	ldr	r2, .L528+148
	cmp	r3, r2
	bne	.LCB6227
	bl	.L418	@far jump
.LCB6227:
	ldr	r2, .L528+148
	cmp	r3, r2
	ble	.LCB6230
	bl	.L419	@far jump
.LCB6230:
	bl	.L417	@ far jump
.L433:
	ldr	r2, .L528+152
	cmp	r3, r2
	bne	.LCB6237
	bl	.L416	@far jump
.LCB6237:
	ldr	r2, .L528+152
	cmp	r3, r2
	bgt	.L437
	ldr	r2, .L528+156
	cmp	r3, r2
	bne	.LCB6243
	bl	.L412	@far jump
.LCB6243:
	ldr	r2, .L528+156
	cmp	r3, r2
	bgt	.L438
	ldr	r2, .L528+160
	cmp	r3, r2
	bne	.LCB6249
	bl	.L421	@far jump
.LCB6249:
	ldr	r2, .L528+164
	cmp	r3, r2
	bne	.LCB6252
	bl	.L422	@far jump
.LCB6252:
	bl	.L394	@ far jump
.L438:
	ldr	r2, .L528+168
	cmp	r3, r2
	bne	.LCB6259
	bl	.L414	@far jump
.LCB6259:
	ldr	r2, .L528+168
	cmp	r3, r2
	ble	.LCB6262
	bl	.L415	@far jump
.LCB6262:
	bl	.L413	@ far jump
.L437:
	ldr	r2, .L528+172
	cmp	r3, r2
	bne	.LCB6269
	bl	.L420	@far jump
.LCB6269:
	ldr	r2, .L528+172
	cmp	r3, r2
	bgt	.L439
	ldr	r2, .L528+176
	cmp	r3, r2
	bne	.LCB6275
	bl	.L418	@far jump
.LCB6275:
	ldr	r2, .L528+176
	cmp	r3, r2
	ble	.LCB6278
	bl	.L419	@far jump
.LCB6278:
	bl	.L417	@ far jump
.L439:
	ldr	r2, .L528+180
	cmp	r3, r2
	bne	.LCB6285
	bl	.L422	@far jump
.LCB6285:
	ldr	r2, .L528+180
	cmp	r3, r2
	bge	.LCB6288
	bl	.L421	@far jump
.LCB6288:
	ldr	r2, .L528+184
	cmp	r3, r2
	bne	.LCB6291
	bl	.L412	@far jump
.LCB6291:
	bl	.L394	@ far jump
.L425:
	ldr	r2, .L528+188
	cmp	r3, r2
	bne	.LCB6298
	bl	.L420	@far jump
.LCB6298:
	ldr	r2, .L528+188
	cmp	r3, r2
	ble	.LCB6301
	b	.L440	@long jump
.LCB6301:
	ldr	r2, .L528+192
	cmp	r3, r2
	bne	.LCB6304
	bl	.L416	@far jump
.LCB6304:
	ldr	r2, .L528+192
	cmp	r3, r2
	ble	.LCB6307
	b	.L441	@long jump
.LCB6307:
	ldr	r2, .L528+196
	cmp	r3, r2
	bne	.LCB6310
	bl	.L420	@far jump
.LCB6310:
	ldr	r2, .L528+196
	cmp	r3, r2
	bgt	.L442
	ldr	r2, .L528+200
	cmp	r3, r2
	bne	.LCB6316
	bl	.L416	@far jump
.LCB6316:
	ldr	r2, .L528+200
	cmp	r3, r2
	bgt	.L443
	ldr	r2, .L528+204
	cmp	r3, r2
	bne	.LCB6322
	bl	.L414	@far jump
.LCB6322:
	ldr	r2, .L528+208
	cmp	r3, r2
	bne	.LCB6325
	bl	.L415	@far jump
.LCB6325:
	bl	.L394	@ far jump
.L443:
	ldr	r2, .L528+212
	cmp	r3, r2
	bne	.LCB6332
	bl	.L418	@far jump
.LCB6332:
	ldr	r2, .L528+212
	cmp	r3, r2
	ble	.LCB6335
	bl	.L419	@far jump
.LCB6335:
	bl	.L417	@ far jump
.L442:
	ldr	r2, .L528+216
	cmp	r3, r2
	bne	.LCB6342
	bl	.L412	@far jump
.LCB6342:
	ldr	r2, .L528+216
	cmp	r3, r2
	ble	.LCB6345
	b	.L444	@long jump
.LCB6345:
	ldr	r2, .L528+220
	cmp	r3, r2
	bne	.LCB6348
	bl	.L421	@far jump
.LCB6348:
	ldr	r2, .L528+224
	cmp	r3, r2
	bne	.LCB6351
	bl	.L422	@far jump
.LCB6351:
	bl	.L394	@ far jump
.L529:
	.align	2
.L528:
	.word	16895
	.word	CPU
	.word	16406
	.word	Memory
	.word	PPU
	.word	2146
	.word	2147
	.word	2771
	.word	17201
	.word	17157
	.word	16909
	.word	16902
	.word	16898
	.word	16897
	.word	16899
	.word	16905
	.word	16903
	.word	16904
	.word	16907
	.word	16927
	.word	16920
	.word	16912
	.word	16913
	.word	17154
	.word	17153
	.word	17155
	.word	17156
	.word	17176
	.word	17169
	.word	17160
	.word	17158
	.word	17159
	.word	17162
	.word	17168
	.word	17172
	.word	17170
	.word	17171
	.word	17174
	.word	17188
	.word	17184
	.word	17177
	.word	17178
	.word	17186
	.word	17192
	.word	17190
	.word	17194
	.word	17200
	.word	17240
	.word	17220
	.word	17208
	.word	17204
	.word	17202
	.word	17203
	.word	17206
	.word	17216
	.word	17209
	.word	17210
.L444:
	ldr	r2, .L530
	cmp	r3, r2
	bne	.LCB6420
	bl	.L414	@far jump
.LCB6420:
	ldr	r2, .L530
	cmp	r3, r2
	ble	.LCB6423
	bl	.L415	@far jump
.LCB6423:
	bl	.L413	@ far jump
.L441:
	ldr	r2, .L530+4
	cmp	r3, r2
	bne	.LCB6430
	bl	.L412	@far jump
.LCB6430:
	ldr	r2, .L530+4
	cmp	r3, r2
	bgt	.L445
	ldr	r2, .L530+8
	cmp	r3, r2
	bne	.LCB6436
	bl	.L419	@far jump
.LCB6436:
	ldr	r2, .L530+8
	cmp	r3, r2
	bgt	.L446
	ldr	r2, .L530+12
	cmp	r3, r2
	bne	.LCB6442
	bl	.L417	@far jump
.LCB6442:
	ldr	r2, .L530+16
	cmp	r3, r2
	bne	.LCB6445
	bl	.L418	@far jump
.LCB6445:
	bl	.L394	@ far jump
.L446:
	ldr	r2, .L530+20
	cmp	r3, r2
	bne	.LCB6452
	bl	.L421	@far jump
.LCB6452:
	ldr	r2, .L530+20
	cmp	r3, r2
	bge	.LCB6455
	bl	.L420	@far jump
.LCB6455:
	ldr	r2, .L530+24
	cmp	r3, r2
	bne	.LCB6458
	bl	.L422	@far jump
.LCB6458:
	bl	.L394	@ far jump
.L445:
	ldr	r2, .L530+28
	cmp	r3, r2
	bne	.LCB6465
	bl	.L416	@far jump
.LCB6465:
	ldr	r2, .L530+28
	cmp	r3, r2
	bgt	.L447
	ldr	r2, .L530+32
	cmp	r3, r2
	bne	.LCB6471
	bl	.L414	@far jump
.LCB6471:
	ldr	r2, .L530+32
	cmp	r3, r2
	ble	.LCB6474
	bl	.L415	@far jump
.LCB6474:
	bl	.L413	@ far jump
.L447:
	ldr	r2, .L530+36
	cmp	r3, r2
	bne	.LCB6481
	bl	.L418	@far jump
.LCB6481:
	ldr	r2, .L530+36
	cmp	r3, r2
	ble	.LCB6484
	bl	.L419	@far jump
.LCB6484:
	bl	.L417	@ far jump
.L440:
	ldr	r2, .L530+40
	cmp	r3, r2
	bne	.LCB6491
	bl	.L412	@far jump
.LCB6491:
	ldr	r2, .L530+40
	cmp	r3, r2
	bgt	.L448
	ldr	r2, .L530+44
	cmp	r3, r2
	bne	.LCB6497
	bl	.L416	@far jump
.LCB6497:
	ldr	r2, .L530+44
	cmp	r3, r2
	bgt	.L449
	ldr	r2, .L530+48
	cmp	r3, r2
	bne	.LCB6503
	bl	.L412	@far jump
.LCB6503:
	ldr	r2, .L530+48
	cmp	r3, r2
	bgt	.L450
	ldr	r2, .L530+52
	cmp	r3, r2
	bne	.LCB6509
	bl	.L421	@far jump
.LCB6509:
	ldr	r2, .L530+56
	cmp	r3, r2
	bne	.LCB6512
	bl	.L422	@far jump
.LCB6512:
	bl	.L394	@ far jump
.L450:
	ldr	r2, .L530+60
	cmp	r3, r2
	bne	.LCB6519
	bl	.L414	@far jump
.LCB6519:
	ldr	r2, .L530+60
	cmp	r3, r2
	ble	.LCB6522
	bl	.L415	@far jump
.LCB6522:
	bl	.L413	@ far jump
.L449:
	ldr	r2, .L530+64
	cmp	r3, r2
	bne	.LCB6529
	bl	.L419	@far jump
.LCB6529:
	ldr	r2, .L530+64
	cmp	r3, r2
	bgt	.L451
	ldr	r2, .L530+68
	cmp	r3, r2
	bne	.LCB6535
	bl	.L417	@far jump
.LCB6535:
	ldr	r2, .L530+72
	cmp	r3, r2
	bne	.LCB6538
	bl	.L418	@far jump
.LCB6538:
	bl	.L394	@ far jump
.L451:
	ldr	r2, .L530+76
	cmp	r3, r2
	bne	.LCB6545
	bl	.L421	@far jump
.LCB6545:
	ldr	r2, .L530+76
	cmp	r3, r2
	bge	.LCB6548
	bl	.L420	@far jump
.LCB6548:
	ldr	r2, .L530+80
	cmp	r3, r2
	bne	.LCB6551
	bl	.L422	@far jump
.LCB6551:
	bl	.L394	@ far jump
.L448:
	ldr	r2, .L530+84
	cmp	r3, r2
	bne	.LCB6558
	bl	.L419	@far jump
.LCB6558:
	ldr	r2, .L530+84
	cmp	r3, r2
	bgt	.L452
	ldr	r2, .L530+88
	cmp	r3, r2
	bne	.LCB6564
	bl	.L415	@far jump
.LCB6564:
	ldr	r2, .L530+88
	cmp	r3, r2
	bgt	.L453
	ldr	r2, .L530+92
	cmp	r3, r2
	bne	.LCB6570
	bl	.L413	@far jump
.LCB6570:
	ldr	r2, .L530+96
	cmp	r3, r2
	bne	.LCB6573
	bl	.L414	@far jump
.LCB6573:
	bl	.L394	@ far jump
.L453:
	ldr	r2, .L530+100
	cmp	r3, r2
	bne	.LCB6580
	bl	.L417	@far jump
.LCB6580:
	ldr	r2, .L530+100
	cmp	r3, r2
	ble	.LCB6583
	bl	.L418	@far jump
.LCB6583:
	bl	.L416	@ far jump
.L452:
	ldr	r2, .L530+104
	cmp	r3, r2
	bgt	.L454
	mov	r2, #144
	lsl	r2, r2, #7
	cmp	r3, r2
	blt	.LCB6594
	bl	.L506	@far jump
.LCB6594:
	ldr	r2, .L530+108
	cmp	r3, r2
	bne	.LCB6597
	bl	.L421	@far jump
.LCB6597:
	ldr	r2, .L530+108
	cmp	r3, r2
	bge	.LCB6600
	bl	.L420	@far jump
.LCB6600:
	ldr	r2, .L530+112
	cmp	r3, r2
	bne	.LCB6603
	bl	.L422	@far jump
.LCB6603:
	bl	.L394	@ far jump
.L454:
	ldr	r2, .L530+116
	cmp	r3, r2
	ble	.LCB6610
	bl	.L394	@far jump
.LCB6610:
	bl	.L499	@ far jump
.L395:
	.loc 3 1465 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #32
	and	r3, r3, r2
	cmp	r3, #0
	beq	.L455
	ldr	r3, .L530+120
	ldrb	r3, [r3, #1]
	cmp	r3, #0
	beq	.L456
	ldr	r2, .L530+124
	ldr	r3, .L530+128
	ldrh	r3, [r2, r3]
	cmp	r3, #208
	bhi	.L455
.L456:
	.loc 3 1468 0
	ldr	r2, .L530+124
	ldr	r3, .L530+132
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	bne	.L507
	.loc 3 1474 0
	ldr	r2, .L530+124
	ldr	r3, .L530+132
	mov	r1, #1
	strb	r1, [r2, r3]
	.loc 3 1475 0
	ldr	r2, .L530+124
	ldr	r3, .L530+136
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	beq	.L458
	.loc 3 1476 0
	bl	_Z15S9xUpdateHTimerv
	.loc 3 1465 0
	b	.L459
.L458:
	.loc 3 1478 0
	ldr	r2, .L530+124
	ldr	r3, .L530+128
	ldrh	r3, [r2, r3]
	mov	r2, r3
	ldr	r3, .L530+140
	ldr	r3, [r3, #52]
	cmp	r2, r3
	bne	.L508
	.loc 3 1479 0
	mov	r0, #2
	bl	S9xSetIRQ
	.loc 3 1465 0
	b	.L459
.L455:
	.loc 3 1484 0
	ldr	r2, .L530+124
	ldr	r3, .L530+132
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 3 1486 0
	ldr	r3, .L530+120
	ldrb	r3, [r3, #1]
	cmp	r3, #0
	beq	.L459
	.loc 3 1487 0
	add	r3, r7, #7
	add	r2, r7, #7
	ldrb	r2, [r2]
	mov	r1, #32
	bic	r2, r2, r1
	strb	r2, [r3]
	b	.L459
.L507:
	.loc 3 1465 0
	mov	r8, r8
	b	.L459
.L508:
	mov	r8, r8
.L459:
	.loc 3 1491 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #16
	and	r3, r3, r2
	cmp	r3, #0
	beq	.L460
	.loc 3 1493 0
	ldr	r2, .L530+124
	ldr	r3, .L530+136
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	bne	.L509
	.loc 3 1499 0
	ldr	r2, .L530+124
	ldr	r3, .L530+136
	mov	r1, #1
	strb	r1, [r2, r3]
	.loc 3 1500 0
	bl	_Z15S9xUpdateHTimerv
	b	.L462
.L460:
	.loc 3 1507 0
	ldr	r2, .L530+124
	ldr	r3, .L530+136
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 3 1508 0
	ldr	r3, .L530+144
	ldr	r3, [r3, #4]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r3, #1
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	mov	r1, r3
	ldr	r2, .L530+124
	ldr	r3, .L530+148
	strh	r1, [r2, r3]
	b	.L462
.L509:
	.loc 3 1500 0
	mov	r8, r8
.L462:
	.loc 3 1512 0
	ldr	r2, .L530+144
	mov	r3, #147
	lsl	r3, r3, #1
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	bne	.L463
	.loc 3 1513 0
	mov	r0, #3
	bl	_ZL16CLEAR_IRQ_SOURCEj
.L463:
	.loc 3 1515 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	lsl	r3, r3, #24
	asr	r3, r3, #24
	cmp	r3, #0
	blt	.LCB6747
	bl	.L510	@far jump
.LCB6747:
	.loc 3 1516 0
	ldr	r3, .L530+152
	ldr	r3, [r3, #20]
	mov	r1, #132
	lsl	r1, r1, #7
	add	r3, r3, r1
	ldrb	r3, [r3]
	.loc 3 1515 0
	lsl	r3, r3, #24
	asr	r3, r3, #24
	cmp	r3, #0
	bge	.LCB6757
	bl	.L511	@far jump
.LCB6757:
	ldr	r3, .L530+140
	ldr	r2, [r3, #52]
	ldr	r1, .L530+124
	ldr	r3, .L530+156
	ldrh	r3, [r1, r3]
	add	r3, r3, #1
	cmp	r2, r3
	bge	.LCB6765
	bl	.L512	@far jump
.LCB6765:
	ldr	r3, .L530+140
	ldr	r2, [r3, #52]
	ldr	r1, .L530+124
	ldr	r3, .L530+156
	ldrh	r3, [r1, r3]
	mov	r1, r3
	ldr	r3, .L530+120
	ldrb	r3, [r3, #2]
	cmp	r3, #0
	beq	.L465
	mov	r3, #25
	b	.L466
.L465:
	mov	r3, #15
.L466:
	add	r3, r1, r3
	cmp	r2, r3
	ble	.LCB6786
	bl	.L513	@far jump
.LCB6786:
	.loc 3 1523 0
	ldr	r3, .L530+152
	ldr	r3, [r3, #20]
	ldr	r2, .L530+160
	add	r3, r3, r2
	ldrb	r3, [r3]
	.loc 3 1515 0
	lsl	r3, r3, #24
	asr	r3, r3, #24
	cmp	r3, #0
	blt	.LCB6795
	bl	.L514	@far jump
.LCB6795:
	ldr	r3, .L530+140
	ldrb	r3, [r3, #5]
	cmp	r3, #0
	beq	.LCB6799
	bl	.L515	@far jump
.LCB6799:
	.loc 3 1525 0
	ldr	r3, .L530+140
	ldr	r2, [r3]
	mov	r3, #128
	orr	r2, r2, r3
	ldr	r3, .L530+140
	str	r2, [r3]
	.loc 3 1526 0
	ldr	r3, .L530+140
	mov	r2, #1
	strb	r2, [r3, #5]
	.loc 3 1527 0
	ldr	r3, .L530+140
	ldr	r2, [r3, #72]
	ldr	r3, .L530+140
	str	r2, [r3, #76]
	.loc 3 1530 0
	bl	.L394	@ far jump
.L531:
	.align	2
.L530:
	.word	17218
	.word	17232
	.word	17223
	.word	17221
	.word	17222
	.word	17225
	.word	17226
	.word	17236
	.word	17234
	.word	17238
	.word	17264
	.word	17252
	.word	17248
	.word	17241
	.word	17242
	.word	17250
	.word	17255
	.word	17253
	.word	17254
	.word	17257
	.word	17258
	.word	17271
	.word	17267
	.word	17265
	.word	17266
	.word	17269
	.word	18435
	.word	17273
	.word	17274
	.word	18439
	.word	SNESGameFixes
	.word	PPU
	.word	2122
	.word	2714
	.word	2715
	.word	CPU
	.word	Settings
	.word	2716
	.word	Memory
	.word	2154
	.word	16912
.L397:
.LBB21:
	.loc 3 1539 0
	ldr	r3, .L532
	ldr	r3, [r3, #20]
	ldr	r4, .L532+4
	add	r3, r3, r4
	ldrb	r3, [r3]
	add	r2, r7, #7
	ldrb	r2, [r2]
	mul	r3, r2
	str	r3, [r7, #12]
	.loc 3 1541 0
	ldr	r3, .L532
	ldr	r3, [r3, #20]
	ldr	r1, .L532+8
	add	r3, r3, r1
	ldr	r2, [r7, #12]
	lsl	r2, r2, #24
	lsr	r2, r2, #24
	strb	r2, [r3]
	.loc 3 1542 0
	ldr	r3, .L532
	ldr	r3, [r3, #20]
	ldr	r2, .L532+12
	add	r3, r3, r2
	ldr	r2, [r7, #12]
	lsr	r2, r2, #8
	lsl	r2, r2, #24
	lsr	r2, r2, #24
	strb	r2, [r3]
	.loc 3 1543 0
	bl	.L394	@ far jump
.L399:
.LBE21:
.LBB22:
	.loc 3 1553 0
	ldr	r3, .L532
	ldr	r3, [r3, #20]
	ldr	r4, .L532+16
	add	r3, r3, r4
	ldrb	r3, [r3]
	mov	r1, r3
	ldr	r3, .L532
	ldr	r3, [r3, #20]
	ldr	r2, .L532+20
	add	r3, r3, r2
	ldrb	r3, [r3]
	lsl	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	mov	r3, r7
	add	r3, r3, #18
	add	r2, r1, r2
	strh	r2, [r3]
	.loc 3 1554 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L467
	mov	r3, r7
	add	r3, r3, #18
	ldrh	r2, [r3]
	add	r3, r7, #7
	ldrb	r3, [r3]
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_idiv
	mov	r3, r0
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	b	.L468
.L467:
	ldr	r3, .L532+24
.L468:
	mov	r2, r7
	add	r2, r2, #20
	strh	r3, [r2]
	.loc 3 1555 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L469
	mov	r3, r7
	add	r3, r3, #18
	ldrh	r2, [r3]
	add	r3, r7, #7
	ldrb	r3, [r3]
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_idivmod
	mov	r3, r1
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	b	.L470
.L469:
	mov	r3, r7
	add	r3, r3, #18
	ldrh	r3, [r3]
.L470:
	mov	r2, r7
	add	r2, r2, #22
	strh	r3, [r2]
	.loc 3 1557 0
	ldr	r3, .L532
	ldr	r3, [r3, #20]
	ldr	r4, .L532+28
	add	r3, r3, r4
	mov	r2, r7
	add	r2, r2, #20
	ldrh	r2, [r2]
	lsl	r2, r2, #24
	lsr	r2, r2, #24
	strb	r2, [r3]
	.loc 3 1558 0
	ldr	r3, .L532
	ldr	r3, [r3, #20]
	ldr	r1, .L532+32
	add	r3, r3, r1
	mov	r2, r7
	add	r2, r2, #20
	ldrh	r2, [r2]
	asr	r2, r2, #8
	lsl	r2, r2, #24
	lsr	r2, r2, #24
	strb	r2, [r3]
	.loc 3 1559 0
	ldr	r3, .L532
	ldr	r3, [r3, #20]
	ldr	r2, .L532+8
	add	r3, r3, r2
	mov	r2, r7
	add	r2, r2, #22
	ldrh	r2, [r2]
	lsl	r2, r2, #24
	lsr	r2, r2, #24
	strb	r2, [r3]
	.loc 3 1560 0
	ldr	r3, .L532
	ldr	r3, [r3, #20]
	ldr	r4, .L532+12
	add	r3, r3, r4
	mov	r2, r7
	add	r2, r2, #22
	ldrh	r2, [r2]
	asr	r2, r2, #8
	lsl	r2, r2, #24
	lsr	r2, r2, #24
	strb	r2, [r3]
	.loc 3 1561 0
	bl	.L394	@ far jump
.L400:
.LBE22:
	.loc 3 1564 0
	ldr	r2, .L532+36
	ldr	r3, .L532+40
	ldrh	r3, [r2, r3]
	str	r3, [r7, #8]
	.loc 3 1565 0
	ldr	r2, .L532+36
	ldr	r3, .L532+40
	ldrh	r3, [r2, r3]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	mov	r2, #255
	lsl	r2, r2, #8
	and	r3, r3, r2
	add	r2, r7, #7
	ldrb	r1, [r2]
	add	r2, r3, #0
	add	r3, r1, #0
	orr	r3, r3, r2
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	lsr	r1, r3, #16
	ldr	r2, .L532+36
	ldr	r3, .L532+40
	strh	r1, [r2, r3]
	.loc 3 1567 0
	ldr	r2, .L532+36
	ldr	r3, .L532+44
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	bne	.LCB7041
	bl	.L516	@far jump
.LCB7041:
	ldr	r2, .L532+36
	ldr	r3, .L532+40
	ldrh	r3, [r2, r3]
	mov	r2, r3
	ldr	r3, [r7, #8]
	cmp	r2, r3
	bne	.LCB7048
	bl	.L517	@far jump
.LCB7048:
	.loc 3 1568 0
	bl	_Z15S9xUpdateHTimerv
	.loc 3 1569 0
	bl	.L394	@ far jump
.L401:
	.loc 3 1572 0
	ldr	r2, .L532+36
	ldr	r3, .L532+40
	ldrh	r3, [r2, r3]
	str	r3, [r7, #8]
	.loc 3 1573 0
	ldr	r2, .L532+36
	ldr	r3, .L532+40
	ldrh	r3, [r2, r3]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	mov	r2, #255
	and	r3, r3, r2
	add	r2, r7, #7
	ldrb	r1, [r2]
	mov	r2, #1
	and	r2, r2, r1
	lsl	r2, r2, #8
	lsl	r2, r2, #16
	lsr	r1, r2, #16
	add	r2, r3, #0
	add	r3, r1, #0
	orr	r3, r3, r2
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	lsr	r1, r3, #16
	ldr	r2, .L532+36
	ldr	r3, .L532+40
	strh	r1, [r2, r3]
	.loc 3 1575 0
	ldr	r2, .L532+36
	ldr	r3, .L532+44
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	bne	.LCB7086
	b	.L518	@long jump
.LCB7086:
	ldr	r2, .L532+36
	ldr	r3, .L532+40
	ldrh	r3, [r2, r3]
	mov	r2, r3
	ldr	r3, [r7, #8]
	cmp	r2, r3
	bne	.LCB7093
	b	.L519	@long jump
.LCB7093:
	.loc 3 1576 0
	bl	_Z15S9xUpdateHTimerv
	.loc 3 1578 0
	b	.L394
.L402:
	.loc 3 1581 0
	ldr	r2, .L532+36
	ldr	r3, .L532+48
	ldrh	r3, [r2, r3]
	str	r3, [r7, #8]
	.loc 3 1582 0
	ldr	r2, .L532+36
	ldr	r3, .L532+48
	ldrh	r3, [r2, r3]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	mov	r2, #255
	lsl	r2, r2, #8
	and	r3, r3, r2
	add	r2, r7, #7
	ldrb	r1, [r2]
	add	r2, r3, #0
	add	r3, r1, #0
	orr	r3, r3, r2
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	lsr	r1, r3, #16
	ldr	r2, .L532+36
	ldr	r3, .L532+48
	strh	r1, [r2, r3]
	.loc 3 1586 0
	ldr	r2, .L532+36
	ldr	r3, .L532+52
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	bne	.LCB7127
	b	.L520	@long jump
.LCB7127:
	ldr	r2, .L532+36
	ldr	r3, .L532+48
	ldrh	r3, [r2, r3]
	mov	r2, r3
	ldr	r3, [r7, #8]
	cmp	r2, r3
	bne	.LCB7134
	b	.L521	@long jump
.LCB7134:
	.loc 3 1588 0
	ldr	r2, .L532+36
	ldr	r3, .L532+44
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	beq	.L474
	.loc 3 1589 0
	bl	_Z15S9xUpdateHTimerv
	.loc 3 1596 0
	b	.L394
.L474:
	.loc 3 1592 0
	ldr	r2, .L532+36
	ldr	r3, .L532+48
	ldrh	r3, [r2, r3]
	mov	r2, r3
	ldr	r3, .L532+56
	ldr	r3, [r3, #52]
	cmp	r2, r3
	beq	.LCB7152
	b	.L522	@long jump
.LCB7152:
	.loc 3 1593 0
	mov	r0, #2
	bl	S9xSetIRQ
	.loc 3 1596 0
	b	.L394
.L498:
	.loc 3 1599 0
	ldr	r2, .L532+36
	ldr	r3, .L532+48
	ldrh	r3, [r2, r3]
	str	r3, [r7, #8]
	.loc 3 1600 0
	ldr	r2, .L532+36
	ldr	r3, .L532+48
	ldrh	r3, [r2, r3]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	mov	r2, #255
	and	r3, r3, r2
	add	r2, r7, #7
	ldrb	r1, [r2]
	mov	r2, #1
	and	r2, r2, r1
	lsl	r2, r2, #8
	lsl	r2, r2, #16
	lsr	r1, r2, #16
	add	r2, r3, #0
	add	r3, r1, #0
	orr	r3, r3, r2
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	lsr	r1, r3, #16
	ldr	r2, .L532+36
	ldr	r3, .L532+48
	strh	r1, [r2, r3]
	.loc 3 1604 0
	ldr	r2, .L532+36
	ldr	r3, .L532+52
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	bne	.LCB7191
	b	.L523	@long jump
.LCB7191:
	ldr	r2, .L532+36
	ldr	r3, .L532+48
	ldrh	r3, [r2, r3]
	mov	r2, r3
	ldr	r3, [r7, #8]
	cmp	r2, r3
	bne	.LCB7198
	b	.L524	@long jump
.LCB7198:
	.loc 3 1606 0
	ldr	r2, .L532+36
	ldr	r3, .L532+44
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	beq	.L476
	.loc 3 1607 0
	bl	_Z15S9xUpdateHTimerv
	.loc 3 1614 0
	b	.L394
.L476:
	.loc 3 1610 0
	ldr	r2, .L532+36
	ldr	r3, .L532+48
	ldrh	r3, [r2, r3]
	mov	r2, r3
	ldr	r3, .L532+56
	ldr	r3, [r3, #52]
	cmp	r2, r3
	beq	.LCB7216
	b	.L525	@long jump
.LCB7216:
	.loc 3 1611 0
	mov	r0, #2
	bl	S9xSetIRQ
	.loc 3 1614 0
	b	.L394
.L533:
	.align	2
.L532:
	.word	Memory
	.word	16898
	.word	16918
	.word	16919
	.word	16900
	.word	16901
	.word	65535
	.word	16916
	.word	16917
	.word	PPU
	.word	2124
	.word	2715
	.word	2122
	.word	2714
	.word	CPU
.L404:
	.loc 3 1621 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #1
	and	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	beq	.L477
	.loc 3 1622 0
	mov	r0, #0
	bl	S9xDoDMA
.L477:
	.loc 3 1623 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #2
	and	r3, r3, r2
	cmp	r3, #0
	beq	.L478
	.loc 3 1624 0
	mov	r0, #1
	bl	S9xDoDMA
.L478:
	.loc 3 1625 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #4
	and	r3, r3, r2
	cmp	r3, #0
	beq	.L479
	.loc 3 1626 0
	mov	r0, #2
	bl	S9xDoDMA
.L479:
	.loc 3 1627 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #8
	and	r3, r3, r2
	cmp	r3, #0
	beq	.L480
	.loc 3 1628 0
	mov	r0, #3
	bl	S9xDoDMA
.L480:
	.loc 3 1629 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #16
	and	r3, r3, r2
	cmp	r3, #0
	beq	.L481
	.loc 3 1630 0
	mov	r0, #4
	bl	S9xDoDMA
.L481:
	.loc 3 1631 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #32
	and	r3, r3, r2
	cmp	r3, #0
	beq	.L482
	.loc 3 1632 0
	mov	r0, #5
	bl	S9xDoDMA
.L482:
	.loc 3 1633 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #64
	and	r3, r3, r2
	cmp	r3, #0
	beq	.L483
	.loc 3 1634 0
	mov	r0, #6
	bl	S9xDoDMA
.L483:
	.loc 3 1635 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	lsl	r3, r3, #24
	asr	r3, r3, #24
	cmp	r3, #0
	blt	.LCB7320
	b	.L526	@long jump
.LCB7320:
	.loc 3 1636 0
	mov	r0, #7
	bl	S9xDoDMA
	.loc 3 1637 0
	b	.L394
.L405:
	.loc 3 1643 0
	ldr	r2, .L534
	mov	r3, #122
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	beq	.L485
	.loc 3 1644 0
	add	r3, r7, #7
	mov	r2, #0
	strb	r2, [r3]
.L485:
	.loc 3 1645 0
	ldr	r3, .L534+4
	ldr	r3, [r3, #20]
	ldr	r1, .L534+8
	add	r3, r3, r1
	add	r2, r7, #7
	ldrb	r2, [r2]
	strb	r2, [r3]
	.loc 3 1646 0
	ldr	r3, .L534+12
	add	r2, r7, #7
	ldrb	r2, [r2]
	strb	r2, [r3, #1]
	.loc 3 1647 0
	b	.L394
.L406:
	.loc 3 1651 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	ldr	r3, .L534+4
	ldr	r3, [r3, #20]
	ldr	r4, .L534+16
	add	r3, r3, r4
	ldrb	r3, [r3]
	eor	r2, r2, r3
	mov	r3, #1
	and	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	bne	.LCB7365
	b	.L527	@long jump
.LCB7365:
	.loc 3 1653 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #1
	and	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	beq	.L486
	.loc 3 1655 0
	ldr	r3, .L534+20
	mov	r2, #6
	str	r2, [r3, #64]
	b	.L487
.L486:
	.loc 3 1661 0
	ldr	r3, .L534+20
	mov	r2, #8
	str	r2, [r3, #64]
.L487:
	.loc 3 1663 0
	ldr	r3, .L534+4
	mov	r0, r3
	bl	_ZN7CMemory11FixROMSpeedEv
	.loc 3 1669 0
	b	.L394
.L408:
	.loc 3 1672 0
	ldr	r3, .L534+4
	ldr	r3, [r3, #20]
	ldr	r1, .L534+24
	add	r3, r3, r1
	mov	r2, #0
	strb	r2, [r3]
	.loc 3 1673 0
	b	.L497
.L409:
	.loc 3 1676 0
	mov	r0, #3
	bl	_ZL16CLEAR_IRQ_SOURCEj
	.loc 3 1677 0
	b	.L394
.L412:
	.loc 3 1708 0
	add	r3, r7, #4
	ldrh	r3, [r3]
	asr	r2, r3, #4
	mov	r3, #7
	and	r3, r3, r2
	str	r3, [r7, #8]
	.loc 3 1709 0
	ldr	r1, [r7, #8]
	add	r3, r7, #7
	ldrb	r3, [r3]
	lsl	r3, r3, #24
	asr	r3, r3, #24
	cmp	r3, #0
	bge	.L489
	mov	r3, #1
	b	.L490
.L489:
	mov	r3, #0
.L490:
	ldr	r2, .L534+28
	mov	r0, #22
	mul	r1, r0
	strb	r3, [r1, r2]
	.loc 3 1710 0
	ldr	r0, [r7, #8]
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #64
	and	r3, r3, r2
	cmp	r3, #0
	beq	.L491
	mov	r3, #1
	b	.L492
.L491:
	mov	r3, #0
.L492:
	ldr	r1, .L534+28
	mov	r2, #8
	mov	r4, #22
	mov	ip, r4
	mov	r4, r0
	mov	r0, ip
	mul	r0, r4
	add	r1, r0, r1
	add	r2, r1, r2
	strb	r3, [r2, #6]
	.loc 3 1711 0
	ldr	r1, [r7, #8]
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #16
	and	r3, r3, r2
	cmp	r3, #0
	beq	.L493
	mov	r3, #1
	b	.L494
.L493:
	mov	r3, #0
.L494:
	ldr	r2, .L534+28
	mov	r0, #22
	mul	r1, r0
	add	r2, r1, r2
	strb	r3, [r2, #2]
	.loc 3 1712 0
	ldr	r1, [r7, #8]
	add	r3, r7, #7
	ldrb	r2, [r3]
	mov	r3, #8
	and	r3, r3, r2
	cmp	r3, #0
	beq	.L495
	mov	r3, #1
	b	.L496
.L495:
	mov	r3, #0
.L496:
	ldr	r2, .L534+28
	mov	r0, #22
	mul	r1, r0
	add	r2, r1, r2
	strb	r3, [r2, #1]
	.loc 3 1713 0
	ldr	r1, [r7, #8]
	add	r3, r7, #7
	ldrb	r3, [r3]
	mov	r2, #7
	and	r3, r3, r2
	ldr	r2, .L534+28
	mov	r0, #22
	mul	r1, r0
	add	r2, r1, r2
	strb	r3, [r2, #3]
	.loc 3 1714 0
	b	.L394
.L413:
	.loc 3 1724 0
	add	r3, r7, #4
	ldrh	r3, [r3]
	asr	r2, r3, #4
	mov	r3, #7
	mov	r1, r2
	and	r1, r1, r3
	ldr	r2, .L534+28
	mov	r3, #8
	mov	r0, #22
	mul	r1, r0
	add	r2, r1, r2
	add	r3, r2, r3
	add	r2, r7, #7
	ldrb	r2, [r2]
	strb	r2, [r3, #2]
	.loc 3 1725 0
	b	.L394
.L414:
	.loc 3 1735 0
	add	r3, r7, #4
	ldrh	r3, [r3]
	asr	r2, r3, #4
	mov	r3, #7
	and	r3, r3, r2
	str	r3, [r7, #8]
	.loc 3 1736 0
	ldr	r1, [r7, #8]
	ldr	r2, [r7, #8]
	ldr	r3, .L534+28
	mov	r0, #22
	mul	r2, r0
	add	r3, r2, r3
	add	r3, r3, #6
	ldrh	r3, [r3]
	mov	r2, #255
	lsl	r2, r2, #8
	and	r3, r3, r2
	ldr	r2, .L534+28
	mov	r0, #22
	mul	r1, r0
	add	r2, r1, r2
	add	r2, r2, #6
	strh	r3, [r2]
	.loc 3 1737 0
	ldr	r1, [r7, #8]
	ldr	r2, [r7, #8]
	ldr	r3, .L534+28
	mov	r0, #22
	mul	r2, r0
	add	r3, r2, r3
	add	r3, r3, #6
	ldrh	r2, [r3]
	add	r3, r7, #7
	ldrb	r3, [r3]
	orr	r3, r3, r2
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, .L534+28
	mov	r0, #22
	mul	r1, r0
	add	r3, r1, r3
	add	r3, r3, #6
	strh	r2, [r3]
	.loc 3 1738 0
	b	.L394
.L415:
	.loc 3 1748 0
	add	r3, r7, #4
	ldrh	r3, [r3]
	asr	r2, r3, #4
	mov	r3, #7
	and	r3, r3, r2
	str	r3, [r7, #8]
	.loc 3 1749 0
	ldr	r1, [r7, #8]
	ldr	r2, [r7, #8]
	ldr	r3, .L534+28
	mov	r0, #22
	mul	r2, r0
	add	r3, r2, r3
	add	r3, r3, #6
	ldrh	r3, [r3]
	mov	r2, #255
	and	r3, r3, r2
	ldr	r2, .L534+28
	mov	r0, #22
	mul	r1, r0
	add	r2, r1, r2
	add	r2, r2, #6
	strh	r3, [r2]
	.loc 3 1750 0
	ldr	r1, [r7, #8]
	ldr	r2, [r7, #8]
	ldr	r3, .L534+28
	mov	r0, #22
	mul	r2, r0
	add	r3, r2, r3
	add	r3, r3, #6
	ldrh	r3, [r3]
	mov	r2, r3
	add	r3, r7, #7
	ldrb	r3, [r3]
	lsl	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	orr	r3, r3, r2
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, .L534+28
	mov	r0, #22
	mul	r1, r0
	add	r3, r1, r3
	add	r3, r3, #6
	strh	r2, [r3]
	.loc 3 1751 0
	b	.L394
.L416:
	.loc 3 1761 0
	add	r3, r7, #4
	ldrh	r3, [r3]
	asr	r2, r3, #4
	mov	r3, #7
	and	r2, r2, r3
	ldr	r3, .L534+28
	mov	r1, #22
	mul	r1, r2
	add	r2, r7, #7
	add	r3, r1, r3
	ldrb	r2, [r2]
	strb	r2, [r3, #4]
	.loc 3 1762 0
	b	.L394
.L417:
	.loc 3 1772 0
	add	r3, r7, #4
	ldrh	r3, [r3]
	asr	r2, r3, #4
	mov	r3, #7
	and	r3, r3, r2
	str	r3, [r7, #8]
	.loc 3 1773 0
	ldr	r1, [r7, #8]
	ldr	r2, [r7, #8]
	ldr	r3, .L534+28
	mov	r0, #22
	mul	r2, r0
	add	r3, r2, r3
	add	r3, r3, #12
	ldrh	r3, [r3]
	mov	r2, #255
	lsl	r2, r2, #8
	and	r3, r3, r2
	ldr	r2, .L534+28
	mov	r0, #22
	mul	r1, r0
	add	r2, r1, r2
	add	r2, r2, #12
	strh	r3, [r2]
	.loc 3 1774 0
	ldr	r1, [r7, #8]
	ldr	r2, [r7, #8]
	ldr	r3, .L534+28
	mov	r0, #22
	mul	r2, r0
	add	r3, r2, r3
	add	r3, r3, #12
	ldrh	r2, [r3]
	add	r3, r7, #7
	ldrb	r3, [r3]
	orr	r3, r3, r2
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, .L534+28
	mov	r0, #22
	mul	r1, r0
	add	r3, r1, r3
	add	r3, r3, #12
	strh	r2, [r3]
	.loc 3 1775 0
	ldr	r1, [r7, #8]
	ldr	r2, [r7, #8]
	ldr	r3, .L534+28
	mov	r0, #22
	mul	r2, r0
	add	r3, r2, r3
	add	r3, r3, #16
	ldrh	r3, [r3]
	mov	r2, #255
	lsl	r2, r2, #8
	and	r3, r3, r2
	ldr	r2, .L534+28
	mov	r0, #22
	mul	r1, r0
	add	r2, r1, r2
	add	r2, r2, #16
	strh	r3, [r2]
	.loc 3 1776 0
	ldr	r1, [r7, #8]
	ldr	r2, [r7, #8]
	ldr	r3, .L534+28
	mov	r0, #22
	mul	r2, r0
	add	r3, r2, r3
	add	r3, r3, #16
	ldrh	r2, [r3]
	add	r3, r7, #7
	ldrb	r3, [r3]
	orr	r3, r3, r2
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, .L534+28
	mov	r0, #22
	mul	r1, r0
	add	r3, r1, r3
	add	r3, r3, #16
	strh	r2, [r3]
	.loc 3 1777 0
	b	.L394
.L535:
	.align	2
.L534:
	.word	Settings
	.word	Memory
	.word	16908
	.word	IPPU
	.word	16909
	.word	CPU
	.word	16912
	.word	DMA
.L418:
	.loc 3 1787 0
	add	r3, r7, #4
	ldrh	r3, [r3]
	asr	r2, r3, #4
	mov	r3, #7
	and	r3, r3, r2
	str	r3, [r7, #8]
	.loc 3 1788 0
	ldr	r1, [r7, #8]
	ldr	r2, [r7, #8]
	ldr	r3, .L536
	mov	r0, #22
	mul	r2, r0
	add	r3, r2, r3
	add	r3, r3, #12
	ldrh	r3, [r3]
	mov	r2, #255
	and	r3, r3, r2
	ldr	r2, .L536
	mov	r0, #22
	mul	r1, r0
	add	r2, r1, r2
	add	r2, r2, #12
	strh	r3, [r2]
	.loc 3 1789 0
	ldr	r1, [r7, #8]
	ldr	r2, [r7, #8]
	ldr	r3, .L536
	mov	r0, #22
	mul	r2, r0
	add	r3, r2, r3
	add	r3, r3, #12
	ldrh	r3, [r3]
	mov	r2, r3
	add	r3, r7, #7
	ldrb	r3, [r3]
	lsl	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	orr	r3, r3, r2
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, .L536
	mov	r0, #22
	mul	r1, r0
	add	r3, r1, r3
	add	r3, r3, #12
	strh	r2, [r3]
	.loc 3 1790 0
	ldr	r1, [r7, #8]
	ldr	r2, [r7, #8]
	ldr	r3, .L536
	mov	r0, #22
	mul	r2, r0
	add	r3, r2, r3
	add	r3, r3, #16
	ldrh	r3, [r3]
	mov	r2, #255
	and	r3, r3, r2
	ldr	r2, .L536
	mov	r0, #22
	mul	r1, r0
	add	r2, r1, r2
	add	r2, r2, #16
	strh	r3, [r2]
	.loc 3 1791 0
	ldr	r1, [r7, #8]
	ldr	r2, [r7, #8]
	ldr	r3, .L536
	mov	r0, #22
	mul	r2, r0
	add	r3, r2, r3
	add	r3, r3, #16
	ldrh	r3, [r3]
	mov	r2, r3
	add	r3, r7, #7
	ldrb	r3, [r3]
	lsl	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	orr	r3, r3, r2
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, .L536
	mov	r0, #22
	mul	r1, r0
	add	r3, r1, r3
	add	r3, r3, #16
	strh	r2, [r3]
	.loc 3 1792 0
	b	.L394
.L419:
	.loc 3 1802 0
	add	r3, r7, #4
	ldrh	r3, [r3]
	asr	r2, r3, #4
	mov	r3, #7
	and	r3, r3, r2
	str	r3, [r7, #8]
	ldr	r1, [r7, #8]
	ldr	r2, .L536
	mov	r3, #16
	mov	r0, #22
	mul	r1, r0
	add	r2, r1, r2
	add	r3, r2, r3
	add	r2, r7, #7
	ldrb	r2, [r2]
	strb	r2, [r3, #2]
	.loc 3 1803 0
	b	.L394
.L420:
	.loc 3 1813 0
	add	r3, r7, #4
	ldrh	r3, [r3]
	asr	r2, r3, #4
	mov	r3, #7
	and	r3, r3, r2
	str	r3, [r7, #8]
	.loc 3 1814 0
	ldr	r1, [r7, #8]
	ldr	r2, [r7, #8]
	ldr	r3, .L536
	mov	r0, #22
	mul	r2, r0
	add	r3, r2, r3
	add	r3, r3, #8
	ldrh	r3, [r3]
	mov	r2, #255
	lsl	r2, r2, #8
	and	r3, r3, r2
	ldr	r2, .L536
	mov	r0, #22
	mul	r1, r0
	add	r2, r1, r2
	add	r2, r2, #8
	strh	r3, [r2]
	.loc 3 1815 0
	ldr	r1, [r7, #8]
	ldr	r2, [r7, #8]
	ldr	r3, .L536
	mov	r0, #22
	mul	r2, r0
	add	r3, r2, r3
	add	r3, r3, #8
	ldrh	r2, [r3]
	add	r3, r7, #7
	ldrb	r3, [r3]
	orr	r3, r3, r2
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, .L536
	mov	r0, #22
	mul	r1, r0
	add	r3, r1, r3
	add	r3, r3, #8
	strh	r2, [r3]
	.loc 3 1816 0
	b	.L394
.L421:
	.loc 3 1826 0
	add	r3, r7, #4
	ldrh	r3, [r3]
	asr	r2, r3, #4
	mov	r3, #7
	and	r3, r3, r2
	str	r3, [r7, #8]
	.loc 3 1827 0
	ldr	r1, [r7, #8]
	ldr	r2, [r7, #8]
	ldr	r3, .L536
	mov	r0, #22
	mul	r2, r0
	add	r3, r2, r3
	add	r3, r3, #8
	ldrh	r3, [r3]
	mov	r2, #255
	and	r3, r3, r2
	ldr	r2, .L536
	mov	r0, #22
	mul	r1, r0
	add	r2, r1, r2
	add	r2, r2, #8
	strh	r3, [r2]
	.loc 3 1828 0
	ldr	r1, [r7, #8]
	ldr	r2, [r7, #8]
	ldr	r3, .L536
	mov	r0, #22
	mul	r2, r0
	add	r3, r2, r3
	add	r3, r3, #8
	ldrh	r3, [r3]
	mov	r2, r3
	add	r3, r7, #7
	ldrb	r3, [r3]
	lsl	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	orr	r3, r3, r2
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, .L536
	mov	r0, #22
	mul	r1, r0
	add	r3, r1, r3
	add	r3, r3, #8
	strh	r2, [r3]
	.loc 3 1829 0
	b	.L394
.L422:
	.loc 3 1839 0
	add	r3, r7, #4
	ldrh	r3, [r3]
	asr	r2, r3, #4
	mov	r3, #7
	and	r3, r3, r2
	str	r3, [r7, #8]
	.loc 3 1840 0
	ldr	r0, [r7, #8]
	add	r3, r7, #7
	ldrb	r3, [r3]
	mov	r2, #127
	and	r3, r3, r2
	ldr	r1, .L536
	mov	r2, #16
	mov	r4, #22
	mov	ip, r4
	mov	r4, r0
	mov	r0, ip
	mul	r0, r4
	add	r1, r0, r1
	add	r2, r1, r2
	strb	r3, [r2, #4]
	.loc 3 1841 0
	ldr	r0, [r7, #8]
	add	r3, r7, #7
	ldrb	r3, [r3]
	lsl	r3, r3, #24
	asr	r3, r3, #24
	mvn	r3, r3
	lsr	r2, r3, #31
	ldr	r1, .L536
	mov	r3, #16
	mov	r4, #22
	mov	ip, r4
	mov	r4, r0
	mov	r0, ip
	mul	r0, r4
	add	r1, r0, r1
	add	r3, r1, r3
	strb	r2, [r3, #3]
	.loc 3 1842 0
	b	.L394
.L499:
	.loc 3 1857 0
	add	r3, r7, #4
	ldrh	r3, [r3]
	ldr	r1, .L536+4
	add	r3, r3, r1
	mov	r2, r3
	add	r3, r7, #7
	ldrb	r1, [r3]
	mov	r3, #7
	and	r3, r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	_Z19S9xSetSDD1MemoryMapjj
	b	.L394
.L500:
	.loc 3 1442 0
	mov	r8, r8
	b	.L394
.L501:
	mov	r8, r8
	b	.L394
.L502:
	mov	r8, r8
	b	.L394
.L503:
	.loc 3 1535 0
	mov	r8, r8
	b	.L394
.L505:
	.loc 3 1669 0
	mov	r8, r8
	b	.L394
.L506:
	.loc 3 1849 0
	mov	r8, r8
	b	.L394
.L510:
	.loc 3 1530 0
	mov	r8, r8
	b	.L394
.L511:
	mov	r8, r8
	b	.L394
.L512:
	mov	r8, r8
	b	.L394
.L513:
	mov	r8, r8
	b	.L394
.L514:
	mov	r8, r8
	b	.L394
.L515:
	mov	r8, r8
	b	.L394
.L516:
	.loc 3 1569 0
	mov	r8, r8
	b	.L394
.L517:
	mov	r8, r8
	b	.L394
.L518:
	.loc 3 1578 0
	mov	r8, r8
	b	.L394
.L519:
	mov	r8, r8
	b	.L394
.L520:
	.loc 3 1596 0
	mov	r8, r8
	b	.L394
.L521:
	mov	r8, r8
	b	.L394
.L522:
	mov	r8, r8
	b	.L394
.L523:
	.loc 3 1614 0
	mov	r8, r8
	b	.L394
.L524:
	mov	r8, r8
	b	.L394
.L525:
	mov	r8, r8
	b	.L394
.L526:
	.loc 3 1637 0
	mov	r8, r8
	b	.L394
.L527:
	.loc 3 1669 0
	mov	r8, r8
.L394:
	.loc 3 1874 0
	ldr	r3, .L536+8
	ldr	r2, [r3, #20]
	add	r3, r7, #4
	ldrh	r3, [r3]
	add	r3, r2, r3
	add	r2, r7, #7
	ldrb	r2, [r2]
	strb	r2, [r3]
	b	.L497
.L504:
	.loc 3 1698 0
	mov	r8, r8
.L497:
.LBE20:
	.loc 3 1875 0
	mov	sp, r7
	add	sp, sp, #28
	@ sp needed for prologue
	pop	{r4, r7, pc}
.L537:
	.align	2
.L536:
	.word	DMA
	.word	-18436
	.word	Memory
.LFE32:
	.fnend
	.size	S9xSetCPU, .-S9xSetCPU
	.align	2
	.global	S9xGetCPU
	.hidden	S9xGetCPU
	.code	16
	.thumb_func
	.type	S9xGetCPU, %function
S9xGetCPU:
	.fnstart
.LFB33:
	.loc 3 1882 0
	.save	{r7, lr}
	push	{r7, lr}
.LCFI36:
	sub	sp, sp, #24
.LCFI37:
	add	r7, sp, #0
.LCFI38:
	mov	r2, r0
	add	r3, r7, #6
	strh	r2, [r3]
.LBB23:
	.loc 3 1885 0
	add	r3, r7, #6
	ldrh	r2, [r3]
	ldr	r3, .L600
	cmp	r2, r3
	bls	.LCB8169
	b	.L539	@long jump
.LCB8169:
	.loc 3 1888 0
	ldr	r3, .L600+4
	ldr	r3, [r3, #28]
	add	r2, r3, #6
	ldr	r3, .L600+4
	str	r2, [r3, #28]
	.loc 3 1890 0
	add	r3, r7, #6
	ldrh	r3, [r3]
	ldr	r2, .L600+8
	cmp	r3, r2
	beq	.L542
	ldr	r2, .L600+8
	cmp	r3, r2
	bgt	.L544
	ldr	r0, .L600+12
	add	r3, r3, r0
	cmp	r3, #1
	bls	.LCB8186
	b	.L540	@long jump
.LCB8186:
	b	.L598
.L544:
	ldr	r2, .L600+16
	cmp	r3, r2
	beq	.L543
	b	.L540
.L598:
	.loc 3 1895 0
	mov	r3, #64
	b	.L545
.L542:
.LBB24:
	.loc 3 1899 0
	ldr	r3, .L600+20
	ldr	r3, [r3, #20]
	ldr	r1, .L600+8
	add	r3, r3, r1
	ldrb	r3, [r3]
	mov	r2, r3
	mov	r3, #1
	and	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	beq	.L546
	.loc 3 1901 0
	ldr	r3, .L600+24
	ldrb	r3, [r3, #25]
	cmp	r3, #0
	bne	.L547
	ldr	r2, .L600+28
	ldr	r3, .L600+32
	ldr	r3, [r2, r3]
	cmp	r3, #2
	beq	.L548
.L547:
	ldr	r3, .L600+24
	ldrb	r3, [r3, #25]
	cmp	r3, #0
	beq	.L549
	ldr	r2, .L600+28
	ldr	r3, .L600+32
	ldr	r3, [r2, r3]
	cmp	r3, #3
	bne	.L549
.L548:
	.loc 3 1906 0
	ldr	r2, .L600+36
	ldr	r3, .L600+40
	ldrb	r3, [r2, r3]
	add	r3, r3, #1
	lsl	r3, r3, #24
	lsr	r1, r3, #24
	ldr	r2, .L600+36
	ldr	r3, .L600+40
	strb	r1, [r2, r3]
	ldr	r2, .L600+36
	ldr	r3, .L600+40
	ldrb	r3, [r2, r3]
	mov	r2, #2
	cmp	r2, r3
	sbc	r3, r3, r3
	neg	r3, r3
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	beq	.L549
	.loc 3 1907 0
	ldr	r2, .L600+36
	ldr	r3, .L600+40
	mov	r1, #0
	strb	r1, [r2, r3]
.L549:
	.loc 3 1909 0
	mov	r3, #0
	b	.L545
.L546:
	.loc 3 1912 0
	ldr	r3, .L600+24
	ldrb	r3, [r3, #25]
	cmp	r3, #0
	beq	.L550
	mov	r3, #1
	b	.L551
.L550:
	mov	r3, #0
.L551:
	str	r3, [r7, #12]
	.loc 3 1913 0
	ldr	r2, [r7, #12]
	ldr	r3, .L600+28
	mov	r0, #229
	lsl	r0, r0, #2
	add	r2, r2, r0
	lsl	r2, r2, #2
	ldr	r2, [r2, r3]
	ldr	r1, .L600+36
	ldr	r3, .L600+44
	ldrb	r1, [r1, r3]
	mov	r3, #15
	eor	r3, r3, r1
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	lsr	r2, r2, r3
	mov	r3, r7
	add	r3, r3, #11
	strb	r2, [r3]
	.loc 3 1914 0
	ldr	r2, .L600+36
	ldr	r3, .L600+44
	ldrb	r3, [r2, r3]
	add	r3, r3, #1
	lsl	r3, r3, #24
	lsr	r1, r3, #24
	ldr	r2, .L600+36
	ldr	r3, .L600+44
	strb	r1, [r2, r3]
	.loc 3 1915 0
	mov	r3, r7
	add	r3, r3, #11
	ldrb	r3, [r3]
	mov	r2, #1
	and	r3, r3, r2
	b	.L545
.L543:
.LBE24:
.LBB25:
	.loc 3 1919 0
	ldr	r3, .L600+20
	ldr	r3, [r3, #20]
	ldr	r1, .L600+8
	add	r3, r3, r1
	ldrb	r3, [r3]
	mov	r2, r3
	mov	r3, #1
	and	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	beq	.L552
	.loc 3 1922 0
	ldr	r2, .L600+28
	ldr	r3, .L600+32
	ldr	r3, [r2, r3]
	cmp	r3, #2
	beq	.L555
	cmp	r3, #3
	beq	.L556
	cmp	r3, #0
	bne	.L553
.L554:
	.loc 3 1925 0
	mov	r3, #2
	b	.L545
.L555:
	.loc 3 1927 0
	ldr	r3, .L600+24
	ldrb	r3, [r3, #25]
	cmp	r3, #0
	beq	.L557
	.loc 3 1928 0
	ldr	r2, .L600+36
	ldr	r3, .L600+40
	ldrb	r3, [r2, r3]
	.loc 3 1927 0
	add	r3, r3, #1
	lsl	r3, r3, #24
	lsr	r1, r3, #24
	ldr	r2, .L600+36
	ldr	r3, .L600+40
	strb	r1, [r2, r3]
	.loc 3 1928 0
	ldr	r2, .L600+36
	ldr	r3, .L600+40
	ldrb	r3, [r2, r3]
	.loc 3 1927 0
	cmp	r3, #2
	bls	.L557
	mov	r3, #1
	b	.L558
.L557:
	mov	r3, #0
.L558:
	cmp	r3, #0
	beq	.L599
	.loc 3 1929 0
	ldr	r2, .L600+36
	ldr	r3, .L600+40
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 3 1930 0
	b	.L553
.L556:
	.loc 3 1933 0
	ldr	r3, .L600+24
	ldrb	r3, [r3, #25]
	cmp	r3, #0
	bne	.L560
	.loc 3 1934 0
	ldr	r2, .L600+36
	ldr	r3, .L600+40
	ldrb	r3, [r2, r3]
	.loc 3 1933 0
	add	r3, r3, #1
	lsl	r3, r3, #24
	lsr	r1, r3, #24
	ldr	r2, .L600+36
	ldr	r3, .L600+40
	strb	r1, [r2, r3]
	.loc 3 1934 0
	ldr	r2, .L600+36
	ldr	r3, .L600+40
	ldrb	r3, [r2, r3]
	.loc 3 1933 0
	cmp	r3, #2
	bls	.L560
	mov	r3, #1
	b	.L561
.L560:
	mov	r3, #0
.L561:
	cmp	r3, #0
	beq	.L553
	.loc 3 1935 0
	ldr	r2, .L600+36
	ldr	r3, .L600+40
	mov	r1, #0
	strb	r1, [r2, r3]
	b	.L553
.L599:
	.loc 3 1930 0
	mov	r8, r8
.L553:
	.loc 3 1938 0
	mov	r3, #0
	b	.L545
.L552:
	.loc 3 1941 0
	ldr	r3, .L600+24
	ldrb	r3, [r3, #25]
	neg	r2, r3
	adc	r3, r3, r2
	str	r3, [r7, #16]
	.loc 3 1943 0
	ldr	r2, .L600+28
	ldr	r3, .L600+32
	ldr	r3, [r2, r3]
	cmp	r3, #0
	bne	.L562
	.loc 3 1945 0
	ldr	r3, .L600+20
	ldr	r3, [r3, #20]
	ldr	r2, .L600+48
	add	r3, r3, r2
	ldrb	r3, [r3]
	lsl	r3, r3, #24
	asr	r3, r3, #24
	cmp	r3, #0
	bge	.L563
	.loc 3 1948 0
	ldr	r2, [r7, #16]
	ldr	r3, .L600+28
	mov	r0, #229
	lsl	r0, r0, #2
	add	r2, r2, r0
	lsl	r2, r2, #2
	ldr	r2, [r2, r3]
	.loc 3 1954 0
	ldr	r1, .L600+36
	ldr	r3, .L600+52
	ldrb	r1, [r1, r3]
	mov	r3, #15
	eor	r3, r3, r1
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	mov	r1, r2
	lsr	r1, r1, r3
	mov	r3, r1
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	mov	r2, #1
	and	r3, r3, r2
	.loc 3 1951 0
	ldr	r1, .L600+28
	ldr	r2, .L600+56
	ldr	r1, [r1, r2]
	.loc 3 1954 0
	ldr	r0, .L600+36
	ldr	r2, .L600+52
	ldrb	r0, [r0, r2]
	mov	r2, #15
	eor	r2, r2, r0
	lsl	r2, r2, #24
	lsr	r2, r2, #24
	mov	r0, r1
	lsr	r0, r0, r2
	mov	r2, r0
	lsl	r2, r2, #24
	lsr	r2, r2, #24
	mov	r1, #1
	and	r2, r2, r1
	lsl	r2, r2, #1
	lsl	r2, r2, #24
	lsr	r1, r2, #24
	mov	r2, r7
	add	r2, r2, #11
	orr	r3, r3, r1
	strb	r3, [r2]
	.loc 3 1955 0
	ldr	r2, .L600+36
	ldr	r3, .L600+52
	ldrb	r3, [r2, r3]
	add	r3, r3, #1
	lsl	r3, r3, #24
	lsr	r1, r3, #24
	ldr	r2, .L600+36
	ldr	r3, .L600+52
	strb	r1, [r2, r3]
	.loc 3 1956 0
	mov	r3, r7
	add	r3, r3, #11
	ldrb	r3, [r3]
	b	.L545
.L563:
	.loc 3 1961 0
	ldr	r2, .L600+28
	ldr	r3, .L600+60
	ldr	r2, [r2, r3]
	.loc 3 1967 0
	ldr	r1, .L600+36
	ldr	r3, .L600+64
	ldrb	r1, [r1, r3]
	mov	r3, #15
	eor	r3, r3, r1
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	mov	r1, r2
	lsr	r1, r1, r3
	mov	r3, r1
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	mov	r2, #1
	and	r3, r3, r2
	.loc 3 1964 0
	ldr	r1, .L600+28
	mov	r2, #230
	lsl	r2, r2, #4
	ldr	r1, [r1, r2]
	.loc 3 1967 0
	ldr	r0, .L600+36
	ldr	r2, .L600+64
	ldrb	r0, [r0, r2]
	mov	r2, #15
	eor	r2, r2, r0
	lsl	r2, r2, #24
	lsr	r2, r2, #24
	mov	r0, r1
	lsr	r0, r0, r2
	mov	r2, r0
	lsl	r2, r2, #24
	lsr	r2, r2, #24
	mov	r1, #1
	and	r2, r2, r1
	lsl	r2, r2, #1
	lsl	r2, r2, #24
	lsr	r1, r2, #24
	mov	r2, r7
	add	r2, r2, #11
	orr	r3, r3, r1
	strb	r3, [r2]
	.loc 3 1968 0
	ldr	r2, .L600+36
	ldr	r3, .L600+64
	ldrb	r3, [r2, r3]
	add	r3, r3, #1
	lsl	r3, r3, #24
	lsr	r1, r3, #24
	ldr	r2, .L600+36
	ldr	r3, .L600+64
	strb	r1, [r2, r3]
	.loc 3 1969 0
	mov	r3, r7
	add	r3, r3, #11
	ldrb	r3, [r3]
	b	.L545
.L562:
	.loc 3 1973 0
	ldr	r2, [r7, #16]
	ldr	r3, .L600+28
	mov	r1, #229
	lsl	r1, r1, #2
	add	r2, r2, r1
	lsl	r2, r2, #2
	ldr	r1, [r2, r3]
	.loc 3 1975 0
	ldr	r2, .L600+36
	ldr	r3, .L600+52
	ldrb	r2, [r2, r3]
	mov	r3, #15
	eor	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	mov	r0, r1
	lsr	r0, r0, r3
	mov	r3, r0
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	mov	r1, #1
	and	r3, r3, r1
	add	r2, r2, #1
	lsl	r2, r2, #24
	lsr	r0, r2, #24
	ldr	r1, .L600+36
	ldr	r2, .L600+52
	strb	r0, [r1, r2]
	b	.L545
.L540:
.LBE25:
	.loc 3 1988 0
	ldr	r3, .L600+20
	ldr	r2, [r3, #20]
	add	r3, r7, #6
	ldrh	r3, [r3]
	add	r3, r2, r3
	ldrb	r3, [r3]
	b	.L545
.L539:
	.loc 3 1991 0
	add	r3, r7, #6
	ldrh	r3, [r3]
	ldr	r1, .L600+68
	add	r2, r3, r1
	mov	r3, #189
	lsl	r3, r3, #1
	cmp	r2, r3
	bls	.LCB8610
	b	.L564	@long jump
.LCB8610:
	lsl	r2, r2, #2
	ldr	r3, .L600+72
	add	r3, r2, r3
	ldr	r3, [r3]
	mov	pc, r3
	.section	.rodata
	.align	2
.L591:
	.word	.L565
	.word	.L566
	.word	.L566
	.word	.L566
	.word	.L566
	.word	.L566
	.word	.L566
	.word	.L567
	.word	.L568
	.word	.L569
	.word	.L570
	.word	.L571
	.word	.L572
	.word	.L573
	.word	.L574
	.word	.L574
	.word	.L575
	.word	.L576
	.word	.L577
	.word	.L578
	.word	.L578
	.word	.L578
	.word	.L578
	.word	.L578
	.word	.L579
	.word	.L579
	.word	.L579
	.word	.L579
	.word	.L579
	.word	.L579
	.word	.L579
	.word	.L579
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L580
	.word	.L581
	.word	.L582
	.word	.L583
	.word	.L584
	.word	.L585
	.word	.L586
	.word	.L587
	.word	.L588
	.word	.L589
	.word	.L590
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L580
	.word	.L581
	.word	.L582
	.word	.L583
	.word	.L584
	.word	.L585
	.word	.L586
	.word	.L587
	.word	.L588
	.word	.L589
	.word	.L590
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L580
	.word	.L581
	.word	.L582
	.word	.L583
	.word	.L584
	.word	.L585
	.word	.L586
	.word	.L587
	.word	.L588
	.word	.L589
	.word	.L590
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L580
	.word	.L581
	.word	.L582
	.word	.L583
	.word	.L584
	.word	.L585
	.word	.L586
	.word	.L587
	.word	.L588
	.word	.L589
	.word	.L590
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L580
	.word	.L581
	.word	.L582
	.word	.L583
	.word	.L584
	.word	.L585
	.word	.L586
	.word	.L587
	.word	.L588
	.word	.L589
	.word	.L590
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L580
	.word	.L581
	.word	.L582
	.word	.L583
	.word	.L584
	.word	.L585
	.word	.L586
	.word	.L587
	.word	.L588
	.word	.L589
	.word	.L590
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L580
	.word	.L581
	.word	.L582
	.word	.L583
	.word	.L584
	.word	.L585
	.word	.L586
	.word	.L587
	.word	.L588
	.word	.L589
	.word	.L590
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L564
	.word	.L580
	.word	.L581
	.word	.L582
	.word	.L583
	.word	.L584
	.word	.L585
	.word	.L586
	.word	.L587
	.word	.L588
	.word	.L589
	.word	.L590
	.text
.L601:
	.align	2
.L600:
	.word	16895
	.word	CPU
	.word	16406
	.word	-16384
	.word	16407
	.word	Memory
	.word	Settings
	.word	IPPU
	.word	3660
	.word	PPU
	.word	2772
	.word	2146
	.word	16897
	.word	2147
	.word	3672
	.word	3676
	.word	2771
	.word	-16896
	.word	.L591
.L565:
	.loc 3 1997 0
	ldr	r3, .L602
	ldrb	r3, [r3, #4]
	cmp	r3, #0
	beq	.L566
	.loc 3 2000 0
	ldr	r3, .L602+4
	ldr	r2, [r3, #36]
	ldr	r3, .L602+4
	str	r2, [r3, #40]
	.loc 3 2002 0
	bl	_ZL13REGISTER_4212v
	mov	r3, r0
	b	.L545
.L566:
	.loc 3 2013 0
	ldr	r3, .L602+8
	ldr	r2, [r3, #20]
	add	r3, r7, #6
	ldrh	r3, [r3]
	add	r3, r2, r3
	ldrb	r3, [r3]
	b	.L545
.L567:
	.loc 3 2015 0
	ldr	r2, .L602+12
	ldr	r3, .L602+16
	ldrh	r3, [r2, r3]
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	b	.L545
.L568:
	.loc 3 2017 0
	ldr	r2, .L602+12
	ldr	r3, .L602+16
	ldrh	r3, [r2, r3]
	asr	r3, r3, #8
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	b	.L545
.L569:
	.loc 3 2019 0
	ldr	r2, .L602+12
	ldr	r3, .L602+20
	ldrh	r3, [r2, r3]
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	b	.L545
.L570:
	.loc 3 2021 0
	ldr	r2, .L602+12
	ldr	r3, .L602+20
	ldrh	r3, [r2, r3]
	asr	r3, r3, #8
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	b	.L545
.L571:
	.loc 3 2029 0
	ldr	r3, .L602+8
	ldr	r3, [r3, #20]
	ldr	r0, .L602+24
	add	r2, r3, r0
	ldr	r3, .L602+8
	ldr	r3, [r3, #20]
	ldr	r1, .L602+24
	add	r3, r3, r1
	ldrb	r3, [r3]
	neg	r1, r3
	adc	r3, r3, r1
	strb	r3, [r2]
	.loc 3 2030 0
	ldr	r3, .L602+8
	ldr	r3, [r3, #20]
	ldr	r2, .L602+24
	add	r3, r3, r2
	ldrb	r3, [r3]
	b	.L545
.L572:
	.loc 3 2033 0
	ldr	r3, .L602+28
	ldrb	r3, [r3, #1]
	b	.L545
.L573:
	.loc 3 2036 0
	ldr	r3, .L602+8
	ldr	r2, [r3, #20]
	add	r3, r7, #6
	ldrh	r3, [r3]
	add	r3, r2, r3
	ldrb	r3, [r3]
	b	.L545
.L574:
	.loc 3 2040 0
	ldr	r3, .L602+8
	ldr	r2, [r3, #20]
	add	r3, r7, #6
	ldrh	r3, [r3]
	add	r3, r2, r3
	ldrb	r3, [r3]
	b	.L545
.L575:
	.loc 3 2043 0
	ldr	r3, .L602+4
	ldr	r2, [r3, #36]
	ldr	r3, .L602+4
	str	r2, [r3, #40]
	.loc 3 2045 0
	ldr	r3, .L602+8
	ldr	r3, [r3, #20]
	ldr	r0, .L602+32
	add	r2, r3, r0
	mov	r3, r7
	add	r3, r3, #11
	ldrb	r2, [r2]
	strb	r2, [r3]
	.loc 3 2046 0
	ldr	r3, .L602+8
	ldr	r3, [r3, #20]
	ldr	r1, .L602+32
	add	r3, r3, r1
	mov	r2, #0
	strb	r2, [r3]
	.loc 3 2047 0
	mov	r3, r7
	add	r3, r3, #11
	ldrb	r3, [r3]
	b	.L545
.L576:
	.loc 3 2053 0
	ldr	r3, .L602+4
	ldrb	r3, [r3, #6]
	mov	r2, r3
	mov	r3, #3
	and	r3, r3, r2
	cmp	r3, #0
	beq	.L592
	mov	r3, #128
	b	.L593
.L592:
	mov	r3, #0
.L593:
	mov	r2, r7
	add	r2, r2, #11
	strb	r3, [r2]
	.loc 3 2055 0
	ldr	r3, .L602+4
	ldr	r2, [r3, #28]
	ldr	r3, .L602+36
	ldr	r3, [r3, #8]
	cmp	r2, r3
	blt	.L594
	mov	r3, #64
	b	.L595
.L594:
	mov	r3, #0
.L595:
	mov	r2, r7
	add	r2, r2, #11
	ldrb	r1, [r2]
	add	r2, r3, #0
	add	r3, r1, #0
	orr	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r2, r3, #24
	mov	r3, r7
	add	r3, r3, #11
	strb	r2, [r3]
	.loc 3 2056 0
	mov	r0, #3
	bl	_ZL16CLEAR_IRQ_SOURCEj
	.loc 3 2057 0
	mov	r3, r7
	add	r3, r3, #11
	ldrb	r3, [r3]
	b	.L545
.L577:
	.loc 3 2061 0
	ldr	r3, .L602+4
	ldr	r2, [r3, #36]
	ldr	r3, .L602+4
	str	r2, [r3, #40]
	.loc 3 2063 0
	bl	_ZL13REGISTER_4212v
	mov	r3, r0
	b	.L545
.L578:
	.loc 3 2073 0
	ldr	r3, .L602+8
	ldr	r2, [r3, #20]
	add	r3, r7, #6
	ldrh	r3, [r3]
	add	r3, r2, r3
	ldrb	r3, [r3]
	b	.L545
.L579:
	.loc 3 2083 0
	ldr	r3, .L602+8
	ldr	r2, [r3, #20]
	add	r3, r7, #6
	ldrh	r3, [r3]
	add	r3, r2, r3
	ldrb	r3, [r3]
	b	.L545
.L580:
	.loc 3 2094 0
	ldr	r3, .L602+8
	ldr	r2, [r3, #20]
	add	r3, r7, #6
	ldrh	r3, [r3]
	add	r3, r2, r3
	ldrb	r3, [r3]
	b	.L545
.L581:
	.loc 3 2104 0
	ldr	r3, .L602+8
	ldr	r2, [r3, #20]
	add	r3, r7, #6
	ldrh	r3, [r3]
	add	r3, r2, r3
	ldrb	r3, [r3]
	b	.L545
.L582:
	.loc 3 2114 0
	ldr	r3, .L602+8
	ldr	r2, [r3, #20]
	add	r3, r7, #6
	ldrh	r3, [r3]
	add	r3, r2, r3
	ldrb	r3, [r3]
	b	.L545
.L583:
	.loc 3 2124 0
	ldr	r3, .L602+8
	ldr	r2, [r3, #20]
	add	r3, r7, #6
	ldrh	r3, [r3]
	add	r3, r2, r3
	ldrb	r3, [r3]
	b	.L545
.L584:
	.loc 3 2134 0
	ldr	r3, .L602+8
	ldr	r2, [r3, #20]
	add	r3, r7, #6
	ldrh	r3, [r3]
	add	r3, r2, r3
	ldrb	r3, [r3]
	b	.L545
.L585:
	.loc 3 2144 0
	ldr	r3, .L602+8
	ldr	r2, [r3, #20]
	add	r3, r7, #6
	ldrh	r3, [r3]
	add	r3, r2, r3
	ldrb	r3, [r3]
	b	.L545
.L586:
	.loc 3 2154 0
	ldr	r3, .L602+8
	ldr	r2, [r3, #20]
	add	r3, r7, #6
	ldrh	r3, [r3]
	add	r3, r2, r3
	ldrb	r3, [r3]
	b	.L545
.L587:
	.loc 3 2164 0
	add	r3, r7, #6
	ldrh	r3, [r3]
	asr	r2, r3, #4
	mov	r3, #7
	mov	r1, r2
	and	r1, r1, r3
	ldr	r2, .L602+40
	mov	r3, #16
	mov	r0, #22
	mul	r1, r0
	add	r2, r1, r2
	add	r3, r2, r3
	ldrb	r3, [r3, #2]
	b	.L545
.L588:
	.loc 3 2174 0
	ldr	r3, .L602+8
	ldr	r2, [r3, #20]
	add	r3, r7, #6
	ldrh	r3, [r3]
	add	r3, r2, r3
	ldrb	r3, [r3]
	b	.L545
.L589:
	.loc 3 2184 0
	ldr	r3, .L602+8
	ldr	r2, [r3, #20]
	add	r3, r7, #6
	ldrh	r3, [r3]
	add	r3, r2, r3
	ldrb	r3, [r3]
	b	.L545
.L590:
.LBB26:
	.loc 3 2195 0
	add	r3, r7, #6
	ldrh	r2, [r3]
	mov	r3, #112
	and	r3, r3, r2
	asr	r3, r3, #4
	str	r3, [r7, #20]
	.loc 3 2196 0
	ldr	r3, .L602+28
	ldrb	r3, [r3, #1]
	mov	r2, r3
	ldr	r3, [r7, #20]
	asr	r2, r2, r3
	mov	r3, #1
	and	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	beq	.L596
	.loc 3 2198 0
	ldr	r1, [r7, #20]
	ldr	r2, .L602+40
	mov	r3, #16
	mov	r0, #22
	mul	r1, r0
	add	r2, r1, r2
	add	r3, r2, r3
	ldrb	r3, [r3, #4]
	b	.L545
.L596:
	.loc 3 2200 0
	ldr	r3, .L602+8
	ldr	r2, [r3, #20]
	add	r3, r7, #6
	ldrh	r3, [r3]
	add	r3, r2, r3
	ldrb	r3, [r3]
	b	.L545
.L564:
.LBE26:
	.loc 3 2214 0
	ldr	r3, .L602+8
	ldr	r2, [r3, #20]
	add	r3, r7, #6
	ldrh	r3, [r3]
	add	r3, r2, r3
	ldrb	r3, [r3]
.L545:
.LBE23:
	.loc 3 2215 0
	mov	r0, r3
	mov	sp, r7
	add	sp, sp, #24
	@ sp needed for prologue
	pop	{r7, pc}
.L603:
	.align	2
.L602:
	.word	SNESGameFixes
	.word	CPU
	.word	Memory
	.word	PPU
	.word	2124
	.word	2122
	.word	16907
	.word	IPPU
	.word	16912
	.word	Settings
	.word	DMA
.LFE33:
	.cantunwind
	.fnend
	.size	S9xGetCPU, .-S9xGetCPU
	.align	2
	.global	S9xResetPPU
	.hidden	S9xResetPPU
	.code	16
	.thumb_func
	.type	S9xResetPPU, %function
S9xResetPPU:
	.fnstart
.LFB34:
	.loc 3 2218 0
	.save	{r4, r7, lr}
	push	{r4, r7, lr}
.LCFI39:
	.pad #20
	sub	sp, sp, #20
.LCFI40:
	.setfp r7, sp, #0
	add	r7, sp, #0
.LCFI41:
.LBB27:
	.loc 3 2219 0
	ldr	r3, .L621
	mov	r2, #0
	strb	r2, [r3]
	.loc 3 2220 0
	ldr	r3, .L621
	mov	r2, #0
	strb	r2, [r3, #1]
	.loc 3 2221 0
	ldr	r3, .L621
	mov	r2, #0
	strb	r2, [r3, #2]
	.loc 3 2222 0
	ldr	r3, .L621
	mov	r2, #0
	strb	r2, [r3, #4]
	.loc 3 2223 0
	ldr	r3, .L621
	mov	r2, #1
	strb	r2, [r3, #5]
	.loc 3 2224 0
	ldr	r3, .L621
	mov	r2, #0
	strh	r2, [r3, #6]
	.loc 3 2225 0
	ldr	r3, .L621
	mov	r2, #0
	strh	r2, [r3, #10]
	.loc 3 2226 0
	ldr	r3, .L621
	mov	r2, #0
	strh	r2, [r3, #12]
.LBB28:
	.loc 3 2228 0
	mov	r3, r7
	add	r3, r3, #11
	mov	r2, #0
	strb	r2, [r3]
	b	.L605
.L606:
	.loc 3 2230 0
	mov	r3, r7
	add	r3, r3, #11
	ldrb	r2, [r3]
	ldr	r0, .L621
	mov	r1, #8
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r0
	add	r3, r3, r1
	mov	r2, #0
	strh	r2, [r3, #6]
	.loc 3 2231 0
	mov	r3, r7
	add	r3, r3, #11
	ldrb	r2, [r3]
	ldr	r0, .L621
	mov	r1, #8
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r0
	add	r3, r3, r1
	mov	r2, #0
	strh	r2, [r3, #8]
	.loc 3 2232 0
	mov	r3, r7
	add	r3, r3, #11
	ldrb	r2, [r3]
	ldr	r0, .L621
	mov	r1, #8
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r0
	add	r3, r3, r1
	mov	r2, #0
	strh	r2, [r3, #10]
	.loc 3 2233 0
	mov	r3, r7
	add	r3, r3, #11
	ldrb	r2, [r3]
	ldr	r0, .L621
	mov	r1, #8
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r0
	add	r3, r3, r1
	mov	r2, #0
	strb	r2, [r3, #12]
	.loc 3 2234 0
	mov	r3, r7
	add	r3, r3, #11
	ldrb	r2, [r3]
	ldr	r0, .L621
	mov	r1, #16
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r0
	add	r3, r3, r1
	mov	r2, #0
	strh	r2, [r3, #6]
	.loc 3 2235 0
	mov	r3, r7
	add	r3, r3, #11
	ldrb	r2, [r3]
	ldr	r0, .L621
	mov	r1, #16
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r0
	add	r3, r3, r1
	mov	r2, #0
	strh	r2, [r3, #8]
	.loc 3 2237 0
	mov	r3, r7
	add	r3, r3, #11
	ldrb	r1, [r3]
	ldr	r2, .L621
	ldr	r3, .L621+4
	add	r2, r1, r2
	add	r3, r2, r3
	mov	r2, #0
	strb	r2, [r3, #2]
	.loc 3 2238 0
	mov	r3, r7
	add	r3, r3, #11
	ldrb	r1, [r3]
	ldr	r2, .L621
	mov	r3, #171
	lsl	r3, r3, #4
	add	r2, r1, r2
	add	r3, r2, r3
	mov	r2, #0
	strb	r2, [r3]
	.loc 3 2239 0
	mov	r3, r7
	add	r3, r3, #11
	ldrb	r1, [r3]
	ldr	r2, .L621
	mov	r3, #171
	lsl	r3, r3, #4
	add	r2, r1, r2
	add	r3, r2, r3
	mov	r2, #0
	strb	r2, [r3, #6]
	.loc 3 2240 0
	mov	r3, r7
	add	r3, r3, #11
	ldrb	r1, [r3]
	ldr	r2, .L621
	ldr	r3, .L621+8
	add	r2, r1, r2
	add	r3, r2, r3
	mov	r2, #0
	strb	r2, [r3, #4]
	.loc 3 2241 0
	mov	r3, r7
	add	r3, r3, #11
	ldrb	r1, [r3]
	ldr	r2, .L621
	mov	r3, #172
	lsl	r3, r3, #4
	add	r2, r1, r2
	add	r3, r2, r3
	mov	r2, #1
	strb	r2, [r3, #2]
	.loc 3 2242 0
	mov	r3, r7
	add	r3, r3, #11
	ldrb	r1, [r3]
	ldr	r2, .L621
	ldr	r3, .L621+12
	add	r2, r1, r2
	add	r3, r2, r3
	mov	r2, #1
	strb	r2, [r3]
	.loc 3 2228 0
	mov	r3, r7
	add	r3, r3, #11
	mov	r2, r7
	add	r2, r2, #11
	ldrb	r2, [r2]
	add	r2, r2, #1
	strb	r2, [r3]
.L605:
	mov	r3, r7
	add	r3, r3, #11
	ldrb	r3, [r3]
	sub	r3, r3, #4
	sub	r2, r3, #1
	sbc	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	beq	.LCB9236
	b	.L606	@long jump
.LCB9236:
.LBE28:
	.loc 3 2245 0
	ldr	r2, .L621
	ldr	r3, .L621+16
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 3 2246 0
	ldr	r2, .L621
	ldr	r3, .L621+20
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 3 2247 0
	ldr	r2, .L621
	ldr	r3, .L621+24
	mov	r1, #0
	strb	r1, [r2, r3]
	ldr	r2, .L621
	ldr	r3, .L621+24
	ldrb	r1, [r2, r3]
	ldr	r2, .L621
	ldr	r3, .L621+28
	strb	r1, [r2, r3]
	.loc 3 2248 0
	ldr	r2, .L621
	ldr	r3, .L621+32
	mov	r1, #0
	strb	r1, [r2, r3]
	ldr	r2, .L621
	ldr	r3, .L621+32
	ldrb	r1, [r2, r3]
	ldr	r2, .L621
	ldr	r3, .L621+36
	strb	r1, [r2, r3]
	.loc 3 2249 0
	ldr	r2, .L621
	ldr	r3, .L621+40
	mov	r1, #0
	strb	r1, [r2, r3]
	ldr	r2, .L621
	ldr	r3, .L621+40
	ldrb	r1, [r2, r3]
	ldr	r2, .L621
	mov	r3, #172
	lsl	r3, r3, #4
	strb	r1, [r2, r3]
	.loc 3 2250 0
	ldr	r2, .L621
	ldr	r3, .L621+44
	mov	r1, #1
	strb	r1, [r2, r3]
	ldr	r2, .L621
	ldr	r3, .L621+44
	ldrb	r1, [r2, r3]
	ldr	r2, .L621
	ldr	r3, .L621+48
	strb	r1, [r2, r3]
	.loc 3 2251 0
	ldr	r2, .L621
	ldr	r3, .L621+52
	mov	r1, #1
	strb	r1, [r2, r3]
	ldr	r2, .L621
	ldr	r3, .L621+52
	ldrb	r1, [r2, r3]
	ldr	r2, .L621
	ldr	r3, .L621+56
	strb	r1, [r2, r3]
	.loc 3 2253 0
	ldr	r2, .L621
	mov	r3, #62
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 3 2255 0
	mov	r3, #0
	str	r3, [r7, #4]
	b	.L607
.L608:
	.loc 3 2257 0
	ldr	r2, [r7, #4]
	ldr	r1, [r7, #4]
	mov	r3, #7
	and	r3, r3, r1
	lsl	r3, r3, #2
	mov	r1, r3
	ldr	r3, .L621+60
	add	r2, r2, #16
	lsl	r2, r2, #2
	str	r1, [r2, r3]
	.loc 3 2258 0
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #4]
	asr	r1, r3, #3
	mov	r3, #7
	and	r3, r3, r1
	lsl	r3, r3, #2
	mov	r1, r3
	ldr	r3, .L621+60
	add	r2, r2, #17
	add	r2, r2, #255
	lsl	r2, r2, #2
	str	r1, [r2, r3]
	.loc 3 2259 0
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #4]
	asr	r1, r3, #6
	mov	r3, #2
	and	r3, r3, r1
	lsl	r3, r3, #3
	mov	r1, r3
	ldr	r3, .L621+60
	mov	r0, #132
	lsl	r0, r0, #2
	add	r2, r2, r0
	lsl	r2, r2, #2
	str	r1, [r2, r3]
	.loc 3 2260 0
	ldr	r2, [r7, #4]
	.loc 3 2261 0
	ldr	r1, [r7, #4]
	ldr	r3, .L621+60
	add	r1, r1, #16
	lsl	r1, r1, #2
	ldr	r3, [r1, r3]
	lsl	r3, r3, #16
	lsr	r1, r3, #16
	ldr	r0, [r7, #4]
	ldr	r3, .L621+60
	add	r0, r0, #17
	add	r0, r0, #255
	lsl	r0, r0, #2
	ldr	r3, [r0, r3]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #5
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	orr	r3, r3, r1
	lsl	r3, r3, #16
	lsr	r1, r3, #16
	ldr	r0, [r7, #4]
	ldr	r3, .L621+60
	mov	r4, #132
	lsl	r4, r4, #2
	add	r0, r0, r4
	lsl	r0, r0, #2
	ldr	r3, [r0, r3]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #10
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	orr	r3, r3, r1
	lsl	r3, r3, #16
	lsr	r1, r3, #16
	ldr	r3, .L621
	add	r2, r2, #32
	lsl	r2, r2, #1
	strh	r1, [r2, r3]
	.loc 3 2255 0
	ldr	r3, [r7, #4]
	add	r3, r3, #1
	str	r3, [r7, #4]
.L607:
	ldr	r3, [r7, #4]
	mov	r2, #255
	lsr	r0, r3, #31
	asr	r1, r2, #31
	mov	r4, r0
	cmp	r2, r3
	adc	r4, r4, r1
	mov	r3, r4
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	bne	.L608
	.loc 3 2264 0
	ldr	r2, .L621
	mov	r3, #144
	lsl	r3, r3, #2
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 3 2265 0
	ldr	r2, .L621
	ldr	r3, .L621+64
	mov	r1, #127
	strb	r1, [r2, r3]
.LBB29:
	.loc 3 2266 0
	mov	r3, #0
	str	r3, [r7, #12]
	b	.L609
.L622:
	.align	2
.L621:
	.word	PPU
	.word	2728
	.word	2744
	.word	2760
	.word	2734
	.word	2735
	.word	2741
	.word	2740
	.word	2747
	.word	2746
	.word	2753
	.word	2759
	.word	2758
	.word	2765
	.word	2764
	.word	IPPU
	.word	577
.L610:
	.loc 3 2268 0
	ldr	r1, [r7, #12]
	ldr	r0, .L623
	mov	r2, #144
	lsl	r2, r2, #2
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #2
	add	r3, r3, r0
	add	r3, r3, r2
	mov	r2, #0
	strh	r2, [r3, #2]
	.loc 3 2269 0
	ldr	r1, [r7, #12]
	ldr	r0, .L623
	mov	r2, #144
	lsl	r2, r2, #2
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #2
	add	r3, r3, r0
	add	r3, r3, r2
	mov	r2, #0
	strh	r2, [r3, #4]
	.loc 3 2270 0
	ldr	r1, [r7, #12]
	ldr	r0, .L623
	mov	r2, #144
	lsl	r2, r2, #2
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #2
	add	r3, r3, r0
	add	r3, r3, r2
	mov	r2, #0
	strb	r2, [r3, #8]
	.loc 3 2271 0
	ldr	r1, [r7, #12]
	ldr	r0, .L623
	mov	r2, #144
	lsl	r2, r2, #2
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #2
	add	r3, r3, r0
	add	r3, r3, r2
	mov	r2, #0
	strb	r2, [r3, #9]
	.loc 3 2272 0
	ldr	r1, [r7, #12]
	ldr	r0, .L623
	mov	r2, #146
	lsl	r2, r2, #2
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #2
	add	r3, r3, r0
	add	r3, r3, r2
	mov	r2, #0
	strb	r2, [r3, #2]
	.loc 3 2273 0
	ldr	r1, [r7, #12]
	ldr	r0, .L623
	mov	r2, #146
	lsl	r2, r2, #2
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #2
	add	r3, r3, r0
	add	r3, r3, r2
	mov	r2, #0
	strb	r2, [r3, #3]
	.loc 3 2274 0
	ldr	r1, [r7, #12]
	ldr	r0, .L623
	mov	r2, #144
	lsl	r2, r2, #2
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #2
	add	r3, r3, r0
	add	r3, r3, r2
	mov	r2, #0
	strh	r2, [r3, #6]
	.loc 3 2275 0
	ldr	r1, [r7, #12]
	ldr	r0, .L623
	mov	r2, #146
	lsl	r2, r2, #2
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	lsl	r3, r3, #2
	add	r3, r3, r0
	add	r3, r3, r2
	mov	r2, #0
	strb	r2, [r3, #4]
	.loc 3 2266 0
	ldr	r3, [r7, #12]
	add	r3, r3, #1
	str	r3, [r7, #12]
.L609:
	ldr	r3, [r7, #12]
	mov	r2, #127
	lsr	r0, r3, #31
	asr	r1, r2, #31
	mov	r4, r0
	cmp	r2, r3
	adc	r4, r4, r1
	mov	r3, r4
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	bne	.L610
.LBE29:
	.loc 3 2277 0
	ldr	r2, .L623
	ldr	r3, .L623+4
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 3 2279 0
	ldr	r2, .L623
	ldr	r3, .L623+8
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 3 2280 0
	ldr	r2, .L623
	ldr	r3, .L623+12
	mov	r1, #0
	strh	r1, [r2, r3]
	.loc 3 2281 0
	ldr	r2, .L623
	ldr	r3, .L623+16
	mov	r1, #0
	strh	r1, [r2, r3]
	.loc 3 2282 0
	ldr	r2, .L623
	ldr	r3, .L623+20
	mov	r1, #0
	strh	r1, [r2, r3]
	.loc 3 2283 0
	ldr	r2, .L623
	ldr	r3, .L623+24
	mov	r1, #0
	strh	r1, [r2, r3]
	.loc 3 2284 0
	ldr	r2, .L623
	ldr	r3, .L623+28
	mov	r1, #0
	strh	r1, [r2, r3]
	.loc 3 2285 0
	ldr	r2, .L623
	mov	r3, #133
	lsl	r3, r3, #4
	mov	r1, #0
	strh	r1, [r2, r3]
	.loc 3 2287 0
	ldr	r2, .L623
	ldr	r3, .L623+32
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 3 2288 0
	ldr	r2, .L623
	ldr	r3, .L623+36
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 3 2289 0
	ldr	r2, .L623
	ldr	r3, .L623+40
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 3 2291 0
	ldr	r2, .L623
	ldr	r3, .L623+44
	mov	r1, #0
	strh	r1, [r2, r3]
	ldr	r2, .L623
	ldr	r3, .L623+44
	ldrh	r1, [r2, r3]
	ldr	r2, .L623
	ldr	r3, .L623+48
	strh	r1, [r2, r3]
	ldr	r2, .L623
	ldr	r3, .L623+48
	ldrh	r1, [r2, r3]
	ldr	r2, .L623
	ldr	r3, .L623+52
	strh	r1, [r2, r3]
	ldr	r2, .L623
	ldr	r3, .L623+52
	ldrh	r1, [r2, r3]
	ldr	r2, .L623
	ldr	r3, .L623+56
	strh	r1, [r2, r3]
	.loc 3 2292 0
	ldr	r2, .L623
	mov	r3, #134
	lsl	r3, r3, #4
	mov	r1, #0
	strh	r1, [r2, r3]
	ldr	r2, .L623
	mov	r3, #134
	lsl	r3, r3, #4
	ldrh	r1, [r2, r3]
	ldr	r2, .L623
	ldr	r3, .L623+60
	strh	r1, [r2, r3]
	.loc 3 2293 0
	ldr	r2, .L623
	ldr	r3, .L623+64
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 3 2294 0
	ldr	r2, .L623
	ldr	r3, .L623+68
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 3 2295 0
	ldr	r2, .L623
	ldr	r3, .L623+72
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 3 2297 0
	ldr	r2, .L623
	ldr	r3, .L623+76
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 3 2298 0
	ldr	r2, .L623
	ldr	r3, .L623+80
	mov	r1, #0
	strb	r1, [r2, r3]
	ldr	r2, .L623
	ldr	r3, .L623+80
	ldrb	r1, [r2, r3]
	ldr	r2, .L623
	ldr	r3, .L623+84
	strb	r1, [r2, r3]
	ldr	r2, .L623
	ldr	r3, .L623+84
	ldrb	r1, [r2, r3]
	ldr	r2, .L623
	ldr	r3, .L623+88
	strb	r1, [r2, r3]
	.loc 3 2299 0
	ldr	r2, .L623
	ldr	r3, .L623+92
	mov	r1, #0
	strh	r1, [r2, r3]
	.loc 3 2300 0
	ldr	r2, .L623
	ldr	r3, .L623+96
	mov	r1, #224
	strh	r1, [r2, r3]
	.loc 3 2301 0
	ldr	r2, .L623
	ldr	r3, .L623+100
	mov	r1, #0
	str	r1, [r2, r3]
	.loc 3 2302 0
	ldr	r2, .L623
	mov	r3, #135
	lsl	r3, r3, #4
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 3 2303 0
	ldr	r2, .L623
	ldr	r3, .L623+104
	mov	r1, #1
	strb	r1, [r2, r3]
	.loc 3 2304 0
	ldr	r2, .L623
	ldr	r3, .L623+108
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 3 2305 0
	ldr	r2, .L623
	ldr	r3, .L623+112
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 3 2306 0
	ldr	r2, .L623
	ldr	r3, .L623+116
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 3 2307 0
	ldr	r2, .L623
	mov	r3, #173
	lsl	r3, r3, #4
	mov	r1, #0
	strh	r1, [r2, r3]
	.loc 3 2308 0
	ldr	r2, .L623
	ldr	r3, .L623+120
	mov	r1, #0
	strh	r1, [r2, r3]
	.loc 3 2309 0
	ldr	r2, .L623
	ldr	r3, .L623+124
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 3 2310 0
	ldr	r2, .L623
	ldr	r3, .L623+128
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 3 2311 0
	ldr	r2, .L623+132
	mov	r3, #136
	lsl	r3, r3, #2
	mov	r0, r2
	mov	r1, #0
	mov	r2, r3
	bl	memset
	.loc 3 2313 0
	ldr	r2, .L623
	ldr	r3, .L623+136
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 3 2314 0
	ldr	r2, .L623
	ldr	r3, .L623+140
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 3 2315 0
	ldr	r3, .L623+144
	ldr	r3, [r3, #4]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r3, #1
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	mov	r1, r3
	ldr	r2, .L623
	ldr	r3, .L623+148
	strh	r1, [r2, r3]
	.loc 3 2316 0
	ldr	r2, .L623
	ldr	r3, .L623+152
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 3 2317 0
	ldr	r2, .L623
	mov	r3, #170
	lsl	r3, r3, #4
	mov	r1, #0
	strb	r1, [r2, r3]
	ldr	r2, .L623
	mov	r3, #170
	lsl	r3, r3, #4
	ldrb	r1, [r2, r3]
	ldr	r2, .L623
	ldr	r3, .L623+156
	strb	r1, [r2, r3]
	.loc 3 2318 0
	ldr	r2, .L623
	ldr	r3, .L623+160
	mov	r1, #0
	strb	r1, [r2, r3]
	ldr	r2, .L623
	ldr	r3, .L623+160
	ldrb	r1, [r2, r3]
	ldr	r2, .L623
	ldr	r3, .L623+164
	strb	r1, [r2, r3]
	.loc 3 2319 0
	ldr	r2, .L623
	ldr	r3, .L623+168
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 3 2320 0
	ldr	r2, .L623
	ldr	r3, .L623+172
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 3 2321 0
	ldr	r2, .L623
	ldr	r3, .L623+176
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 3 2322 0
	ldr	r2, .L623
	ldr	r3, .L623+180
	mov	r1, #1
	strb	r1, [r2, r3]
	.loc 3 2323 0
	ldr	r2, .L623
	ldr	r3, .L623+184
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 3 2324 0
	ldr	r2, .L623
	ldr	r3, .L623+188
	mov	r1, #1
	strb	r1, [r2, r3]
	.loc 3 2325 0
	ldr	r2, .L623
	ldr	r3, .L623+192
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 3 2326 0
	ldr	r2, .L623
	ldr	r3, .L623+196
	mov	r1, #1
	strb	r1, [r2, r3]
	.loc 3 2327 0
	ldr	r2, .L623
	ldr	r3, .L623+200
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 3 2328 0
	ldr	r2, .L623
	ldr	r3, .L623+204
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 3 2329 0
	ldr	r2, .L623
	ldr	r3, .L623+208
	mov	r1, #0
	strb	r1, [r2, r3]
	ldr	r2, .L623
	ldr	r3, .L623+208
	ldrb	r1, [r2, r3]
	ldr	r2, .L623
	ldr	r3, .L623+212
	strb	r1, [r2, r3]
	.loc 3 2331 0
	ldr	r3, .L623+216
	mov	r2, #1
	strb	r2, [r3]
	.loc 3 2332 0
	ldr	r3, .L623+216
	mov	r2, #0
	strb	r2, [r3, #1]
	.loc 3 2333 0
	ldr	r3, .L623+216
	mov	r2, #0
	strb	r2, [r3, #2]
	.loc 3 2334 0
	ldr	r3, .L623+216
	mov	r2, #0
	strb	r2, [r3, #3]
	.loc 3 2335 0
	ldr	r3, .L623+216
	mov	r2, #0
	strb	r2, [r3, #4]
	.loc 3 2336 0
	ldr	r3, .L623+216
	mov	r2, #1
	strb	r2, [r3, #5]
	.loc 3 2337 0
	ldr	r3, .L623+216
	mov	r2, #1
	strb	r2, [r3, #6]
	.loc 3 2338 0
	ldr	r3, .L623+216
	mov	r2, #1
	strb	r2, [r3, #7]
	.loc 3 2339 0
	ldr	r3, .L623+216
	mov	r2, #0
	str	r2, [r3, #8]
	.loc 3 2340 0
	ldr	r3, .L623+216
	mov	r2, #0
	str	r2, [r3, #12]
	.loc 3 2341 0
	ldr	r3, .L623+216
	mov	r2, #0
	str	r2, [r3, #16]
	.loc 3 2342 0
	ldr	r3, .L623+216
	mov	r2, #0
	str	r2, [r3, #20]
	.loc 3 2343 0
	ldr	r3, .L623+216
	mov	r2, #0
	str	r2, [r3, #24]
	.loc 3 2344 0
	ldr	r3, .L623+216
	ldr	r2, [r3, #40]
	mov	r3, #128
	lsl	r3, r3, #5
	mov	r0, r2
	mov	r1, #0
	mov	r2, r3
	bl	memset
	.loc 3 2345 0
	ldr	r3, .L623+216
	ldr	r2, [r3, #44]
	mov	r3, #128
	lsl	r3, r3, #4
	mov	r0, r2
	mov	r1, #0
	mov	r2, r3
	bl	memset
	b	.L624
.L625:
	.align	2
.L623:
	.word	PPU
	.word	2114
	.word	2118
	.word	2120
	.word	2116
	.word	2122
	.word	2124
	.word	2126
	.word	2130
	.word	2131
	.word	2132
	.word	2140
	.word	2138
	.word	2136
	.word	2134
	.word	2142
	.word	2146
	.word	2147
	.word	2771
	.word	2148
	.word	2151
	.word	2150
	.word	2149
	.word	2152
	.word	2154
	.word	2156
	.word	2161
	.word	2162
	.word	2163
	.word	2164
	.word	2166
	.word	2168
	.word	2169
	.word	PPU+2170
	.word	2714
	.word	2715
	.word	Settings
	.word	2716
	.word	2718
	.word	2719
	.word	2722
	.word	2721
	.word	2723
	.word	2724
	.word	2725
	.word	2726
	.word	2727
	.word	2728
	.word	2729
	.word	2766
	.word	2767
	.word	2770
	.word	2773
	.word	2772
	.word	IPPU
.L624:
	.loc 3 2346 0
	ldr	r3, .L626
	ldr	r2, [r3, #48]
	mov	r3, #128
	lsl	r3, r3, #3
	mov	r0, r2
	mov	r1, #0
	mov	r2, r3
	bl	memset
	.loc 3 2347 0
	ldr	r2, .L626
	mov	r3, #52
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 3 2348 0
	ldr	r2, .L626
	mov	r3, #53
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 3 2349 0
	ldr	r2, .L626
	mov	r3, #54
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 3 2350 0
	ldr	r2, .L626
	mov	r3, #128
	lsl	r3, r3, #1
	str	r3, [r2, #60]
	.loc 3 2351 0
	ldr	r3, .L626
	mov	r2, #224
	str	r2, [r3, #56]
	.loc 3 2352 0
	ldr	r2, .L626
	mov	r3, #196
	lsl	r3, r3, #4
	mov	r1, #0
	str	r1, [r2, r3]
	.loc 3 2353 0
	mov	r3, #0
	str	r3, [r7, #4]
	b	.L611
.L612:
	.loc 3 2354 0
	ldr	r1, [r7, #4]
	ldr	r3, [r7, #4]
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, .L626
	mov	r0, #196
	lsl	r0, r0, #3
	add	r1, r1, r0
	lsl	r1, r1, #1
	add	r3, r1, r3
	strh	r2, [r3, #4]
	.loc 3 2353 0
	ldr	r3, [r7, #4]
	add	r3, r3, #1
	str	r3, [r7, #4]
.L611:
	ldr	r3, [r7, #4]
	mov	r2, #255
	lsr	r0, r3, #31
	asr	r1, r2, #31
	mov	r4, r0
	cmp	r2, r3
	adc	r4, r4, r1
	mov	r3, r4
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	bne	.L612
	.loc 3 2355 0
	bl	S9xFixColourBrightness
	.loc 3 2356 0
	ldr	r2, .L626
	ldr	r3, .L626+4
	mov	r1, #0
	str	r1, [r2, r3]
	ldr	r2, .L626
	ldr	r3, .L626+4
	ldr	r1, [r2, r3]
	ldr	r2, .L626
	ldr	r3, .L626+8
	str	r1, [r2, r3]
	.loc 3 2357 0
	ldr	r2, .L626
	ldr	r3, .L626+12
	mov	r1, #0
	str	r1, [r2, r3]
	ldr	r2, .L626
	ldr	r3, .L626+12
	ldr	r1, [r2, r3]
	ldr	r2, .L626
	ldr	r3, .L626+16
	str	r1, [r2, r3]
	ldr	r2, .L626
	ldr	r3, .L626+16
	ldr	r1, [r2, r3]
	ldr	r2, .L626
	mov	r3, #229
	lsl	r3, r3, #4
	str	r1, [r2, r3]
	.loc 3 2358 0
	ldr	r2, .L626
	mov	r3, #230
	lsl	r3, r3, #4
	mov	r1, #0
	str	r1, [r2, r3]
	ldr	r2, .L626
	mov	r3, #230
	lsl	r3, r3, #4
	ldr	r1, [r2, r3]
	ldr	r2, .L626
	ldr	r3, .L626+20
	str	r1, [r2, r3]
	.loc 3 2359 0
	ldr	r2, .L626
	ldr	r3, .L626+24
	mov	r1, #0
	str	r1, [r2, r3]
	.loc 3 2360 0
	ldr	r2, .L626
	ldr	r3, .L626+28
	mov	r1, #0
	str	r1, [r2, r3]
	ldr	r2, .L626
	ldr	r3, .L626+28
	ldr	r1, [r2, r3]
	ldr	r2, .L626
	ldr	r3, .L626+32
	str	r1, [r2, r3]
	.loc 3 2361 0
	ldr	r2, .L626
	ldr	r3, .L626+36
	mov	r1, #128
	str	r1, [r2, r3]
	ldr	r2, .L626
	ldr	r3, .L626+36
	ldr	r1, [r2, r3]
	ldr	r2, .L626
	mov	r3, #231
	lsl	r3, r3, #4
	str	r1, [r2, r3]
	.loc 3 2362 0
	ldr	r2, .L626
	ldr	r3, .L626+40
	mov	r1, #112
	str	r1, [r2, r3]
	ldr	r2, .L626
	ldr	r3, .L626+40
	ldr	r1, [r2, r3]
	ldr	r2, .L626
	ldr	r3, .L626+44
	str	r1, [r2, r3]
	.loc 3 2364 0
	ldr	r3, .L626+48
	ldr	r3, [r3, #72]
	cmp	r3, #0
	bne	.L613
	.loc 3 2365 0
	ldr	r2, .L626
	ldr	r3, .L626+52
	mov	r1, #6
	str	r1, [r2, r3]
	b	.L614
.L613:
	.loc 3 2367 0
	ldr	r3, .L626+48
	ldr	r3, [r3, #72]
	sub	r3, r3, #1
	mov	r1, r3
	ldr	r2, .L626
	ldr	r3, .L626+52
	str	r1, [r2, r3]
.L614:
	.loc 3 2368 0
	bl	S9xNextController
	.loc 3 2370 0
	mov	r3, #0
	str	r3, [r7, #4]
	b	.L615
.L616:
	.loc 3 2371 0
	ldr	r2, [r7, #4]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #3
	sub	r3, r3, r2
	lsl	r3, r3, #3
	mov	r0, #232
	lsl	r0, r0, #4
	add	r2, r3, r0
	ldr	r3, .L626
	add	r2, r2, r3
	mov	r3, #156
	lsl	r3, r3, #1
	mov	r0, r2
	mov	r1, #0
	mov	r2, r3
	bl	memset
	.loc 3 2370 0
	ldr	r3, [r7, #4]
	add	r3, r3, #1
	str	r3, [r7, #4]
.L615:
	ldr	r3, [r7, #4]
	mov	r2, #1
	lsr	r0, r3, #31
	asr	r1, r2, #31
	mov	r4, r0
	cmp	r2, r3
	adc	r4, r4, r1
	mov	r3, r4
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	bne	.L616
	.loc 3 2373 0
	ldr	r2, .L626+48
	mov	r3, #79
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	beq	.L617
	.loc 3 2375 0
	mov	r0, #0
	bl	S9xProcessMouse
	.loc 3 2376 0
	mov	r0, #1
	bl	S9xProcessMouse
.L617:
	.loc 3 2378 0
	mov	r3, #0
	str	r3, [r7, #4]
	b	.L618
.L619:
	.loc 3 2379 0
	ldr	r3, .L626+56
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	add	r1, r2, r3
	ldr	r3, [r7, #4]
	asr	r2, r3, #8
	mov	r3, #128
	lsl	r3, r3, #1
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	memset
	.loc 3 2378 0
	ldr	r3, [r7, #4]
	add	r3, r3, #1
	add	r3, r3, #255
	str	r3, [r7, #4]
.L618:
	ldr	r3, [r7, #4]
	ldr	r2, .L626+60
	lsr	r0, r3, #31
	asr	r1, r2, #31
	mov	r4, r0
	cmp	r2, r3
	adc	r4, r4, r1
	mov	r3, r4
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	bne	.L619
	.loc 3 2381 0
	ldr	r3, .L626+56
	ldr	r3, [r3, #20]
	mov	r0, #132
	lsl	r0, r0, #6
	add	r2, r3, r0
	mov	r3, #128
	lsl	r3, r3, #1
	mov	r0, r2
	mov	r1, #0
	mov	r2, r3
	bl	memset
	.loc 3 2382 0
	ldr	r3, .L626+56
	ldr	r3, [r3, #20]
	mov	r1, #132
	lsl	r1, r1, #7
	add	r2, r3, r1
	mov	r3, #128
	lsl	r3, r3, #1
	mov	r0, r2
	mov	r1, #0
	mov	r2, r3
	bl	memset
	.loc 3 2383 0
	ldr	r3, .L626+56
	ldr	r3, [r3, #20]
	mov	r4, #128
	lsl	r4, r4, #7
	add	r2, r3, r4
	mov	r3, #128
	lsl	r3, r3, #1
	mov	r0, r2
	mov	r1, #0
	mov	r2, r3
	bl	memset
	.loc 3 2385 0
	ldr	r3, .L626+56
	ldr	r3, [r3, #20]
	mov	r0, #128
	lsl	r0, r0, #5
	add	r2, r3, r0
	mov	r3, #128
	lsl	r3, r3, #5
	mov	r0, r2
	mov	r1, #0
	mov	r2, r3
	bl	memset
.LBE27:
	.loc 3 2386 0
	mov	sp, r7
	add	sp, sp, #20
	@ sp needed for prologue
	pop	{r4, r7, pc}
.L627:
	.align	2
.L626:
	.word	IPPU
	.word	3656
	.word	3652
	.word	3672
	.word	3668
	.word	3676
	.word	3684
	.word	3692
	.word	3688
	.word	3700
	.word	3708
	.word	3704
	.word	Settings
	.word	3660
	.word	Memory
	.word	32767
.LFE34:
	.fnend
	.size	S9xResetPPU, .-S9xResetPPU
	.align	2
	.global	S9xProcessMouse
	.hidden	S9xProcessMouse
	.code	16
	.thumb_func
	.type	S9xProcessMouse, %function
S9xProcessMouse:
	.fnstart
.LFB35:
	.loc 3 2389 0
	.save	{r7, lr}
	push	{r7, lr}
.LCFI42:
	.pad #32
	sub	sp, sp, #32
.LCFI43:
	.setfp r7, sp, #0
	add	r7, sp, #0
.LCFI44:
	str	r0, [r7, #4]
.LBB30:
	.loc 3 2393 0
	ldr	r2, .L645
	ldr	r3, .L645+4
	ldr	r3, [r2, r3]
	cmp	r3, #3
	beq	.L629
	ldr	r2, .L645
	ldr	r3, .L645+4
	ldr	r3, [r2, r3]
	cmp	r3, #2
	bne	.L630
.L629:
	ldr	r0, [r7, #4]
	mov	r1, r7
	add	r1, r1, #20
	mov	r2, r7
	add	r2, r2, #16
	mov	r3, r7
	add	r3, r3, #12
	bl	S9xReadMousePosition
	mov	r3, r0
	cmp	r3, #0
	beq	.L630
	mov	r3, #1
	b	.L631
.L630:
	mov	r3, #0
.L631:
	cmp	r3, #0
	bne	.LCB10293
	b	.L644	@long jump
.LCB10293:
.LBB31:
	.loc 3 2399 0
	ldr	r2, [r7, #4]
	.loc 3 2401 0
	ldr	r0, [r7, #4]
	ldr	r1, .L645+8
	mov	r3, #173
	lsl	r3, r3, #4
	add	r1, r0, r1
	add	r3, r1, r3
	ldrb	r3, [r3, #4]
	.loc 3 2403 0
	lsl	r3, r3, #4
	mov	r1, r3
	ldr	r0, [r7, #12]
	mov	r3, #1
	and	r3, r3, r0
	lsl	r3, r3, #6
	orr	r1, r1, r3
	ldr	r0, [r7, #12]
	mov	r3, #2
	and	r3, r3, r0
	lsl	r3, r3, #6
	orr	r1, r1, r3
	mov	r3, #1
	orr	r1, r1, r3
	ldr	r3, .L645
	ldr	r0, .L645+12
	add	r2, r2, r0
	lsl	r2, r2, #2
	str	r1, [r2, r3]
	.loc 3 2405 0
	ldr	r2, [r7, #20]
	ldr	r1, [r7, #4]
	ldr	r3, .L645
	mov	r0, #231
	lsl	r0, r0, #2
	add	r1, r1, r0
	lsl	r1, r1, #2
	ldr	r3, [r1, r3]
	sub	r3, r2, r3
	str	r3, [r7, #24]
	.loc 3 2406 0
	ldr	r2, [r7, #16]
	ldr	r1, [r7, #4]
	ldr	r3, .L645
	ldr	r0, .L645+16
	add	r1, r1, r0
	lsl	r1, r1, #2
	ldr	r3, [r1, r3]
	sub	r3, r2, r3
	str	r3, [r7, #28]
	.loc 3 2408 0
	ldr	r3, [r7, #24]
	cmp	r3, #63
	ble	.L633
	.loc 3 2410 0
	mov	r3, #63
	str	r3, [r7, #24]
	.loc 3 2411 0
	ldr	r2, [r7, #4]
	ldr	r1, [r7, #4]
	ldr	r3, .L645
	mov	r0, #231
	lsl	r0, r0, #2
	add	r1, r1, r0
	lsl	r1, r1, #2
	ldr	r3, [r1, r3]
	mov	r1, r3
	add	r1, r1, #63
	ldr	r3, .L645
	mov	r0, #231
	lsl	r0, r0, #2
	add	r2, r2, r0
	lsl	r2, r2, #2
	str	r1, [r2, r3]
	b	.L634
.L633:
	.loc 3 2413 0
	ldr	r3, [r7, #24]
	mov	r1, r3
	add	r1, r1, #63
	bge	.L635
	.loc 3 2415 0
	mov	r3, #63
	neg	r3, r3
	str	r3, [r7, #24]
	.loc 3 2416 0
	ldr	r2, [r7, #4]
	ldr	r1, [r7, #4]
	ldr	r3, .L645
	mov	r0, #231
	lsl	r0, r0, #2
	add	r1, r1, r0
	lsl	r1, r1, #2
	ldr	r3, [r1, r3]
	mov	r1, r3
	sub	r1, r1, #63
	ldr	r3, .L645
	mov	r0, #231
	lsl	r0, r0, #2
	add	r2, r2, r0
	lsl	r2, r2, #2
	str	r1, [r2, r3]
	b	.L634
.L635:
	.loc 3 2419 0
	ldr	r2, [r7, #4]
	ldr	r1, [r7, #20]
	ldr	r3, .L645
	mov	r0, #231
	lsl	r0, r0, #2
	add	r2, r2, r0
	lsl	r2, r2, #2
	str	r1, [r2, r3]
.L634:
	.loc 3 2421 0
	ldr	r3, [r7, #28]
	cmp	r3, #63
	ble	.L636
	.loc 3 2423 0
	mov	r3, #63
	str	r3, [r7, #28]
	.loc 3 2424 0
	ldr	r2, [r7, #4]
	ldr	r1, [r7, #4]
	ldr	r3, .L645
	ldr	r0, .L645+16
	add	r1, r1, r0
	lsl	r1, r1, #2
	ldr	r3, [r1, r3]
	mov	r1, r3
	add	r1, r1, #63
	ldr	r3, .L645
	ldr	r0, .L645+16
	add	r2, r2, r0
	lsl	r2, r2, #2
	str	r1, [r2, r3]
	b	.L637
.L636:
	.loc 3 2426 0
	ldr	r3, [r7, #28]
	mov	r1, r3
	add	r1, r1, #63
	bge	.L638
	.loc 3 2428 0
	mov	r3, #63
	neg	r3, r3
	str	r3, [r7, #28]
	.loc 3 2429 0
	ldr	r2, [r7, #4]
	ldr	r1, [r7, #4]
	ldr	r3, .L645
	ldr	r0, .L645+16
	add	r1, r1, r0
	lsl	r1, r1, #2
	ldr	r3, [r1, r3]
	mov	r1, r3
	sub	r1, r1, #63
	ldr	r3, .L645
	ldr	r0, .L645+16
	add	r2, r2, r0
	lsl	r2, r2, #2
	str	r1, [r2, r3]
	b	.L637
.L638:
	.loc 3 2432 0
	ldr	r2, [r7, #4]
	ldr	r1, [r7, #16]
	ldr	r3, .L645
	ldr	r0, .L645+16
	add	r2, r2, r0
	lsl	r2, r2, #2
	str	r1, [r2, r3]
.L637:
	.loc 3 2434 0
	ldr	r3, [r7, #24]
	cmp	r3, #0
	bge	.L639
	.loc 3 2436 0
	ldr	r3, [r7, #24]
	neg	r3, r3
	str	r3, [r7, #24]
	.loc 3 2437 0
	ldr	r2, [r7, #4]
	ldr	r1, [r7, #4]
	ldr	r3, .L645
	ldr	r0, .L645+12
	add	r1, r1, r0
	lsl	r1, r1, #2
	ldr	r1, [r1, r3]
	ldr	r0, [r7, #24]
	mov	r3, #128
	orr	r3, r3, r0
	lsl	r3, r3, #16
	orr	r1, r1, r3
	ldr	r3, .L645
	ldr	r0, .L645+12
	add	r2, r2, r0
	lsl	r2, r2, #2
	str	r1, [r2, r3]
	b	.L640
.L639:
	.loc 3 2440 0
	ldr	r2, [r7, #4]
	ldr	r1, [r7, #4]
	ldr	r3, .L645
	ldr	r0, .L645+12
	add	r1, r1, r0
	lsl	r1, r1, #2
	ldr	r1, [r1, r3]
	ldr	r3, [r7, #24]
	lsl	r3, r3, #16
	orr	r1, r1, r3
	ldr	r3, .L645
	ldr	r0, .L645+12
	add	r2, r2, r0
	lsl	r2, r2, #2
	str	r1, [r2, r3]
.L640:
	.loc 3 2442 0
	ldr	r3, [r7, #28]
	cmp	r3, #0
	bge	.L641
	.loc 3 2444 0
	ldr	r3, [r7, #28]
	neg	r3, r3
	str	r3, [r7, #28]
	.loc 3 2445 0
	ldr	r2, [r7, #4]
	ldr	r1, [r7, #4]
	ldr	r3, .L645
	ldr	r0, .L645+12
	add	r1, r1, r0
	lsl	r1, r1, #2
	ldr	r1, [r1, r3]
	ldr	r0, [r7, #28]
	mov	r3, #128
	orr	r3, r3, r0
	lsl	r3, r3, #24
	orr	r1, r1, r3
	ldr	r3, .L645
	ldr	r0, .L645+12
	add	r2, r2, r0
	lsl	r2, r2, #2
	str	r1, [r2, r3]
	b	.L642
.L641:
	.loc 3 2448 0
	ldr	r2, [r7, #4]
	ldr	r1, [r7, #4]
	ldr	r3, .L645
	ldr	r0, .L645+12
	add	r1, r1, r0
	lsl	r1, r1, #2
	ldr	r1, [r1, r3]
	ldr	r3, [r7, #28]
	lsl	r3, r3, #24
	orr	r1, r1, r3
	ldr	r3, .L645
	ldr	r0, .L645+12
	add	r2, r2, r0
	lsl	r2, r2, #2
	str	r1, [r2, r3]
.L642:
	.loc 3 2450 0
	ldr	r2, .L645
	ldr	r3, .L645+4
	ldr	r3, [r2, r3]
	cmp	r3, #2
	bne	.L643
	.loc 3 2451 0
	ldr	r2, [r7, #4]
	ldr	r3, .L645
	ldr	r1, .L645+12
	add	r2, r2, r1
	lsl	r2, r2, #2
	ldr	r1, [r2, r3]
	ldr	r2, .L645
	mov	r3, #229
	lsl	r3, r3, #4
	str	r1, [r2, r3]
	b	.L644
.L643:
	.loc 3 2453 0
	ldr	r2, [r7, #4]
	ldr	r3, .L645
	ldr	r0, .L645+12
	add	r2, r2, r0
	lsl	r2, r2, #2
	ldr	r1, [r2, r3]
	ldr	r2, .L645
	ldr	r3, .L645+20
	str	r1, [r2, r3]
.L644:
.LBE31:
.LBE30:
	.loc 3 2455 0
	mov	sp, r7
	add	sp, sp, #32
	@ sp needed for prologue
	pop	{r7, pc}
.L646:
	.align	2
.L645:
	.word	IPPU
	.word	3660
	.word	PPU
	.word	922
	.word	926
	.word	3668
.LFE35:
	.fnend
	.size	S9xProcessMouse, .-S9xProcessMouse
	.align	2
	.global	_Z17ProcessSuperScopev
	.hidden	_Z17ProcessSuperScopev
	.code	16
	.thumb_func
	.type	_Z17ProcessSuperScopev, %function
_Z17ProcessSuperScopev:
	.fnstart
.LFB36:
	.loc 3 2458 0
	.save	{r7, lr}
	push	{r7, lr}
.LCFI45:
	.pad #16
	sub	sp, sp, #16
.LCFI46:
	.setfp r7, sp, #0
	add	r7, sp, #0
.LCFI47:
.LBB32:
	.loc 3 2462 0
	ldr	r2, .L656
	ldr	r3, .L656+4
	ldr	r3, [r2, r3]
	cmp	r3, #4
	bne	.L648
	mov	r1, r7
	add	r1, r1, #8
	add	r2, r7, #4
	mov	r3, r7
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	S9xReadSuperScopePosition
	mov	r3, r0
	cmp	r3, #0
	beq	.L648
	mov	r3, #1
	b	.L649
.L648:
	mov	r3, #0
.L649:
	cmp	r3, #0
	beq	.L655
.LBB33:
	.loc 3 2473 0
	ldr	r3, [r7]
	lsl	r3, r3, #15
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r1, [r7]
	mov	r3, #2
	and	r3, r3, r1
	lsl	r3, r3, #13
	orr	r2, r2, r3
	ldr	r1, [r7]
	mov	r3, #4
	and	r3, r3, r1
	lsl	r3, r3, #11
	orr	r2, r2, r3
	ldr	r1, [r7]
	mov	r3, #8
	and	r3, r3, r1
	lsl	r3, r3, #9
	orr	r2, r2, r3
	mov	r3, #255
	orr	r3, r3, r2
	str	r3, [r7, #12]
	.loc 3 2474 0
	ldr	r3, [r7, #8]
	cmp	r3, #255
	ble	.L651
	.loc 3 2475 0
	mov	r3, #255
	str	r3, [r7, #8]
.L651:
	.loc 3 2476 0
	ldr	r3, [r7, #8]
	cmp	r3, #0
	bge	.L652
	.loc 3 2477 0
	mov	r3, #0
	str	r3, [r7, #8]
.L652:
	.loc 3 2478 0
	ldr	r2, .L656+8
	ldr	r3, .L656+12
	ldrh	r3, [r2, r3]
	sub	r2, r3, #1
	ldr	r3, [r7, #4]
	cmp	r2, r3
	bge	.L653
	.loc 3 2479 0
	ldr	r2, .L656+8
	ldr	r3, .L656+12
	ldrh	r3, [r2, r3]
	sub	r3, r3, #1
	str	r3, [r7, #4]
.L653:
	.loc 3 2480 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bge	.L654
	.loc 3 2481 0
	mov	r3, #0
	str	r3, [r7, #4]
.L654:
	.loc 3 2483 0
	ldr	r3, [r7, #4]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r3, #1
	lsl	r3, r3, #16
	lsr	r1, r3, #16
	ldr	r2, .L656+8
	ldr	r3, .L656+16
	strh	r1, [r2, r3]
	.loc 3 2484 0
	ldr	r3, [r7, #8]
	lsl	r3, r3, #16
	lsr	r1, r3, #16
	ldr	r2, .L656+8
	mov	r3, #133
	lsl	r3, r3, #4
	strh	r1, [r2, r3]
	.loc 3 2485 0
	ldr	r2, .L656+8
	ldr	r3, .L656+20
	mov	r1, #1
	strb	r1, [r2, r3]
	.loc 3 2486 0
	ldr	r3, .L656+24
	ldr	r3, [r3, #20]
	ldr	r1, .L656+28
	add	r2, r3, r1
	ldr	r3, .L656+24
	ldr	r3, [r3, #20]
	ldr	r1, .L656+28
	add	r3, r3, r1
	ldrb	r1, [r3]
	mov	r3, #64
	orr	r3, r3, r1
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	strb	r3, [r2]
	.loc 3 2487 0
	ldr	r2, .L656
	ldr	r3, .L656+32
	ldr	r1, [r7, #12]
	str	r1, [r2, r3]
.L655:
.LBE33:
.LBE32:
	.loc 3 2489 0
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed for prologue
	pop	{r7, pc}
.L657:
	.align	2
.L656:
	.word	IPPU
	.word	3660
	.word	PPU
	.word	2154
	.word	2126
	.word	2132
	.word	Memory
	.word	8511
	.word	3668
.LFE36:
	.fnend
	.size	_Z17ProcessSuperScopev, .-_Z17ProcessSuperScopev
	.align	2
	.global	S9xNextController
	.hidden	S9xNextController
	.code	16
	.thumb_func
	.type	S9xNextController, %function
S9xNextController:
	.fnstart
.LFB37:
	.loc 3 2492 0
	.save	{r7, lr}
	push	{r7, lr}
.LCFI48:
	add	r7, sp, #0
.LCFI49:
	.loc 3 2493 0
	ldr	r2, .L668
	ldr	r3, .L668+4
	ldr	r3, [r2, r3]
	cmp	r3, #4
	bhi	.L659
	lsl	r2, r3, #2
	ldr	r3, .L668+8
	add	r3, r2, r3
	ldr	r3, [r3]
	mov	pc, r3
	.section	.rodata
	.align	2
.L665:
	.word	.L660
	.word	.L661
	.word	.L662
	.word	.L663
	.word	.L664
	.text
.L660:
	.loc 3 2496 0
	ldr	r2, .L668
	ldr	r3, .L668+4
	mov	r1, #1
	str	r1, [r2, r3]
	.loc 3 2497 0
	b	.L667
.L661:
	.loc 3 2499 0
	ldr	r2, .L668+12
	mov	r3, #79
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	beq	.L662
	.loc 3 2501 0
	ldr	r2, .L668
	ldr	r3, .L668+4
	mov	r1, #2
	str	r1, [r2, r3]
	.loc 3 2502 0
	b	.L667
.L662:
	.loc 3 2505 0
	ldr	r2, .L668+12
	mov	r3, #79
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	beq	.L663
	.loc 3 2507 0
	ldr	r2, .L668
	ldr	r3, .L668+4
	mov	r1, #3
	str	r1, [r2, r3]
	.loc 3 2508 0
	b	.L667
.L663:
	.loc 3 2511 0
	ldr	r2, .L668+12
	mov	r3, #78
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	beq	.L664
	.loc 3 2513 0
	ldr	r2, .L668
	ldr	r3, .L668+4
	mov	r1, #4
	str	r1, [r2, r3]
	.loc 3 2514 0
	b	.L667
.L664:
	.loc 3 2517 0
	ldr	r2, .L668+12
	mov	r3, #77
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	beq	.L659
	.loc 3 2519 0
	ldr	r2, .L668
	ldr	r3, .L668+4
	mov	r1, #0
	str	r1, [r2, r3]
	.loc 3 2520 0
	b	.L667
.L659:
	.loc 3 2523 0
	ldr	r2, .L668
	ldr	r3, .L668+4
	mov	r1, #1
	str	r1, [r2, r3]
.L667:
	.loc 3 2526 0
	mov	sp, r7
	@ sp needed for prologue
	pop	{r7, pc}
.L669:
	.align	2
.L668:
	.word	IPPU
	.word	3660
	.word	.L665
	.word	Settings
.LFE37:
	.cantunwind
	.fnend
	.size	S9xNextController, .-S9xNextController
	.align	2
	.global	S9xUpdateJoypads
	.hidden	S9xUpdateJoypads
	.code	16
	.thumb_func
	.type	S9xUpdateJoypads, %function
S9xUpdateJoypads:
	.fnstart
.LFB38:
	.loc 3 2529 0
	.save	{r4, r7, lr}
	push	{r4, r7, lr}
.LCFI50:
	.pad #12
	sub	sp, sp, #12
.LCFI51:
	.setfp r7, sp, #0
	add	r7, sp, #0
.LCFI52:
.LBB34:
	.loc 3 2532 0
	mov	r3, #0
	str	r3, [r7]
	b	.L671
.L674:
	.loc 3 2534 0
	ldr	r4, [r7]
	ldr	r3, [r7]
	mov	r0, r3
	bl	S9xReadJoypad
	mov	r1, r0
	ldr	r3, .L691
	mov	r0, #229
	lsl	r0, r0, #2
	add	r2, r4, r0
	lsl	r2, r2, #2
	str	r1, [r2, r3]
	.loc 3 2535 0
	ldr	r2, [r7]
	ldr	r3, .L691
	mov	r1, #229
	lsl	r1, r1, #2
	add	r2, r2, r1
	lsl	r2, r2, #2
	ldr	r2, [r2, r3]
	mov	r3, #128
	lsl	r3, r3, #2
	and	r3, r3, r2
	cmp	r3, #0
	beq	.L672
	.loc 3 2536 0
	ldr	r2, [r7]
	ldr	r1, [r7]
	ldr	r3, .L691
	mov	r4, #229
	lsl	r4, r4, #2
	add	r1, r1, r4
	lsl	r1, r1, #2
	ldr	r1, [r1, r3]
	ldr	r3, .L691+4
	and	r1, r1, r3
	ldr	r3, .L691
	mov	r0, #229
	lsl	r0, r0, #2
	add	r2, r2, r0
	lsl	r2, r2, #2
	str	r1, [r2, r3]
.L672:
	.loc 3 2537 0
	ldr	r2, [r7]
	ldr	r3, .L691
	mov	r1, #229
	lsl	r1, r1, #2
	add	r2, r2, r1
	lsl	r2, r2, #2
	ldr	r2, [r2, r3]
	mov	r3, #128
	lsl	r3, r3, #4
	and	r3, r3, r2
	cmp	r3, #0
	beq	.L673
	.loc 3 2538 0
	ldr	r2, [r7]
	ldr	r1, [r7]
	ldr	r3, .L691
	mov	r4, #229
	lsl	r4, r4, #2
	add	r1, r1, r4
	lsl	r1, r1, #2
	ldr	r1, [r1, r3]
	ldr	r3, .L691+8
	and	r1, r1, r3
	ldr	r3, .L691
	mov	r0, #229
	lsl	r0, r0, #2
	add	r2, r2, r0
	lsl	r2, r2, #2
	str	r1, [r2, r3]
.L673:
	.loc 3 2532 0
	ldr	r3, [r7]
	add	r3, r3, #1
	str	r3, [r7]
.L671:
	ldr	r3, [r7]
	mov	r2, #4
	lsr	r0, r3, #31
	asr	r1, r2, #31
	mov	r4, r0
	cmp	r2, r3
	adc	r4, r4, r1
	mov	r3, r4
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	bne	.L674
	.loc 3 2542 0
	ldr	r3, .L691+12
	ldrb	r3, [r3, #6]
	cmp	r3, #0
	beq	.L675
	ldr	r2, .L691
	ldr	r3, .L691+16
	ldr	r3, [r2, r3]
	cmp	r3, #1
	beq	.L676
	ldr	r2, .L691
	ldr	r3, .L691+16
	ldr	r3, [r2, r3]
	cmp	r3, #0
	bne	.L675
.L676:
	.loc 3 2546 0
	mov	r3, #0
	str	r3, [r7]
	b	.L677
.L679:
	.loc 3 2548 0
	ldr	r2, [r7]
	ldr	r3, .L691
	mov	r0, #229
	lsl	r0, r0, #2
	add	r2, r2, r0
	lsl	r2, r2, #2
	ldr	r3, [r2, r3]
	cmp	r3, #0
	beq	.L678
	.loc 3 2549 0
	ldr	r2, [r7]
	ldr	r1, [r7]
	ldr	r3, .L691
	mov	r4, #229
	lsl	r4, r4, #2
	add	r1, r1, r4
	lsl	r1, r1, #2
	ldr	r1, [r1, r3]
	ldr	r3, .L691+20
	orr	r1, r1, r3
	ldr	r3, .L691
	mov	r0, #229
	lsl	r0, r0, #2
	add	r2, r2, r0
	lsl	r2, r2, #2
	str	r1, [r2, r3]
.L678:
	.loc 3 2546 0
	ldr	r3, [r7]
	add	r3, r3, #1
	str	r3, [r7]
.L677:
	ldr	r3, [r7]
	mov	r2, #4
	lsr	r0, r3, #31
	asr	r1, r2, #31
	mov	r4, r0
	cmp	r2, r3
	adc	r4, r4, r1
	mov	r3, r4
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	bne	.L679
.L675:
	.loc 3 2554 0
	ldr	r2, .L691+24
	mov	r3, #79
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	beq	.L680
	.loc 3 2556 0
	mov	r3, #0
	str	r3, [r7]
	b	.L681
.L682:
	.loc 3 2557 0
	ldr	r3, [r7]
	mov	r0, r3
	bl	S9xProcessMouse
	.loc 3 2556 0
	ldr	r3, [r7]
	add	r3, r3, #1
	str	r3, [r7]
.L681:
	ldr	r3, [r7]
	mov	r2, #1
	lsr	r0, r3, #31
	asr	r1, r2, #31
	mov	r4, r0
	cmp	r2, r3
	adc	r4, r4, r1
	mov	r3, r4
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	bne	.L682
.L680:
	.loc 3 2561 0
	ldr	r2, .L691+24
	mov	r3, #78
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	beq	.L683
	.loc 3 2562 0
	bl	_Z17ProcessSuperScopev
.L683:
	.loc 3 2564 0
	ldr	r3, .L691+28
	ldr	r3, [r3, #20]
	mov	r0, #132
	lsl	r0, r0, #7
	add	r3, r3, r0
	ldrb	r3, [r3]
	mov	r2, r3
	mov	r3, #1
	and	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	bne	.LCB11074
	b	.L690	@long jump
.LCB11074:
.LBB35:
	.loc 3 2566 0
	ldr	r2, .L691+32
	ldr	r3, .L691+36
	mov	r1, #16
	strb	r1, [r2, r3]
	.loc 3 2567 0
	ldr	r3, .L691+28
	ldr	r3, [r3, #20]
	ldr	r1, .L691+40
	add	r3, r3, r1
	ldrb	r3, [r3]
	lsl	r3, r3, #24
	asr	r3, r3, #24
	cmp	r3, #0
	bge	.L685
	.loc 3 2569 0
	ldr	r2, .L691+32
	ldr	r3, .L691+44
	mov	r1, #16
	strb	r1, [r2, r3]
	.loc 3 2570 0
	ldr	r2, .L691+32
	ldr	r3, .L691+48
	mov	r1, #0
	strb	r1, [r2, r3]
	b	.L686
.L685:
	.loc 3 2574 0
	ldr	r2, .L691+32
	ldr	r3, .L691+44
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 3 2575 0
	ldr	r2, .L691+32
	ldr	r3, .L691+48
	mov	r1, #16
	strb	r1, [r2, r3]
.L686:
	.loc 3 2577 0
	ldr	r3, .L691+24
	ldrb	r3, [r3, #25]
	cmp	r3, #0
	beq	.L687
	mov	r3, #1
	b	.L688
.L687:
	mov	r3, #0
.L688:
	str	r3, [r7, #4]
	.loc 3 2579 0
	ldr	r3, .L691+28
	ldr	r3, [r3, #20]
	ldr	r2, .L691+52
	add	r3, r3, r2
	ldr	r1, [r7, #4]
	ldr	r2, .L691
	mov	r4, #229
	lsl	r4, r4, #2
	add	r1, r1, r4
	lsl	r1, r1, #2
	ldr	r2, [r1, r2]
	lsl	r2, r2, #24
	lsr	r2, r2, #24
	strb	r2, [r3]
	.loc 3 2580 0
	ldr	r3, .L691+28
	ldr	r3, [r3, #20]
	ldr	r0, .L691+56
	add	r3, r3, r0
	ldr	r1, [r7, #4]
	ldr	r2, .L691
	mov	r4, #229
	lsl	r4, r4, #2
	add	r1, r1, r4
	lsl	r1, r1, #2
	ldr	r2, [r1, r2]
	lsr	r2, r2, #8
	lsl	r2, r2, #24
	lsr	r2, r2, #24
	strb	r2, [r3]
	.loc 3 2581 0
	ldr	r3, .L691+28
	ldr	r3, [r3, #20]
	ldr	r0, .L691+60
	add	r3, r3, r0
	ldr	r1, [r7, #4]
	mov	r2, #1
	eor	r1, r1, r2
	ldr	r2, .L691
	mov	r4, #229
	lsl	r4, r4, #2
	add	r1, r1, r4
	lsl	r1, r1, #2
	ldr	r2, [r1, r2]
	lsl	r2, r2, #24
	lsr	r2, r2, #24
	strb	r2, [r3]
	.loc 3 2582 0
	ldr	r3, .L691+28
	ldr	r3, [r3, #20]
	ldr	r0, .L691+64
	add	r3, r3, r0
	ldr	r1, [r7, #4]
	mov	r2, #1
	eor	r1, r1, r2
	ldr	r2, .L691
	mov	r4, #229
	lsl	r4, r4, #2
	add	r1, r1, r4
	lsl	r1, r1, #2
	ldr	r2, [r1, r2]
	lsr	r2, r2, #8
	lsl	r2, r2, #24
	lsr	r2, r2, #24
	strb	r2, [r3]
	.loc 3 2583 0
	ldr	r3, .L691+28
	ldr	r3, [r3, #20]
	ldr	r0, .L691+40
	add	r3, r3, r0
	ldrb	r3, [r3]
	lsl	r3, r3, #24
	asr	r3, r3, #24
	cmp	r3, #0
	bge	.L689
	.loc 3 2585 0
	ldr	r3, .L691+28
	ldr	r3, [r3, #20]
	ldr	r1, .L691+68
	add	r3, r3, r1
	ldr	r1, [r7, #4]
	ldr	r2, .L691
	mov	r4, #229
	lsl	r4, r4, #2
	add	r1, r1, r4
	lsl	r1, r1, #2
	ldr	r2, [r1, r2]
	lsl	r2, r2, #24
	lsr	r2, r2, #24
	strb	r2, [r3]
	.loc 3 2586 0
	ldr	r3, .L691+28
	ldr	r3, [r3, #20]
	ldr	r0, .L691+72
	add	r3, r3, r0
	ldr	r1, [r7, #4]
	ldr	r2, .L691
	mov	r4, #229
	lsl	r4, r4, #2
	add	r1, r1, r4
	lsl	r1, r1, #2
	ldr	r2, [r1, r2]
	lsr	r2, r2, #8
	lsl	r2, r2, #24
	lsr	r2, r2, #24
	strb	r2, [r3]
	.loc 3 2587 0
	ldr	r3, .L691+28
	ldr	r3, [r3, #20]
	ldr	r0, .L691+76
	add	r3, r3, r0
	ldr	r1, .L691
	ldr	r2, .L691+80
	ldr	r2, [r1, r2]
	lsl	r2, r2, #24
	lsr	r2, r2, #24
	strb	r2, [r3]
	.loc 3 2588 0
	ldr	r3, .L691+28
	ldr	r3, [r3, #20]
	ldr	r1, .L691+84
	add	r3, r3, r1
	ldr	r1, .L691
	ldr	r2, .L691+80
	ldr	r2, [r1, r2]
	lsr	r2, r2, #8
	lsl	r2, r2, #24
	lsr	r2, r2, #24
	strb	r2, [r3]
	b	.L690
.L689:
	.loc 3 2592 0
	ldr	r3, .L691+28
	ldr	r3, [r3, #20]
	ldr	r2, .L691+68
	add	r3, r3, r2
	ldr	r1, .L691
	ldr	r2, .L691+88
	ldr	r2, [r1, r2]
	lsl	r2, r2, #24
	lsr	r2, r2, #24
	strb	r2, [r3]
	.loc 3 2593 0
	ldr	r3, .L691+28
	ldr	r3, [r3, #20]
	ldr	r4, .L691+72
	add	r3, r3, r4
	ldr	r1, .L691
	ldr	r2, .L691+88
	ldr	r2, [r1, r2]
	lsr	r2, r2, #8
	lsl	r2, r2, #24
	lsr	r2, r2, #24
	strb	r2, [r3]
	.loc 3 2594 0
	ldr	r3, .L691+28
	ldr	r3, [r3, #20]
	ldr	r0, .L691+76
	add	r2, r3, r0
	ldr	r1, .L691
	mov	r3, #230
	lsl	r3, r3, #4
	ldr	r3, [r1, r3]
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	strb	r3, [r2]
	.loc 3 2595 0
	ldr	r3, .L691+28
	ldr	r3, [r3, #20]
	ldr	r1, .L691+84
	add	r2, r3, r1
	ldr	r1, .L691
	mov	r3, #230
	lsl	r3, r3, #4
	ldr	r3, [r1, r3]
	lsr	r3, r3, #8
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	strb	r3, [r2]
.L690:
.LBE35:
.LBE34:
	.loc 3 2598 0
	mov	sp, r7
	add	sp, sp, #12
	@ sp needed for prologue
	pop	{r4, r7, pc}
.L692:
	.align	2
.L691:
	.word	IPPU
	.word	-257
	.word	-1025
	.word	SNESGameFixes
	.word	3660
	.word	-65536
	.word	Settings
	.word	Memory
	.word	PPU
	.word	2146
	.word	16897
	.word	2147
	.word	2771
	.word	16920
	.word	16921
	.word	16922
	.word	16923
	.word	16924
	.word	16925
	.word	16926
	.word	3672
	.word	16927
	.word	3676
.LFE38:
	.fnend
	.size	S9xUpdateJoypads, .-S9xUpdateJoypads
	.align	2
	.global	S9xSuperFXExec
	.hidden	S9xSuperFXExec
	.code	16
	.thumb_func
	.type	S9xSuperFXExec, %function
S9xSuperFXExec:
	.fnstart
.LFB39:
	.loc 3 2603 0
	.save	{r7, lr}
	push	{r7, lr}
.LCFI53:
	.pad #8
	sub	sp, sp, #8
.LCFI54:
	.setfp r7, sp, #0
	add	r7, sp, #0
.LCFI55:
.LBB36:
	.loc 3 2605 0
	ldr	r2, .L700
	mov	r3, #80
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	beq	.L699
	.loc 3 2607 0
	ldr	r3, .L700+4
	ldr	r3, [r3, #20]
	ldr	r1, .L700+8
	add	r3, r3, r1
	ldrb	r3, [r3]
	mov	r2, r3
	mov	r3, #32
	and	r3, r3, r2
	cmp	r3, #0
	beq	.L699
	.loc 3 2608 0
	ldr	r3, .L700+4
	ldr	r3, [r3, #20]
	ldr	r2, .L700+12
	add	r3, r3, r2
	ldrb	r3, [r3]
	.loc 3 2607 0
	mov	r2, r3
	mov	r3, #24
	and	r3, r3, r2
	cmp	r3, #24
	bne	.L699
.LBB37:
	.loc 3 2610 0
	ldr	r2, .L700
	mov	r3, #145
	lsl	r3, r3, #1
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	bne	.L695
	.loc 3 2611 0
	mov	r3, #1
	neg	r3, r3
	mov	r0, r3
	bl	_Z9FxEmulatej
	b	.L696
.L695:
	.loc 3 2612 0
	ldr	r3, .L700+4
	ldr	r3, [r3, #20]
	ldr	r1, .L700+16
	add	r3, r3, r1
	ldrb	r3, [r3]
	mov	r2, r3
	mov	r3, #1
	and	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	beq	.L697
	mov	r3, #175
	lsl	r3, r3, #2
	b	.L698
.L697:
	mov	r3, #175
	lsl	r3, r3, #1
.L698:
	mov	r0, r3
	bl	_Z9FxEmulatej
.L696:
	.loc 3 2614 0
	ldr	r3, .L700+4
	ldr	r3, [r3, #20]
	ldr	r2, .L700+8
	add	r3, r3, r2
	ldrb	r3, [r3]
	mov	r2, r3
	ldr	r3, .L700+4
	ldr	r3, [r3, #20]
	ldr	r1, .L700+20
	add	r3, r3, r1
	ldrb	r3, [r3]
	lsl	r3, r3, #8
	orr	r3, r3, r2
	str	r3, [r7, #4]
	.loc 3 2615 0
	ldr	r2, [r7, #4]
	ldr	r3, .L700+24
	and	r2, r2, r3
	mov	r3, #128
	lsl	r3, r3, #8
	cmp	r2, r3
	bne	.L699
	.loc 3 2618 0
	mov	r0, #4
	bl	S9xSetIRQ
.L699:
.LBE37:
.LBE36:
	.loc 3 2785 0
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed for prologue
	pop	{r7, pc}
.L701:
	.align	2
.L700:
	.word	Settings
	.word	Memory
	.word	12336
	.word	12346
	.word	12345
	.word	12337
	.word	32800
.LFE39:
	.fnend
	.size	S9xSuperFXExec, .-S9xSuperFXExec
	.data
	.align	2
	.type	_ZZ9S9xSetPPUE8IncCount, %object
	.size	_ZZ9S9xSetPPUE8IncCount, 8
_ZZ9S9xSetPPUE8IncCount:
	.short	0
	.short	32
	.short	64
	.short	128
	.align	2
	.type	_ZZ9S9xSetPPUE5Shift, %object
	.size	_ZZ9S9xSetPPUE5Shift, 8
_ZZ9S9xSetPPUE5Shift:
	.short	0
	.short	5
	.short	6
	.short	7
	.section	.debug_frame,"",%progbits
.Lframe0:
	.4byte	.LECIE0-.LSCIE0
.LSCIE0:
	.4byte	0xffffffff
	.byte	0x1
	.ascii	"\000"
	.uleb128 0x1
	.sleb128 -4
	.byte	0xe
	.byte	0xc
	.uleb128 0xd
	.uleb128 0x0
	.align	2
.LECIE0:
.LSFDE0:
	.4byte	.LEFDE0-.LASFDE0
.LASFDE0:
	.4byte	.Lframe0
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.byte	0x4
	.4byte	.LCFI0-.LFB6
	.byte	0xe
	.uleb128 0x8
	.byte	0x11
	.uleb128 0x7
	.sleb128 2
	.byte	0x11
	.uleb128 0xe
	.sleb128 1
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.byte	0x4
	.4byte	.LCFI2-.LFB7
	.byte	0xe
	.uleb128 0x8
	.byte	0x11
	.uleb128 0x7
	.sleb128 2
	.byte	0x11
	.uleb128 0xe
	.sleb128 1
	.byte	0x4
	.4byte	.LCFI3-.LCFI2
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.byte	0x4
	.4byte	.LCFI4-.LFB8
	.byte	0xe
	.uleb128 0x8
	.byte	0x11
	.uleb128 0x7
	.sleb128 2
	.byte	0x11
	.uleb128 0xe
	.sleb128 1
	.byte	0x4
	.4byte	.LCFI5-.LCFI4
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI6-.LCFI5
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.byte	0x4
	.4byte	.LCFI7-.LFB9
	.byte	0xe
	.uleb128 0x8
	.byte	0x11
	.uleb128 0x7
	.sleb128 2
	.byte	0x11
	.uleb128 0xe
	.sleb128 1
	.byte	0x4
	.4byte	.LCFI8-.LCFI7
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI9-.LCFI8
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.byte	0x4
	.4byte	.LCFI10-.LFB12
	.byte	0xe
	.uleb128 0x8
	.byte	0x11
	.uleb128 0x7
	.sleb128 2
	.byte	0x11
	.uleb128 0xe
	.sleb128 1
	.byte	0x4
	.4byte	.LCFI11-.LCFI10
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI12-.LCFI11
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.byte	0x4
	.4byte	.LCFI13-.LFB15
	.byte	0xe
	.uleb128 0xc
	.byte	0x11
	.uleb128 0x4
	.sleb128 3
	.byte	0x11
	.uleb128 0x7
	.sleb128 2
	.byte	0x11
	.uleb128 0xe
	.sleb128 1
	.byte	0x4
	.4byte	.LCFI14-.LCFI13
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI15-.LCFI14
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.byte	0x4
	.4byte	.LCFI16-.LFB16
	.byte	0xe
	.uleb128 0x8
	.byte	0x11
	.uleb128 0x7
	.sleb128 2
	.byte	0x11
	.uleb128 0xe
	.sleb128 1
	.byte	0x4
	.4byte	.LCFI17-.LCFI16
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI18-.LCFI17
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE12:
.LSFDE14:
	.4byte	.LEFDE14-.LASFDE14
.LASFDE14:
	.4byte	.Lframe0
	.4byte	.LFB17
	.4byte	.LFE17-.LFB17
	.byte	0x4
	.4byte	.LCFI19-.LFB17
	.byte	0xe
	.uleb128 0x8
	.byte	0x11
	.uleb128 0x7
	.sleb128 2
	.byte	0x11
	.uleb128 0xe
	.sleb128 1
	.byte	0x4
	.4byte	.LCFI20-.LCFI19
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI21-.LCFI20
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB28
	.4byte	.LFE28-.LFB28
	.byte	0x4
	.4byte	.LCFI22-.LFB28
	.byte	0xe
	.uleb128 0x8
	.byte	0x11
	.uleb128 0x7
	.sleb128 2
	.byte	0x11
	.uleb128 0xe
	.sleb128 1
	.byte	0x4
	.4byte	.LCFI23-.LCFI22
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE16:
.LSFDE18:
	.4byte	.LEFDE18-.LASFDE18
.LASFDE18:
	.4byte	.Lframe0
	.4byte	.LFB29
	.4byte	.LFE29-.LFB29
	.byte	0x4
	.4byte	.LCFI24-.LFB29
	.byte	0xe
	.uleb128 0xc
	.byte	0x11
	.uleb128 0x4
	.sleb128 3
	.byte	0x11
	.uleb128 0x7
	.sleb128 2
	.byte	0x11
	.uleb128 0xe
	.sleb128 1
	.byte	0x4
	.4byte	.LCFI25-.LCFI24
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI26-.LCFI25
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE18:
.LSFDE20:
	.4byte	.LEFDE20-.LASFDE20
.LASFDE20:
	.4byte	.Lframe0
	.4byte	.LFB30
	.4byte	.LFE30-.LFB30
	.byte	0x4
	.4byte	.LCFI27-.LFB30
	.byte	0xe
	.uleb128 0x8
	.byte	0x11
	.uleb128 0x7
	.sleb128 2
	.byte	0x11
	.uleb128 0xe
	.sleb128 1
	.byte	0x4
	.4byte	.LCFI28-.LCFI27
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI29-.LCFI28
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE20:
.LSFDE22:
	.4byte	.LEFDE22-.LASFDE22
.LASFDE22:
	.4byte	.Lframe0
	.4byte	.LFB31
	.4byte	.LFE31-.LFB31
	.byte	0x4
	.4byte	.LCFI30-.LFB31
	.byte	0xe
	.uleb128 0x8
	.byte	0x11
	.uleb128 0x7
	.sleb128 2
	.byte	0x11
	.uleb128 0xe
	.sleb128 1
	.byte	0x4
	.4byte	.LCFI31-.LCFI30
	.byte	0xe
	.uleb128 0x38
	.byte	0x4
	.4byte	.LCFI32-.LCFI31
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE22:
.LSFDE24:
	.4byte	.LEFDE24-.LASFDE24
.LASFDE24:
	.4byte	.Lframe0
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.byte	0x4
	.4byte	.LCFI33-.LFB32
	.byte	0xe
	.uleb128 0xc
	.byte	0x11
	.uleb128 0x4
	.sleb128 3
	.byte	0x11
	.uleb128 0x7
	.sleb128 2
	.byte	0x11
	.uleb128 0xe
	.sleb128 1
	.byte	0x4
	.4byte	.LCFI34-.LCFI33
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI35-.LCFI34
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE24:
.LSFDE26:
	.4byte	.LEFDE26-.LASFDE26
.LASFDE26:
	.4byte	.Lframe0
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.byte	0x4
	.4byte	.LCFI36-.LFB33
	.byte	0xe
	.uleb128 0x8
	.byte	0x11
	.uleb128 0x7
	.sleb128 2
	.byte	0x11
	.uleb128 0xe
	.sleb128 1
	.byte	0x4
	.4byte	.LCFI37-.LCFI36
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI38-.LCFI37
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE26:
.LSFDE28:
	.4byte	.LEFDE28-.LASFDE28
.LASFDE28:
	.4byte	.Lframe0
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.byte	0x4
	.4byte	.LCFI39-.LFB34
	.byte	0xe
	.uleb128 0xc
	.byte	0x11
	.uleb128 0x4
	.sleb128 3
	.byte	0x11
	.uleb128 0x7
	.sleb128 2
	.byte	0x11
	.uleb128 0xe
	.sleb128 1
	.byte	0x4
	.4byte	.LCFI40-.LCFI39
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI41-.LCFI40
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE28:
.LSFDE30:
	.4byte	.LEFDE30-.LASFDE30
.LASFDE30:
	.4byte	.Lframe0
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.byte	0x4
	.4byte	.LCFI42-.LFB35
	.byte	0xe
	.uleb128 0x8
	.byte	0x11
	.uleb128 0x7
	.sleb128 2
	.byte	0x11
	.uleb128 0xe
	.sleb128 1
	.byte	0x4
	.4byte	.LCFI43-.LCFI42
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI44-.LCFI43
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE30:
.LSFDE32:
	.4byte	.LEFDE32-.LASFDE32
.LASFDE32:
	.4byte	.Lframe0
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.byte	0x4
	.4byte	.LCFI45-.LFB36
	.byte	0xe
	.uleb128 0x8
	.byte	0x11
	.uleb128 0x7
	.sleb128 2
	.byte	0x11
	.uleb128 0xe
	.sleb128 1
	.byte	0x4
	.4byte	.LCFI46-.LCFI45
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI47-.LCFI46
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE32:
.LSFDE34:
	.4byte	.LEFDE34-.LASFDE34
.LASFDE34:
	.4byte	.Lframe0
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.byte	0x4
	.4byte	.LCFI48-.LFB37
	.byte	0xe
	.uleb128 0x8
	.byte	0x11
	.uleb128 0x7
	.sleb128 2
	.byte	0x11
	.uleb128 0xe
	.sleb128 1
	.byte	0x4
	.4byte	.LCFI49-.LCFI48
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE34:
.LSFDE36:
	.4byte	.LEFDE36-.LASFDE36
.LASFDE36:
	.4byte	.Lframe0
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.byte	0x4
	.4byte	.LCFI50-.LFB38
	.byte	0xe
	.uleb128 0xc
	.byte	0x11
	.uleb128 0x4
	.sleb128 3
	.byte	0x11
	.uleb128 0x7
	.sleb128 2
	.byte	0x11
	.uleb128 0xe
	.sleb128 1
	.byte	0x4
	.4byte	.LCFI51-.LCFI50
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI52-.LCFI51
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE36:
.LSFDE38:
	.4byte	.LEFDE38-.LASFDE38
.LASFDE38:
	.4byte	.Lframe0
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.byte	0x4
	.4byte	.LCFI53-.LFB39
	.byte	0xe
	.uleb128 0x8
	.byte	0x11
	.uleb128 0x7
	.sleb128 2
	.byte	0x11
	.uleb128 0xe
	.sleb128 1
	.byte	0x4
	.4byte	.LCFI54-.LCFI53
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI55-.LCFI54
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE38:
	.text
.Letext0:
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LFB6-.Ltext0
	.4byte	.LCFI0-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LCFI0-.Ltext0
	.4byte	.LCFI1-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 8
	.4byte	.LCFI1-.Ltext0
	.4byte	.LFE6-.Ltext0
	.2byte	0x2
	.byte	0x77
	.sleb128 8
	.4byte	0x0
	.4byte	0x0
.LLST1:
	.4byte	.LFB7-.Ltext0
	.4byte	.LCFI2-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LCFI2-.Ltext0
	.4byte	.LCFI3-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 8
	.4byte	.LCFI3-.Ltext0
	.4byte	.LFE7-.Ltext0
	.2byte	0x2
	.byte	0x77
	.sleb128 8
	.4byte	0x0
	.4byte	0x0
.LLST2:
	.4byte	.LFB8-.Ltext0
	.4byte	.LCFI4-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LCFI4-.Ltext0
	.4byte	.LCFI5-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 8
	.4byte	.LCFI5-.Ltext0
	.4byte	.LCFI6-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 24
	.4byte	.LCFI6-.Ltext0
	.4byte	.LFE8-.Ltext0
	.2byte	0x2
	.byte	0x77
	.sleb128 24
	.4byte	0x0
	.4byte	0x0
.LLST3:
	.4byte	.LFB9-.Ltext0
	.4byte	.LCFI7-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LCFI7-.Ltext0
	.4byte	.LCFI8-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 8
	.4byte	.LCFI8-.Ltext0
	.4byte	.LCFI9-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 24
	.4byte	.LCFI9-.Ltext0
	.4byte	.LFE9-.Ltext0
	.2byte	0x2
	.byte	0x77
	.sleb128 24
	.4byte	0x0
	.4byte	0x0
.LLST4:
	.4byte	.LFB12-.Ltext0
	.4byte	.LCFI10-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LCFI10-.Ltext0
	.4byte	.LCFI11-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 8
	.4byte	.LCFI11-.Ltext0
	.4byte	.LCFI12-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 24
	.4byte	.LCFI12-.Ltext0
	.4byte	.LFE12-.Ltext0
	.2byte	0x2
	.byte	0x77
	.sleb128 24
	.4byte	0x0
	.4byte	0x0
.LLST5:
	.4byte	.LFB15-.Ltext0
	.4byte	.LCFI13-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LCFI13-.Ltext0
	.4byte	.LCFI14-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 12
	.4byte	.LCFI14-.Ltext0
	.4byte	.LCFI15-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 24
	.4byte	.LCFI15-.Ltext0
	.4byte	.LFE15-.Ltext0
	.2byte	0x2
	.byte	0x77
	.sleb128 24
	.4byte	0x0
	.4byte	0x0
.LLST6:
	.4byte	.LFB16-.Ltext0
	.4byte	.LCFI16-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LCFI16-.Ltext0
	.4byte	.LCFI17-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 8
	.4byte	.LCFI17-.Ltext0
	.4byte	.LCFI18-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 16
	.4byte	.LCFI18-.Ltext0
	.4byte	.LFE16-.Ltext0
	.2byte	0x2
	.byte	0x77
	.sleb128 16
	.4byte	0x0
	.4byte	0x0
.LLST7:
	.4byte	.LFB17-.Ltext0
	.4byte	.LCFI19-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LCFI19-.Ltext0
	.4byte	.LCFI20-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 8
	.4byte	.LCFI20-.Ltext0
	.4byte	.LCFI21-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 16
	.4byte	.LCFI21-.Ltext0
	.4byte	.LFE17-.Ltext0
	.2byte	0x2
	.byte	0x77
	.sleb128 16
	.4byte	0x0
	.4byte	0x0
.LLST8:
	.4byte	.LFB28-.Ltext0
	.4byte	.LCFI22-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LCFI22-.Ltext0
	.4byte	.LCFI23-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 8
	.4byte	.LCFI23-.Ltext0
	.4byte	.LFE28-.Ltext0
	.2byte	0x2
	.byte	0x77
	.sleb128 8
	.4byte	0x0
	.4byte	0x0
.LLST9:
	.4byte	.LFB29-.Ltext0
	.4byte	.LCFI24-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LCFI24-.Ltext0
	.4byte	.LCFI25-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 12
	.4byte	.LCFI25-.Ltext0
	.4byte	.LCFI26-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 24
	.4byte	.LCFI26-.Ltext0
	.4byte	.LFE29-.Ltext0
	.2byte	0x2
	.byte	0x77
	.sleb128 24
	.4byte	0x0
	.4byte	0x0
.LLST10:
	.4byte	.LFB30-.Ltext0
	.4byte	.LCFI27-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LCFI27-.Ltext0
	.4byte	.LCFI28-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 8
	.4byte	.LCFI28-.Ltext0
	.4byte	.LCFI29-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 24
	.4byte	.LCFI29-.Ltext0
	.4byte	.LFE30-.Ltext0
	.2byte	0x2
	.byte	0x77
	.sleb128 24
	.4byte	0x0
	.4byte	0x0
.LLST11:
	.4byte	.LFB31-.Ltext0
	.4byte	.LCFI30-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LCFI30-.Ltext0
	.4byte	.LCFI31-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 8
	.4byte	.LCFI31-.Ltext0
	.4byte	.LCFI32-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 56
	.4byte	.LCFI32-.Ltext0
	.4byte	.LFE31-.Ltext0
	.2byte	0x2
	.byte	0x77
	.sleb128 56
	.4byte	0x0
	.4byte	0x0
.LLST12:
	.4byte	.LFB32-.Ltext0
	.4byte	.LCFI33-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LCFI33-.Ltext0
	.4byte	.LCFI34-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 12
	.4byte	.LCFI34-.Ltext0
	.4byte	.LCFI35-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 40
	.4byte	.LCFI35-.Ltext0
	.4byte	.LFE32-.Ltext0
	.2byte	0x2
	.byte	0x77
	.sleb128 40
	.4byte	0x0
	.4byte	0x0
.LLST13:
	.4byte	.LFB33-.Ltext0
	.4byte	.LCFI36-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LCFI36-.Ltext0
	.4byte	.LCFI37-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 8
	.4byte	.LCFI37-.Ltext0
	.4byte	.LCFI38-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 32
	.4byte	.LCFI38-.Ltext0
	.4byte	.LFE33-.Ltext0
	.2byte	0x2
	.byte	0x77
	.sleb128 32
	.4byte	0x0
	.4byte	0x0
.LLST14:
	.4byte	.LFB34-.Ltext0
	.4byte	.LCFI39-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LCFI39-.Ltext0
	.4byte	.LCFI40-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 12
	.4byte	.LCFI40-.Ltext0
	.4byte	.LCFI41-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 32
	.4byte	.LCFI41-.Ltext0
	.4byte	.LFE34-.Ltext0
	.2byte	0x2
	.byte	0x77
	.sleb128 32
	.4byte	0x0
	.4byte	0x0
.LLST15:
	.4byte	.LFB35-.Ltext0
	.4byte	.LCFI42-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LCFI42-.Ltext0
	.4byte	.LCFI43-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 8
	.4byte	.LCFI43-.Ltext0
	.4byte	.LCFI44-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 40
	.4byte	.LCFI44-.Ltext0
	.4byte	.LFE35-.Ltext0
	.2byte	0x2
	.byte	0x77
	.sleb128 40
	.4byte	0x0
	.4byte	0x0
.LLST16:
	.4byte	.LFB36-.Ltext0
	.4byte	.LCFI45-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LCFI45-.Ltext0
	.4byte	.LCFI46-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 8
	.4byte	.LCFI46-.Ltext0
	.4byte	.LCFI47-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 24
	.4byte	.LCFI47-.Ltext0
	.4byte	.LFE36-.Ltext0
	.2byte	0x2
	.byte	0x77
	.sleb128 24
	.4byte	0x0
	.4byte	0x0
.LLST17:
	.4byte	.LFB37-.Ltext0
	.4byte	.LCFI48-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LCFI48-.Ltext0
	.4byte	.LCFI49-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 8
	.4byte	.LCFI49-.Ltext0
	.4byte	.LFE37-.Ltext0
	.2byte	0x2
	.byte	0x77
	.sleb128 8
	.4byte	0x0
	.4byte	0x0
.LLST18:
	.4byte	.LFB38-.Ltext0
	.4byte	.LCFI50-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LCFI50-.Ltext0
	.4byte	.LCFI51-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 12
	.4byte	.LCFI51-.Ltext0
	.4byte	.LCFI52-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 24
	.4byte	.LCFI52-.Ltext0
	.4byte	.LFE38-.Ltext0
	.2byte	0x2
	.byte	0x77
	.sleb128 24
	.4byte	0x0
	.4byte	0x0
.LLST19:
	.4byte	.LFB39-.Ltext0
	.4byte	.LCFI53-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LCFI53-.Ltext0
	.4byte	.LCFI54-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 8
	.4byte	.LCFI54-.Ltext0
	.4byte	.LCFI55-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 16
	.4byte	.LCFI55-.Ltext0
	.4byte	.LFE39-.Ltext0
	.2byte	0x2
	.byte	0x77
	.sleb128 16
	.4byte	0x0
	.4byte	0x0
	.file 4 "Z:/QtSDK_1.1_RC/Symbian/SDKs/Symbian3Qt472/epoc32/include/gcce/gcce.h"
	.file 5 "Z:/AntSnes/snes9x_asm_optimized/port.h"
	.file 6 "Z:/AntSnes/snes9x_asm_optimized/65c816.h"
	.file 7 "Z:/AntSnes/snes9x_asm_optimized/snes9x.h"
	.file 8 "Z:/AntSnes/snes9x_asm_optimized/memmap.h"
	.file 9 "Z:/AntSnes/snes9x_asm_optimized/sa1.h"
	.file 10 "Z:/AntSnes/snes9x_asm_optimized/spc700.h"
	.file 11 "Z:/AntSnes/snes9x_asm_optimized/apu.h"
	.file 12 "Z:/AntSnes/snes9x_asm_optimized/gfx.h"
	.file 13 "Z:/AntSnes/snes9x_asm_optimized/getset.h"
	.file 14 "<built-in>"
	.section	.debug_info
	.4byte	0x27de
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF513
	.byte	0x4
	.4byte	.LASF514
	.4byte	.LASF515
	.4byte	.Ltext0
	.4byte	.Letext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF0
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF1
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF2
	.uleb128 0x3
	.4byte	.LASF516
	.byte	0x4
	.4byte	0x52
	.uleb128 0x4
	.4byte	.LASF19
	.4byte	0x52
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.uleb128 0x6
	.byte	0x4
	.byte	0x78
	.4byte	0x66
	.uleb128 0x7
	.ascii	"std\000"
	.byte	0xe
	.byte	0x0
	.4byte	0x72
	.uleb128 0x8
	.4byte	.LASF8
	.byte	0x4
	.byte	0x73
	.4byte	0x3a
	.byte	0x0
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF3
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF4
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF5
	.uleb128 0x9
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF6
	.uleb128 0xa
	.byte	0x4
	.4byte	0x9b
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF7
	.uleb128 0xa
	.byte	0x4
	.4byte	0xa8
	.uleb128 0xb
	.4byte	0x9b
	.uleb128 0xc
	.byte	0x4
	.byte	0x7
	.uleb128 0xd
	.uleb128 0xa
	.byte	0x4
	.4byte	0xb0
	.uleb128 0x8
	.4byte	.LASF9
	.byte	0x5
	.byte	0x47
	.4byte	0x80
	.uleb128 0x8
	.4byte	.LASF10
	.byte	0x5
	.byte	0x48
	.4byte	0x80
	.uleb128 0x8
	.4byte	.LASF11
	.byte	0x5
	.byte	0x49
	.4byte	0xd8
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF12
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF13
	.uleb128 0x8
	.4byte	.LASF14
	.byte	0x5
	.byte	0x4b
	.4byte	0x8e
	.uleb128 0x8
	.4byte	.LASF15
	.byte	0x5
	.byte	0x4c
	.4byte	0x87
	.uleb128 0x8
	.4byte	.LASF16
	.byte	0x5
	.byte	0x4d
	.4byte	0x79
	.uleb128 0x8
	.4byte	.LASF17
	.byte	0x5
	.byte	0x4e
	.4byte	0x2c
	.uleb128 0x8
	.4byte	.LASF18
	.byte	0x5
	.byte	0x50
	.4byte	0x80
	.uleb128 0xe
	.4byte	.LASF447
	.byte	0x2
	.byte	0x6
	.byte	0x65
	.4byte	0x161
	.uleb128 0xf
	.4byte	.LASF20
	.byte	0x2
	.byte	0x6
	.byte	0x67
	.4byte	0x14e
	.uleb128 0x10
	.ascii	"l\000"
	.byte	0x6
	.byte	0x67
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x10
	.ascii	"h\000"
	.byte	0x6
	.byte	0x67
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.byte	0x0
	.uleb128 0x11
	.ascii	"B\000"
	.byte	0x6
	.byte	0x67
	.4byte	0x129
	.uleb128 0x11
	.ascii	"W\000"
	.byte	0x6
	.byte	0x6b
	.4byte	0xcd
	.byte	0x0
	.uleb128 0xf
	.4byte	.LASF21
	.byte	0x10
	.byte	0x6
	.byte	0x6e
	.4byte	0x1dd
	.uleb128 0x10
	.ascii	"PB\000"
	.byte	0x6
	.byte	0x6f
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x10
	.ascii	"DB\000"
	.byte	0x6
	.byte	0x70
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0x10
	.ascii	"P\000"
	.byte	0x6
	.byte	0x71
	.4byte	0x11d
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x10
	.ascii	"A\000"
	.byte	0x6
	.byte	0x72
	.4byte	0x11d
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x10
	.ascii	"D\000"
	.byte	0x6
	.byte	0x73
	.4byte	0x11d
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x10
	.ascii	"X\000"
	.byte	0x6
	.byte	0x74
	.4byte	0x11d
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x10
	.ascii	"S\000"
	.byte	0x6
	.byte	0x75
	.4byte	0x11d
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0x10
	.ascii	"Y\000"
	.byte	0x6
	.byte	0x76
	.4byte	0x11d
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x10
	.ascii	"PC\000"
	.byte	0x6
	.byte	0x77
	.4byte	0xcd
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.byte	0x0
	.uleb128 0x12
	.4byte	.LASF517
	.byte	0x4
	.byte	0x7
	.byte	0x95
	.4byte	0x21a
	.uleb128 0x13
	.4byte	.LASF22
	.sleb128 0
	.uleb128 0x13
	.4byte	.LASF23
	.sleb128 1
	.uleb128 0x13
	.4byte	.LASF24
	.sleb128 2
	.uleb128 0x13
	.4byte	.LASF25
	.sleb128 3
	.uleb128 0x13
	.4byte	.LASF26
	.sleb128 4
	.uleb128 0x13
	.4byte	.LASF27
	.sleb128 5
	.uleb128 0x13
	.4byte	.LASF28
	.sleb128 6
	.uleb128 0x13
	.4byte	.LASF29
	.sleb128 7
	.byte	0x0
	.uleb128 0xf
	.4byte	.LASF30
	.byte	0x88
	.byte	0x7
	.byte	0xbd
	.4byte	0x458
	.uleb128 0x14
	.4byte	.LASF31
	.byte	0x7
	.byte	0xbe
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x14
	.4byte	.LASF32
	.byte	0x7
	.byte	0xbf
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x14
	.4byte	.LASF33
	.byte	0x7
	.byte	0xc0
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x14
	.4byte	.LASF34
	.byte	0x7
	.byte	0xc1
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x14
	.4byte	.LASF35
	.byte	0x7
	.byte	0xc2
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x14
	.4byte	.LASF36
	.byte	0x7
	.byte	0xc3
	.4byte	0x161
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x10
	.ascii	"PC\000"
	.byte	0x7
	.byte	0xcd
	.4byte	0x458
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x14
	.4byte	.LASF37
	.byte	0x7
	.byte	0xce
	.4byte	0xf1
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x14
	.4byte	.LASF38
	.byte	0x7
	.byte	0xcf
	.4byte	0x458
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x14
	.4byte	.LASF39
	.byte	0x7
	.byte	0xd0
	.4byte	0x458
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x14
	.4byte	.LASF40
	.byte	0x7
	.byte	0xd1
	.4byte	0x458
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x14
	.4byte	.LASF41
	.byte	0x7
	.byte	0xd2
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0x14
	.4byte	.LASF42
	.byte	0x7
	.byte	0xd3
	.4byte	0xf1
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x14
	.4byte	.LASF43
	.byte	0x7
	.byte	0xd4
	.4byte	0xf1
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x14
	.4byte	.LASF44
	.byte	0x7
	.byte	0xd5
	.4byte	0xf1
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x14
	.4byte	.LASF45
	.byte	0x7
	.byte	0xd6
	.4byte	0xf1
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0x14
	.4byte	.LASF46
	.byte	0x7
	.byte	0xd7
	.4byte	0xf1
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x14
	.4byte	.LASF47
	.byte	0x7
	.byte	0xd8
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.uleb128 0x14
	.4byte	.LASF48
	.byte	0x7
	.byte	0xd9
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x14
	.4byte	.LASF49
	.byte	0x7
	.byte	0xda
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x4c
	.uleb128 0x14
	.4byte	.LASF50
	.byte	0x7
	.byte	0xdb
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0x14
	.4byte	.LASF51
	.byte	0x7
	.byte	0xdd
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x54
	.uleb128 0x14
	.4byte	.LASF52
	.byte	0x7
	.byte	0xde
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x55
	.uleb128 0x14
	.4byte	.LASF53
	.byte	0x7
	.byte	0xdf
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x56
	.uleb128 0x14
	.4byte	.LASF54
	.byte	0x7
	.byte	0xe0
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x57
	.uleb128 0x14
	.4byte	.LASF55
	.byte	0x7
	.byte	0xe1
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x58
	.uleb128 0x14
	.4byte	.LASF56
	.byte	0x7
	.byte	0xe2
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x5c
	.uleb128 0x14
	.4byte	.LASF57
	.byte	0x7
	.byte	0xe3
	.4byte	0x45e
	.byte	0x2
	.byte	0x23
	.uleb128 0x5d
	.uleb128 0x14
	.4byte	.LASF58
	.byte	0x7
	.byte	0xe5
	.4byte	0x458
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0x14
	.4byte	.LASF59
	.byte	0x7
	.byte	0xe6
	.4byte	0x458
	.byte	0x2
	.byte	0x23
	.uleb128 0x64
	.uleb128 0x14
	.4byte	.LASF60
	.byte	0x7
	.byte	0xe7
	.4byte	0x458
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0x14
	.4byte	.LASF61
	.byte	0x7
	.byte	0xe8
	.4byte	0x458
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.uleb128 0x14
	.4byte	.LASF62
	.byte	0x7
	.byte	0xe9
	.4byte	0x458
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0x14
	.4byte	.LASF63
	.byte	0x7
	.byte	0xea
	.4byte	0x458
	.byte	0x2
	.byte	0x23
	.uleb128 0x74
	.uleb128 0x14
	.4byte	.LASF64
	.byte	0x7
	.byte	0xeb
	.4byte	0xcd
	.byte	0x2
	.byte	0x23
	.uleb128 0x78
	.uleb128 0x14
	.4byte	.LASF65
	.byte	0x7
	.byte	0xec
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x7a
	.uleb128 0x14
	.4byte	.LASF66
	.byte	0x7
	.byte	0xed
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x7b
	.uleb128 0x14
	.4byte	.LASF67
	.byte	0x7
	.byte	0xee
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x7c
	.uleb128 0x14
	.4byte	.LASF68
	.byte	0x7
	.byte	0xef
	.4byte	0xfc
	.byte	0x3
	.byte	0x23
	.uleb128 0x80
	.uleb128 0x14
	.4byte	.LASF69
	.byte	0x7
	.byte	0xf0
	.4byte	0xf1
	.byte	0x3
	.byte	0x23
	.uleb128 0x84
	.byte	0x0
	.uleb128 0xa
	.byte	0x4
	.4byte	0xc2
	.uleb128 0x15
	.4byte	0xb7
	.4byte	0x46e
	.uleb128 0x16
	.4byte	0xad
	.byte	0x2
	.byte	0x0
	.uleb128 0x17
	.4byte	.LASF70
	.2byte	0x130
	.byte	0x7
	.byte	0xfa
	.4byte	0xab1
	.uleb128 0x14
	.4byte	.LASF71
	.byte	0x7
	.byte	0xfc
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x14
	.4byte	.LASF72
	.byte	0x7
	.byte	0xfd
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0x14
	.4byte	.LASF73
	.byte	0x7
	.byte	0xfe
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x14
	.4byte	.LASF74
	.byte	0x7
	.byte	0xff
	.4byte	0x72
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x18
	.4byte	.LASF75
	.byte	0x7
	.2byte	0x100
	.4byte	0x72
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x18
	.4byte	.LASF76
	.byte	0x7
	.2byte	0x101
	.4byte	0x72
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x18
	.4byte	.LASF77
	.byte	0x7
	.2byte	0x102
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x18
	.4byte	.LASF78
	.byte	0x7
	.2byte	0x103
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x11
	.uleb128 0x18
	.4byte	.LASF79
	.byte	0x7
	.2byte	0x104
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.uleb128 0x18
	.4byte	.LASF80
	.byte	0x7
	.2byte	0x105
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x13
	.uleb128 0x18
	.4byte	.LASF81
	.byte	0x7
	.2byte	0x108
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x18
	.4byte	.LASF82
	.byte	0x7
	.2byte	0x109
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x15
	.uleb128 0x18
	.4byte	.LASF83
	.byte	0x7
	.2byte	0x10a
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x16
	.uleb128 0x18
	.4byte	.LASF84
	.byte	0x7
	.2byte	0x10b
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x17
	.uleb128 0x18
	.4byte	.LASF85
	.byte	0x7
	.2byte	0x10c
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x18
	.4byte	.LASF86
	.byte	0x7
	.2byte	0x10f
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0x18
	.4byte	.LASF87
	.byte	0x7
	.2byte	0x110
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0x18
	.4byte	.LASF88
	.byte	0x7
	.2byte	0x113
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x1b
	.uleb128 0x18
	.4byte	.LASF89
	.byte	0x7
	.2byte	0x114
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x19
	.ascii	"PAL\000"
	.byte	0x7
	.2byte	0x115
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x1d
	.uleb128 0x18
	.4byte	.LASF90
	.byte	0x7
	.2byte	0x116
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x18
	.4byte	.LASF91
	.byte	0x7
	.2byte	0x117
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x18
	.4byte	.LASF92
	.byte	0x7
	.2byte	0x118
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x18
	.4byte	.LASF93
	.byte	0x7
	.2byte	0x119
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0x18
	.4byte	.LASF94
	.byte	0x7
	.2byte	0x11c
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x18
	.4byte	.LASF95
	.byte	0x7
	.2byte	0x11d
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x31
	.uleb128 0x18
	.4byte	.LASF96
	.byte	0x7
	.2byte	0x11e
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x32
	.uleb128 0x18
	.4byte	.LASF97
	.byte	0x7
	.2byte	0x11f
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x33
	.uleb128 0x18
	.4byte	.LASF98
	.byte	0x7
	.2byte	0x120
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x18
	.4byte	.LASF99
	.byte	0x7
	.2byte	0x121
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x35
	.uleb128 0x18
	.4byte	.LASF100
	.byte	0x7
	.2byte	0x122
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x36
	.uleb128 0x18
	.4byte	.LASF101
	.byte	0x7
	.2byte	0x125
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x37
	.uleb128 0x18
	.4byte	.LASF102
	.byte	0x7
	.2byte	0x126
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x18
	.4byte	.LASF103
	.byte	0x7
	.2byte	0x127
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x39
	.uleb128 0x18
	.4byte	.LASF104
	.byte	0x7
	.2byte	0x128
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x3a
	.uleb128 0x18
	.4byte	.LASF105
	.byte	0x7
	.2byte	0x129
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x3b
	.uleb128 0x18
	.4byte	.LASF106
	.byte	0x7
	.2byte	0x12a
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0x18
	.4byte	.LASF107
	.byte	0x7
	.2byte	0x12b
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x3d
	.uleb128 0x18
	.4byte	.LASF108
	.byte	0x7
	.2byte	0x12c
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x3e
	.uleb128 0x18
	.4byte	.LASF109
	.byte	0x7
	.2byte	0x12d
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x3f
	.uleb128 0x18
	.4byte	.LASF110
	.byte	0x7
	.2byte	0x12e
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x18
	.4byte	.LASF111
	.byte	0x7
	.2byte	0x12f
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x41
	.uleb128 0x18
	.4byte	.LASF112
	.byte	0x7
	.2byte	0x130
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x42
	.uleb128 0x18
	.4byte	.LASF113
	.byte	0x7
	.2byte	0x131
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x43
	.uleb128 0x18
	.4byte	.LASF114
	.byte	0x7
	.2byte	0x132
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.uleb128 0x18
	.4byte	.LASF115
	.byte	0x7
	.2byte	0x133
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x18
	.4byte	.LASF116
	.byte	0x7
	.2byte	0x135
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x4c
	.uleb128 0x18
	.4byte	.LASF117
	.byte	0x7
	.2byte	0x136
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x4d
	.uleb128 0x18
	.4byte	.LASF118
	.byte	0x7
	.2byte	0x137
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x4e
	.uleb128 0x18
	.4byte	.LASF119
	.byte	0x7
	.2byte	0x138
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x4f
	.uleb128 0x18
	.4byte	.LASF120
	.byte	0x7
	.2byte	0x139
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0x18
	.4byte	.LASF121
	.byte	0x7
	.2byte	0x13a
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x51
	.uleb128 0x19
	.ascii	"SA1\000"
	.byte	0x7
	.2byte	0x13b
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x52
	.uleb128 0x19
	.ascii	"C4\000"
	.byte	0x7
	.2byte	0x13c
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x53
	.uleb128 0x18
	.4byte	.LASF122
	.byte	0x7
	.2byte	0x13d
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x54
	.uleb128 0x18
	.4byte	.LASF123
	.byte	0x7
	.2byte	0x140
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x58
	.uleb128 0x18
	.4byte	.LASF124
	.byte	0x7
	.2byte	0x141
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x5c
	.uleb128 0x18
	.4byte	.LASF125
	.byte	0x7
	.2byte	0x142
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x5d
	.uleb128 0x18
	.4byte	.LASF126
	.byte	0x7
	.2byte	0x143
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x5e
	.uleb128 0x18
	.4byte	.LASF127
	.byte	0x7
	.2byte	0x144
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x5f
	.uleb128 0x18
	.4byte	.LASF128
	.byte	0x7
	.2byte	0x145
	.4byte	0x87
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0x18
	.4byte	.LASF129
	.byte	0x7
	.2byte	0x146
	.4byte	0x87
	.byte	0x2
	.byte	0x23
	.uleb128 0x64
	.uleb128 0x18
	.4byte	.LASF130
	.byte	0x7
	.2byte	0x147
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0x18
	.4byte	.LASF131
	.byte	0x7
	.2byte	0x148
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x69
	.uleb128 0x18
	.4byte	.LASF132
	.byte	0x7
	.2byte	0x149
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x6a
	.uleb128 0x18
	.4byte	.LASF133
	.byte	0x7
	.2byte	0x14a
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x6b
	.uleb128 0x18
	.4byte	.LASF134
	.byte	0x7
	.2byte	0x14b
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.uleb128 0x18
	.4byte	.LASF135
	.byte	0x7
	.2byte	0x14c
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x6d
	.uleb128 0x18
	.4byte	.LASF136
	.byte	0x7
	.2byte	0x14d
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x6e
	.uleb128 0x18
	.4byte	.LASF137
	.byte	0x7
	.2byte	0x14e
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x6f
	.uleb128 0x18
	.4byte	.LASF138
	.byte	0x7
	.2byte	0x150
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0x18
	.4byte	.LASF139
	.byte	0x7
	.2byte	0x151
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x71
	.uleb128 0x18
	.4byte	.LASF140
	.byte	0x7
	.2byte	0x154
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x72
	.uleb128 0x18
	.4byte	.LASF141
	.byte	0x7
	.2byte	0x155
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x73
	.uleb128 0x18
	.4byte	.LASF142
	.byte	0x7
	.2byte	0x156
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x74
	.uleb128 0x18
	.4byte	.LASF143
	.byte	0x7
	.2byte	0x157
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x75
	.uleb128 0x18
	.4byte	.LASF144
	.byte	0x7
	.2byte	0x15a
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x76
	.uleb128 0x18
	.4byte	.LASF145
	.byte	0x7
	.2byte	0x15b
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x77
	.uleb128 0x18
	.4byte	.LASF146
	.byte	0x7
	.2byte	0x15c
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x78
	.uleb128 0x18
	.4byte	.LASF147
	.byte	0x7
	.2byte	0x15d
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x79
	.uleb128 0x18
	.4byte	.LASF148
	.byte	0x7
	.2byte	0x15e
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x7a
	.uleb128 0x18
	.4byte	.LASF149
	.byte	0x7
	.2byte	0x15f
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x7b
	.uleb128 0x18
	.4byte	.LASF150
	.byte	0x7
	.2byte	0x162
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x7c
	.uleb128 0x18
	.4byte	.LASF151
	.byte	0x7
	.2byte	0x163
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x7d
	.uleb128 0x18
	.4byte	.LASF152
	.byte	0x7
	.2byte	0x164
	.4byte	0xab1
	.byte	0x2
	.byte	0x23
	.uleb128 0x7e
	.uleb128 0x18
	.4byte	.LASF153
	.byte	0x7
	.2byte	0x165
	.4byte	0x87
	.byte	0x3
	.byte	0x23
	.uleb128 0x100
	.uleb128 0x18
	.4byte	.LASF154
	.byte	0x7
	.2byte	0x166
	.4byte	0xb7
	.byte	0x3
	.byte	0x23
	.uleb128 0x104
	.uleb128 0x18
	.4byte	.LASF155
	.byte	0x7
	.2byte	0x167
	.4byte	0xb7
	.byte	0x3
	.byte	0x23
	.uleb128 0x105
	.uleb128 0x18
	.4byte	.LASF156
	.byte	0x7
	.2byte	0x168
	.4byte	0xf1
	.byte	0x3
	.byte	0x23
	.uleb128 0x108
	.uleb128 0x18
	.4byte	.LASF157
	.byte	0x7
	.2byte	0x169
	.4byte	0xb7
	.byte	0x3
	.byte	0x23
	.uleb128 0x10c
	.uleb128 0x18
	.4byte	.LASF158
	.byte	0x7
	.2byte	0x16a
	.4byte	0xb7
	.byte	0x3
	.byte	0x23
	.uleb128 0x10d
	.uleb128 0x18
	.4byte	.LASF159
	.byte	0x7
	.2byte	0x16b
	.4byte	0xfc
	.byte	0x3
	.byte	0x23
	.uleb128 0x110
	.uleb128 0x18
	.4byte	.LASF160
	.byte	0x7
	.2byte	0x16c
	.4byte	0xfc
	.byte	0x3
	.byte	0x23
	.uleb128 0x114
	.uleb128 0x18
	.4byte	.LASF161
	.byte	0x7
	.2byte	0x16d
	.4byte	0xfc
	.byte	0x3
	.byte	0x23
	.uleb128 0x118
	.uleb128 0x18
	.4byte	.LASF162
	.byte	0x7
	.2byte	0x170
	.4byte	0xfc
	.byte	0x3
	.byte	0x23
	.uleb128 0x11c
	.uleb128 0x18
	.4byte	.LASF163
	.byte	0x7
	.2byte	0x171
	.4byte	0xb7
	.byte	0x3
	.byte	0x23
	.uleb128 0x120
	.uleb128 0x18
	.4byte	.LASF164
	.byte	0x7
	.2byte	0x172
	.4byte	0xb7
	.byte	0x3
	.byte	0x23
	.uleb128 0x121
	.uleb128 0x18
	.4byte	.LASF165
	.byte	0x7
	.2byte	0x173
	.4byte	0xb7
	.byte	0x3
	.byte	0x23
	.uleb128 0x122
	.uleb128 0x18
	.4byte	.LASF166
	.byte	0x7
	.2byte	0x174
	.4byte	0xb7
	.byte	0x3
	.byte	0x23
	.uleb128 0x123
	.uleb128 0x18
	.4byte	.LASF167
	.byte	0x7
	.2byte	0x175
	.4byte	0xb7
	.byte	0x3
	.byte	0x23
	.uleb128 0x124
	.uleb128 0x19
	.ascii	"BS\000"
	.byte	0x7
	.2byte	0x176
	.4byte	0xb7
	.byte	0x3
	.byte	0x23
	.uleb128 0x125
	.uleb128 0x18
	.4byte	.LASF168
	.byte	0x7
	.2byte	0x177
	.4byte	0xb7
	.byte	0x3
	.byte	0x23
	.uleb128 0x126
	.uleb128 0x18
	.4byte	.LASF169
	.byte	0x7
	.2byte	0x178
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0x127
	.uleb128 0x18
	.4byte	.LASF170
	.byte	0x7
	.2byte	0x179
	.4byte	0xb7
	.byte	0x3
	.byte	0x23
	.uleb128 0x128
	.uleb128 0x18
	.4byte	.LASF171
	.byte	0x7
	.2byte	0x17c
	.4byte	0xfc
	.byte	0x3
	.byte	0x23
	.uleb128 0x12c
	.byte	0x0
	.uleb128 0x15
	.4byte	0x9b
	.4byte	0xac1
	.uleb128 0x16
	.4byte	0xad
	.byte	0x7f
	.byte	0x0
	.uleb128 0x1a
	.4byte	.LASF172
	.byte	0x9
	.byte	0x7
	.2byte	0x183
	.4byte	0xb56
	.uleb128 0x18
	.4byte	.LASF173
	.byte	0x7
	.2byte	0x184
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x18
	.4byte	.LASF174
	.byte	0x7
	.2byte	0x185
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0x18
	.4byte	.LASF175
	.byte	0x7
	.2byte	0x186
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x18
	.4byte	.LASF176
	.byte	0x7
	.2byte	0x187
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0x18
	.4byte	.LASF177
	.byte	0x7
	.2byte	0x188
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x18
	.4byte	.LASF178
	.byte	0x7
	.2byte	0x189
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x18
	.4byte	.LASF179
	.byte	0x7
	.2byte	0x18a
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x18
	.4byte	.LASF180
	.byte	0x7
	.2byte	0x18b
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x18
	.4byte	.LASF181
	.byte	0x7
	.2byte	0x18c
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x1b
	.4byte	.LASF518
	.2byte	0xd174
	.byte	0x8
	.byte	0x50
	.4byte	0x1191
	.uleb128 0x10
	.ascii	"RAM\000"
	.byte	0x8
	.byte	0x84
	.4byte	0x458
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x10
	.ascii	"ROM\000"
	.byte	0x8
	.byte	0x85
	.4byte	0x458
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x14
	.4byte	.LASF182
	.byte	0x8
	.byte	0x86
	.4byte	0x458
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x14
	.4byte	.LASF183
	.byte	0x8
	.byte	0x87
	.4byte	0x458
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x14
	.4byte	.LASF184
	.byte	0x8
	.byte	0x88
	.4byte	0x458
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x14
	.4byte	.LASF185
	.byte	0x8
	.byte	0x89
	.4byte	0x458
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x14
	.4byte	.LASF186
	.byte	0x8
	.byte	0x8a
	.4byte	0x458
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x14
	.4byte	.LASF187
	.byte	0x8
	.byte	0x8b
	.4byte	0x112
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x14
	.4byte	.LASF188
	.byte	0x8
	.byte	0x8c
	.4byte	0x112
	.byte	0x2
	.byte	0x23
	.uleb128 0x1d
	.uleb128 0x14
	.4byte	.LASF189
	.byte	0x8
	.byte	0x8d
	.4byte	0xcd
	.byte	0x2
	.byte	0x23
	.uleb128 0x1e
	.uleb128 0x14
	.4byte	.LASF190
	.byte	0x8
	.byte	0x8e
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x10
	.ascii	"Map\000"
	.byte	0x8
	.byte	0x8f
	.4byte	0x1191
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x14
	.4byte	.LASF191
	.byte	0x8
	.byte	0x90
	.4byte	0x1191
	.byte	0x4
	.byte	0x23
	.uleb128 0x4024
	.uleb128 0x14
	.4byte	.LASF192
	.byte	0x8
	.byte	0x91
	.4byte	0x11a2
	.byte	0x4
	.byte	0x23
	.uleb128 0x8024
	.uleb128 0x14
	.4byte	.LASF193
	.byte	0x8
	.byte	0x92
	.4byte	0x11a2
	.byte	0x4
	.byte	0x23
	.uleb128 0x9024
	.uleb128 0x14
	.4byte	.LASF194
	.byte	0x8
	.byte	0x93
	.4byte	0x11a2
	.byte	0x4
	.byte	0x23
	.uleb128 0xa024
	.uleb128 0x14
	.4byte	.LASF195
	.byte	0x8
	.byte	0x94
	.4byte	0x11b3
	.byte	0x4
	.byte	0x23
	.uleb128 0xb024
	.uleb128 0x14
	.4byte	.LASF196
	.byte	0x8
	.byte	0x95
	.4byte	0x11c3
	.byte	0x4
	.byte	0x23
	.uleb128 0xb03b
	.uleb128 0x14
	.4byte	.LASF197
	.byte	0x8
	.byte	0x96
	.4byte	0x11d3
	.byte	0x4
	.byte	0x23
	.uleb128 0xb040
	.uleb128 0x14
	.4byte	.LASF198
	.byte	0x8
	.byte	0x97
	.4byte	0xc2
	.byte	0x4
	.byte	0x23
	.uleb128 0xb043
	.uleb128 0x14
	.4byte	.LASF199
	.byte	0x8
	.byte	0x98
	.4byte	0xc2
	.byte	0x4
	.byte	0x23
	.uleb128 0xb044
	.uleb128 0x14
	.4byte	.LASF200
	.byte	0x8
	.byte	0x99
	.4byte	0xc2
	.byte	0x4
	.byte	0x23
	.uleb128 0xb045
	.uleb128 0x14
	.4byte	.LASF201
	.byte	0x8
	.byte	0x9a
	.4byte	0xf1
	.byte	0x4
	.byte	0x23
	.uleb128 0xb048
	.uleb128 0x14
	.4byte	.LASF202
	.byte	0x8
	.byte	0x9b
	.4byte	0xf1
	.byte	0x4
	.byte	0x23
	.uleb128 0xb04c
	.uleb128 0x14
	.4byte	.LASF203
	.byte	0x8
	.byte	0x9c
	.4byte	0xfc
	.byte	0x4
	.byte	0x23
	.uleb128 0xb050
	.uleb128 0x14
	.4byte	.LASF204
	.byte	0x8
	.byte	0x9d
	.4byte	0xfc
	.byte	0x4
	.byte	0x23
	.uleb128 0xb054
	.uleb128 0x14
	.4byte	.LASF205
	.byte	0x8
	.byte	0x9e
	.4byte	0xfc
	.byte	0x4
	.byte	0x23
	.uleb128 0xb058
	.uleb128 0x14
	.4byte	.LASF206
	.byte	0x8
	.byte	0x9f
	.4byte	0xfc
	.byte	0x4
	.byte	0x23
	.uleb128 0xb05c
	.uleb128 0x14
	.4byte	.LASF207
	.byte	0x8
	.byte	0xa0
	.4byte	0x458
	.byte	0x4
	.byte	0x23
	.uleb128 0xb060
	.uleb128 0x14
	.4byte	.LASF208
	.byte	0x8
	.byte	0xa1
	.4byte	0x458
	.byte	0x4
	.byte	0x23
	.uleb128 0xb064
	.uleb128 0x14
	.4byte	.LASF209
	.byte	0x8
	.byte	0xa2
	.4byte	0xfc
	.byte	0x4
	.byte	0x23
	.uleb128 0xb068
	.uleb128 0x14
	.4byte	.LASF210
	.byte	0x8
	.byte	0xa3
	.4byte	0xfc
	.byte	0x4
	.byte	0x23
	.uleb128 0xb06c
	.uleb128 0x14
	.4byte	.LASF211
	.byte	0x8
	.byte	0xa4
	.4byte	0xfc
	.byte	0x4
	.byte	0x23
	.uleb128 0xb070
	.uleb128 0x14
	.4byte	.LASF212
	.byte	0x8
	.byte	0xa5
	.4byte	0x11e3
	.byte	0x4
	.byte	0x23
	.uleb128 0xb074
	.uleb128 0x14
	.4byte	.LASF213
	.byte	0x8
	.byte	0xa6
	.4byte	0x11f4
	.byte	0x4
	.byte	0x23
	.uleb128 0xd074
	.uleb128 0x1c
	.byte	0x1
	.4byte	.LASF214
	.byte	0x8
	.byte	0x52
	.4byte	.LASF216
	.4byte	0x112
	.byte	0x1
	.4byte	0xd9c
	.uleb128 0x1d
	.4byte	0x1204
	.byte	0x1
	.uleb128 0x1e
	.4byte	0xa2
	.byte	0x0
	.uleb128 0x1f
	.byte	0x1
	.4byte	.LASF222
	.byte	0x8
	.byte	0x53
	.4byte	.LASF224
	.byte	0x1
	.4byte	0xdb9
	.uleb128 0x1d
	.4byte	0x1204
	.byte	0x1
	.uleb128 0x1e
	.4byte	0x112
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.4byte	.LASF215
	.byte	0x8
	.byte	0x54
	.4byte	.LASF217
	.4byte	0x112
	.byte	0x1
	.4byte	0xdda
	.uleb128 0x1d
	.4byte	0x1204
	.byte	0x1
	.uleb128 0x1e
	.4byte	0xa2
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.4byte	.LASF218
	.byte	0x8
	.byte	0x55
	.4byte	.LASF219
	.4byte	0x112
	.byte	0x1
	.4byte	0xdfb
	.uleb128 0x1d
	.4byte	0x1204
	.byte	0x1
	.uleb128 0x1e
	.4byte	0xa2
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.4byte	.LASF220
	.byte	0x8
	.byte	0x56
	.4byte	.LASF221
	.4byte	0x112
	.byte	0x1
	.4byte	0xe17
	.uleb128 0x1d
	.4byte	0x1204
	.byte	0x1
	.byte	0x0
	.uleb128 0x1f
	.byte	0x1
	.4byte	.LASF223
	.byte	0x8
	.byte	0x57
	.4byte	.LASF225
	.byte	0x1
	.4byte	0xe2f
	.uleb128 0x1d
	.4byte	0x1204
	.byte	0x1
	.byte	0x0
	.uleb128 0x1f
	.byte	0x1
	.4byte	.LASF226
	.byte	0x8
	.byte	0x58
	.4byte	.LASF227
	.byte	0x1
	.4byte	0xe47
	.uleb128 0x1d
	.4byte	0x1204
	.byte	0x1
	.byte	0x0
	.uleb128 0x1f
	.byte	0x1
	.4byte	.LASF228
	.byte	0x8
	.byte	0x5a
	.4byte	.LASF229
	.byte	0x1
	.4byte	0xe5f
	.uleb128 0x1d
	.4byte	0x1204
	.byte	0x1
	.byte	0x0
	.uleb128 0x1f
	.byte	0x1
	.4byte	.LASF230
	.byte	0x8
	.byte	0x5b
	.4byte	.LASF231
	.byte	0x1
	.4byte	0xe77
	.uleb128 0x1d
	.4byte	0x1204
	.byte	0x1
	.byte	0x0
	.uleb128 0x1f
	.byte	0x1
	.4byte	.LASF232
	.byte	0x8
	.byte	0x5c
	.4byte	.LASF233
	.byte	0x1
	.4byte	0xe8f
	.uleb128 0x1d
	.4byte	0x1204
	.byte	0x1
	.byte	0x0
	.uleb128 0x1f
	.byte	0x1
	.4byte	.LASF234
	.byte	0x8
	.byte	0x5d
	.4byte	.LASF235
	.byte	0x1
	.4byte	0xea7
	.uleb128 0x1d
	.4byte	0x1204
	.byte	0x1
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.4byte	.LASF236
	.byte	0x8
	.byte	0x5e
	.4byte	.LASF237
	.4byte	0x95
	.byte	0x1
	.4byte	0xec8
	.uleb128 0x1d
	.4byte	0x1204
	.byte	0x1
	.uleb128 0x1e
	.4byte	0xa2
	.byte	0x0
	.uleb128 0x1f
	.byte	0x1
	.4byte	.LASF238
	.byte	0x8
	.byte	0x60
	.4byte	.LASF239
	.byte	0x1
	.4byte	0xee0
	.uleb128 0x1d
	.4byte	0x1204
	.byte	0x1
	.byte	0x0
	.uleb128 0x1f
	.byte	0x1
	.4byte	.LASF240
	.byte	0x8
	.byte	0x61
	.4byte	.LASF241
	.byte	0x1
	.4byte	0xef8
	.uleb128 0x1d
	.4byte	0x1204
	.byte	0x1
	.byte	0x0
	.uleb128 0x1f
	.byte	0x1
	.4byte	.LASF242
	.byte	0x8
	.byte	0x62
	.4byte	.LASF243
	.byte	0x1
	.4byte	0xf10
	.uleb128 0x1d
	.4byte	0x1204
	.byte	0x1
	.byte	0x0
	.uleb128 0x1f
	.byte	0x1
	.4byte	.LASF244
	.byte	0x8
	.byte	0x63
	.4byte	.LASF245
	.byte	0x1
	.4byte	0xf28
	.uleb128 0x1d
	.4byte	0x1204
	.byte	0x1
	.byte	0x0
	.uleb128 0x1f
	.byte	0x1
	.4byte	.LASF246
	.byte	0x8
	.byte	0x64
	.4byte	.LASF247
	.byte	0x1
	.4byte	0xf40
	.uleb128 0x1d
	.4byte	0x1204
	.byte	0x1
	.byte	0x0
	.uleb128 0x1f
	.byte	0x1
	.4byte	.LASF248
	.byte	0x8
	.byte	0x65
	.4byte	.LASF249
	.byte	0x1
	.4byte	0xf58
	.uleb128 0x1d
	.4byte	0x1204
	.byte	0x1
	.byte	0x0
	.uleb128 0x1f
	.byte	0x1
	.4byte	.LASF250
	.byte	0x8
	.byte	0x66
	.4byte	.LASF251
	.byte	0x1
	.4byte	0xf70
	.uleb128 0x1d
	.4byte	0x1204
	.byte	0x1
	.byte	0x0
	.uleb128 0x1f
	.byte	0x1
	.4byte	.LASF252
	.byte	0x8
	.byte	0x67
	.4byte	.LASF253
	.byte	0x1
	.4byte	0xf8d
	.uleb128 0x1d
	.4byte	0x1204
	.byte	0x1
	.uleb128 0x1e
	.4byte	0x112
	.byte	0x0
	.uleb128 0x1f
	.byte	0x1
	.4byte	.LASF254
	.byte	0x8
	.byte	0x68
	.4byte	.LASF255
	.byte	0x1
	.4byte	0xfa5
	.uleb128 0x1d
	.4byte	0x1204
	.byte	0x1
	.byte	0x0
	.uleb128 0x1f
	.byte	0x1
	.4byte	.LASF256
	.byte	0x8
	.byte	0x69
	.4byte	.LASF257
	.byte	0x1
	.4byte	0xfbd
	.uleb128 0x1d
	.4byte	0x1204
	.byte	0x1
	.byte	0x0
	.uleb128 0x1f
	.byte	0x1
	.4byte	.LASF258
	.byte	0x8
	.byte	0x6a
	.4byte	.LASF259
	.byte	0x1
	.4byte	0xfd5
	.uleb128 0x1d
	.4byte	0x1204
	.byte	0x1
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.4byte	.LASF260
	.byte	0x8
	.byte	0x6b
	.4byte	.LASF261
	.4byte	0x112
	.byte	0x1
	.4byte	0xffb
	.uleb128 0x1d
	.4byte	0x1204
	.byte	0x1
	.uleb128 0x1e
	.4byte	0x458
	.uleb128 0x1e
	.4byte	0x87
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.4byte	.LASF262
	.byte	0x8
	.byte	0x6c
	.4byte	.LASF263
	.4byte	0x87
	.byte	0x1
	.4byte	0x101c
	.uleb128 0x1d
	.4byte	0x1204
	.byte	0x1
	.uleb128 0x1e
	.4byte	0x112
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.4byte	.LASF264
	.byte	0x8
	.byte	0x6d
	.4byte	.LASF265
	.4byte	0x87
	.byte	0x1
	.4byte	0x103d
	.uleb128 0x1d
	.4byte	0x1204
	.byte	0x1
	.uleb128 0x1e
	.4byte	0x112
	.byte	0x0
	.uleb128 0x1f
	.byte	0x1
	.4byte	.LASF266
	.byte	0x8
	.byte	0x6e
	.4byte	.LASF267
	.byte	0x1
	.4byte	0x1055
	.uleb128 0x1d
	.4byte	0x1204
	.byte	0x1
	.byte	0x0
	.uleb128 0x1f
	.byte	0x1
	.4byte	.LASF268
	.byte	0x8
	.byte	0x6f
	.4byte	.LASF269
	.byte	0x1
	.4byte	0x107c
	.uleb128 0x1d
	.4byte	0x1204
	.byte	0x1
	.uleb128 0x1e
	.4byte	0xa2
	.uleb128 0x1e
	.4byte	0x112
	.uleb128 0x1e
	.4byte	0x120a
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.4byte	.LASF270
	.byte	0x8
	.byte	0x72
	.4byte	.LASF271
	.4byte	0xa2
	.byte	0x1
	.4byte	0x1098
	.uleb128 0x1d
	.4byte	0x1204
	.byte	0x1
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.4byte	.LASF272
	.byte	0x8
	.byte	0x73
	.4byte	.LASF273
	.4byte	0xa2
	.byte	0x1
	.4byte	0x10b4
	.uleb128 0x1d
	.4byte	0x1204
	.byte	0x1
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.4byte	.LASF274
	.byte	0x8
	.byte	0x74
	.4byte	.LASF275
	.4byte	0xa2
	.byte	0x1
	.4byte	0x10d0
	.uleb128 0x1d
	.4byte	0x1204
	.byte	0x1
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.4byte	.LASF276
	.byte	0x8
	.byte	0x75
	.4byte	.LASF277
	.4byte	0xa2
	.byte	0x1
	.4byte	0x10ec
	.uleb128 0x1d
	.4byte	0x1204
	.byte	0x1
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.4byte	.LASF278
	.byte	0x8
	.byte	0x76
	.4byte	.LASF279
	.4byte	0xa2
	.byte	0x1
	.4byte	0x1108
	.uleb128 0x1d
	.4byte	0x1204
	.byte	0x1
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.4byte	.LASF280
	.byte	0x8
	.byte	0x77
	.4byte	.LASF281
	.4byte	0xa2
	.byte	0x1
	.4byte	0x1124
	.uleb128 0x1d
	.4byte	0x1204
	.byte	0x1
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.4byte	.LASF282
	.byte	0x8
	.byte	0x78
	.4byte	.LASF283
	.4byte	0xa2
	.byte	0x1
	.4byte	0x1140
	.uleb128 0x1d
	.4byte	0x1204
	.byte	0x1
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.4byte	.LASF284
	.byte	0x8
	.byte	0x79
	.4byte	.LASF285
	.4byte	0xa2
	.byte	0x1
	.4byte	0x115c
	.uleb128 0x1d
	.4byte	0x1204
	.byte	0x1
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.4byte	.LASF286
	.byte	0x8
	.byte	0x7a
	.4byte	.LASF287
	.4byte	0xa2
	.byte	0x1
	.4byte	0x1178
	.uleb128 0x1d
	.4byte	0x1204
	.byte	0x1
	.byte	0x0
	.uleb128 0x20
	.byte	0x1
	.4byte	.LASF288
	.byte	0x8
	.byte	0x7b
	.4byte	.LASF289
	.4byte	0xa2
	.byte	0x1
	.uleb128 0x1d
	.4byte	0x1204
	.byte	0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x15
	.4byte	0x458
	.4byte	0x11a2
	.uleb128 0x21
	.4byte	0xad
	.2byte	0xfff
	.byte	0x0
	.uleb128 0x15
	.4byte	0xc2
	.4byte	0x11b3
	.uleb128 0x21
	.4byte	0xad
	.2byte	0xfff
	.byte	0x0
	.uleb128 0x15
	.4byte	0x9b
	.4byte	0x11c3
	.uleb128 0x16
	.4byte	0xad
	.byte	0x16
	.byte	0x0
	.uleb128 0x15
	.4byte	0x9b
	.4byte	0x11d3
	.uleb128 0x16
	.4byte	0xad
	.byte	0x4
	.byte	0x0
	.uleb128 0x15
	.4byte	0x9b
	.4byte	0x11e3
	.uleb128 0x16
	.4byte	0xad
	.byte	0x2
	.byte	0x0
	.uleb128 0x15
	.4byte	0xc2
	.4byte	0x11f4
	.uleb128 0x21
	.4byte	0xad
	.2byte	0x1fff
	.byte	0x0
	.uleb128 0x15
	.4byte	0x9b
	.4byte	0x1204
	.uleb128 0x16
	.4byte	0xad
	.byte	0xff
	.byte	0x0
	.uleb128 0xa
	.byte	0x4
	.4byte	0xb56
	.uleb128 0x22
	.byte	0x4
	.4byte	0xf1
	.uleb128 0x17
	.4byte	.LASF290
	.2byte	0x138
	.byte	0x1
	.byte	0x3f
	.4byte	0x1249
	.uleb128 0x14
	.4byte	.LASF291
	.byte	0x1
	.byte	0x40
	.4byte	0x1249
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x14
	.4byte	.LASF292
	.byte	0x1
	.byte	0x41
	.4byte	0x1259
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x14
	.4byte	.LASF293
	.byte	0x1
	.byte	0x42
	.4byte	0x1259
	.byte	0x3
	.byte	0x23
	.uleb128 0xa8
	.byte	0x0
	.uleb128 0x15
	.4byte	0xfc
	.4byte	0x1259
	.uleb128 0x16
	.4byte	0xad
	.byte	0x5
	.byte	0x0
	.uleb128 0x15
	.4byte	0xfc
	.4byte	0x126f
	.uleb128 0x16
	.4byte	0xad
	.byte	0x5
	.uleb128 0x16
	.4byte	0xad
	.byte	0x5
	.byte	0x0
	.uleb128 0x17
	.4byte	.LASF294
	.2byte	0x10f0
	.byte	0x1
	.byte	0x45
	.4byte	0x1465
	.uleb128 0x14
	.4byte	.LASF295
	.byte	0x1
	.byte	0x46
	.4byte	0x112
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x14
	.4byte	.LASF296
	.byte	0x1
	.byte	0x47
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0x14
	.4byte	.LASF297
	.byte	0x1
	.byte	0x48
	.4byte	0x112
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x14
	.4byte	.LASF298
	.byte	0x1
	.byte	0x49
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0x14
	.4byte	.LASF299
	.byte	0x1
	.byte	0x4a
	.4byte	0x112
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x14
	.4byte	.LASF300
	.byte	0x1
	.byte	0x4b
	.4byte	0x112
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x14
	.4byte	.LASF301
	.byte	0x1
	.byte	0x4c
	.4byte	0x112
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x14
	.4byte	.LASF302
	.byte	0x1
	.byte	0x4d
	.4byte	0x112
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x14
	.4byte	.LASF303
	.byte	0x1
	.byte	0x4e
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x14
	.4byte	.LASF304
	.byte	0x1
	.byte	0x4f
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x14
	.4byte	.LASF305
	.byte	0x1
	.byte	0x50
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x14
	.4byte	.LASF306
	.byte	0x1
	.byte	0x51
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x14
	.4byte	.LASF307
	.byte	0x1
	.byte	0x52
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x14
	.4byte	.LASF308
	.byte	0x1
	.byte	0x53
	.4byte	0x1465
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x14
	.4byte	.LASF309
	.byte	0x1
	.byte	0x54
	.4byte	0x1465
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x14
	.4byte	.LASF310
	.byte	0x1
	.byte	0x55
	.4byte	0x112
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x14
	.4byte	.LASF311
	.byte	0x1
	.byte	0x56
	.4byte	0x112
	.byte	0x2
	.byte	0x23
	.uleb128 0x35
	.uleb128 0x14
	.4byte	.LASF312
	.byte	0x1
	.byte	0x57
	.4byte	0x112
	.byte	0x2
	.byte	0x23
	.uleb128 0x36
	.uleb128 0x14
	.4byte	.LASF313
	.byte	0x1
	.byte	0x58
	.4byte	0x87
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x14
	.4byte	.LASF314
	.byte	0x1
	.byte	0x59
	.4byte	0x87
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0x10
	.ascii	"Red\000"
	.byte	0x1
	.byte	0x5a
	.4byte	0x1475
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x14
	.4byte	.LASF315
	.byte	0x1
	.byte	0x5b
	.4byte	0x1475
	.byte	0x3
	.byte	0x23
	.uleb128 0x440
	.uleb128 0x14
	.4byte	.LASF316
	.byte	0x1
	.byte	0x5c
	.4byte	0x1475
	.byte	0x3
	.byte	0x23
	.uleb128 0x840
	.uleb128 0x10
	.ascii	"XB\000"
	.byte	0x1
	.byte	0x5d
	.4byte	0x458
	.byte	0x3
	.byte	0x23
	.uleb128 0xc40
	.uleb128 0x14
	.4byte	.LASF317
	.byte	0x1
	.byte	0x5e
	.4byte	0x1485
	.byte	0x3
	.byte	0x23
	.uleb128 0xc44
	.uleb128 0x14
	.4byte	.LASF318
	.byte	0x1
	.byte	0x5f
	.4byte	0x87
	.byte	0x3
	.byte	0x23
	.uleb128 0xe44
	.uleb128 0x14
	.4byte	.LASF319
	.byte	0x1
	.byte	0x60
	.4byte	0x87
	.byte	0x3
	.byte	0x23
	.uleb128 0xe48
	.uleb128 0x14
	.4byte	.LASF320
	.byte	0x1
	.byte	0x61
	.4byte	0x87
	.byte	0x3
	.byte	0x23
	.uleb128 0xe4c
	.uleb128 0x14
	.4byte	.LASF321
	.byte	0x1
	.byte	0x62
	.4byte	0x1495
	.byte	0x3
	.byte	0x23
	.uleb128 0xe50
	.uleb128 0x14
	.4byte	.LASF113
	.byte	0x1
	.byte	0x63
	.4byte	0xfc
	.byte	0x3
	.byte	0x23
	.uleb128 0xe64
	.uleb128 0x14
	.4byte	.LASF112
	.byte	0x1
	.byte	0x64
	.4byte	0x14a5
	.byte	0x3
	.byte	0x23
	.uleb128 0xe68
	.uleb128 0x14
	.4byte	.LASF322
	.byte	0x1
	.byte	0x65
	.4byte	0x14b5
	.byte	0x3
	.byte	0x23
	.uleb128 0xe70
	.uleb128 0x14
	.4byte	.LASF323
	.byte	0x1
	.byte	0x66
	.4byte	0x14b5
	.byte	0x3
	.byte	0x23
	.uleb128 0xe78
	.uleb128 0x14
	.4byte	.LASF324
	.byte	0x1
	.byte	0x67
	.4byte	0x14c5
	.byte	0x3
	.byte	0x23
	.uleb128 0xe80
	.byte	0x0
	.uleb128 0x15
	.4byte	0x458
	.4byte	0x1475
	.uleb128 0x16
	.4byte	0xad
	.byte	0x2
	.byte	0x0
	.uleb128 0x15
	.4byte	0xfc
	.4byte	0x1485
	.uleb128 0x16
	.4byte	0xad
	.byte	0xff
	.byte	0x0
	.uleb128 0x15
	.4byte	0xcd
	.4byte	0x1495
	.uleb128 0x16
	.4byte	0xad
	.byte	0xff
	.byte	0x0
	.uleb128 0x15
	.4byte	0xfc
	.4byte	0x14a5
	.uleb128 0x16
	.4byte	0xad
	.byte	0x4
	.byte	0x0
	.uleb128 0x15
	.4byte	0xfc
	.4byte	0x14b5
	.uleb128 0x16
	.4byte	0xad
	.byte	0x1
	.byte	0x0
	.uleb128 0x15
	.4byte	0x87
	.4byte	0x14c5
	.uleb128 0x16
	.4byte	0xad
	.byte	0x1
	.byte	0x0
	.uleb128 0x15
	.4byte	0x1210
	.4byte	0x14d5
	.uleb128 0x16
	.4byte	0xad
	.byte	0x1
	.byte	0x0
	.uleb128 0xf
	.4byte	.LASF325
	.byte	0xc
	.byte	0x1
	.byte	0x6b
	.4byte	0x1552
	.uleb128 0x14
	.4byte	.LASF326
	.byte	0x1
	.byte	0x6c
	.4byte	0x8e
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x14
	.4byte	.LASF327
	.byte	0x1
	.byte	0x6d
	.4byte	0xcd
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x14
	.4byte	.LASF328
	.byte	0x1
	.byte	0x6e
	.4byte	0xcd
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x14
	.4byte	.LASF329
	.byte	0x1
	.byte	0x6f
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x14
	.4byte	.LASF330
	.byte	0x1
	.byte	0x70
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x14
	.4byte	.LASF331
	.byte	0x1
	.byte	0x71
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x14
	.4byte	.LASF332
	.byte	0x1
	.byte	0x72
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.uleb128 0x14
	.4byte	.LASF282
	.byte	0x1
	.byte	0x73
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.byte	0x0
	.uleb128 0x17
	.4byte	.LASF333
	.2byte	0xad8
	.byte	0x1
	.byte	0x76
	.4byte	0x1a25
	.uleb128 0xf
	.4byte	.LASF20
	.byte	0xa
	.byte	0x1
	.byte	0x7b
	.4byte	0x15c0
	.uleb128 0x14
	.4byte	.LASF334
	.byte	0x1
	.byte	0x7c
	.4byte	0x112
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x14
	.4byte	.LASF335
	.byte	0x1
	.byte	0x7d
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0x14
	.4byte	.LASF336
	.byte	0x1
	.byte	0x7e
	.4byte	0xcd
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x14
	.4byte	.LASF337
	.byte	0x1
	.byte	0x7f
	.4byte	0xcd
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x14
	.4byte	.LASF338
	.byte	0x1
	.byte	0x80
	.4byte	0xcd
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x14
	.4byte	.LASF339
	.byte	0x1
	.byte	0x81
	.4byte	0xcd
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0xf
	.4byte	.LASF20
	.byte	0xc
	.byte	0x1
	.byte	0x84
	.4byte	0x1621
	.uleb128 0x14
	.4byte	.LASF340
	.byte	0x1
	.byte	0x85
	.4byte	0xcd
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x14
	.4byte	.LASF341
	.byte	0x1
	.byte	0x86
	.4byte	0xcd
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x14
	.4byte	.LASF342
	.byte	0x1
	.byte	0x87
	.4byte	0xcd
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x14
	.4byte	.LASF343
	.byte	0x1
	.byte	0x88
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x14
	.4byte	.LASF344
	.byte	0x1
	.byte	0x89
	.4byte	0xcd
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x14
	.4byte	.LASF345
	.byte	0x1
	.byte	0x8a
	.4byte	0xcd
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.byte	0x0
	.uleb128 0x14
	.4byte	.LASF346
	.byte	0x1
	.byte	0x77
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x14
	.4byte	.LASF347
	.byte	0x1
	.byte	0x78
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0x14
	.4byte	.LASF348
	.byte	0x1
	.byte	0x79
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x10
	.ascii	"VMA\000"
	.byte	0x1
	.byte	0x82
	.4byte	0x155f
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x10
	.ascii	"BG\000"
	.byte	0x1
	.byte	0x8b
	.4byte	0x1a25
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0x14
	.4byte	.LASF349
	.byte	0x1
	.byte	0x8d
	.4byte	0x112
	.byte	0x2
	.byte	0x23
	.uleb128 0x3e
	.uleb128 0x14
	.4byte	.LASF350
	.byte	0x1
	.byte	0x8e
	.4byte	0x1485
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x14
	.4byte	.LASF351
	.byte	0x1
	.byte	0x8f
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0x240
	.uleb128 0x14
	.4byte	.LASF352
	.byte	0x1
	.byte	0x90
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0x241
	.uleb128 0x10
	.ascii	"OBJ\000"
	.byte	0x1
	.byte	0x91
	.4byte	0x1a35
	.byte	0x3
	.byte	0x23
	.uleb128 0x242
	.uleb128 0x14
	.4byte	.LASF353
	.byte	0x1
	.byte	0x92
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0x842
	.uleb128 0x14
	.4byte	.LASF354
	.byte	0x1
	.byte	0x93
	.4byte	0xcd
	.byte	0x3
	.byte	0x23
	.uleb128 0x844
	.uleb128 0x14
	.4byte	.LASF355
	.byte	0x1
	.byte	0x95
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0x846
	.uleb128 0x14
	.4byte	.LASF356
	.byte	0x1
	.byte	0x96
	.4byte	0xcd
	.byte	0x3
	.byte	0x23
	.uleb128 0x848
	.uleb128 0x14
	.4byte	.LASF357
	.byte	0x1
	.byte	0x97
	.4byte	0xcd
	.byte	0x3
	.byte	0x23
	.uleb128 0x84a
	.uleb128 0x14
	.4byte	.LASF358
	.byte	0x1
	.byte	0x98
	.4byte	0xcd
	.byte	0x3
	.byte	0x23
	.uleb128 0x84c
	.uleb128 0x14
	.4byte	.LASF359
	.byte	0x1
	.byte	0x99
	.4byte	0xcd
	.byte	0x3
	.byte	0x23
	.uleb128 0x84e
	.uleb128 0x14
	.4byte	.LASF360
	.byte	0x1
	.byte	0x9a
	.4byte	0xcd
	.byte	0x3
	.byte	0x23
	.uleb128 0x850
	.uleb128 0x14
	.4byte	.LASF361
	.byte	0x1
	.byte	0x9c
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0x852
	.uleb128 0x14
	.4byte	.LASF362
	.byte	0x1
	.byte	0x9d
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0x853
	.uleb128 0x14
	.4byte	.LASF363
	.byte	0x1
	.byte	0x9e
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0x854
	.uleb128 0x14
	.4byte	.LASF364
	.byte	0x1
	.byte	0xa0
	.4byte	0x8e
	.byte	0x3
	.byte	0x23
	.uleb128 0x856
	.uleb128 0x14
	.4byte	.LASF365
	.byte	0x1
	.byte	0xa1
	.4byte	0x8e
	.byte	0x3
	.byte	0x23
	.uleb128 0x858
	.uleb128 0x14
	.4byte	.LASF366
	.byte	0x1
	.byte	0xa2
	.4byte	0x8e
	.byte	0x3
	.byte	0x23
	.uleb128 0x85a
	.uleb128 0x14
	.4byte	.LASF367
	.byte	0x1
	.byte	0xa3
	.4byte	0x8e
	.byte	0x3
	.byte	0x23
	.uleb128 0x85c
	.uleb128 0x14
	.4byte	.LASF368
	.byte	0x1
	.byte	0xa4
	.4byte	0x8e
	.byte	0x3
	.byte	0x23
	.uleb128 0x85e
	.uleb128 0x14
	.4byte	.LASF369
	.byte	0x1
	.byte	0xa5
	.4byte	0x8e
	.byte	0x3
	.byte	0x23
	.uleb128 0x860
	.uleb128 0x14
	.4byte	.LASF370
	.byte	0x1
	.byte	0xa6
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0x862
	.uleb128 0x14
	.4byte	.LASF371
	.byte	0x1
	.byte	0xa7
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0x863
	.uleb128 0x14
	.4byte	.LASF372
	.byte	0x1
	.byte	0xa9
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0x864
	.uleb128 0x14
	.4byte	.LASF373
	.byte	0x1
	.byte	0xaa
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0x865
	.uleb128 0x14
	.4byte	.LASF374
	.byte	0x1
	.byte	0xab
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0x866
	.uleb128 0x14
	.4byte	.LASF375
	.byte	0x1
	.byte	0xac
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0x867
	.uleb128 0x14
	.4byte	.LASF376
	.byte	0x1
	.byte	0xad
	.4byte	0xcd
	.byte	0x3
	.byte	0x23
	.uleb128 0x868
	.uleb128 0x14
	.4byte	.LASF377
	.byte	0x1
	.byte	0xae
	.4byte	0xcd
	.byte	0x3
	.byte	0x23
	.uleb128 0x86a
	.uleb128 0x14
	.4byte	.LASF378
	.byte	0x1
	.byte	0xaf
	.4byte	0xfc
	.byte	0x3
	.byte	0x23
	.uleb128 0x86c
	.uleb128 0x14
	.4byte	.LASF379
	.byte	0x1
	.byte	0xb0
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0x870
	.uleb128 0x14
	.4byte	.LASF380
	.byte	0x1
	.byte	0xb1
	.4byte	0x112
	.byte	0x3
	.byte	0x23
	.uleb128 0x871
	.uleb128 0x14
	.4byte	.LASF381
	.byte	0x1
	.byte	0xb2
	.4byte	0x112
	.byte	0x3
	.byte	0x23
	.uleb128 0x872
	.uleb128 0x14
	.4byte	.LASF382
	.byte	0x1
	.byte	0xb3
	.4byte	0x112
	.byte	0x3
	.byte	0x23
	.uleb128 0x873
	.uleb128 0x14
	.4byte	.LASF383
	.byte	0x1
	.byte	0xb4
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0x874
	.uleb128 0x14
	.4byte	.LASF384
	.byte	0x1
	.byte	0xb5
	.4byte	0xcd
	.byte	0x3
	.byte	0x23
	.uleb128 0x876
	.uleb128 0x14
	.4byte	.LASF385
	.byte	0x1
	.byte	0xb6
	.4byte	0x112
	.byte	0x3
	.byte	0x23
	.uleb128 0x878
	.uleb128 0x14
	.4byte	.LASF386
	.byte	0x1
	.byte	0xb7
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0x879
	.uleb128 0x14
	.4byte	.LASF387
	.byte	0x1
	.byte	0xb8
	.4byte	0x1a45
	.byte	0x3
	.byte	0x23
	.uleb128 0x87a
	.uleb128 0x14
	.4byte	.LASF388
	.byte	0x1
	.byte	0xb9
	.4byte	0x112
	.byte	0x3
	.byte	0x23
	.uleb128 0xa9a
	.uleb128 0x14
	.4byte	.LASF389
	.byte	0x1
	.byte	0xba
	.4byte	0x112
	.byte	0x3
	.byte	0x23
	.uleb128 0xa9b
	.uleb128 0x14
	.4byte	.LASF390
	.byte	0x1
	.byte	0xbb
	.4byte	0x8e
	.byte	0x3
	.byte	0x23
	.uleb128 0xa9c
	.uleb128 0x14
	.4byte	.LASF391
	.byte	0x1
	.byte	0xbc
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0xa9e
	.uleb128 0x14
	.4byte	.LASF392
	.byte	0x1
	.byte	0xbd
	.4byte	0x1a56
	.byte	0x3
	.byte	0x23
	.uleb128 0xa9f
	.uleb128 0x14
	.4byte	.LASF393
	.byte	0x1
	.byte	0xbe
	.4byte	0x112
	.byte	0x3
	.byte	0x23
	.uleb128 0xaa3
	.uleb128 0x14
	.4byte	.LASF394
	.byte	0x1
	.byte	0xbf
	.4byte	0x112
	.byte	0x3
	.byte	0x23
	.uleb128 0xaa4
	.uleb128 0x14
	.4byte	.LASF395
	.byte	0x1
	.byte	0xc0
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0xaa5
	.uleb128 0x14
	.4byte	.LASF396
	.byte	0x1
	.byte	0xc1
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0xaa6
	.uleb128 0x14
	.4byte	.LASF397
	.byte	0x1
	.byte	0xc2
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0xaa7
	.uleb128 0x14
	.4byte	.LASF398
	.byte	0x1
	.byte	0xc3
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0xaa8
	.uleb128 0x14
	.4byte	.LASF399
	.byte	0x1
	.byte	0xc4
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0xaa9
	.uleb128 0x14
	.4byte	.LASF400
	.byte	0x1
	.byte	0xc5
	.4byte	0x1a66
	.byte	0x3
	.byte	0x23
	.uleb128 0xaaa
	.uleb128 0x14
	.4byte	.LASF401
	.byte	0x1
	.byte	0xc6
	.4byte	0x1a66
	.byte	0x3
	.byte	0x23
	.uleb128 0xab0
	.uleb128 0x14
	.4byte	.LASF402
	.byte	0x1
	.byte	0xc7
	.4byte	0x1a66
	.byte	0x3
	.byte	0x23
	.uleb128 0xab6
	.uleb128 0x14
	.4byte	.LASF403
	.byte	0x1
	.byte	0xc8
	.4byte	0x1a66
	.byte	0x3
	.byte	0x23
	.uleb128 0xabc
	.uleb128 0x14
	.4byte	.LASF404
	.byte	0x1
	.byte	0xc9
	.4byte	0x1a76
	.byte	0x3
	.byte	0x23
	.uleb128 0xac2
	.uleb128 0x14
	.4byte	.LASF405
	.byte	0x1
	.byte	0xca
	.4byte	0x1a76
	.byte	0x3
	.byte	0x23
	.uleb128 0xac8
	.uleb128 0x14
	.4byte	.LASF406
	.byte	0x1
	.byte	0xcb
	.4byte	0x112
	.byte	0x3
	.byte	0x23
	.uleb128 0xace
	.uleb128 0x14
	.4byte	.LASF407
	.byte	0x1
	.byte	0xcc
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0xacf
	.uleb128 0x14
	.4byte	.LASF408
	.byte	0x1
	.byte	0xcd
	.4byte	0xcd
	.byte	0x3
	.byte	0x23
	.uleb128 0xad0
	.uleb128 0x14
	.4byte	.LASF409
	.byte	0x1
	.byte	0xce
	.4byte	0x112
	.byte	0x3
	.byte	0x23
	.uleb128 0xad2
	.uleb128 0x14
	.4byte	.LASF410
	.byte	0x1
	.byte	0xcf
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0xad3
	.uleb128 0x14
	.4byte	.LASF411
	.byte	0x1
	.byte	0xd0
	.4byte	0x1a86
	.byte	0x3
	.byte	0x23
	.uleb128 0xad4
	.byte	0x0
	.uleb128 0x15
	.4byte	0x15c0
	.4byte	0x1a35
	.uleb128 0x16
	.4byte	0xad
	.byte	0x3
	.byte	0x0
	.uleb128 0x15
	.4byte	0x14d5
	.4byte	0x1a45
	.uleb128 0x16
	.4byte	0xad
	.byte	0x7f
	.byte	0x0
	.uleb128 0x15
	.4byte	0xc2
	.4byte	0x1a56
	.uleb128 0x21
	.4byte	0xad
	.2byte	0x21f
	.byte	0x0
	.uleb128 0x15
	.4byte	0x112
	.4byte	0x1a66
	.uleb128 0x16
	.4byte	0xad
	.byte	0x3
	.byte	0x0
	.uleb128 0x15
	.4byte	0xc2
	.4byte	0x1a76
	.uleb128 0x16
	.4byte	0xad
	.byte	0x5
	.byte	0x0
	.uleb128 0x15
	.4byte	0x112
	.4byte	0x1a86
	.uleb128 0x16
	.4byte	0xad
	.byte	0x5
	.byte	0x0
	.uleb128 0x15
	.4byte	0xc2
	.4byte	0x1a96
	.uleb128 0x16
	.4byte	0xad
	.byte	0x1
	.byte	0x0
	.uleb128 0xf
	.4byte	.LASF412
	.byte	0x16
	.byte	0x1
	.byte	0xd8
	.4byte	0x1b75
	.uleb128 0x14
	.4byte	.LASF413
	.byte	0x1
	.byte	0xd9
	.4byte	0x112
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x14
	.4byte	.LASF414
	.byte	0x1
	.byte	0xda
	.4byte	0x112
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0x14
	.4byte	.LASF415
	.byte	0x1
	.byte	0xdb
	.4byte	0x112
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x14
	.4byte	.LASF416
	.byte	0x1
	.byte	0xdc
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0x14
	.4byte	.LASF417
	.byte	0x1
	.byte	0xde
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x14
	.4byte	.LASF418
	.byte	0x1
	.byte	0xdf
	.4byte	0xcd
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x14
	.4byte	.LASF336
	.byte	0x1
	.byte	0xe0
	.4byte	0xcd
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x14
	.4byte	.LASF419
	.byte	0x1
	.byte	0xe1
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0x14
	.4byte	.LASF420
	.byte	0x1
	.byte	0xe4
	.4byte	0xcd
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x14
	.4byte	.LASF421
	.byte	0x1
	.byte	0xe7
	.4byte	0x112
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0x14
	.4byte	.LASF422
	.byte	0x1
	.byte	0xe8
	.4byte	0xcd
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x14
	.4byte	.LASF423
	.byte	0x1
	.byte	0xe9
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.uleb128 0x14
	.4byte	.LASF424
	.byte	0x1
	.byte	0xea
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x13
	.uleb128 0x14
	.4byte	.LASF425
	.byte	0x1
	.byte	0xeb
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x14
	.4byte	.LASF426
	.byte	0x1
	.byte	0xec
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x15
	.byte	0x0
	.uleb128 0xf
	.4byte	.LASF427
	.byte	0x4
	.byte	0x2
	.byte	0x33
	.4byte	0x1b90
	.uleb128 0x14
	.4byte	.LASF428
	.byte	0x2
	.byte	0x37
	.4byte	0xb1
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x17
	.4byte	.LASF429
	.2byte	0x8058
	.byte	0x9
	.byte	0x3a
	.4byte	0x1d6f
	.uleb128 0x14
	.4byte	.LASF430
	.byte	0x9
	.byte	0x3b
	.4byte	0x1d6f
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x14
	.4byte	.LASF431
	.byte	0x9
	.byte	0x3c
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x14
	.4byte	.LASF432
	.byte	0x9
	.byte	0x3d
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x14
	.4byte	.LASF433
	.byte	0x9
	.byte	0x3e
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x14
	.4byte	.LASF434
	.byte	0x9
	.byte	0x3f
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x14
	.4byte	.LASF435
	.byte	0x9
	.byte	0x40
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x14
	.4byte	.LASF436
	.byte	0x9
	.byte	0x41
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x14
	.4byte	.LASF437
	.byte	0x9
	.byte	0x42
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x14
	.4byte	.LASF31
	.byte	0x9
	.byte	0x43
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x14
	.4byte	.LASF438
	.byte	0x9
	.byte	0x44
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x14
	.4byte	.LASF33
	.byte	0x9
	.byte	0x45
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0x14
	.4byte	.LASF34
	.byte	0x9
	.byte	0x46
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0x14
	.4byte	.LASF35
	.byte	0x9
	.byte	0x47
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x1b
	.uleb128 0x14
	.4byte	.LASF439
	.byte	0x9
	.byte	0x48
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x10
	.ascii	"PC\000"
	.byte	0x9
	.byte	0x4a
	.4byte	0x458
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x14
	.4byte	.LASF38
	.byte	0x9
	.byte	0x4b
	.4byte	0x458
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x14
	.4byte	.LASF184
	.byte	0x9
	.byte	0x4c
	.4byte	0x458
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x14
	.4byte	.LASF39
	.byte	0x9
	.byte	0x4d
	.4byte	0x458
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0x14
	.4byte	.LASF40
	.byte	0x9
	.byte	0x4e
	.4byte	0x458
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x14
	.4byte	.LASF41
	.byte	0x9
	.byte	0x4f
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x14
	.4byte	.LASF440
	.byte	0x9
	.byte	0x50
	.4byte	0x458
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x14
	.4byte	.LASF441
	.byte	0x9
	.byte	0x51
	.4byte	0x458
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0x10
	.ascii	"Map\000"
	.byte	0x9
	.byte	0x55
	.4byte	0x1191
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x14
	.4byte	.LASF191
	.byte	0x9
	.byte	0x56
	.4byte	0x1191
	.byte	0x4
	.byte	0x23
	.uleb128 0x4040
	.uleb128 0x10
	.ascii	"op1\000"
	.byte	0x9
	.byte	0x57
	.4byte	0xe6
	.byte	0x4
	.byte	0x23
	.uleb128 0x8040
	.uleb128 0x10
	.ascii	"op2\000"
	.byte	0x9
	.byte	0x58
	.4byte	0xe6
	.byte	0x4
	.byte	0x23
	.uleb128 0x8042
	.uleb128 0x14
	.4byte	.LASF442
	.byte	0x9
	.byte	0x59
	.4byte	0x87
	.byte	0x4
	.byte	0x23
	.uleb128 0x8044
	.uleb128 0x10
	.ascii	"sum\000"
	.byte	0x9
	.byte	0x5a
	.4byte	0x107
	.byte	0x4
	.byte	0x23
	.uleb128 0x8048
	.uleb128 0x14
	.4byte	.LASF443
	.byte	0x9
	.byte	0x5b
	.4byte	0xb7
	.byte	0x4
	.byte	0x23
	.uleb128 0x8050
	.uleb128 0x14
	.4byte	.LASF444
	.byte	0x9
	.byte	0x5c
	.4byte	0xc2
	.byte	0x4
	.byte	0x23
	.uleb128 0x8051
	.uleb128 0x14
	.4byte	.LASF445
	.byte	0x9
	.byte	0x5d
	.4byte	0xb7
	.byte	0x4
	.byte	0x23
	.uleb128 0x8052
	.uleb128 0x14
	.4byte	.LASF446
	.byte	0x9
	.byte	0x5e
	.4byte	0xc2
	.byte	0x4
	.byte	0x23
	.uleb128 0x8053
	.byte	0x0
	.uleb128 0xa
	.byte	0x4
	.4byte	0x1b75
	.uleb128 0xe
	.4byte	.LASF448
	.byte	0x4
	.byte	0xa
	.byte	0x5a
	.4byte	0x1dc4
	.uleb128 0xf
	.4byte	.LASF20
	.byte	0x2
	.byte	0xa
	.byte	0x5c
	.4byte	0x1da6
	.uleb128 0x10
	.ascii	"A\000"
	.byte	0xa
	.byte	0x5c
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x10
	.ascii	"Y\000"
	.byte	0xa
	.byte	0x5c
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.byte	0x0
	.uleb128 0x11
	.ascii	"B\000"
	.byte	0xa
	.byte	0x5c
	.4byte	0x1d81
	.uleb128 0x11
	.ascii	"W\000"
	.byte	0xa
	.byte	0x60
	.4byte	0xcd
	.uleb128 0x23
	.4byte	.LASF449
	.byte	0xa
	.byte	0x61
	.4byte	0xfc
	.byte	0x0
	.uleb128 0xf
	.4byte	.LASF450
	.byte	0x4c
	.byte	0xb
	.byte	0x37
	.4byte	0x1f43
	.uleb128 0x14
	.4byte	.LASF451
	.byte	0xb
	.byte	0x38
	.4byte	0x458
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x14
	.4byte	.LASF336
	.byte	0xb
	.byte	0x39
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x14
	.4byte	.LASF452
	.byte	0xb
	.byte	0x3a
	.4byte	0x458
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x14
	.4byte	.LASF453
	.byte	0xb
	.byte	0x3b
	.4byte	0x458
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x14
	.4byte	.LASF41
	.byte	0xb
	.byte	0x3c
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x14
	.4byte	.LASF454
	.byte	0xb
	.byte	0x3d
	.4byte	0x458
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x14
	.4byte	.LASF455
	.byte	0xb
	.byte	0x3e
	.4byte	0x458
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x14
	.4byte	.LASF431
	.byte	0xb
	.byte	0x3f
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x14
	.4byte	.LASF434
	.byte	0xb
	.byte	0x40
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x1d
	.uleb128 0x10
	.ascii	"Bit\000"
	.byte	0xb
	.byte	0x41
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x1e
	.uleb128 0x14
	.4byte	.LASF456
	.byte	0xb
	.byte	0x42
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x1f
	.uleb128 0x14
	.4byte	.LASF457
	.byte	0xb
	.byte	0x43
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x14
	.4byte	.LASF458
	.byte	0xb
	.byte	0x44
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x14
	.4byte	.LASF459
	.byte	0xb
	.byte	0x45
	.4byte	0xf1
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x14
	.4byte	.LASF460
	.byte	0xb
	.byte	0x46
	.4byte	0xf1
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0x14
	.4byte	.LASF461
	.byte	0xb
	.byte	0x48
	.4byte	0x1f43
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x10
	.ascii	"PC\000"
	.byte	0xb
	.byte	0x49
	.4byte	0x458
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x10
	.ascii	"YA\000"
	.byte	0xb
	.byte	0x4a
	.4byte	0x1d75
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x10
	.ascii	"P\000"
	.byte	0xb
	.byte	0x4b
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0x14
	.4byte	.LASF462
	.byte	0xb
	.byte	0x4c
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x3d
	.uleb128 0x14
	.4byte	.LASF463
	.byte	0xb
	.byte	0x4d
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x3e
	.uleb128 0x14
	.4byte	.LASF432
	.byte	0xb
	.byte	0x4e
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x3f
	.uleb128 0x10
	.ascii	"X\000"
	.byte	0xb
	.byte	0x4f
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x10
	.ascii	"S\000"
	.byte	0xb
	.byte	0x50
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x41
	.uleb128 0x14
	.4byte	.LASF464
	.byte	0xb
	.byte	0x51
	.4byte	0xcd
	.byte	0x2
	.byte	0x23
	.uleb128 0x42
	.uleb128 0x10
	.ascii	"RAM\000"
	.byte	0xb
	.byte	0x52
	.4byte	0x458
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.uleb128 0x14
	.4byte	.LASF465
	.byte	0xb
	.byte	0x54
	.4byte	0x458
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.byte	0x0
	.uleb128 0xa
	.byte	0x4
	.4byte	0xfc
	.uleb128 0xf
	.4byte	.LASF466
	.byte	0xe0
	.byte	0xb
	.byte	0x58
	.4byte	0x1ff5
	.uleb128 0x14
	.4byte	.LASF37
	.byte	0xb
	.byte	0x59
	.4byte	0xf1
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x14
	.4byte	.LASF467
	.byte	0xb
	.byte	0x5a
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x14
	.4byte	.LASF31
	.byte	0xb
	.byte	0x5b
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x14
	.4byte	.LASF468
	.byte	0xb
	.byte	0x5c
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x14
	.4byte	.LASF469
	.byte	0xb
	.byte	0x5d
	.4byte	0x1ff5
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x10
	.ascii	"DSP\000"
	.byte	0xb
	.byte	0x5e
	.4byte	0x2005
	.byte	0x2
	.byte	0x23
	.uleb128 0xb
	.uleb128 0x14
	.4byte	.LASF465
	.byte	0xb
	.byte	0x5f
	.4byte	0x2015
	.byte	0x3
	.byte	0x23
	.uleb128 0x8b
	.uleb128 0x14
	.4byte	.LASF470
	.byte	0xb
	.byte	0x60
	.4byte	0x2025
	.byte	0x3
	.byte	0x23
	.uleb128 0xcc
	.uleb128 0x14
	.4byte	.LASF471
	.byte	0xb
	.byte	0x61
	.4byte	0x2025
	.byte	0x3
	.byte	0x23
	.uleb128 0xd2
	.uleb128 0x14
	.4byte	.LASF472
	.byte	0xb
	.byte	0x62
	.4byte	0x45e
	.byte	0x3
	.byte	0x23
	.uleb128 0xd8
	.uleb128 0x14
	.4byte	.LASF473
	.byte	0xb
	.byte	0x63
	.4byte	0x45e
	.byte	0x3
	.byte	0x23
	.uleb128 0xdb
	.byte	0x0
	.uleb128 0x15
	.4byte	0xc2
	.4byte	0x2005
	.uleb128 0x16
	.4byte	0xad
	.byte	0x3
	.byte	0x0
	.uleb128 0x15
	.4byte	0xc2
	.4byte	0x2015
	.uleb128 0x16
	.4byte	0xad
	.byte	0x7f
	.byte	0x0
	.uleb128 0x15
	.4byte	0xc2
	.4byte	0x2025
	.uleb128 0x16
	.4byte	0xad
	.byte	0x3f
	.byte	0x0
	.uleb128 0x15
	.4byte	0xcd
	.4byte	0x2035
	.uleb128 0x16
	.4byte	0xad
	.byte	0x2
	.byte	0x0
	.uleb128 0x24
	.4byte	.LASF519
	.byte	0x1
	.2byte	0x10c
	.4byte	0xc2
	.4byte	.LFB6
	.4byte	.LFE6
	.4byte	.LLST0
	.uleb128 0x25
	.4byte	.LASF520
	.byte	0x1
	.2byte	0x11a
	.4byte	.LFB7
	.4byte	.LFE7
	.4byte	.LLST1
	.uleb128 0x26
	.4byte	.LASF476
	.byte	0x1
	.2byte	0x120
	.4byte	.LFB8
	.4byte	.LFE8
	.4byte	.LLST2
	.4byte	0x20bb
	.uleb128 0x27
	.4byte	.LASF478
	.byte	0x1
	.2byte	0x120
	.4byte	0xc2
	.byte	0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x28
	.4byte	.LBB2
	.4byte	.LBE2
	.uleb128 0x29
	.4byte	.LASF474
	.byte	0x1
	.2byte	0x125
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x28
	.4byte	.LBB3
	.4byte	.LBE3
	.uleb128 0x29
	.4byte	.LASF475
	.byte	0x1
	.2byte	0x12f
	.4byte	0x20bb
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0xa
	.byte	0x4
	.4byte	0x14d5
	.uleb128 0x26
	.4byte	.LASF477
	.byte	0x1
	.2byte	0x168
	.4byte	.LFB9
	.4byte	.LFE9
	.4byte	.LLST3
	.4byte	0x211b
	.uleb128 0x27
	.4byte	.LASF479
	.byte	0x1
	.2byte	0x168
	.4byte	0xc2
	.byte	0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x28
	.4byte	.LBB4
	.4byte	.LBE4
	.uleb128 0x29
	.4byte	.LASF480
	.byte	0x1
	.2byte	0x16a
	.4byte	0xfc
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x28
	.4byte	.LBB5
	.4byte	.LBE5
	.uleb128 0x2a
	.ascii	"rem\000"
	.byte	0x1
	.2byte	0x16d
	.4byte	0xfc
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x26
	.4byte	.LASF481
	.byte	0x1
	.2byte	0x1a5
	.4byte	.LFB12
	.4byte	.LFE12
	.4byte	.LLST4
	.4byte	0x2175
	.uleb128 0x27
	.4byte	.LASF479
	.byte	0x1
	.2byte	0x1a5
	.4byte	0xc2
	.byte	0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x28
	.4byte	.LBB6
	.4byte	.LBE6
	.uleb128 0x29
	.4byte	.LASF480
	.byte	0x1
	.2byte	0x1a7
	.4byte	0xfc
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x28
	.4byte	.LBB7
	.4byte	.LBE7
	.uleb128 0x2a
	.ascii	"rem\000"
	.byte	0x1
	.2byte	0x1aa
	.4byte	0xfc
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x26
	.4byte	.LASF482
	.byte	0x1
	.2byte	0x1e1
	.4byte	.LFB15
	.4byte	.LFE15
	.4byte	.LLST5
	.4byte	0x219d
	.uleb128 0x27
	.4byte	.LASF479
	.byte	0x1
	.2byte	0x1e1
	.4byte	0xc2
	.byte	0x2
	.byte	0x91
	.sleb128 -17
	.byte	0x0
	.uleb128 0x26
	.4byte	.LASF483
	.byte	0x1
	.2byte	0x212
	.4byte	.LFB16
	.4byte	.LFE16
	.4byte	.LLST6
	.4byte	0x21c5
	.uleb128 0x27
	.4byte	.LASF479
	.byte	0x1
	.2byte	0x212
	.4byte	0xc2
	.byte	0x2
	.byte	0x91
	.sleb128 -9
	.byte	0x0
	.uleb128 0x2b
	.4byte	.LASF484
	.byte	0x2
	.byte	0x64
	.4byte	.LFB17
	.4byte	.LFE17
	.4byte	.LLST7
	.4byte	0x21e9
	.uleb128 0x2c
	.ascii	"M\000"
	.byte	0x2
	.byte	0x64
	.4byte	0xfc
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.byte	0x0
	.uleb128 0x2d
	.byte	0x1
	.4byte	.LASF521
	.byte	0x3
	.byte	0x43
	.4byte	.LASF522
	.4byte	.LFB28
	.4byte	.LFE28
	.4byte	.LLST8
	.uleb128 0x2e
	.byte	0x1
	.4byte	.LASF485
	.byte	0x3
	.byte	0x80
	.4byte	.LFB29
	.4byte	.LFE29
	.4byte	.LLST9
	.4byte	0x2230
	.uleb128 0x28
	.4byte	.LBB9
	.4byte	.LBE9
	.uleb128 0x2f
	.ascii	"i\000"
	.byte	0x3
	.byte	0x85
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.byte	0x0
	.byte	0x0
	.uleb128 0x2e
	.byte	0x1
	.4byte	.LASF486
	.byte	0x3
	.byte	0x94
	.4byte	.LFB30
	.4byte	.LFE30
	.4byte	.LLST10
	.4byte	0x22bd
	.uleb128 0x30
	.4byte	.LASF479
	.byte	0x3
	.byte	0x94
	.4byte	0xc2
	.byte	0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x30
	.4byte	.LASF336
	.byte	0x3
	.byte	0x94
	.4byte	0xcd
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x31
	.4byte	.LBB11
	.4byte	.LBE11
	.4byte	0x22a3
	.uleb128 0x29
	.4byte	.LASF487
	.byte	0x3
	.2byte	0x17e
	.4byte	0x22bd
	.byte	0x5
	.byte	0x3
	.4byte	_ZZ9S9xSetPPUE8IncCount
	.uleb128 0x29
	.4byte	.LASF339
	.byte	0x3
	.2byte	0x17f
	.4byte	0x22bd
	.byte	0x5
	.byte	0x3
	.4byte	_ZZ9S9xSetPPUE5Shift
	.uleb128 0x2a
	.ascii	"i\000"
	.byte	0x3
	.2byte	0x185
	.4byte	0xc2
	.byte	0x2
	.byte	0x91
	.sleb128 -13
	.byte	0x0
	.uleb128 0x28
	.4byte	.LBB12
	.4byte	.LBE12
	.uleb128 0x29
	.4byte	.LASF488
	.byte	0x3
	.2byte	0x2be
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.byte	0x0
	.byte	0x0
	.uleb128 0x15
	.4byte	0xcd
	.4byte	0x22cd
	.uleb128 0x16
	.4byte	0xad
	.byte	0x3
	.byte	0x0
	.uleb128 0x32
	.byte	0x1
	.4byte	.LASF490
	.byte	0x3
	.2byte	0x3dc
	.4byte	0xc2
	.4byte	.LFB31
	.4byte	.LFE31
	.4byte	.LLST11
	.4byte	0x23d2
	.uleb128 0x27
	.4byte	.LASF336
	.byte	0x3
	.2byte	0x3dc
	.4byte	0xcd
	.byte	0x2
	.byte	0x91
	.sleb128 -50
	.uleb128 0x28
	.4byte	.LBB13
	.4byte	.LBE13
	.uleb128 0x29
	.4byte	.LASF478
	.byte	0x3
	.2byte	0x3de
	.4byte	0xc2
	.byte	0x2
	.byte	0x91
	.sleb128 -45
	.uleb128 0x31
	.4byte	.LBB14
	.4byte	.LBE14
	.4byte	0x232c
	.uleb128 0x2a
	.ascii	"r\000"
	.byte	0x3
	.2byte	0x434
	.4byte	0xf1
	.byte	0x2
	.byte	0x91
	.sleb128 -44
	.byte	0x0
	.uleb128 0x31
	.4byte	.LBB15
	.4byte	.LBE15
	.4byte	0x2367
	.uleb128 0x29
	.4byte	.LASF474
	.byte	0x3
	.2byte	0x46f
	.4byte	0xfc
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2a
	.ascii	"rem\000"
	.byte	0x3
	.2byte	0x470
	.4byte	0xfc
	.byte	0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x29
	.4byte	.LASF480
	.byte	0x3
	.2byte	0x471
	.4byte	0xfc
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.byte	0x0
	.uleb128 0x31
	.4byte	.LBB16
	.4byte	.LBE16
	.4byte	0x23a2
	.uleb128 0x29
	.4byte	.LASF474
	.byte	0x3
	.2byte	0x489
	.4byte	0xfc
	.byte	0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x2a
	.ascii	"rem\000"
	.byte	0x3
	.2byte	0x48a
	.4byte	0xfc
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x29
	.4byte	.LASF480
	.byte	0x3
	.2byte	0x48b
	.4byte	0xfc
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.byte	0x0
	.uleb128 0x33
	.4byte	.Ldebug_ranges0+0x0
	.4byte	0x23b9
	.uleb128 0x2a
	.ascii	"r\000"
	.byte	0x3
	.2byte	0x52e
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.byte	0x0
	.uleb128 0x28
	.4byte	.LBB18
	.4byte	.LBE18
	.uleb128 0x2a
	.ascii	"r\000"
	.byte	0x3
	.2byte	0x539
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x34
	.byte	0x1
	.4byte	.LASF489
	.byte	0x3
	.2byte	0x591
	.4byte	.LFB32
	.4byte	.LFE32
	.4byte	.LLST12
	.4byte	0x2473
	.uleb128 0x27
	.4byte	.LASF478
	.byte	0x3
	.2byte	0x591
	.4byte	0xc2
	.byte	0x2
	.byte	0x91
	.sleb128 -33
	.uleb128 0x27
	.4byte	.LASF336
	.byte	0x3
	.2byte	0x591
	.4byte	0xcd
	.byte	0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x28
	.4byte	.LBB20
	.4byte	.LBE20
	.uleb128 0x2a
	.ascii	"d\000"
	.byte	0x3
	.2byte	0x593
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x31
	.4byte	.LBB21
	.4byte	.LBE21
	.4byte	0x243c
	.uleb128 0x2a
	.ascii	"res\000"
	.byte	0x3
	.2byte	0x603
	.4byte	0xfc
	.byte	0x2
	.byte	0x91
	.sleb128 -28
	.byte	0x0
	.uleb128 0x28
	.4byte	.LBB22
	.4byte	.LBE22
	.uleb128 0x2a
	.ascii	"a\000"
	.byte	0x3
	.2byte	0x610
	.4byte	0xcd
	.byte	0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x2a
	.ascii	"div\000"
	.byte	0x3
	.2byte	0x612
	.4byte	0xcd
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x2a
	.ascii	"rem\000"
	.byte	0x3
	.2byte	0x613
	.4byte	0xcd
	.byte	0x2
	.byte	0x91
	.sleb128 -18
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x32
	.byte	0x1
	.4byte	.LASF491
	.byte	0x3
	.2byte	0x759
	.4byte	0xc2
	.4byte	.LFB33
	.4byte	.LFE33
	.4byte	.LLST13
	.4byte	0x250a
	.uleb128 0x27
	.4byte	.LASF336
	.byte	0x3
	.2byte	0x759
	.4byte	0xcd
	.byte	0x2
	.byte	0x91
	.sleb128 -26
	.uleb128 0x28
	.4byte	.LBB23
	.4byte	.LBE23
	.uleb128 0x29
	.4byte	.LASF478
	.byte	0x3
	.2byte	0x75b
	.4byte	0xc2
	.byte	0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x31
	.4byte	.LBB24
	.4byte	.LBE24
	.4byte	0x24d4
	.uleb128 0x2a
	.ascii	"ind\000"
	.byte	0x3
	.2byte	0x778
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.byte	0x0
	.uleb128 0x31
	.4byte	.LBB25
	.4byte	.LBE25
	.4byte	0x24f1
	.uleb128 0x2a
	.ascii	"ind\000"
	.byte	0x3
	.2byte	0x795
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.byte	0x0
	.uleb128 0x28
	.4byte	.LBB26
	.4byte	.LBE26
	.uleb128 0x2a
	.ascii	"d\000"
	.byte	0x3
	.2byte	0x893
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x34
	.byte	0x1
	.4byte	.LASF492
	.byte	0x3
	.2byte	0x8a9
	.4byte	.LFB34
	.4byte	.LFE34
	.4byte	.LLST14
	.4byte	0x256f
	.uleb128 0x28
	.4byte	.LBB27
	.4byte	.LBE27
	.uleb128 0x2a
	.ascii	"c\000"
	.byte	0x3
	.2byte	0x8ce
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x31
	.4byte	.LBB28
	.4byte	.LBE28
	.4byte	0x2554
	.uleb128 0x2a
	.ascii	"B\000"
	.byte	0x3
	.2byte	0x8b4
	.4byte	0xc2
	.byte	0x2
	.byte	0x91
	.sleb128 -21
	.byte	0x0
	.uleb128 0x28
	.4byte	.LBB29
	.4byte	.LBE29
	.uleb128 0x29
	.4byte	.LASF493
	.byte	0x3
	.2byte	0x8da
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x34
	.byte	0x1
	.4byte	.LASF494
	.byte	0x3
	.2byte	0x954
	.4byte	.LFB35
	.4byte	.LFE35
	.4byte	.LLST15
	.4byte	0x25f3
	.uleb128 0x27
	.4byte	.LASF495
	.byte	0x3
	.2byte	0x954
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x28
	.4byte	.LBB30
	.4byte	.LBE30
	.uleb128 0x2a
	.ascii	"x\000"
	.byte	0x3
	.2byte	0x956
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x2a
	.ascii	"y\000"
	.byte	0x3
	.2byte	0x956
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x29
	.4byte	.LASF496
	.byte	0x3
	.2byte	0x957
	.4byte	0xfc
	.byte	0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x28
	.4byte	.LBB31
	.4byte	.LBE31
	.uleb128 0x29
	.4byte	.LASF497
	.byte	0x3
	.2byte	0x95d
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x29
	.4byte	.LASF498
	.byte	0x3
	.2byte	0x95d
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x35
	.byte	0x1
	.4byte	.LASF499
	.byte	0x3
	.2byte	0x999
	.4byte	.LASF523
	.4byte	.LFB36
	.4byte	.LFE36
	.4byte	.LLST16
	.4byte	0x265d
	.uleb128 0x28
	.4byte	.LBB32
	.4byte	.LBE32
	.uleb128 0x2a
	.ascii	"x\000"
	.byte	0x3
	.2byte	0x99b
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x2a
	.ascii	"y\000"
	.byte	0x3
	.2byte	0x99b
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x29
	.4byte	.LASF496
	.byte	0x3
	.2byte	0x99c
	.4byte	0xfc
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x28
	.4byte	.LBB33
	.4byte	.LBE33
	.uleb128 0x29
	.4byte	.LASF500
	.byte	0x3
	.2byte	0x9a2
	.4byte	0xfc
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x36
	.byte	0x1
	.4byte	.LASF524
	.byte	0x3
	.2byte	0x9bb
	.4byte	.LFB37
	.4byte	.LFE37
	.4byte	.LLST17
	.uleb128 0x34
	.byte	0x1
	.4byte	.LASF501
	.byte	0x3
	.2byte	0x9e0
	.4byte	.LFB38
	.4byte	.LFE38
	.4byte	.LLST18
	.4byte	0x26bc
	.uleb128 0x28
	.4byte	.LBB34
	.4byte	.LBE34
	.uleb128 0x2a
	.ascii	"i\000"
	.byte	0x3
	.2byte	0x9e2
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x28
	.4byte	.LBB35
	.4byte	.LBE35
	.uleb128 0x2a
	.ascii	"ind\000"
	.byte	0x3
	.2byte	0xa11
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x34
	.byte	0x1
	.4byte	.LASF502
	.byte	0x3
	.2byte	0xa2a
	.4byte	.LFB39
	.4byte	.LFE39
	.4byte	.LLST19
	.4byte	0x26ef
	.uleb128 0x28
	.4byte	.LBB37
	.4byte	.LBE37
	.uleb128 0x29
	.4byte	.LASF503
	.byte	0x3
	.2byte	0xa35
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.byte	0x0
	.byte	0x0
	.uleb128 0x37
	.4byte	.LASF504
	.byte	0x7
	.2byte	0x190
	.4byte	0x46e
	.byte	0x1
	.byte	0x1
	.uleb128 0x38
	.ascii	"CPU\000"
	.byte	0x7
	.2byte	0x191
	.4byte	0x21a
	.byte	0x1
	.byte	0x1
	.uleb128 0x37
	.4byte	.LASF505
	.byte	0x7
	.2byte	0x192
	.4byte	0xac1
	.byte	0x1
	.byte	0x1
	.uleb128 0x39
	.4byte	.LASF506
	.byte	0x8
	.byte	0xaa
	.4byte	0xb56
	.byte	0x1
	.byte	0x1
	.uleb128 0x39
	.4byte	.LASF507
	.byte	0x1
	.byte	0x2e
	.4byte	0xc2
	.byte	0x1
	.byte	0x1
	.uleb128 0x15
	.4byte	0xcd
	.4byte	0x2743
	.uleb128 0x16
	.4byte	0xad
	.byte	0x1
	.byte	0x0
	.uleb128 0x39
	.4byte	.LASF508
	.byte	0x1
	.byte	0x2f
	.4byte	0x2733
	.byte	0x1
	.byte	0x1
	.uleb128 0x38
	.ascii	"PPU\000"
	.byte	0x1
	.2byte	0x104
	.4byte	0x1552
	.byte	0x1
	.byte	0x1
	.uleb128 0x15
	.4byte	0x1a96
	.4byte	0x276e
	.uleb128 0x16
	.4byte	0xad
	.byte	0x7
	.byte	0x0
	.uleb128 0x38
	.ascii	"DMA\000"
	.byte	0x1
	.2byte	0x105
	.4byte	0x275e
	.byte	0x1
	.byte	0x1
	.uleb128 0x37
	.4byte	.LASF509
	.byte	0x1
	.2byte	0x106
	.4byte	0x126f
	.byte	0x1
	.byte	0x1
	.uleb128 0x15
	.4byte	0xc2
	.4byte	0x27a0
	.uleb128 0x16
	.4byte	0xad
	.byte	0xf
	.uleb128 0x16
	.4byte	0xad
	.byte	0x1f
	.byte	0x0
	.uleb128 0x39
	.4byte	.LASF510
	.byte	0xc
	.byte	0x94
	.4byte	0x278a
	.byte	0x1
	.byte	0x1
	.uleb128 0x3a
	.ascii	"SA1\000"
	.byte	0x9
	.byte	0x63
	.4byte	0x1b90
	.byte	0x1
	.byte	0x1
	.uleb128 0x39
	.4byte	.LASF511
	.byte	0xd
	.byte	0x36
	.4byte	0xcd
	.byte	0x1
	.byte	0x1
	.uleb128 0x3a
	.ascii	"APU\000"
	.byte	0xb
	.byte	0x66
	.4byte	0x1f49
	.byte	0x1
	.byte	0x1
	.uleb128 0x39
	.4byte	.LASF512
	.byte	0xb
	.byte	0x67
	.4byte	0x1dc4
	.byte	0x1
	.byte	0x1
	.byte	0x0
	.section	.debug_abbrev
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0x0
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x4
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.uleb128 0x34
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x6
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x18
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
	.uleb128 0x39
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x8
	.uleb128 0x16
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x9
	.uleb128 0x24
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0x0
	.byte	0x0
	.uleb128 0xa
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xb
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xc
	.uleb128 0x24
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0xd
	.uleb128 0x15
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0xe
	.uleb128 0x17
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xf
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x10
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x12
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x13
	.uleb128 0x28
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0x0
	.byte	0x0
	.uleb128 0x14
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x16
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x17
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x18
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x19
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1a
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1b
	.uleb128 0x2
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x2007
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1d
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x1e
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1f
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x2007
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x20
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x2007
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x21
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0x0
	.byte	0x0
	.uleb128 0x22
	.uleb128 0x10
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x23
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x24
	.uleb128 0x2e
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x25
	.uleb128 0x2e
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x26
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x27
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x28
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x29
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x2a
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x2b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x2c
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x2d
	.uleb128 0x2e
	.byte	0x0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x2007
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x2e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x2f
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x30
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x31
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x32
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x33
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x34
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x35
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x2007
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x36
	.uleb128 0x2e
	.byte	0x0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x37
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x38
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x39
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x3a
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,"",%progbits
	.4byte	0xed
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x27e2
	.4byte	0x21e9
	.ascii	"S9xUpdateHTimer\000"
	.4byte	0x2201
	.ascii	"S9xFixColourBrightness\000"
	.4byte	0x2230
	.ascii	"S9xSetPPU\000"
	.4byte	0x22cd
	.ascii	"S9xGetPPU\000"
	.4byte	0x23d2
	.ascii	"S9xSetCPU\000"
	.4byte	0x2473
	.ascii	"S9xGetCPU\000"
	.4byte	0x250a
	.ascii	"S9xResetPPU\000"
	.4byte	0x256f
	.ascii	"S9xProcessMouse\000"
	.4byte	0x25f3
	.ascii	"ProcessSuperScope\000"
	.4byte	0x265d
	.ascii	"S9xNextController\000"
	.4byte	0x2672
	.ascii	"S9xUpdateJoypads\000"
	.4byte	0x26bc
	.ascii	"S9xSuperFXExec\000"
	.4byte	0x0
	.section	.debug_aranges,"",%progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0x0
	.2byte	0x0
	.2byte	0x0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0x0
	.4byte	0x0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LBB17-.Ltext0
	.4byte	.LBE17-.Ltext0
	.4byte	.LBB19-.Ltext0
	.4byte	.LBE19-.Ltext0
	.4byte	0x0
	.4byte	0x0
	.section	.debug_str,"MS",%progbits,1
.LASF393:
	.ascii	"Mode7HFlip\000"
.LASF143:
	.ascii	"Mode7Interpolate\000"
.LASF199:
	.ascii	"ROMType\000"
.LASF170:
	.ascii	"SDD1Pack\000"
.LASF257:
	.ascii	"_ZN7CMemory9SA1ROMMapEv\000"
.LASF309:
	.ascii	"TileCached\000"
.LASF71:
	.ascii	"APUEnabled\000"
.LASF418:
	.ascii	"AAddress\000"
.LASF87:
	.ascii	"JoystickEnabled\000"
.LASF281:
	.ascii	"_ZN7CMemory12KartContentsEv\000"
.LASF128:
	.ascii	"SoundBufferSize\000"
.LASF301:
	.ascii	"RenderThisFrame\000"
.LASF439:
	.ascii	"Waiting\000"
.LASF382:
	.ascii	"OBJThroughSub\000"
.LASF224:
	.ascii	"_ZN7CMemory7InitROMEh\000"
.LASF406:
	.ascii	"RecomputeClipWindows\000"
.LASF17:
	.ascii	"int64\000"
.LASF178:
	.ascii	"_0x213E_ReturnValue\000"
.LASF300:
	.ascii	"OBJChanged\000"
.LASF519:
	.ascii	"REGISTER_4212\000"
.LASF16:
	.ascii	"uint32\000"
.LASF417:
	.ascii	"ABank\000"
.LASF386:
	.ascii	"OAMReadFlip\000"
.LASF346:
	.ascii	"BGMode\000"
.LASF316:
	.ascii	"Blue\000"
.LASF373:
	.ascii	"FixedColourRed\000"
.LASF486:
	.ascii	"S9xSetPPU\000"
.LASF359:
	.ascii	"VBeamPosLatched\000"
.LASF303:
	.ascii	"FrameCount\000"
.LASF313:
	.ascii	"RenderedScreenHeight\000"
.LASF438:
	.ascii	"Executing\000"
.LASF210:
	.ascii	"SDD1LoggedDataCountPrev\000"
.LASF219:
	.ascii	"_ZN7CMemory8SaveSRAMEPKc\000"
.LASF454:
	.ascii	"ShadowRAM\000"
.LASF193:
	.ascii	"BlockIsRAM\000"
.LASF162:
	.ascii	"StrikeGunnerOffsetHack\000"
.LASF242:
	.ascii	"SRAM512KLoROMMap\000"
.LASF425:
	.ascii	"LineCount\000"
.LASF88:
	.ascii	"ForcePAL\000"
.LASF216:
	.ascii	"_ZN7CMemory7LoadROMEPKc\000"
.LASF104:
	.ascii	"ForceNoDSP1\000"
.LASF232:
	.ascii	"MapRAM\000"
.LASF76:
	.ascii	"CyclesPercentage\000"
.LASF96:
	.ascii	"ForceHeader\000"
.LASF51:
	.ascii	"InDMA\000"
.LASF424:
	.ascii	"Repeat\000"
.LASF503:
	.ascii	"GSUStatus\000"
.LASF251:
	.ascii	"_ZN7CMemory13SuperFXROMMapEv\000"
.LASF44:
	.ascii	"MemSpeed\000"
.LASF48:
	.ascii	"NMITriggerPoint\000"
.LASF459:
	.ascii	"OneCycle\000"
.LASF448:
	.ascii	"YAndA\000"
.LASF485:
	.ascii	"S9xFixColourBrightness\000"
.LASF124:
	.ascii	"TraceSoundDSP\000"
.LASF181:
	.ascii	"SRAMInitialValue\000"
.LASF325:
	.ascii	"SOBJ\000"
.LASF37:
	.ascii	"Cycles\000"
.LASF112:
	.ascii	"Mouse\000"
.LASF274:
	.ascii	"StaticRAMSize\000"
.LASF190:
	.ascii	"SRAMSize\000"
.LASF400:
	.ascii	"ClipCounts\000"
.LASF277:
	.ascii	"_ZN7CMemory7MapTypeEv\000"
.LASF521:
	.ascii	"S9xUpdateHTimer\000"
.LASF307:
	.ascii	"FrameSkip\000"
.LASF97:
	.ascii	"ForceNoHeader\000"
.LASF268:
	.ascii	"CheckForIPSPatch\000"
.LASF293:
	.ascii	"Right\000"
.LASF253:
	.ascii	"_ZN7CMemory11TalesROMMapEh\000"
.LASF295:
	.ascii	"ColorsChanged\000"
.LASF113:
	.ascii	"SuperScope\000"
.LASF133:
	.ascii	"DisableMasterVolume\000"
.LASF250:
	.ascii	"SuperFXROMMap\000"
.LASF140:
	.ascii	"SixteenBit\000"
.LASF163:
	.ascii	"ChuckRock\000"
.LASF95:
	.ascii	"ForceHiROM\000"
.LASF93:
	.ascii	"SkipFrames\000"
.LASF3:
	.ascii	"long int\000"
.LASF186:
	.ascii	"C4RAM\000"
.LASF244:
	.ascii	"SRAM1024KLoROMMap\000"
.LASF109:
	.ascii	"ForceSDD1\000"
.LASF444:
	.ascii	"VirtualBitmapFormat\000"
.LASF56:
	.ascii	"TriedInterleavedMode2\000"
.LASF344:
	.ascii	"NameBase\000"
.LASF518:
	.ascii	"CMemory\000"
.LASF335:
	.ascii	"Increment\000"
.LASF74:
	.ascii	"H_Max\000"
.LASF311:
	.ascii	"LatchedInterlace\000"
.LASF331:
	.ascii	"Priority\000"
.LASF324:
	.ascii	"Clip\000"
.LASF407:
	.ascii	"CGFLIPRead\000"
.LASF261:
	.ascii	"_ZN7CMemory8AllASCIIEPhi\000"
.LASF500:
	.ascii	"scope\000"
.LASF165:
	.ascii	"WinterGold\000"
.LASF67:
	.ascii	"_PALMSOS_R9\000"
.LASF415:
	.ascii	"AAddressDecrement\000"
.LASF336:
	.ascii	"Address\000"
.LASF43:
	.ascii	"V_Counter\000"
.LASF421:
	.ascii	"HDMAIndirectAddressing\000"
.LASF392:
	.ascii	"BGMosaic\000"
.LASF282:
	.ascii	"Size\000"
.LASF297:
	.ascii	"HDMAStarted\000"
.LASF182:
	.ascii	"VRAM\000"
.LASF437:
	.ascii	"ShiftedDB\000"
.LASF167:
	.ascii	"WrestlemaniaArcade\000"
.LASF13:
	.ascii	"signed char\000"
.LASF353:
	.ascii	"OAMPriorityRotation\000"
.LASF423:
	.ascii	"IndirectBank\000"
.LASF292:
	.ascii	"Left\000"
.LASF354:
	.ascii	"OAMAddr\000"
.LASF172:
	.ascii	"SSNESGameFixes\000"
.LASF208:
	.ascii	"SDD1Data\000"
.LASF117:
	.ascii	"MultiPlayer5Master\000"
.LASF35:
	.ascii	"WaitingForInterrupt\000"
.LASF260:
	.ascii	"AllASCII\000"
.LASF115:
	.ascii	"ControllerOption\000"
.LASF495:
	.ascii	"which1\000"
.LASF52:
	.ascii	"WhichEvent\000"
.LASF5:
	.ascii	"unsigned char\000"
.LASF409:
	.ascii	"Need16x8Mulitply\000"
.LASF299:
	.ascii	"LatchedBlanking\000"
.LASF222:
	.ascii	"InitROM\000"
.LASF334:
	.ascii	"High\000"
.LASF235:
	.ascii	"_ZN7CMemory11MapExtraRAMEv\000"
.LASF110:
	.ascii	"ForceNoSDD1\000"
.LASF343:
	.ascii	"BGSize\000"
.LASF83:
	.ascii	"TraceVRAM\000"
.LASF189:
	.ascii	"SRAMMask\000"
.LASF412:
	.ascii	"SDMA\000"
.LASF175:
	.ascii	"alienVSpredetorFix\000"
.LASF520:
	.ascii	"FLUSH_REDRAW\000"
.LASF326:
	.ascii	"HPos\000"
.LASF465:
	.ascii	"ExtraRAM\000"
.LASF212:
	.ascii	"SDD1LoggedData\000"
.LASF173:
	.ascii	"NeedInit0x2137\000"
.LASF319:
	.ascii	"CurrentLine\000"
.LASF46:
	.ascii	"FastROMSpeed\000"
.LASF150:
	.ascii	"NetPlay\000"
.LASF431:
	.ascii	"_Carry\000"
.LASF108:
	.ascii	"ForceNoC4\000"
.LASF31:
	.ascii	"Flags\000"
.LASF496:
	.ascii	"buttons\000"
.LASF330:
	.ascii	"HFlip\000"
.LASF7:
	.ascii	"char\000"
.LASF388:
	.ascii	"VTimerEnabled\000"
.LASF237:
	.ascii	"_ZN7CMemory4SafeEPKc\000"
.LASF445:
	.ascii	"in_char_dma\000"
.LASF36:
	.ascii	"Regs\000"
.LASF123:
	.ascii	"SoundPlaybackRate\000"
.LASF473:
	.ascii	"TimerValueWritten\000"
.LASF203:
	.ascii	"CalculatedSize\000"
.LASF138:
	.ascii	"AltSampleDecode\000"
.LASF352:
	.ascii	"LastSprite\000"
.LASF515:
	.ascii	"Z:\\\\AntSnes\\\\snes9x_asm_optimized\000"
.LASF380:
	.ascii	"ForcedBlanking\000"
.LASF402:
	.ascii	"ClipWindow1Enable\000"
.LASF25:
	.ascii	"SNES_MOUSE\000"
.LASF215:
	.ascii	"LoadSRAM\000"
.LASF174:
	.ascii	"umiharakawaseFix\000"
.LASF180:
	.ascii	"SoundEnvelopeHeightReading2\000"
.LASF114:
	.ascii	"SRTC\000"
.LASF467:
	.ascii	"ShowROM\000"
.LASF179:
	.ascii	"TouhaidenControllerFix\000"
.LASF411:
	.ascii	"MouseSpeed\000"
.LASF510:
	.ascii	"mul_brightness\000"
.LASF430:
	.ascii	"S9xOpcodes\000"
.LASF23:
	.ascii	"SNES_JOYPAD\000"
.LASF361:
	.ascii	"HBeamFlip\000"
.LASF327:
	.ascii	"VPos\000"
.LASF332:
	.ascii	"Palette\000"
.LASF42:
	.ascii	"NextEvent\000"
.LASF101:
	.ascii	"ForceSuperFX\000"
.LASF191:
	.ascii	"WriteMap\000"
.LASF157:
	.ascii	"ApplyCheats\000"
.LASF398:
	.ascii	"Window2Left\000"
.LASF58:
	.ascii	"Memory_Map\000"
.LASF164:
	.ascii	"StarfoxHack\000"
.LASF38:
	.ascii	"PCBase\000"
.LASF458:
	.ascii	"Scanline\000"
.LASF450:
	.ascii	"SIAPU\000"
.LASF337:
	.ascii	"Mask1\000"
.LASF420:
	.ascii	"TransferBytes\000"
.LASF89:
	.ascii	"ForceNTSC\000"
.LASF514:
	.ascii	"Z:/AntSnes/snes9x_asm_optimized/ppu.cpp\000"
.LASF92:
	.ascii	"FrameTime\000"
.LASF130:
	.ascii	"SoundEnvelopeHeightReading\000"
.LASF160:
	.ascii	"AutoMaxSkipFrames\000"
.LASF226:
	.ascii	"FreeSDD1Data\000"
.LASF207:
	.ascii	"SDD1Index\000"
.LASF499:
	.ascii	"ProcessSuperScope\000"
.LASF487:
	.ascii	"IncCount\000"
.LASF79:
	.ascii	"ForcedPause\000"
.LASF269:
	.ascii	"_ZN7CMemory16CheckForIPSPatchEPKchRi\000"
.LASF147:
	.ascii	"ForceNoTransparency\000"
.LASF276:
	.ascii	"MapType\000"
.LASF26:
	.ascii	"SNES_SUPERSCOPE\000"
.LASF375:
	.ascii	"FixedColourBlue\000"
.LASF320:
	.ascii	"Controller\000"
.LASF211:
	.ascii	"SDD1LoggedDataCount\000"
.LASF227:
	.ascii	"_ZN7CMemory12FreeSDD1DataEv\000"
.LASF137:
	.ascii	"Mute\000"
.LASF264:
	.ascii	"ScoreLoROM\000"
.LASF185:
	.ascii	"FillRAM\000"
.LASF9:
	.ascii	"bool8\000"
.LASF364:
	.ascii	"MatrixA\000"
.LASF365:
	.ascii	"MatrixB\000"
.LASF338:
	.ascii	"FullGraphicCount\000"
.LASF367:
	.ascii	"MatrixD\000"
.LASF494:
	.ascii	"S9xProcessMouse\000"
.LASF478:
	.ascii	"byte\000"
.LASF463:
	.ascii	"pad2\000"
.LASF50:
	.ascii	"IRQCycleCount\000"
.LASF213:
	.ascii	"ROMFilename\000"
.LASF141:
	.ascii	"Transparency\000"
.LASF200:
	.ascii	"ROMSize\000"
.LASF372:
	.ascii	"CGADD\000"
.LASF516:
	.ascii	"__va_list\000"
.LASF362:
	.ascii	"VBeamFlip\000"
.LASF65:
	.ascii	"APU_APUExecuting\000"
.LASF265:
	.ascii	"_ZN7CMemory10ScoreLoROMEh\000"
.LASF451:
	.ascii	"DirectPage\000"
.LASF347:
	.ascii	"BG3Priority\000"
.LASF376:
	.ascii	"SavedOAMAddr\000"
.LASF506:
	.ascii	"Memory\000"
.LASF273:
	.ascii	"_ZN7CMemory5SpeedEv\000"
.LASF504:
	.ascii	"Settings\000"
.LASF505:
	.ascii	"SNESGameFixes\000"
.LASF53:
	.ascii	"SRAMModified\000"
.LASF19:
	.ascii	"__ap\000"
.LASF98:
	.ascii	"ForceInterleaved\000"
.LASF493:
	.ascii	"Sprite\000"
.LASF489:
	.ascii	"S9xSetCPU\000"
.LASF18:
	.ascii	"bool8_32\000"
.LASF283:
	.ascii	"_ZN7CMemory4SizeEv\000"
.LASF126:
	.ascii	"ReverseStereo\000"
.LASF408:
	.ascii	"OBJNameSelect\000"
.LASF278:
	.ascii	"MapMode\000"
.LASF470:
	.ascii	"Timer\000"
.LASF91:
	.ascii	"FrameTimeNTSC\000"
.LASF192:
	.ascii	"MemorySpeed\000"
.LASF321:
	.ascii	"Joypads\000"
.LASF231:
	.ascii	"_ZN7CMemory11FixROMSpeedEv\000"
.LASF432:
	.ascii	"_Zero\000"
.LASF414:
	.ascii	"AAddressFixed\000"
.LASF214:
	.ascii	"LoadROM\000"
.LASF427:
	.ascii	"SOpcodes\000"
.LASF136:
	.ascii	"ThreadSound\000"
.LASF315:
	.ascii	"Green\000"
.LASF159:
	.ascii	"TurboSkipFrames\000"
.LASF374:
	.ascii	"FixedColourGreen\000"
.LASF426:
	.ascii	"FirstLine\000"
.LASF410:
	.ascii	"Joypad3ButtonReadPos\000"
.LASF134:
	.ascii	"SoundSync\000"
.LASF456:
	.ascii	"pad0\000"
.LASF462:
	.ascii	"pad1\000"
.LASF302:
	.ascii	"DirectColourMapsNeedRebuild\000"
.LASF464:
	.ascii	"pad3\000"
.LASF287:
	.ascii	"_ZN7CMemory5ROMIDEv\000"
.LASF127:
	.ascii	"SixteenBitSound\000"
.LASF522:
	.ascii	"_Z15S9xUpdateHTimerv\000"
.LASF1:
	.ascii	"long long int\000"
.LASF8:
	.ascii	"va_list\000"
.LASF511:
	.ascii	"mem_check\000"
.LASF202:
	.ascii	"HeaderCount\000"
.LASF49:
	.ascii	"NMICycleCount\000"
.LASF291:
	.ascii	"Count\000"
.LASF351:
	.ascii	"FirstSprite\000"
.LASF443:
	.ascii	"overflow\000"
.LASF355:
	.ascii	"OAMFlip\000"
.LASF120:
	.ascii	"SuperFX\000"
.LASF111:
	.ascii	"MultiPlayer5\000"
.LASF220:
	.ascii	"Init\000"
.LASF305:
	.ascii	"DisplayedRenderedFrameCount\000"
.LASF469:
	.ascii	"OutPorts\000"
.LASF99:
	.ascii	"ForceInterleaved2\000"
.LASF194:
	.ascii	"BlockIsROM\000"
.LASF132:
	.ascii	"DisableSampleCaching\000"
.LASF228:
	.ascii	"WriteProtectROM\000"
.LASF310:
	.ascii	"FirstVRAMRead\000"
.LASF209:
	.ascii	"SDD1Entries\000"
.LASF298:
	.ascii	"MaxBrightness\000"
.LASF32:
	.ascii	"BranchSkip\000"
.LASF107:
	.ascii	"ForceC4\000"
.LASF523:
	.ascii	"_Z17ProcessSuperScopev\000"
.LASF474:
	.ascii	"addr\000"
.LASF248:
	.ascii	"HiROMMap\000"
.LASF77:
	.ascii	"DisableIRQ\000"
.LASF20:
	.ascii	"<anonymous struct>\000"
.LASF94:
	.ascii	"ForceLoROM\000"
.LASF45:
	.ascii	"MemSpeedx2\000"
.LASF435:
	.ascii	"CPUExecuting\000"
.LASF4:
	.ascii	"unsigned int\000"
.LASF166:
	.ascii	"Dezaemon\000"
.LASF476:
	.ascii	"REGISTER_2104\000"
.LASF318:
	.ascii	"PreviousLine\000"
.LASF125:
	.ascii	"Stereo\000"
.LASF86:
	.ascii	"SwapJoypads\000"
.LASF144:
	.ascii	"BGLayering\000"
.LASF475:
	.ascii	"pObj\000"
.LASF146:
	.ascii	"ForceTransparency\000"
.LASF63:
	.ascii	"Memory_BWRAM\000"
.LASF177:
	.ascii	"Old_Read0x4200\000"
.LASF116:
	.ascii	"ShutdownMaster\000"
.LASF188:
	.ascii	"LoROM\000"
.LASF436:
	.ascii	"ShiftedPB\000"
.LASF441:
	.ascii	"WaitByteAddress2\000"
.LASF385:
	.ascii	"OBJAddition\000"
.LASF239:
	.ascii	"_ZN7CMemory8LoROMMapEv\000"
.LASF395:
	.ascii	"Mode7Repeat\000"
.LASF477:
	.ascii	"REGISTER_2118\000"
.LASF481:
	.ascii	"REGISTER_2119\000"
.LASF419:
	.ascii	"BAddress\000"
.LASF240:
	.ascii	"LoROM24MBSMap\000"
.LASF80:
	.ascii	"StopEmulation\000"
.LASF187:
	.ascii	"HiROM\000"
.LASF254:
	.ascii	"AlphaROMMap\000"
.LASF363:
	.ascii	"HVBeamCounterLatched\000"
.LASF413:
	.ascii	"TransferDirection\000"
.LASF340:
	.ascii	"SCBase\000"
.LASF270:
	.ascii	"TVStandard\000"
.LASF158:
	.ascii	"TurboMode\000"
.LASF129:
	.ascii	"SoundMixInterval\000"
.LASF314:
	.ascii	"RenderedScreenWidth\000"
.LASF39:
	.ascii	"PCAtOpcodeStart\000"
.LASF433:
	.ascii	"_Negative\000"
.LASF201:
	.ascii	"ROMFramesPerSecond\000"
.LASF78:
	.ascii	"Paused\000"
.LASF379:
	.ascii	"BG_Forced\000"
.LASF482:
	.ascii	"REGISTER_2122\000"
.LASF236:
	.ascii	"Safe\000"
.LASF171:
	.ascii	"GfxLayerMask\000"
.LASF328:
	.ascii	"Name\000"
.LASF524:
	.ascii	"S9xNextController\000"
.LASF387:
	.ascii	"OAMData\000"
.LASF153:
	.ascii	"Port\000"
.LASF479:
	.ascii	"Byte\000"
.LASF121:
	.ascii	"DSP1Master\000"
.LASF102:
	.ascii	"ForceNoSuperFX\000"
.LASF342:
	.ascii	"HOffset\000"
.LASF241:
	.ascii	"_ZN7CMemory13LoROM24MBSMapEv\000"
.LASF381:
	.ascii	"OBJThroughMain\000"
.LASF152:
	.ascii	"ServerName\000"
.LASF288:
	.ascii	"CompanyID\000"
.LASF64:
	.ascii	"Memory_SRAMMask\000"
.LASF447:
	.ascii	"mypair\000"
.LASF21:
	.ascii	"SRegisters\000"
.LASF81:
	.ascii	"TraceDMA\000"
.LASF243:
	.ascii	"_ZN7CMemory16SRAM512KLoROMMapEv\000"
.LASF105:
	.ascii	"ForceSA1\000"
.LASF197:
	.ascii	"CompanyId\000"
.LASF341:
	.ascii	"VOffset\000"
.LASF229:
	.ascii	"_ZN7CMemory15WriteProtectROMEv\000"
.LASF204:
	.ascii	"CalculatedChecksum\000"
.LASF183:
	.ascii	"SRAM\000"
.LASF258:
	.ascii	"BSHiROMMap\000"
.LASF357:
	.ascii	"IRQVBeamPos\000"
.LASF271:
	.ascii	"_ZN7CMemory10TVStandardEv\000"
.LASF312:
	.ascii	"DoubleWidthPixels\000"
.LASF55:
	.ascii	"_ARM_asm_reserved_1\000"
.LASF2:
	.ascii	"long long unsigned int\000"
.LASF296:
	.ascii	"HDMA\000"
.LASF206:
	.ascii	"ROMComplementChecksum\000"
.LASF512:
	.ascii	"IAPU\000"
.LASF378:
	.ascii	"WRAM\000"
.LASF28:
	.ascii	"SNES_JUSTIFIER_2\000"
.LASF468:
	.ascii	"KeyedChannels\000"
.LASF322:
	.ascii	"PrevMouseX\000"
.LASF323:
	.ascii	"PrevMouseY\000"
.LASF484:
	.ascii	"CLEAR_IRQ_SOURCE\000"
.LASF34:
	.ascii	"IRQActive\000"
.LASF461:
	.ascii	"asmJumpTab\000"
.LASF72:
	.ascii	"Shutdown\000"
.LASF371:
	.ascii	"Joypad2ButtonReadPos\000"
.LASF238:
	.ascii	"LoROMMap\000"
.LASF507:
	.ascii	"GetBank\000"
.LASF442:
	.ascii	"arithmetic_op\000"
.LASF401:
	.ascii	"ClipWindowOverlapLogic\000"
.LASF509:
	.ascii	"IPPU\000"
.LASF139:
	.ascii	"FixFrequency\000"
.LASF356:
	.ascii	"OAMTileAddress\000"
.LASF68:
	.ascii	"_PALMSOS_R10\000"
.LASF404:
	.ascii	"ClipWindow1Inside\000"
.LASF61:
	.ascii	"Memory_BlockIsRAM\000"
.LASF196:
	.ascii	"ROMId\000"
.LASF358:
	.ascii	"IRQHBeamPos\000"
.LASF306:
	.ascii	"SkippedFrames\000"
.LASF279:
	.ascii	"_ZN7CMemory7MapModeEv\000"
.LASF508:
	.ascii	"SignExtend\000"
.LASF82:
	.ascii	"TraceHDMA\000"
.LASF460:
	.ascii	"TwoCycles\000"
.LASF449:
	.ascii	"_padder\000"
.LASF30:
	.ascii	"SCPUState\000"
.LASF59:
	.ascii	"Memory_WriteMap\000"
.LASF119:
	.ascii	"MouseMaster\000"
.LASF27:
	.ascii	"SNES_JUSTIFIER\000"
.LASF69:
	.ascii	"APU_Cycles\000"
.LASF466:
	.ascii	"SAPU\000"
.LASF403:
	.ascii	"ClipWindow2Enable\000"
.LASF384:
	.ascii	"OBJNameBase\000"
.LASF491:
	.ascii	"S9xGetCPU\000"
.LASF490:
	.ascii	"S9xGetPPU\000"
.LASF289:
	.ascii	"_ZN7CMemory9CompanyIDEv\000"
.LASF255:
	.ascii	"_ZN7CMemory11AlphaROMMapEv\000"
.LASF377:
	.ascii	"ScreenHeight\000"
.LASF218:
	.ascii	"SaveSRAM\000"
.LASF57:
	.ascii	"_ARM_asm_padding1\000"
.LASF66:
	.ascii	"_ARM_asm_padding2\000"
.LASF267:
	.ascii	"_ZN7CMemory13ApplyROMFixesEv\000"
.LASF118:
	.ascii	"SuperScopeMaster\000"
.LASF286:
	.ascii	"ROMID\000"
.LASF333:
	.ascii	"SPPU\000"
.LASF391:
	.ascii	"Mosaic\000"
.LASF502:
	.ascii	"S9xSuperFXExec\000"
.LASF405:
	.ascii	"ClipWindow2Inside\000"
.LASF399:
	.ascii	"Window2Right\000"
.LASF480:
	.ascii	"address\000"
.LASF472:
	.ascii	"TimerEnabled\000"
.LASF70:
	.ascii	"SSettings\000"
.LASF40:
	.ascii	"WaitAddress\000"
.LASF455:
	.ascii	"CachedSamples\000"
.LASF389:
	.ascii	"HTimerEnabled\000"
.LASF275:
	.ascii	"_ZN7CMemory13StaticRAMSizeEv\000"
.LASF142:
	.ascii	"SupportHiRes\000"
.LASF416:
	.ascii	"TransferMode\000"
.LASF10:
	.ascii	"uint8\000"
.LASF54:
	.ascii	"BRKTriggered\000"
.LASF339:
	.ascii	"Shift\000"
.LASF6:
	.ascii	"short int\000"
.LASF100:
	.ascii	"ForceNotInterleaved\000"
.LASF366:
	.ascii	"MatrixC\000"
.LASF47:
	.ascii	"AutoSaveTimer\000"
.LASF501:
	.ascii	"S9xUpdateJoypads\000"
.LASF24:
	.ascii	"SNES_MOUSE_SWAPPED\000"
.LASF349:
	.ascii	"CGFLIP\000"
.LASF497:
	.ascii	"delta_x\000"
.LASF498:
	.ascii	"delta_y\000"
.LASF245:
	.ascii	"_ZN7CMemory17SRAM1024KLoROMMapEv\000"
.LASF483:
	.ascii	"REGISTER_2180\000"
.LASF155:
	.ascii	"OpenGLEnable\000"
.LASF368:
	.ascii	"CentreX\000"
.LASF369:
	.ascii	"CentreY\000"
.LASF154:
	.ascii	"GlideEnable\000"
.LASF233:
	.ascii	"_ZN7CMemory6MapRAMEv\000"
.LASF284:
	.ascii	"Headers\000"
.LASF390:
	.ascii	"HTimerPosition\000"
.LASF394:
	.ascii	"Mode7VFlip\000"
.LASF221:
	.ascii	"_ZN7CMemory4InitEv\000"
.LASF148:
	.ascii	"DisableHDMA\000"
.LASF308:
	.ascii	"TileCache\000"
.LASF225:
	.ascii	"_ZN7CMemory6DeinitEv\000"
.LASF280:
	.ascii	"KartContents\000"
.LASF223:
	.ascii	"Deinit\000"
.LASF195:
	.ascii	"ROMName\000"
.LASF145:
	.ascii	"DisableGraphicWindows\000"
.LASF457:
	.ascii	"TimerErrorCounter\000"
.LASF422:
	.ascii	"IndirectAddress\000"
.LASF84:
	.ascii	"TraceUnknownRegisters\000"
.LASF205:
	.ascii	"ROMChecksum\000"
.LASF41:
	.ascii	"WaitCounter\000"
.LASF429:
	.ascii	"SSA1\000"
.LASF85:
	.ascii	"TraceDSP\000"
.LASF151:
	.ascii	"NetPlayServer\000"
.LASF329:
	.ascii	"VFlip\000"
.LASF434:
	.ascii	"_Overflow\000"
.LASF14:
	.ascii	"int16\000"
.LASF492:
	.ascii	"S9xResetPPU\000"
.LASF263:
	.ascii	"_ZN7CMemory10ScoreHiROMEh\000"
.LASF304:
	.ascii	"RenderedFramesCount\000"
.LASF22:
	.ascii	"SNES_MULTIPLAYER5\000"
.LASF131:
	.ascii	"DisableSoundEcho\000"
.LASF234:
	.ascii	"MapExtraRAM\000"
.LASF272:
	.ascii	"Speed\000"
.LASF428:
	.ascii	"S9xOpcode\000"
.LASF230:
	.ascii	"FixROMSpeed\000"
.LASF252:
	.ascii	"TalesROMMap\000"
.LASF247:
	.ascii	"_ZN7CMemory19SufamiTurboLoROMMapEv\000"
.LASF256:
	.ascii	"SA1ROMMap\000"
.LASF397:
	.ascii	"Window1Right\000"
.LASF396:
	.ascii	"Window1Left\000"
.LASF517:
	.ascii	"<anonymous enum>\000"
.LASF488:
	.ascii	"new_fixedcol\000"
.LASF348:
	.ascii	"Brightness\000"
.LASF383:
	.ascii	"OBJSizeSelect\000"
.LASF360:
	.ascii	"HBeamPosLatched\000"
.LASF217:
	.ascii	"_ZN7CMemory8LoadSRAMEPKc\000"
.LASF169:
	.ascii	"APURAMInitialValue\000"
.LASF33:
	.ascii	"NMIActive\000"
.LASF198:
	.ascii	"ROMSpeed\000"
.LASF73:
	.ascii	"SoundSkipMethod\000"
.LASF62:
	.ascii	"Memory_SRAM\000"
.LASF246:
	.ascii	"SufamiTurboLoROMMap\000"
.LASF266:
	.ascii	"ApplyROMFixes\000"
.LASF135:
	.ascii	"InterpolatedSound\000"
.LASF60:
	.ascii	"Memory_MemorySpeed\000"
.LASF12:
	.ascii	"short unsigned int\000"
.LASF446:
	.ascii	"variable_bit_pos\000"
.LASF176:
	.ascii	"APU_OutPorts_ReturnValueFix\000"
.LASF290:
	.ascii	"ClipData\000"
.LASF259:
	.ascii	"_ZN7CMemory10BSHiROMMapEv\000"
.LASF294:
	.ascii	"InternalPPU\000"
.LASF149:
	.ascii	"DisplayFrameRate\000"
.LASF15:
	.ascii	"int32\000"
.LASF471:
	.ascii	"TimerTarget\000"
.LASF317:
	.ascii	"ScreenColors\000"
.LASF122:
	.ascii	"SDD1\000"
.LASF370:
	.ascii	"Joypad1ButtonReadPos\000"
.LASF75:
	.ascii	"HBlankStart\000"
.LASF345:
	.ascii	"SCSize\000"
.LASF350:
	.ascii	"CGDATA\000"
.LASF156:
	.ascii	"AutoSaveDelay\000"
.LASF161:
	.ascii	"os9x_hack\000"
.LASF513:
	.ascii	"GNU C++ 4.4.1\000"
.LASF440:
	.ascii	"WaitByteAddress1\000"
.LASF106:
	.ascii	"ForceNoSA1\000"
.LASF168:
	.ascii	"DaffyDuck\000"
.LASF285:
	.ascii	"_ZN7CMemory7HeadersEv\000"
.LASF262:
	.ascii	"ScoreHiROM\000"
.LASF11:
	.ascii	"uint16\000"
.LASF184:
	.ascii	"BWRAM\000"
.LASF0:
	.ascii	"wchar_t\000"
.LASF452:
	.ascii	"WaitAddress1\000"
.LASF453:
	.ascii	"WaitAddress2\000"
.LASF29:
	.ascii	"SNES_MAX_CONTROLLER_OPTIONS\000"
.LASF249:
	.ascii	"_ZN7CMemory8HiROMMapEv\000"
.LASF103:
	.ascii	"ForceDSP1\000"
.LASF90:
	.ascii	"FrameTimePAL\000"
	.ident	"GCC: (Symbian ADT Sourcery G++ Lite 4.4-172) 4.4.1"
