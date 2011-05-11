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
	.file	"soundux.cpp"
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
	.type	_ZL15sounduxmemset32Pvmm, %function
_ZL15sounduxmemset32Pvmm:
	.fnstart
.LFB0:
	.file 1 "Z:/AntSnes/snes9x_asm_optimized/soundux.cpp"
	.loc 1 65 0
	.save	{r7, lr}
	push	{r7, lr}
.LCFI0:
	sub	sp, sp, #24
.LCFI1:
	add	r7, sp, #0
.LCFI2:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
.LBB2:
	.loc 1 66 0
	ldr	r3, [r7, #12]
	str	r3, [r7, #20]
	.loc 1 67 0
	b	.L2
.L3:
	ldr	r3, [r7, #20]
	ldr	r2, [r7, #8]
	str	r2, [r3]
	ldr	r3, [r7, #20]
	add	r3, r3, #4
	str	r3, [r7, #20]
	ldr	r3, [r7, #4]
	sub	r3, r3, #1
	str	r3, [r7, #4]
.L2:
	ldr	r3, [r7, #4]
	sub	r2, r3, #1
	sbc	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	bne	.L3
.LBE2:
	.loc 1 68 0
	mov	sp, r7
	add	sp, sp, #24
	@ sp needed for prologue
	pop	{r7, pc}
.LFE0:
	.cantunwind
	.fnend
	.size	_ZL15sounduxmemset32Pvmm, .-_ZL15sounduxmemset32Pvmm
	.align	2
	.code	16
	.thumb_func
	.type	_ZL15S9xSetSoundMuteh, %function
_ZL15S9xSetSoundMuteh:
	.fnstart
.LFB9:
	.file 2 "Z:/AntSnes/snes9x_asm_optimized/soundux.h"
	.loc 2 202 0
	.save	{r7, lr}
	push	{r7, lr}
.LCFI3:
	sub	sp, sp, #8
.LCFI4:
	add	r7, sp, #0
.LCFI5:
	mov	r2, r0
	add	r3, r7, #7
	strb	r2, [r3]
	.loc 2 204 0
	ldr	r3, .L7
	add	r2, r7, #7
	ldrb	r2, [r2]
	strb	r2, [r3, #5]
	.loc 2 206 0
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed for prologue
	pop	{r7, pc}
.L8:
	.align	2
.L7:
	.word	so
.LFE9:
	.cantunwind
	.fnend
	.size	_ZL15S9xSetSoundMuteh, .-_ZL15S9xSetSoundMuteh
	.align	2
	.code	16
	.thumb_func
	.type	_ZL13S9xSetEnvRateP7Channelmiij, %function
_ZL13S9xSetEnvRateP7Channelmiij:
	.fnstart
.LFB10:
	.loc 2 209 0
	.save	{r7, lr}
	push	{r7, lr}
.LCFI6:
	sub	sp, sp, #16
.LCFI7:
	add	r7, sp, #0
.LCFI8:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7]
	.loc 2 210 0
	ldr	r3, [r7]
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [r7, #12]
	strh	r2, [r3, #36]
	.loc 2 212 0
	ldr	r3, [r7, #8]
	add	r3, r3, #1
	bne	.L10
	.loc 2 214 0
	ldr	r3, [r7, #12]
	mov	r2, #0
	str	r2, [r3, #48]
	.loc 2 215 0
	mov	r3, #0
	str	r3, [r7, #8]
	b	.L11
.L10:
	.loc 2 218 0
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #4]
	str	r2, [r3, #48]
.L11:
	.loc 2 221 0
	ldr	r3, [r7, #8]
	cmp	r3, #0
	beq	.L12
	ldr	r3, .L23
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L13
.L12:
	.loc 2 222 0
	ldr	r3, [r7, #12]
	mov	r2, #0
	str	r2, [r3, #44]
	.loc 2 221 0
	b	.L22
.L13:
	.loc 2 225 0
	ldr	r3, [r7, #24]
	lsr	r3, r3, #28
	cmp	r3, #5
	bhi	.L22
	lsl	r2, r3, #2
	ldr	r3, .L23+4
	add	r3, r2, r3
	ldr	r3, [r3]
	mov	pc, r3
	.section	.rodata
	.align	2
.L21:
	.word	.L15
	.word	.L16
	.word	.L17
	.word	.L18
	.word	.L19
	.word	.L20
	.text
.L15:
	.loc 2 227 0
	ldr	r2, [r7, #12]
	mov	r3, #156
	ldrb	r3, [r2, r3]
	mov	r2, r3
	ldr	r3, [r7, #12]
	ldr	r0, [r3]
	ldr	r1, .L23+8
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r0
	lsl	r3, r3, #2
	ldr	r2, [r3, r1]
	ldr	r3, [r7, #12]
	str	r2, [r3, #44]
	.loc 2 228 0
	b	.L22
.L16:
	.loc 2 231 0
	ldr	r2, [r7, #12]
	mov	r3, #157
	ldrb	r3, [r2, r3]
	mov	r2, r3
	ldr	r3, [r7, #12]
	ldr	r0, [r3]
	ldr	r1, .L23+12
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r0
	lsl	r3, r3, #2
	ldr	r2, [r3, r1]
	ldr	r3, [r7, #12]
	str	r2, [r3, #44]
	.loc 2 232 0
	b	.L22
.L17:
	.loc 2 235 0
	ldr	r2, [r7, #12]
	mov	r3, #158
	ldrb	r3, [r2, r3]
	mov	r2, r3
	ldr	r3, [r7, #12]
	ldr	r0, [r3]
	ldr	r1, .L23+16
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r0
	lsl	r3, r3, #2
	ldr	r2, [r3, r1]
	ldr	r3, [r7, #12]
	str	r2, [r3, #44]
	.loc 2 236 0
	b	.L22
.L18:
	.loc 2 239 0
	ldr	r2, [r7, #24]
	mov	r3, #31
	and	r2, r2, r3
	ldr	r3, [r7, #12]
	ldr	r0, [r3]
	ldr	r1, .L23+20
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r0
	lsl	r3, r3, #2
	ldr	r2, [r3, r1]
	ldr	r3, [r7, #12]
	str	r2, [r3, #44]
	.loc 2 240 0
	b	.L22
.L19:
	.loc 2 243 0
	ldr	r2, [r7, #24]
	mov	r3, #31
	and	r2, r2, r3
	ldr	r3, [r7, #12]
	ldr	r0, [r3]
	ldr	r1, .L23+24
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r0
	lsl	r3, r3, #2
	ldr	r2, [r3, r1]
	ldr	r3, [r7, #12]
	str	r2, [r3, #44]
	.loc 2 244 0
	b	.L22
.L20:
	.loc 2 247 0
	ldr	r3, [r7, #12]
	ldr	r2, [r3]
	ldr	r3, .L23+28
	lsl	r2, r2, #2
	ldr	r2, [r2, r3]
	ldr	r3, [r7, #12]
	str	r2, [r3, #44]
.L22:
	.loc 2 268 0
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed for prologue
	pop	{r7, pc}
.L24:
	.align	2
.L23:
	.word	so
	.word	.L21
	.word	AttackERate
	.word	DecayERate
	.word	SustainERate
	.word	IncreaseERate
	.word	DecreaseERateExp
	.word	KeyOffERate
.LFE10:
	.cantunwind
	.fnend
	.size	_ZL13S9xSetEnvRateP7Channelmiij, .-_ZL13S9xSetEnvRateP7Channelmiij
	.align	2
	.code	16
	.thumb_func
	.type	_ZL16S9xSetEchoEnableh, %function
_ZL16S9xSetEchoEnableh:
	.fnstart
.LFB11:
	.loc 2 271 0
	.save	{r4, r7, lr}
	push	{r4, r7, lr}
.LCFI9:
	sub	sp, sp, #20
.LCFI10:
	add	r7, sp, #0
.LCFI11:
	mov	r2, r0
	add	r3, r7, #7
	strb	r2, [r3]
.LBB3:
	.loc 2 272 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	ldr	r3, .L34
	str	r2, [r3, #28]
	.loc 2 273 0
	ldr	r3, .L34
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L26
	ldr	r2, .L34+4
	mov	r3, #105
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	beq	.L27
.L26:
	.loc 2 274 0
	add	r3, r7, #7
	mov	r2, #0
	strb	r2, [r3]
.L27:
	.loc 2 275 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L28
	ldr	r3, .L34
	ldr	r3, [r3, #8]
	cmp	r3, #0
	bne	.L28
	.loc 2 277 0
	ldr	r2, .L34+8
	ldr	r3, .L34+12
	mov	r0, r2
	mov	r1, #0
	mov	r2, r3
	bl	memset
	.loc 2 278 0
	ldr	r3, .L34+16
	mov	r0, r3
	mov	r1, #0
	mov	r2, #64
	bl	memset
.L28:
	.loc 2 281 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	ldr	r3, .L34
	str	r2, [r3, #8]
.LBB4:
	.loc 2 282 0
	mov	r3, #0
	str	r3, [r7, #12]
	b	.L29
.L32:
	.loc 2 284 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	ldr	r3, [r7, #12]
	asr	r2, r2, r3
	mov	r3, #1
	and	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	beq	.L30
	.loc 2 285 0
	ldr	r1, [r7, #12]
	ldr	r2, .L34
	mov	r3, #176
	mov	r0, #212
	mul	r1, r0
	add	r2, r1, r2
	add	r3, r2, r3
	ldr	r2, .L34+20
	str	r2, [r3]
	b	.L31
.L30:
	.loc 2 287 0
	ldr	r1, [r7, #12]
	ldr	r2, .L34
	mov	r3, #176
	mov	r0, #212
	mul	r1, r0
	add	r2, r1, r2
	add	r3, r2, r3
	mov	r2, #0
	str	r2, [r3]
.L31:
	.loc 2 282 0
	ldr	r3, [r7, #12]
	add	r3, r3, #1
	str	r3, [r7, #12]
.L29:
	ldr	r3, [r7, #12]
	mov	r2, #7
	lsr	r0, r3, #31
	asr	r1, r2, #31
	mov	r4, r0
	cmp	r2, r3
	adc	r4, r4, r1
	mov	r3, r4
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	bne	.L32
.LBE4:
.LBE3:
	.loc 2 289 0
	mov	sp, r7
	add	sp, sp, #20
	@ sp needed for prologue
	pop	{r4, r7, pc}
.L35:
	.align	2
.L34:
	.word	SoundData
	.word	Settings
	.word	Echo
	.word	96000
	.word	Loop
	.word	EchoBuffer
.LFE11:
	.cantunwind
	.fnend
	.size	_ZL16S9xSetEchoEnableh, .-_ZL16S9xSetEchoEnableh
	.align	2
	.code	16
	.thumb_func
	.type	_ZL18S9xSetEchoFeedbacki, %function
_ZL18S9xSetEchoFeedbacki:
	.fnstart
.LFB12:
	.loc 2 292 0
	.save	{r7, lr}
	push	{r7, lr}
.LCFI12:
	sub	sp, sp, #8
.LCFI13:
	add	r7, sp, #0
.LCFI14:
	str	r0, [r7, #4]
	.loc 2 293 0
	ldr	r3, [r7, #4]
	mov	r2, r3
	add	r2, r2, #128
	bge	.L37
	mov	r3, #128
	neg	r3, r3
	str	r3, [r7, #4]
	b	.L38
.L37:
	ldr	r3, [r7, #4]
	cmp	r3, #127
	ble	.L38
	mov	r3, #127
	str	r3, [r7, #4]
.L38:
	.loc 2 294 0
	ldr	r3, .L40
	ldr	r2, [r7, #4]
	str	r2, [r3, #12]
	.loc 2 295 0
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed for prologue
	pop	{r7, pc}
.L41:
	.align	2
.L40:
	.word	SoundData
.LFE12:
	.cantunwind
	.fnend
	.size	_ZL18S9xSetEchoFeedbacki, .-_ZL18S9xSetEchoFeedbacki
	.align	2
	.code	16
	.thumb_func
	.type	_ZL23S9xSetFilterCoefficientii, %function
_ZL23S9xSetFilterCoefficientii:
	.fnstart
.LFB13:
	.loc 2 298 0
	.save	{r7, lr}
	push	{r7, lr}
.LCFI15:
	sub	sp, sp, #8
.LCFI16:
	add	r7, sp, #0
.LCFI17:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 2 299 0
	ldr	r2, [r7, #4]
	mov	r3, #7
	and	r2, r2, r3
	ldr	r3, .L47
	lsl	r2, r2, #2
	ldr	r1, [r7]
	str	r1, [r2, r3]
	.loc 2 300 0
	ldr	r3, .L47
	ldr	r3, [r3]
	.loc 2 307 0
	cmp	r3, #127
	beq	.L43
	.loc 2 300 0
	ldr	r3, .L47
	ldr	r3, [r3]
	.loc 2 307 0
	cmp	r3, #0
	bne	.L44
.L43:
	.loc 2 301 0
	ldr	r3, .L47
	ldr	r3, [r3, #4]
	.loc 2 307 0
	cmp	r3, #0
	bne	.L44
	.loc 2 302 0
	ldr	r3, .L47
	ldr	r3, [r3, #8]
	.loc 2 307 0
	cmp	r3, #0
	bne	.L44
	.loc 2 303 0
	ldr	r3, .L47
	ldr	r3, [r3, #12]
	.loc 2 307 0
	cmp	r3, #0
	bne	.L44
	.loc 2 304 0
	ldr	r3, .L47
	ldr	r3, [r3, #16]
	.loc 2 307 0
	cmp	r3, #0
	bne	.L44
	.loc 2 305 0
	ldr	r3, .L47
	ldr	r3, [r3, #20]
	.loc 2 307 0
	cmp	r3, #0
	bne	.L44
	.loc 2 306 0
	ldr	r3, .L47
	ldr	r3, [r3, #24]
	.loc 2 307 0
	cmp	r3, #0
	bne	.L44
	ldr	r3, .L47
	ldr	r3, [r3, #28]
	cmp	r3, #0
	bne	.L44
	mov	r3, #1
	b	.L45
.L44:
	mov	r3, #0
.L45:
	mov	r1, r3
	ldr	r2, .L47+4
	mov	r3, #218
	lsl	r3, r3, #3
	strb	r1, [r2, r3]
	.loc 2 308 0
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed for prologue
	pop	{r7, pc}
.L48:
	.align	2
.L47:
	.word	FilterTaps
	.word	SoundData
.LFE13:
	.cantunwind
	.fnend
	.size	_ZL23S9xSetFilterCoefficientii, .-_ZL23S9xSetFilterCoefficientii
	.align	2
	.code	16
	.thumb_func
	.type	_ZL19S9xGetSampleAddressi, %function
_ZL19S9xGetSampleAddressi:
	.fnstart
.LFB14:
	.loc 2 311 0
	.save	{r7, lr}
	push	{r7, lr}
.LCFI18:
	sub	sp, sp, #16
.LCFI19:
	add	r7, sp, #0
.LCFI20:
	str	r0, [r7, #4]
.LBB5:
	.loc 2 312 0
	ldr	r2, .L51
	mov	r3, #104
	ldrb	r3, [r2, r3]
	lsl	r2, r3, #8
	ldr	r3, [r7, #4]
	lsl	r3, r3, #2
	add	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	str	r3, [r7, #12]
	.loc 2 313 0
	ldr	r3, .L51+4
	ldr	r3, [r3, #68]
	mov	r2, r3
	ldr	r3, [r7, #12]
	add	r3, r2, r3
.LBE5:
	.loc 2 314 0
	mov	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed for prologue
	pop	{r7, pc}
.L52:
	.align	2
.L51:
	.word	APU
	.word	IAPU
.LFE14:
	.cantunwind
	.fnend
	.size	_ZL19S9xGetSampleAddressi, .-_ZL19S9xGetSampleAddressi
	.align	2
	.code	16
	.thumb_func
	.type	_ZL20S9xSetSoundFrequencyii, %function
_ZL20S9xSetSoundFrequencyii:
	.fnstart
.LFB15:
	.loc 2 317 0
	.save	{r7, lr}
	push	{r7, lr}
.LCFI21:
	sub	sp, sp, #8
.LCFI22:
	add	r7, sp, #0
.LCFI23:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 2 318 0
	ldr	r3, .L57
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L56
	.loc 2 320 0
	ldr	r2, [r7, #4]
	ldr	r3, .L57+4
	mov	r1, #212
	mul	r2, r1
	add	r3, r2, r3
	add	r3, r3, #52
	ldr	r3, [r3]
	cmp	r3, #1
	bne	.L55
	.loc 2 321 0
	ldr	r2, .L57+8
	mov	r3, #119
	ldrb	r3, [r2, r3]
	mov	r2, r3
	mov	r3, #31
	and	r2, r2, r3
	ldr	r3, .L57+12
	lsl	r2, r2, #2
	ldr	r3, [r2, r3]
	str	r3, [r7]
.L55:
	.loc 2 326 0
	ldr	r1, [r7, #4]
	ldr	r3, .L57
	ldr	r3, [r3, #12]
	ldr	r2, [r7]
	mul	r3, r2
	lsr	r2, r3, #11
	ldr	r3, .L57+4
	mov	r0, #212
	mul	r1, r0
	add	r3, r1, r3
	add	r3, r3, #64
	str	r2, [r3]
.L56:
	.loc 2 335 0
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed for prologue
	pop	{r7, pc}
.L58:
	.align	2
.L57:
	.word	so
	.word	SoundData
	.word	APU
	.word	NoiseFreq
.LFE15:
	.cantunwind
	.fnend
	.size	_ZL20S9xSetSoundFrequencyii, .-_ZL20S9xSetSoundFrequencyii
	.bss
	.align	2
_ZL4wave:
	.space	7056
	.text
	.align	2
	.code	16
	.thumb_func
	.type	_ZL20S9xAPUSetEndOfSampleiP7Channel, %function
_ZL20S9xAPUSetEndOfSampleiP7Channel:
	.fnstart
.LFB36:
	.loc 1 144 0
	.save	{r7, lr}
	push	{r7, lr}
.LCFI24:
	sub	sp, sp, #8
.LCFI25:
	add	r7, sp, #0
.LCFI26:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 145 0
	ldr	r3, [r7]
	mov	r2, #0
	str	r2, [r3]
	.loc 1 146 0
	ldr	r2, [r7]
	mov	r3, #132
	mov	r1, #0
	str	r1, [r2, r3]
	.loc 1 147 0
	ldr	r2, .L61
	mov	r3, #135
	ldrb	r3, [r2, r3]
	mov	r2, r3
	mov	r1, #1
	ldr	r3, [r7, #4]
	mov	r0, r1
	lsl	r0, r0, r3
	mov	r3, r0
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	orr	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	lsl	r3, r3, #24
	lsr	r1, r3, #24
	ldr	r2, .L61
	mov	r3, #135
	strb	r1, [r2, r3]
	.loc 1 148 0
	ldr	r2, .L61
	mov	r3, #87
	ldrb	r3, [r2, r3]
	mov	r2, r3
	mov	r1, #1
	ldr	r3, [r7, #4]
	mov	r0, r1
	lsl	r0, r0, r3
	mov	r3, r0
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	mvn	r3, r3
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	and	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	lsl	r3, r3, #24
	lsr	r1, r3, #24
	ldr	r2, .L61
	mov	r3, #87
	strb	r1, [r2, r3]
	.loc 1 149 0
	ldr	r2, .L61
	mov	r3, #103
	ldrb	r3, [r2, r3]
	mov	r2, r3
	mov	r1, #1
	ldr	r3, [r7, #4]
	mov	r0, r1
	lsl	r0, r0, r3
	mov	r3, r0
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	mvn	r3, r3
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	and	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	lsl	r3, r3, #24
	lsr	r1, r3, #24
	ldr	r2, .L61
	mov	r3, #103
	strb	r1, [r2, r3]
	.loc 1 150 0
	ldr	r3, .L61
	ldrb	r3, [r3, #6]
	mov	r2, r3
	mov	r1, #1
	ldr	r3, [r7, #4]
	mov	r0, r1
	lsl	r0, r0, r3
	mov	r3, r0
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	mvn	r3, r3
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	and	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	lsl	r3, r3, #24
	lsr	r2, r3, #24
	ldr	r3, .L61
	strb	r2, [r3, #6]
	.loc 1 151 0
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed for prologue
	pop	{r7, pc}
.L62:
	.align	2
.L61:
	.word	APU
.LFE36:
	.cantunwind
	.fnend
	.size	_ZL20S9xAPUSetEndOfSampleiP7Channel, .-_ZL20S9xAPUSetEndOfSampleiP7Channel
	.align	2
	.code	16
	.thumb_func
	.type	_ZL13S9xAPUSetEndXi, %function
_ZL13S9xAPUSetEndXi:
	.fnstart
.LFB37:
	.loc 1 157 0
	.save	{r7, lr}
	push	{r7, lr}
.LCFI27:
	sub	sp, sp, #8
.LCFI28:
	add	r7, sp, #0
.LCFI29:
	str	r0, [r7, #4]
	.loc 1 158 0
	ldr	r2, .L65
	mov	r3, #135
	ldrb	r3, [r2, r3]
	mov	r2, r3
	mov	r1, #1
	ldr	r3, [r7, #4]
	mov	r0, r1
	lsl	r0, r0, r3
	mov	r3, r0
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	orr	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	lsl	r3, r3, #24
	lsr	r1, r3, #24
	ldr	r2, .L65
	mov	r3, #135
	strb	r1, [r2, r3]
	.loc 1 159 0
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed for prologue
	pop	{r7, pc}
.L66:
	.align	2
.L65:
	.word	APU
.LFE37:
	.cantunwind
	.fnend
	.size	_ZL13S9xAPUSetEndXi, .-_ZL13S9xAPUSetEndXi
	.align	2
	.global	_Z15S9xSetEchoDelayi
	.hidden	_Z15S9xSetEchoDelayi
	.code	16
	.thumb_func
	.type	_Z15S9xSetEchoDelayi, %function
_Z15S9xSetEchoDelayi:
	.fnstart
.LFB38:
	.loc 1 165 0
	.save	{r4, r7, lr}
	push	{r4, r7, lr}
.LCFI30:
	sub	sp, sp, #12
.LCFI31:
	add	r7, sp, #0
.LCFI32:
	str	r0, [r7, #4]
	.loc 1 166 0
	ldr	r3, [r7, #4]
	lsl	r2, r3, #9
	ldr	r3, .L74
	ldr	r3, [r3]
	mul	r3, r2
	asr	r2, r3, #15
	ldr	r3, .L74+4
	str	r2, [r3, #20]
	.loc 1 167 0
	ldr	r3, .L74
	ldrb	r3, [r3, #4]
	cmp	r3, #0
	beq	.L68
	.loc 1 168 0
	ldr	r3, .L74+4
	ldr	r3, [r3, #20]
	lsl	r2, r3, #1
	ldr	r3, .L74+4
	str	r2, [r3, #20]
.L68:
	.loc 1 169 0
	ldr	r3, .L74+4
	ldr	r3, [r3, #20]
	cmp	r3, #0
	beq	.L69
	.loc 1 170 0
	b	.L70
.L71:
	.loc 1 171 0
	ldr	r3, .L74+4
	ldr	r2, [r3, #16]
	ldr	r3, .L74+4
	ldr	r3, [r3, #20]
	sub	r2, r2, r3
	ldr	r3, .L74+4
	str	r2, [r3, #16]
.L70:
	.loc 1 170 0
	ldr	r3, .L74+4
	ldr	r2, [r3, #16]
	ldr	r3, .L74+4
	ldr	r3, [r3, #20]
	asr	r0, r2, #31
	lsr	r1, r3, #31
	mov	r4, r0
	cmp	r2, r3
	adc	r4, r4, r1
	mov	r3, r4
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	bne	.L71
	b	.L72
.L69:
	.loc 1 173 0
	ldr	r3, .L74+4
	mov	r2, #0
	str	r2, [r3, #16]
.L72:
	.loc 1 174 0
	ldr	r2, .L74+8
	mov	r3, #88
	ldrb	r3, [r2, r3]
	mov	r0, r3
	bl	_ZL16S9xSetEchoEnableh
	.loc 1 175 0
	mov	sp, r7
	add	sp, sp, #12
	@ sp needed for prologue
	pop	{r4, r7, pc}
.L75:
	.align	2
.L74:
	.word	so
	.word	SoundData
	.word	APU
.LFE38:
	.cantunwind
	.fnend
	.size	_Z15S9xSetEchoDelayi, .-_Z15S9xSetEchoDelayi
	.align	2
	.global	_Z17S9xSetSoundKeyOffi
	.hidden	_Z17S9xSetSoundKeyOffi
	.code	16
	.thumb_func
	.type	_Z17S9xSetSoundKeyOffi, %function
_Z17S9xSetSoundKeyOffi:
	.fnstart
.LFB39:
	.loc 1 178 0
	.save	{r7, lr}
	push	{r7, lr}
.LCFI33:
	sub	sp, sp, #24
.LCFI34:
	add	r7, sp, #8
.LCFI35:
	str	r0, [r7, #4]
.LBB6:
	.loc 1 179 0
	ldr	r3, [r7, #4]
	mov	r2, #212
	mul	r3, r2
	mov	r2, r3
	add	r2, r2, #48
	ldr	r3, .L79
	add	r3, r2, r3
	str	r3, [r7, #12]
	.loc 1 181 0
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L78
	.loc 1 183 0
	ldr	r3, [r7, #12]
	mov	r2, #4
	str	r2, [r3]
	.loc 1 184 0
	ldr	r2, [r7, #12]
	mov	r3, #132
	mov	r1, #4
	str	r1, [r2, r3]
	.loc 1 185 0
	ldr	r1, [r7, #12]
	mov	r3, #1
	neg	r3, r3
	mov	r2, #160
	lsl	r2, r2, #23
	str	r2, [sp]
	mov	r0, r1
	mov	r1, #8
	mov	r2, r3
	mov	r3, #0
	bl	_ZL13S9xSetEnvRateP7Channelmiij
.L78:
.LBE6:
	.loc 1 187 0
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed for prologue
	pop	{r7, pc}
.L80:
	.align	2
.L79:
	.word	SoundData
.LFE39:
	.cantunwind
	.fnend
	.size	_Z17S9xSetSoundKeyOffi, .-_Z17S9xSetSoundKeyOffi
	.align	2
	.global	_Z28S9xFixSoundAfterSnapshotLoadv
	.hidden	_Z28S9xFixSoundAfterSnapshotLoadv
	.code	16
	.thumb_func
	.type	_Z28S9xFixSoundAfterSnapshotLoadv, %function
_Z28S9xFixSoundAfterSnapshotLoadv:
	.fnstart
.LFB40:
	.loc 1 190 0
	.save	{r4, r7, lr}
	push	{r4, r7, lr}
.LCFI36:
	sub	sp, sp, #12
.LCFI37:
	add	r7, sp, #0
.LCFI38:
.LBB7:
	.loc 1 191 0
	ldr	r2, .L85
	mov	r3, #119
	ldrb	r3, [r2, r3]
	mov	r2, r3
	mov	r3, #32
	and	r3, r3, r2
	neg	r2, r3
	adc	r2, r2, r3
	ldr	r3, .L85+4
	str	r2, [r3, #24]
	.loc 1 192 0
	ldr	r2, .L85
	mov	r3, #88
	ldrb	r3, [r2, r3]
	mov	r2, r3
	ldr	r3, .L85+4
	str	r2, [r3, #28]
	.loc 1 193 0
	ldr	r2, .L85
	mov	r3, #136
	ldrb	r3, [r2, r3]
	mov	r2, r3
	mov	r3, #15
	and	r3, r3, r2
	mov	r0, r3
	bl	_Z15S9xSetEchoDelayi
	.loc 1 194 0
	ldr	r3, .L85
	ldrb	r3, [r3, #24]
	lsl	r3, r3, #24
	asr	r3, r3, #24
	mov	r0, r3
	bl	_ZL18S9xSetEchoFeedbacki
	.loc 1 196 0
	ldr	r3, .L85
	ldrb	r3, [r3, #26]
	lsl	r3, r3, #24
	asr	r3, r3, #24
	mov	r0, #0
	mov	r1, r3
	bl	_ZL23S9xSetFilterCoefficientii
	.loc 1 197 0
	ldr	r2, .L85
	mov	r3, #42
	ldrb	r3, [r2, r3]
	lsl	r3, r3, #24
	asr	r3, r3, #24
	mov	r0, #1
	mov	r1, r3
	bl	_ZL23S9xSetFilterCoefficientii
	.loc 1 198 0
	ldr	r2, .L85
	mov	r3, #58
	ldrb	r3, [r2, r3]
	lsl	r3, r3, #24
	asr	r3, r3, #24
	mov	r0, #2
	mov	r1, r3
	bl	_ZL23S9xSetFilterCoefficientii
	.loc 1 199 0
	ldr	r2, .L85
	mov	r3, #74
	ldrb	r3, [r2, r3]
	lsl	r3, r3, #24
	asr	r3, r3, #24
	mov	r0, #3
	mov	r1, r3
	bl	_ZL23S9xSetFilterCoefficientii
	.loc 1 200 0
	ldr	r2, .L85
	mov	r3, #90
	ldrb	r3, [r2, r3]
	lsl	r3, r3, #24
	asr	r3, r3, #24
	mov	r0, #4
	mov	r1, r3
	bl	_ZL23S9xSetFilterCoefficientii
	.loc 1 201 0
	ldr	r2, .L85
	mov	r3, #106
	ldrb	r3, [r2, r3]
	lsl	r3, r3, #24
	asr	r3, r3, #24
	mov	r0, #5
	mov	r1, r3
	bl	_ZL23S9xSetFilterCoefficientii
	.loc 1 202 0
	ldr	r2, .L85
	mov	r3, #122
	ldrb	r3, [r2, r3]
	lsl	r3, r3, #24
	asr	r3, r3, #24
	mov	r0, #6
	mov	r1, r3
	bl	_ZL23S9xSetFilterCoefficientii
	.loc 1 203 0
	ldr	r2, .L85
	mov	r3, #138
	ldrb	r3, [r2, r3]
	lsl	r3, r3, #24
	asr	r3, r3, #24
	mov	r0, #7
	mov	r1, r3
	bl	_ZL23S9xSetFilterCoefficientii
.LBB8:
	.loc 1 204 0
	mov	r3, #0
	str	r3, [r7, #4]
	b	.L82
.L83:
	.loc 1 206 0
	ldr	r1, [r7, #4]
	ldr	r2, .L85+4
	mov	r3, #160
	mov	r0, #212
	mul	r1, r0
	add	r2, r1, r2
	add	r3, r2, r3
	mov	r2, #1
	strb	r2, [r3, #7]
	.loc 1 207 0
	ldr	r2, [r7, #4]
	ldr	r3, .L85+4
	mov	r1, #212
	mul	r2, r1
	add	r3, r2, r3
	add	r3, r3, #60
	ldr	r3, [r3]
	ldr	r2, [r7, #4]
	mov	r0, r2
	mov	r1, r3
	bl	_ZL20S9xSetSoundFrequencyii
	.loc 1 208 0
	ldr	r0, [r7, #4]
	ldr	r2, [r7, #4]
	ldr	r3, .L85+4
	mov	r1, #212
	mul	r2, r1
	add	r3, r2, r3
	add	r3, r3, #76
	ldr	r3, [r3]
	lsl	r2, r3, #24
	ldr	r1, .L85+4
	mov	r3, #184
	mov	r4, #212
	mov	ip, r4
	mov	r4, r0
	mov	r0, ip
	mul	r0, r4
	add	r1, r0, r1
	add	r3, r1, r3
	str	r2, [r3]
	.loc 1 209 0
	ldr	r1, [r7, #4]
	ldr	r2, .L85+4
	mov	r3, #184
	mov	r0, #212
	mul	r1, r0
	add	r2, r1, r2
	add	r3, r2, r3
	mov	r2, #0
	strh	r2, [r3, #4]
	.loc 1 210 0
	ldr	r1, [r7, #4]
	ldr	r2, .L85+4
	mov	r3, #192
	mov	r0, #212
	mul	r1, r0
	add	r2, r1, r2
	add	r3, r2, r3
	mov	r2, #0
	str	r2, [r3]
	.loc 1 211 0
	ldr	r0, [r7, #4]
	ldr	r1, [r7, #4]
	ldr	r2, .L85+4
	mov	r3, #152
	mov	r4, #212
	mov	ip, r4
	mov	r4, r1
	mov	r1, ip
	mul	r1, r4
	add	r2, r1, r2
	add	r3, r2, r3
	ldrh	r3, [r3, #2]
	lsl	r3, r3, #16
	asr	r2, r3, #16
	ldr	r1, .L85+4
	mov	r3, #196
	mov	r4, #212
	mov	ip, r4
	mov	r4, r0
	mov	r0, ip
	mul	r0, r4
	add	r1, r0, r1
	add	r3, r1, r3
	str	r2, [r3]
	.loc 1 212 0
	ldr	r0, [r7, #4]
	ldr	r1, [r7, #4]
	ldr	r2, .L85+4
	mov	r3, #154
	mov	r4, #212
	mov	ip, r4
	mov	r4, r1
	mov	r1, ip
	mul	r1, r4
	add	r2, r1, r2
	add	r3, r2, r3
	ldrh	r3, [r3, #2]
	lsl	r3, r3, #16
	asr	r2, r3, #16
	ldr	r1, .L85+4
	mov	r3, #200
	mov	r4, #212
	mov	ip, r4
	mov	r4, r0
	mov	r0, ip
	mul	r0, r4
	add	r1, r0, r1
	add	r3, r1, r3
	str	r2, [r3]
	.loc 1 204 0
	ldr	r3, [r7, #4]
	add	r3, r3, #1
	str	r3, [r7, #4]
.L82:
	ldr	r3, [r7, #4]
	mov	r2, #7
	lsr	r0, r3, #31
	asr	r1, r2, #31
	mov	r4, r0
	cmp	r2, r3
	adc	r4, r4, r1
	mov	r3, r4
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	bne	.L83
.LBE8:
	.loc 1 214 0
	ldr	r3, .L85+4
	ldrh	r3, [r3]
	lsl	r3, r3, #16
	asr	r1, r3, #16
	ldr	r2, .L85+4
	ldr	r3, .L85+8
	str	r1, [r2, r3]
	.loc 1 215 0
	ldr	r3, .L85+4
	ldrh	r3, [r3, #2]
	lsl	r3, r3, #16
	asr	r1, r3, #16
	ldr	r2, .L85+4
	mov	r3, #219
	lsl	r3, r3, #3
	str	r1, [r2, r3]
	.loc 1 216 0
	ldr	r3, .L85+4
	ldrh	r3, [r3, #4]
	lsl	r3, r3, #16
	asr	r1, r3, #16
	ldr	r2, .L85+4
	ldr	r3, .L85+12
	str	r1, [r2, r3]
	.loc 1 217 0
	ldr	r3, .L85+4
	ldrh	r3, [r3, #6]
	lsl	r3, r3, #16
	asr	r1, r3, #16
	ldr	r2, .L85+4
	mov	r3, #220
	lsl	r3, r3, #3
	str	r1, [r2, r3]
	.loc 1 218 0
	ldr	r3, .L85+16
	mov	r2, #0
	str	r2, [r3, #36]
.LBE7:
	.loc 1 219 0
	mov	sp, r7
	add	sp, sp, #12
	@ sp needed for prologue
	pop	{r4, r7, pc}
.L86:
	.align	2
.L85:
	.word	APU
	.word	SoundData
	.word	1748
	.word	1756
	.word	IAPU
.LFE40:
	.cantunwind
	.fnend
	.size	_Z28S9xFixSoundAfterSnapshotLoadv, .-_Z28S9xFixSoundAfterSnapshotLoadv
	.align	2
	.global	_Z20S9xSetEnvelopeHeightii
	.hidden	_Z20S9xSetEnvelopeHeightii
	.code	16
	.thumb_func
	.type	_Z20S9xSetEnvelopeHeightii, %function
_Z20S9xSetEnvelopeHeightii:
	.fnstart
.LFB41:
	.loc 1 222 0
	.save	{r7, lr}
	push	{r7, lr}
.LCFI39:
	sub	sp, sp, #16
.LCFI40:
	add	r7, sp, #0
.LCFI41:
	str	r0, [r7, #4]
	str	r1, [r7]
.LBB9:
	.loc 1 223 0
	ldr	r3, [r7, #4]
	mov	r2, #212
	mul	r3, r2
	mov	r2, r3
	add	r2, r2, #48
	ldr	r3, .L92
	add	r3, r2, r3
	str	r3, [r7, #12]
	.loc 1 225 0
	ldr	r3, [r7, #12]
	ldr	r2, [r7]
	str	r2, [r3, #28]
	.loc 1 226 0
	ldr	r3, [r7]
	lsl	r1, r3, #24
	ldr	r2, [r7, #12]
	mov	r3, #136
	str	r1, [r2, r3]
	.loc 1 228 0
	ldr	r3, [r7, #12]
	ldrh	r3, [r3, #8]
	lsl	r3, r3, #16
	asr	r3, r3, #16
	ldr	r2, [r7]
	mul	r3, r2
	cmp	r3, #0
	bge	.L88
	add	r3, r3, #127
.L88:
	asr	r3, r3, #7
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [r7, #12]
	strh	r2, [r3, #32]
	.loc 1 229 0
	ldr	r3, [r7, #12]
	ldrh	r3, [r3, #10]
	lsl	r3, r3, #16
	asr	r3, r3, #16
	ldr	r2, [r7]
	mul	r3, r2
	cmp	r3, #0
	bge	.L89
	add	r3, r3, #127
.L89:
	asr	r3, r3, #7
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [r7, #12]
	strh	r2, [r3, #34]
	.loc 1 231 0
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #28]
	cmp	r3, #0
	bne	.L91
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L91
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	cmp	r3, #5
	beq	.L91
	.loc 1 233 0
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #12]
	mov	r0, r2
	mov	r1, r3
	bl	_ZL20S9xAPUSetEndOfSampleiP7Channel
.L91:
.LBE9:
	.loc 1 235 0
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed for prologue
	pop	{r7, pc}
.L93:
	.align	2
.L92:
	.word	SoundData
.LFE41:
	.cantunwind
	.fnend
	.size	_Z20S9xSetEnvelopeHeightii, .-_Z20S9xSetEnvelopeHeightii
	.align	2
	.global	_Z17S9xSetSoundSampleit
	.hidden	_Z17S9xSetSoundSampleit
	.code	16
	.thumb_func
	.type	_Z17S9xSetSoundSampleit, %function
_Z17S9xSetSoundSampleit:
	.fnstart
.LFB42:
	.loc 1 239 0
	.save	{r7, lr}
	push	{r7, lr}
.LCFI42:
	sub	sp, sp, #8
.LCFI43:
	add	r7, sp, #0
.LCFI44:
	str	r0, [r7, #4]
	mov	r2, r1
	add	r3, r7, #2
	strh	r2, [r3]
	.loc 1 240 0
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed for prologue
	pop	{r7, pc}
.LFE42:
	.cantunwind
	.fnend
	.size	_Z17S9xSetSoundSampleit, .-_Z17S9xSetSoundSampleit
	.align	2
	.code	16
	.thumb_func
	.type	_ZL11DecodeBlockP7Channel, %function
_ZL11DecodeBlockP7Channel:
	.fnstart
.LFB43:
	.loc 1 264 0
	.save	{r7, lr}
	push	{r7, lr}
.LCFI45:
	sub	sp, sp, #40
.LCFI46:
	add	r7, sp, #0
.LCFI47:
	str	r0, [r7, #4]
.LBB10:
	.loc 1 265 0
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #120]
	ldr	r3, .L115
	cmp	r2, r3
	bls	.L97
	.loc 1 267 0
	ldr	r2, [r7, #4]
	mov	r3, #118
	mov	r1, #1
	strb	r1, [r2, r3]
	.loc 1 268 0
	ldr	r3, [r7, #4]
	mov	r2, #0
	strb	r2, [r3, #24]
	.loc 1 269 0
	ldr	r3, [r7, #4]
	mov	r2, r3
	add	r2, r2, #74
	ldr	r3, [r7, #4]
	str	r2, [r3, #112]
	.loc 1 270 0
	ldr	r3, [r7, #4]
	add	r3, r3, #74
	mov	r0, r3
	mov	r1, #0
	mov	r2, #8
	bl	_ZL15sounduxmemset32Pvmm
	.loc 1 271 0
	b	.L114
.L97:
	.loc 1 273 0
	ldr	r3, .L115+4
	ldr	r3, [r3, #68]
	mov	r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #120]
	add	r3, r2, r3
	str	r3, [r7, #8]
	.loc 1 275 0
	ldr	r3, [r7, #8]
	ldrb	r2, [r3]
	mov	r3, r7
	add	r3, r3, #15
	strb	r2, [r3]
	.loc 1 276 0
	mov	r3, r7
	add	r3, r3, #15
	ldrb	r3, [r3]
	mov	r2, #1
	and	r3, r3, r2
	ldr	r1, [r7, #4]
	mov	r2, #118
	strb	r3, [r1, r2]
	ldr	r2, [r7, #4]
	mov	r3, #118
	ldrb	r3, [r2, r3]
	sub	r2, r3, #1
	sbc	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	beq	.L99
	.loc 1 277 0
	mov	r3, r7
	add	r3, r3, #15
	ldrb	r2, [r3]
	mov	r3, #2
	and	r3, r3, r2
	mov	r2, r3
	sub	r3, r2, #1
	sbc	r2, r2, r3
	ldr	r3, [r7, #4]
	strb	r2, [r3, #24]
.L99:
	.loc 1 279 0
	ldr	r3, [r7, #4]
	mov	r2, r3
	add	r2, r2, #74
	ldr	r3, [r7, #4]
	str	r2, [r3, #112]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #112]
	str	r3, [r7, #16]
	.loc 1 289 0
	ldr	r3, [r7, #8]
	add	r3, r3, #1
	str	r3, [r7, #8]
	.loc 1 291 0
	ldr	r2, [r7, #4]
	mov	r3, #148
	ldr	r3, [r2, r3]
	str	r3, [r7, #32]
	.loc 1 292 0
	ldr	r2, [r7, #4]
	mov	r3, #152
	ldr	r3, [r2, r3]
	str	r3, [r7, #36]
	.loc 1 293 0
	mov	r3, r7
	add	r3, r3, #15
	ldrb	r3, [r3]
	asr	r2, r3, #4
	mov	r3, r7
	add	r3, r3, #25
	strb	r2, [r3]
	.loc 1 295 0
	mov	r3, r7
	add	r3, r3, #15
	ldrb	r3, [r3]
	asr	r2, r3, #2
	mov	r3, #3
	and	r3, r3, r2
	cmp	r3, #1
	beq	.L102
	cmp	r3, #1
	bgt	.L105
	cmp	r3, #0
	beq	.L101
	b	.L100
.L105:
	cmp	r3, #2
	bne	.LCB1425
	b	.L103	@long jump
.LCB1425:
	cmp	r3, #3
	bne	.LCB1427
	b	.L104	@long jump
.LCB1427:
	b	.L100
.L101:
	.loc 1 298 0
	mov	r3, #8
	str	r3, [r7, #28]
	b	.L106
.L107:
	.loc 1 300 0
	mov	r3, r7
	add	r3, r3, #26
	ldr	r2, [r7, #8]
	ldrb	r2, [r2]
	strb	r2, [r3]
	ldr	r3, [r7, #8]
	add	r3, r3, #1
	str	r3, [r7, #8]
	.loc 1 301 0
	mov	r3, r7
	add	r3, r3, #26
	ldrb	r3, [r3, #0]
	lsl	r3, r3, #24
	asr	r3, r3, #24
	lsl	r2, r3, #4
	mov	r3, r7
	add	r3, r3, #27
	strb	r2, [r3]
	.loc 1 302 0
	mov	r3, r7
	add	r3, r3, #27
	ldrb	r3, [r3, #0]
	lsl	r3, r3, #24
	asr	r3, r3, #24
	asr	r2, r3, #4
	mov	r3, r7
	add	r3, r3, #27
	strb	r2, [r3]
	.loc 1 303 0
	mov	r3, r7
	add	r3, r3, #26
	ldrb	r3, [r3, #0]
	lsl	r3, r3, #24
	asr	r3, r3, #24
	asr	r2, r3, #4
	mov	r3, r7
	add	r3, r3, #26
	strb	r2, [r3]
	.loc 1 304 0
	mov	r3, r7
	add	r3, r3, #26
	mov	r2, #0
	ldrsb	r2, [r3, r2]
	mov	r3, r7
	add	r3, r3, #25
	ldrb	r3, [r3]
	mov	r1, r2
	lsl	r1, r1, r3
	mov	r3, r1
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [r7, #16]
	strh	r2, [r3]
	ldr	r3, [r7, #16]
	add	r3, r3, #2
	str	r3, [r7, #16]
	.loc 1 305 0
	mov	r3, r7
	add	r3, r3, #27
	mov	r2, #0
	ldrsb	r2, [r3, r2]
	mov	r3, r7
	add	r3, r3, #25
	ldrb	r3, [r3]
	mov	r1, r2
	lsl	r1, r1, r3
	mov	r3, r1
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [r7, #16]
	strh	r2, [r3]
	ldr	r3, [r7, #16]
	add	r3, r3, #2
	str	r3, [r7, #16]
	.loc 1 298 0
	ldr	r3, [r7, #28]
	sub	r3, r3, #1
	str	r3, [r7, #28]
.L106:
	ldr	r3, [r7, #28]
	sub	r2, r3, #1
	sbc	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	bne	.L107
	.loc 1 307 0
	ldr	r3, [r7, #16]
	sub	r3, r3, #4
	ldrh	r3, [r3]
	lsl	r3, r3, #16
	asr	r3, r3, #16
	str	r3, [r7, #36]
	.loc 1 308 0
	ldr	r3, [r7, #16]
	sub	r3, r3, #2
	ldrh	r3, [r3]
	lsl	r3, r3, #16
	asr	r3, r3, #16
	str	r3, [r7, #32]
	.loc 1 309 0
	b	.L100
.L102:
	.loc 1 311 0
	mov	r3, #8
	str	r3, [r7, #28]
	b	.L108
.L109:
	.loc 1 313 0
	mov	r3, r7
	add	r3, r3, #26
	ldr	r2, [r7, #8]
	ldrb	r2, [r2]
	strb	r2, [r3]
	ldr	r3, [r7, #8]
	add	r3, r3, #1
	str	r3, [r7, #8]
	.loc 1 314 0
	mov	r3, r7
	add	r3, r3, #26
	ldrb	r3, [r3, #0]
	lsl	r3, r3, #24
	asr	r3, r3, #24
	lsl	r2, r3, #4
	mov	r3, r7
	add	r3, r3, #27
	strb	r2, [r3]
	.loc 1 315 0
	mov	r3, r7
	add	r3, r3, #27
	ldrb	r3, [r3, #0]
	lsl	r3, r3, #24
	asr	r3, r3, #24
	asr	r2, r3, #4
	mov	r3, r7
	add	r3, r3, #27
	strb	r2, [r3]
	.loc 1 316 0
	mov	r3, r7
	add	r3, r3, #26
	ldrb	r3, [r3, #0]
	lsl	r3, r3, #24
	asr	r3, r3, #24
	asr	r2, r3, #4
	mov	r3, r7
	add	r3, r3, #26
	strb	r2, [r3]
	.loc 1 317 0
	ldr	r3, [r7, #32]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	asr	r3, r3, #16
	str	r3, [r7, #32]
	.loc 1 318 0
	mov	r3, r7
	add	r3, r3, #26
	mov	r2, #0
	ldrsb	r2, [r3, r2]
	mov	r3, r7
	add	r3, r3, #25
	ldrb	r3, [r3]
	lsl	r2, r2, r3
	ldr	r3, [r7, #32]
	add	r2, r2, r3
	ldr	r3, [r7, #32]
	asr	r3, r3, #4
	sub	r3, r2, r3
	str	r3, [r7, #36]
	ldr	r3, [r7, #36]
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [r7, #16]
	strh	r2, [r3]
	ldr	r3, [r7, #16]
	add	r3, r3, #2
	str	r3, [r7, #16]
	.loc 1 319 0
	ldr	r3, [r7, #36]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	asr	r3, r3, #16
	str	r3, [r7, #36]
	.loc 1 320 0
	mov	r3, r7
	add	r3, r3, #27
	mov	r2, #0
	ldrsb	r2, [r3, r2]
	mov	r3, r7
	add	r3, r3, #25
	ldrb	r3, [r3]
	lsl	r2, r2, r3
	ldr	r3, [r7, #36]
	add	r2, r2, r3
	ldr	r3, [r7, #36]
	asr	r3, r3, #4
	sub	r3, r2, r3
	str	r3, [r7, #32]
	ldr	r3, [r7, #32]
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [r7, #16]
	strh	r2, [r3]
	ldr	r3, [r7, #16]
	add	r3, r3, #2
	str	r3, [r7, #16]
	.loc 1 311 0
	ldr	r3, [r7, #28]
	sub	r3, r3, #1
	str	r3, [r7, #28]
.L108:
	ldr	r3, [r7, #28]
	sub	r2, r3, #1
	sbc	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	bne	.L109
	.loc 1 322 0
	b	.L100
.L103:
	.loc 1 324 0
	mov	r3, #8
	str	r3, [r7, #28]
	b	.L110
.L116:
	.align	2
.L115:
	.word	65526
	.word	IAPU
.L111:
	.loc 1 326 0
	mov	r3, r7
	add	r3, r3, #26
	ldr	r2, [r7, #8]
	ldrb	r2, [r2]
	strb	r2, [r3]
	ldr	r3, [r7, #8]
	add	r3, r3, #1
	str	r3, [r7, #8]
	.loc 1 327 0
	mov	r3, r7
	add	r3, r3, #26
	ldrb	r3, [r3, #0]
	lsl	r3, r3, #24
	asr	r3, r3, #24
	lsl	r2, r3, #4
	mov	r3, r7
	add	r3, r3, #27
	strb	r2, [r3]
	.loc 1 328 0
	mov	r3, r7
	add	r3, r3, #27
	ldrb	r3, [r3, #0]
	lsl	r3, r3, #24
	asr	r3, r3, #24
	asr	r2, r3, #4
	mov	r3, r7
	add	r3, r3, #27
	strb	r2, [r3]
	.loc 1 329 0
	mov	r3, r7
	add	r3, r3, #26
	ldrb	r3, [r3, #0]
	lsl	r3, r3, #24
	asr	r3, r3, #24
	asr	r2, r3, #4
	mov	r3, r7
	add	r3, r3, #26
	strb	r2, [r3]
	.loc 1 331 0
	mov	r3, r7
	add	r3, r3, #26
	mov	r2, #0
	ldrsb	r2, [r3, r2]
	mov	r3, r7
	add	r3, r3, #25
	ldrb	r3, [r3]
	lsl	r2, r2, r3
	ldr	r3, [r7, #36]
	sub	r2, r2, r3
	ldr	r3, [r7, #36]
	asr	r3, r3, #4
	add	r3, r2, r3
	str	r3, [r7, #20]
	.loc 1 332 0
	ldr	r3, [r7, #32]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	asr	r3, r3, #16
	str	r3, [r7, #36]
	.loc 1 333 0
	ldr	r3, [r7, #32]
	mov	r2, #3
	bic	r3, r3, r2
	str	r3, [r7, #32]
	.loc 1 335 0
	ldr	r3, [r7, #32]
	lsl	r2, r3, #1
	ldr	r3, [r7, #20]
	add	r2, r2, r3
	ldr	r3, [r7, #32]
	asr	r3, r3, #5
	sub	r2, r2, r3
	ldr	r3, [r7, #32]
	asr	r3, r3, #4
	sub	r3, r2, r3
	str	r3, [r7, #32]
	ldr	r3, [r7, #32]
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [r7, #16]
	strh	r2, [r3]
	ldr	r3, [r7, #16]
	add	r3, r3, #2
	str	r3, [r7, #16]
	.loc 1 337 0
	mov	r3, r7
	add	r3, r3, #27
	mov	r2, #0
	ldrsb	r2, [r3, r2]
	mov	r3, r7
	add	r3, r3, #25
	ldrb	r3, [r3]
	lsl	r2, r2, r3
	ldr	r3, [r7, #36]
	sub	r2, r2, r3
	ldr	r3, [r7, #36]
	asr	r3, r3, #4
	add	r3, r2, r3
	str	r3, [r7, #20]
	.loc 1 338 0
	ldr	r3, [r7, #32]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	asr	r3, r3, #16
	str	r3, [r7, #36]
	.loc 1 339 0
	ldr	r3, [r7, #32]
	mov	r2, #3
	bic	r3, r3, r2
	str	r3, [r7, #32]
	.loc 1 341 0
	ldr	r3, [r7, #32]
	lsl	r2, r3, #1
	ldr	r3, [r7, #20]
	add	r2, r2, r3
	ldr	r3, [r7, #32]
	asr	r3, r3, #5
	sub	r2, r2, r3
	ldr	r3, [r7, #32]
	asr	r3, r3, #4
	sub	r3, r2, r3
	str	r3, [r7, #32]
	ldr	r3, [r7, #32]
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [r7, #16]
	strh	r2, [r3]
	ldr	r3, [r7, #16]
	add	r3, r3, #2
	str	r3, [r7, #16]
	.loc 1 324 0
	ldr	r3, [r7, #28]
	sub	r3, r3, #1
	str	r3, [r7, #28]
.L110:
	ldr	r3, [r7, #28]
	sub	r2, r3, #1
	sbc	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	beq	.LCB1766
	b	.L111	@long jump
.LCB1766:
	.loc 1 343 0
	b	.L100
.L104:
	.loc 1 345 0
	mov	r3, #8
	str	r3, [r7, #28]
	b	.L112
.L113:
	.loc 1 347 0
	mov	r3, r7
	add	r3, r3, #26
	ldr	r2, [r7, #8]
	ldrb	r2, [r2]
	strb	r2, [r3]
	ldr	r3, [r7, #8]
	add	r3, r3, #1
	str	r3, [r7, #8]
	.loc 1 348 0
	mov	r3, r7
	add	r3, r3, #26
	ldrb	r3, [r3, #0]
	lsl	r3, r3, #24
	asr	r3, r3, #24
	lsl	r2, r3, #4
	mov	r3, r7
	add	r3, r3, #27
	strb	r2, [r3]
	.loc 1 349 0
	mov	r3, r7
	add	r3, r3, #27
	ldrb	r3, [r3, #0]
	lsl	r3, r3, #24
	asr	r3, r3, #24
	asr	r2, r3, #4
	mov	r3, r7
	add	r3, r3, #27
	strb	r2, [r3]
	.loc 1 350 0
	mov	r3, r7
	add	r3, r3, #26
	ldrb	r3, [r3, #0]
	lsl	r3, r3, #24
	asr	r3, r3, #24
	asr	r2, r3, #4
	mov	r3, r7
	add	r3, r3, #26
	strb	r2, [r3]
	.loc 1 351 0
	mov	r3, r7
	add	r3, r3, #26
	mov	r2, #0
	ldrsb	r2, [r3, r2]
	mov	r3, r7
	add	r3, r3, #25
	ldrb	r3, [r3]
	mov	r1, r2
	lsl	r1, r1, r3
	mov	r3, r1
	str	r3, [r7, #20]
	.loc 1 353 0
	ldr	r2, [r7, #20]
	ldr	r3, [r7, #36]
	sub	r2, r2, r3
	ldr	r3, [r7, #36]
	asr	r3, r3, #3
	add	r2, r2, r3
	ldr	r3, [r7, #36]
	asr	r3, r3, #4
	add	r3, r2, r3
	str	r3, [r7, #20]
	.loc 1 354 0
	ldr	r3, [r7, #32]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	asr	r3, r3, #16
	str	r3, [r7, #36]
	.loc 1 355 0
	ldr	r3, [r7, #32]
	mov	r2, #3
	bic	r3, r3, r2
	str	r3, [r7, #32]
	.loc 1 357 0
	ldr	r3, [r7, #32]
	lsl	r2, r3, #1
	ldr	r3, [r7, #20]
	add	r2, r2, r3
	ldr	r3, [r7, #32]
	asr	r3, r3, #3
	sub	r2, r2, r3
	ldr	r3, [r7, #32]
	asr	r3, r3, #4
	sub	r2, r2, r3
	ldr	r3, [r7, #36]
	asr	r3, r3, #6
	sub	r3, r2, r3
	str	r3, [r7, #32]
	ldr	r3, [r7, #32]
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [r7, #16]
	strh	r2, [r3]
	ldr	r3, [r7, #16]
	add	r3, r3, #2
	str	r3, [r7, #16]
	.loc 1 359 0
	mov	r3, r7
	add	r3, r3, #27
	mov	r2, #0
	ldrsb	r2, [r3, r2]
	mov	r3, r7
	add	r3, r3, #25
	ldrb	r3, [r3]
	mov	r1, r2
	lsl	r1, r1, r3
	mov	r3, r1
	str	r3, [r7, #20]
	.loc 1 360 0
	ldr	r2, [r7, #20]
	ldr	r3, [r7, #36]
	sub	r2, r2, r3
	ldr	r3, [r7, #36]
	asr	r3, r3, #3
	add	r2, r2, r3
	ldr	r3, [r7, #36]
	asr	r3, r3, #4
	add	r3, r2, r3
	str	r3, [r7, #20]
	.loc 1 361 0
	ldr	r3, [r7, #32]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	asr	r3, r3, #16
	str	r3, [r7, #36]
	.loc 1 362 0
	ldr	r3, [r7, #32]
	mov	r2, #3
	bic	r3, r3, r2
	str	r3, [r7, #32]
	.loc 1 364 0
	ldr	r3, [r7, #32]
	lsl	r2, r3, #1
	ldr	r3, [r7, #20]
	add	r2, r2, r3
	ldr	r3, [r7, #32]
	asr	r3, r3, #3
	sub	r2, r2, r3
	ldr	r3, [r7, #32]
	asr	r3, r3, #4
	sub	r2, r2, r3
	ldr	r3, [r7, #36]
	asr	r3, r3, #6
	sub	r3, r2, r3
	str	r3, [r7, #32]
	ldr	r3, [r7, #32]
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [r7, #16]
	strh	r2, [r3]
	ldr	r3, [r7, #16]
	add	r3, r3, #2
	str	r3, [r7, #16]
	.loc 1 345 0
	ldr	r3, [r7, #28]
	sub	r3, r3, #1
	str	r3, [r7, #28]
.L112:
	ldr	r3, [r7, #28]
	sub	r2, r3, #1
	sbc	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	beq	.LCB1920
	b	.L113	@long jump
.LCB1920:
.L100:
	.loc 1 368 0
	ldr	r2, [r7, #4]
	mov	r3, #148
	ldr	r1, [r7, #32]
	str	r1, [r2, r3]
	.loc 1 369 0
	ldr	r2, [r7, #4]
	mov	r3, #152
	ldr	r1, [r7, #36]
	str	r1, [r2, r3]
	.loc 1 371 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #120]
	mov	r2, r3
	add	r2, r2, #9
	ldr	r3, [r7, #4]
	str	r2, [r3, #120]
.L114:
.LBE10:
	.loc 1 372 0
	mov	sp, r7
	add	sp, sp, #40
	@ sp needed for prologue
	pop	{r7, pc}
.LFE43:
	.cantunwind
	.fnend
	.size	_ZL11DecodeBlockP7Channel, .-_ZL11DecodeBlockP7Channel
	.align	2
	.code	16
	.thumb_func
	.type	_ZL9MixStereoi, %function
_ZL9MixStereoi:
	.fnstart
.LFB44:
	.loc 1 376 0
	.save	{r7, lr}
	push	{r7, lr}
.LCFI48:
	sub	sp, sp, #64
.LCFI49:
	add	r7, sp, #8
.LCFI50:
	str	r0, [r7, #4]
.LBB11:
	.loc 1 377 0
	ldr	r3, .L208
	ldr	r3, [r3, #32]
	mov	r2, r3
	ldr	r1, .L208+4
	mov	r3, #72
	ldrb	r3, [r1, r3]
	mvn	r3, r3
	and	r3, r3, r2
	str	r3, [r7, #8]
.LBB12:
	.loc 1 379 0
	mov	r3, #0
	str	r3, [r7, #12]
	bl	.L118	@ far jump
.L195:
.LBB13:
	.loc 1 382 0
	ldr	r3, [r7, #12]
	mov	r2, #212
	mul	r3, r2
	mov	r2, r3
	add	r2, r2, #48
	ldr	r3, .L208
	add	r3, r2, r3
	str	r3, [r7, #24]
	.loc 1 383 0
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #16]
	str	r3, [r7, #28]
	.loc 1 385 0
	ldr	r3, [r7, #24]
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.LCB1986
	bl	.L197	@far jump
.LCB1986:
	ldr	r3, .L208+8
	ldrb	r3, [r3, #6]
	mov	r2, r3
	ldr	r3, [r7, #12]
	asr	r2, r2, r3
	mov	r3, #1
	and	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r2, r3, #24
	mov	r3, #1
	eor	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	beq	.LCB2001
	bl	.L198	@far jump
.LCB2001:
.L120:
	.loc 1 390 0
	ldr	r3, [r7, #12]
	mov	r2, #1
	mov	r1, r2
	lsl	r1, r1, r3
	mov	r3, r1
	lsl	r3, r3, #24
	lsr	r2, r3, #24
	ldr	r3, [r7, #8]
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	and	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r2, r3, #24
	mov	r3, r7
	add	r3, r3, #35
	strb	r2, [r3]
	.loc 1 392 0
	ldr	r2, [r7, #24]
	mov	r3, #119
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	beq	.L122
	.loc 1 394 0
	ldr	r3, [r7, #24]
	mov	r0, r3
	bl	_ZL11DecodeBlockP7Channel
	.loc 1 395 0
	ldr	r2, [r7, #24]
	mov	r3, #119
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 1 396 0
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #112]
	ldrh	r1, [r3]
	ldr	r2, [r7, #24]
	mov	r3, #72
	strh	r1, [r2, r3]
	.loc 1 397 0
	ldr	r3, [r7, #28]
	lsr	r2, r3, #16
	ldr	r3, [r7, #24]
	str	r2, [r3, #124]
	.loc 1 398 0
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #124]
	cmp	r3, #0
	bne	.L123
	.loc 1 399 0
	ldr	r3, [r7, #24]
	mov	r2, #1
	str	r2, [r3, #124]
.L123:
	.loc 1 400 0
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #124]
	cmp	r3, #16
	bls	.L124
	.loc 1 401 0
	ldr	r3, [r7, #24]
	mov	r2, #15
	str	r2, [r3, #124]
.L124:
	.loc 1 403 0
	ldr	r3, [r7, #24]
	ldr	r2, [r3, #112]
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #124]
	lsl	r3, r3, #1
	add	r3, r2, r3
	ldrh	r1, [r3]
	ldr	r2, [r7, #24]
	mov	r3, #140
	strh	r1, [r2, r3]
	.loc 1 404 0
	ldr	r2, [r7, #24]
	mov	r3, #144
	mov	r1, #0
	str	r1, [r2, r3]
	.loc 1 406 0
	ldr	r2, .L208+12
	mov	r3, #109
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	beq	.L122
	ldr	r2, [r7, #28]
	ldr	r3, .L208+16
	cmp	r2, r3
	bhi	.L122
	mov	r3, r7
	add	r3, r3, #35
	ldrb	r3, [r3]
	cmp	r3, #0
	bne	.L122
	.loc 1 408 0
	ldr	r2, [r7, #24]
	mov	r3, #140
	ldrh	r3, [r2, r3]
	lsl	r3, r3, #16
	asr	r2, r3, #16
	ldr	r1, [r7, #24]
	mov	r3, #72
	ldrh	r3, [r1, r3]
	lsl	r3, r3, #16
	asr	r3, r3, #16
	sub	r3, r2, r3
	ldr	r2, [r7, #28]
	mul	r3, r2
	cmp	r3, #0
	bge	.L125
	ldr	r2, .L208+16
	add	r3, r3, r2
.L125:
	asr	r3, r3, #16
	mov	r1, r3
	ldr	r2, [r7, #24]
	mov	r3, #144
	str	r1, [r2, r3]
.L122:
	.loc 1 410 0
	ldr	r2, [r7, #24]
	mov	r3, #72
	ldrh	r3, [r2, r3]
	lsl	r3, r3, #16
	asr	r3, r3, #16
	ldr	r2, [r7, #24]
	ldrh	r2, [r2, #32]
	lsl	r2, r2, #16
	asr	r2, r2, #16
	mul	r3, r2
	cmp	r3, #0
	bge	.L126
	add	r3, r3, #127
.L126:
	asr	r3, r3, #7
	str	r3, [r7, #16]
	.loc 1 411 0
	ldr	r2, [r7, #24]
	mov	r3, #72
	ldrh	r3, [r2, r3]
	lsl	r3, r3, #16
	asr	r3, r3, #16
	ldr	r2, [r7, #24]
	ldrh	r2, [r2, #34]
	lsl	r2, r2, #16
	asr	r2, r2, #16
	mul	r3, r2
	cmp	r3, #0
	bge	.L127
	add	r3, r3, #127
.L127:
	asr	r3, r3, #7
	str	r3, [r7, #20]
.LBB14:
	.loc 1 413 0
	mov	r3, #0
	str	r3, [r7, #36]
	bl	.L128	@ far jump
.L194:
.LBB15:
	.loc 1 415 0
	ldr	r3, [r7, #28]
	str	r3, [r7, #40]
	.loc 1 417 0
	mov	r3, r7
	add	r3, r3, #35
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L129
	.loc 1 418 0
	ldr	r3, [r7, #36]
	lsr	r2, r3, #1
	ldr	r3, .L208+20
	lsl	r2, r2, #2
	ldr	r3, [r2, r3]
	mov	r1, #128
	lsl	r1, r1, #16
	add	r3, r3, r1
	lsr	r3, r3, #16
	ldr	r2, [r7, #40]
	mul	r3, r2
	lsr	r3, r3, #7
	str	r3, [r7, #40]
.L129:
	.loc 1 420 0
	ldr	r3, [r7, #24]
	ldr	r2, [r3, #40]
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #44]
	add	r2, r2, r3
	ldr	r3, [r7, #24]
	str	r2, [r3, #40]
	.loc 1 421 0
	ldr	r3, [r7, #24]
	ldr	r2, [r3, #40]
	ldr	r3, .L208+16
	cmp	r2, r3
	bhi	.LCB2188
	b	.L130	@long jump
.LCB2188:
.LBB16:
	.loc 1 423 0
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #40]
	lsr	r3, r3, #16
	str	r3, [r7, #44]
	.loc 1 425 0
	ldr	r3, [r7, #24]
	ldr	r3, [r3]
	cmp	r3, #9
	bls	.LCB2197
	b	.L131	@long jump
.LCB2197:
	lsl	r2, r3, #2
	ldr	r3, .L208+24
	add	r3, r2, r3
	ldr	r3, [r3]
	mov	pc, r3
	.section	.rodata
	.align	2
.L141:
	.word	.L131
	.word	.L132
	.word	.L144
	.word	.L148
	.word	.L151
	.word	.L136
	.word	.L137
	.word	.L138
	.word	.L139
	.word	.L161
	.text
.L132:
	.loc 1 428 0
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #40]
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [r7, #24]
	str	r2, [r3, #40]
	.loc 1 429 0
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #28]
	mov	r2, r3
	ldr	r3, [r7, #44]
	lsl	r3, r3, #1
	add	r3, r2, r3
	mov	r2, r3
	ldr	r3, [r7, #24]
	str	r2, [r3, #28]
	.loc 1 430 0
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #28]
	lsl	r1, r3, #24
	ldr	r2, [r7, #24]
	mov	r3, #136
	str	r1, [r2, r3]
	.loc 1 432 0
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #28]
	cmp	r3, #125
	bgt	.LCB2233
	b	.L199	@long jump
.LCB2233:
	.loc 1 434 0
	ldr	r3, [r7, #24]
	mov	r2, #127
	str	r2, [r3, #28]
	.loc 1 435 0
	ldr	r1, [r7, #24]
	mov	r2, #136
	mov	r3, #254
	lsl	r3, r3, #23
	str	r3, [r1, r2]
	.loc 1 436 0
	ldr	r3, [r7, #24]
	mov	r2, #2
	str	r2, [r3]
	.loc 1 437 0
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #68]
	cmp	r3, #8
	beq	.L143
	.loc 1 440 0
	ldr	r3, [r7, #24]
	ldr	r1, [r3, #56]
	ldr	r3, [r7, #24]
	ldr	r2, [r3, #68]
	mov	r3, r2
	lsl	r3, r3, #7
	sub	r3, r3, r2
	lsr	r3, r3, #3
	mov	ip, r3
	ldr	r0, [r7, #24]
	mov	r3, #1
	neg	r3, r3
	mov	r2, #128
	lsl	r2, r2, #21
	str	r2, [sp]
	mov	r2, r3
	mov	r3, ip
	bl	_ZL13S9xSetEnvRateP7Channelmiij
	.loc 1 441 0
	b	.L131
.L143:
	.loc 1 443 0
	ldr	r3, [r7, #24]
	mov	r2, #3
	str	r2, [r3]
	.loc 1 444 0
	ldr	r3, [r7, #24]
	ldr	r1, [r3, #60]
	ldr	r0, [r7, #24]
	mov	r3, #1
	neg	r3, r3
	mov	r2, #128
	lsl	r2, r2, #22
	str	r2, [sp]
	mov	r2, r3
	mov	r3, #0
	bl	_ZL13S9xSetEnvRateP7Channelmiij
	.loc 1 446 0
	b	.L131
.L145:
	.loc 1 451 0
	ldr	r2, [r7, #24]
	mov	r3, #136
	ldr	r3, [r2, r3]
	asr	r2, r3, #8
	mov	r3, r2
	lsl	r3, r3, #8
	sub	r1, r3, r2
	ldr	r2, [r7, #24]
	mov	r3, #136
	str	r1, [r2, r3]
	.loc 1 452 0
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #40]
	ldr	r1, .L208+28
	add	r2, r3, r1
	ldr	r3, [r7, #24]
	str	r2, [r3, #40]
.L144:
	.loc 1 449 0
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #40]
	ldr	r2, .L208+16
	cmp	r2, r3
	sbc	r3, r3, r3
	neg	r3, r3
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	bne	.L145
	.loc 1 454 0
	ldr	r2, [r7, #24]
	mov	r3, #136
	ldr	r3, [r2, r3]
	asr	r2, r3, #24
	ldr	r3, [r7, #24]
	str	r2, [r3, #28]
	.loc 1 455 0
	ldr	r3, [r7, #24]
	ldr	r2, [r3, #28]
	ldr	r3, [r7, #24]
	ldrh	r3, [r3, #36]
	lsl	r3, r3, #16
	asr	r3, r3, #16
	cmp	r2, r3
	ble	.LCB2329
	b	.L200	@long jump
.LCB2329:
	.loc 1 457 0
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #28]
	cmp	r3, #0
	bgt	.L147
	.loc 1 459 0
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #24]
	mov	r0, r2
	mov	r1, r3
	bl	_ZL20S9xAPUSetEndOfSampleiP7Channel
	.loc 1 460 0
	bl	.L121	@ far jump
.L147:
	.loc 1 462 0
	ldr	r3, [r7, #24]
	mov	r2, #3
	str	r2, [r3]
	.loc 1 463 0
	ldr	r3, [r7, #24]
	ldr	r1, [r3, #60]
	ldr	r0, [r7, #24]
	mov	r3, #1
	neg	r3, r3
	mov	r2, #128
	lsl	r2, r2, #22
	str	r2, [sp]
	mov	r2, r3
	mov	r3, #0
	bl	_ZL13S9xSetEnvRateP7Channelmiij
	.loc 1 465 0
	b	.L131
.L149:
	.loc 1 470 0
	ldr	r2, [r7, #24]
	mov	r3, #136
	ldr	r3, [r2, r3]
	asr	r2, r3, #8
	mov	r3, r2
	lsl	r3, r3, #8
	sub	r1, r3, r2
	ldr	r2, [r7, #24]
	mov	r3, #136
	str	r1, [r2, r3]
	.loc 1 471 0
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #40]
	ldr	r1, .L208+28
	add	r2, r3, r1
	ldr	r3, [r7, #24]
	str	r2, [r3, #40]
.L148:
	.loc 1 468 0
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #40]
	ldr	r2, .L208+16
	cmp	r2, r3
	sbc	r3, r3, r3
	neg	r3, r3
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	bne	.L149
	.loc 1 473 0
	ldr	r2, [r7, #24]
	mov	r3, #136
	ldr	r3, [r2, r3]
	asr	r2, r3, #24
	ldr	r3, [r7, #24]
	str	r2, [r3, #28]
	.loc 1 474 0
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #28]
	cmp	r3, #0
	ble	.LCB2397
	b	.L201	@long jump
.LCB2397:
	.loc 1 476 0
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #24]
	mov	r0, r2
	mov	r1, r3
	bl	_ZL20S9xAPUSetEndOfSampleiP7Channel
	.loc 1 477 0
	b	.L121
.L209:
	.align	2
.L208:
	.word	SoundData
	.word	APU
	.word	so
	.word	Settings
	.word	65535
	.word	_ZL4wave
	.word	.L141
	.word	-65536
.L152:
	.loc 1 484 0
	ldr	r2, [r7, #24]
	mov	r3, #136
	ldr	r3, [r2, r3]
	ldr	r2, .L210
	add	r1, r3, r2
	ldr	r2, [r7, #24]
	mov	r3, #136
	str	r1, [r2, r3]
	.loc 1 485 0
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #40]
	ldr	r1, .L210+4
	add	r2, r3, r1
	ldr	r3, [r7, #24]
	str	r2, [r3, #40]
.L151:
	.loc 1 482 0
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #40]
	ldr	r2, .L210+8
	cmp	r2, r3
	sbc	r3, r3, r3
	neg	r3, r3
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	bne	.L152
	.loc 1 487 0
	ldr	r2, [r7, #24]
	mov	r3, #136
	ldr	r3, [r2, r3]
	asr	r2, r3, #24
	ldr	r3, [r7, #24]
	str	r2, [r3, #28]
	.loc 1 488 0
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #28]
	cmp	r3, #0
	ble	.LCB2454
	b	.L202	@long jump
.LCB2454:
	.loc 1 490 0
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #24]
	mov	r0, r2
	mov	r1, r3
	bl	_ZL20S9xAPUSetEndOfSampleiP7Channel
	.loc 1 491 0
	b	.L121
.L137:
	.loc 1 496 0
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #40]
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [r7, #24]
	str	r2, [r3, #40]
	.loc 1 497 0
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #28]
	mov	r2, r3
	ldr	r3, [r7, #44]
	lsl	r3, r3, #1
	add	r3, r2, r3
	mov	r2, r3
	ldr	r3, [r7, #24]
	str	r2, [r3, #28]
	.loc 1 498 0
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #28]
	lsl	r1, r3, #24
	ldr	r2, [r7, #24]
	mov	r3, #136
	str	r1, [r2, r3]
	.loc 1 500 0
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #28]
	cmp	r3, #125
	bgt	.LCB2488
	b	.L203	@long jump
.LCB2488:
	.loc 1 502 0
	ldr	r3, [r7, #24]
	mov	r2, #127
	str	r2, [r3, #28]
	.loc 1 503 0
	ldr	r1, [r7, #24]
	mov	r2, #136
	mov	r3, #254
	lsl	r3, r3, #23
	str	r3, [r1, r2]
	.loc 1 504 0
	ldr	r3, [r7, #24]
	mov	r2, #5
	str	r2, [r3]
	.loc 1 505 0
	ldr	r2, [r7, #24]
	mov	r3, #132
	mov	r1, #5
	str	r1, [r2, r3]
	.loc 1 506 0
	ldr	r2, [r7, #24]
	mov	r3, #1
	neg	r3, r3
	mov	r1, #0
	str	r1, [sp]
	mov	r0, r2
	mov	r1, #0
	mov	r2, r3
	mov	r3, #0
	bl	_ZL13S9xSetEnvRateP7Channelmiij
	.loc 1 508 0
	b	.L131
.L138:
	.loc 1 511 0
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #28]
	cmp	r3, #94
	ble	.L155
	.loc 1 513 0
	b	.L156
.L157:
	.loc 1 515 0
	ldr	r2, [r7, #24]
	mov	r3, #136
	ldr	r3, [r2, r3]
	mov	r2, #254
	lsl	r2, r2, #15
	add	r1, r3, r2
	ldr	r2, [r7, #24]
	mov	r3, #136
	str	r1, [r2, r3]
	.loc 1 516 0
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #40]
	ldr	r1, .L210+4
	add	r2, r3, r1
	ldr	r3, [r7, #24]
	str	r2, [r3, #40]
.L156:
	.loc 1 513 0
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #40]
	ldr	r2, .L210+8
	cmp	r2, r3
	sbc	r3, r3, r3
	neg	r3, r3
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	bne	.L157
	.loc 1 518 0
	ldr	r2, [r7, #24]
	mov	r3, #136
	ldr	r3, [r2, r3]
	asr	r2, r3, #24
	ldr	r3, [r7, #24]
	str	r2, [r3, #28]
	b	.L158
.L155:
	.loc 1 522 0
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #40]
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [r7, #24]
	str	r2, [r3, #40]
	.loc 1 523 0
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #28]
	mov	r2, r3
	ldr	r3, [r7, #44]
	lsl	r3, r3, #1
	add	r3, r2, r3
	mov	r2, r3
	ldr	r3, [r7, #24]
	str	r2, [r3, #28]
	.loc 1 524 0
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #28]
	lsl	r1, r3, #24
	ldr	r2, [r7, #24]
	mov	r3, #136
	str	r1, [r2, r3]
.L158:
	.loc 1 527 0
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #28]
	cmp	r3, #125
	bgt	.LCB2588
	b	.L204	@long jump
.LCB2588:
	.loc 1 529 0
	ldr	r3, [r7, #24]
	mov	r2, #127
	str	r2, [r3, #28]
	.loc 1 530 0
	ldr	r1, [r7, #24]
	mov	r2, #136
	mov	r3, #254
	lsl	r3, r3, #23
	str	r3, [r1, r2]
	.loc 1 531 0
	ldr	r3, [r7, #24]
	mov	r2, #5
	str	r2, [r3]
	.loc 1 532 0
	ldr	r2, [r7, #24]
	mov	r3, #132
	mov	r1, #5
	str	r1, [r2, r3]
	.loc 1 533 0
	ldr	r2, [r7, #24]
	mov	r3, #1
	neg	r3, r3
	mov	r1, #0
	str	r1, [sp]
	mov	r0, r2
	mov	r1, #0
	mov	r2, r3
	mov	r3, #0
	bl	_ZL13S9xSetEnvRateP7Channelmiij
	.loc 1 535 0
	b	.L131
.L139:
	.loc 1 538 0
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #40]
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [r7, #24]
	str	r2, [r3, #40]
	.loc 1 539 0
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #28]
	mov	r2, r3
	ldr	r3, [r7, #44]
	lsl	r3, r3, #1
	sub	r3, r2, r3
	mov	r2, r3
	ldr	r3, [r7, #24]
	str	r2, [r3, #28]
	.loc 1 540 0
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #28]
	lsl	r1, r3, #24
	ldr	r2, [r7, #24]
	mov	r3, #136
	str	r1, [r2, r3]
	.loc 1 541 0
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #28]
	cmp	r3, #0
	bgt	.L205
	.loc 1 543 0
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #24]
	mov	r0, r2
	mov	r1, r3
	bl	_ZL20S9xAPUSetEndOfSampleiP7Channel
	.loc 1 544 0
	b	.L121
.L162:
	.loc 1 551 0
	ldr	r2, [r7, #24]
	mov	r3, #136
	ldr	r3, [r2, r3]
	asr	r2, r3, #8
	mov	r3, r2
	lsl	r3, r3, #8
	sub	r1, r3, r2
	ldr	r2, [r7, #24]
	mov	r3, #136
	str	r1, [r2, r3]
	.loc 1 552 0
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #40]
	ldr	r1, .L210+4
	add	r2, r3, r1
	ldr	r3, [r7, #24]
	str	r2, [r3, #40]
.L161:
	.loc 1 549 0
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #40]
	ldr	r2, .L210+8
	cmp	r2, r3
	sbc	r3, r3, r3
	neg	r3, r3
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	bne	.L162
	.loc 1 554 0
	ldr	r2, [r7, #24]
	mov	r3, #136
	ldr	r3, [r2, r3]
	asr	r2, r3, #24
	ldr	r3, [r7, #24]
	str	r2, [r3, #28]
	.loc 1 555 0
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #28]
	cmp	r3, #0
	bgt	.L206
	.loc 1 557 0
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #24]
	mov	r0, r2
	mov	r1, r3
	bl	_ZL20S9xAPUSetEndOfSampleiP7Channel
	.loc 1 558 0
	b	.L121
.L136:
	.loc 1 563 0
	ldr	r2, [r7, #24]
	mov	r3, #1
	neg	r3, r3
	mov	r1, #0
	str	r1, [sp]
	mov	r0, r2
	mov	r1, #0
	mov	r2, r3
	mov	r3, #0
	bl	_ZL13S9xSetEnvRateP7Channelmiij
	b	.L131
.L199:
	.loc 1 446 0
	mov	r8, r8
	b	.L131
.L200:
	.loc 1 465 0
	mov	r8, r8
	b	.L131
.L201:
	.loc 1 479 0
	mov	r8, r8
	b	.L131
.L202:
	.loc 1 493 0
	mov	r8, r8
	b	.L131
.L203:
	.loc 1 508 0
	mov	r8, r8
	b	.L131
.L204:
	.loc 1 535 0
	mov	r8, r8
	b	.L131
.L205:
	.loc 1 546 0
	mov	r8, r8
	b	.L131
.L206:
	.loc 1 560 0
	mov	r8, r8
.L131:
	.loc 1 566 0
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #28]
	ldr	r2, [r7, #24]
	ldrh	r2, [r2, #8]
	lsl	r2, r2, #16
	asr	r2, r2, #16
	mul	r3, r2
	cmp	r3, #0
	bge	.L164
	add	r3, r3, #127
.L164:
	asr	r3, r3, #7
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [r7, #24]
	strh	r2, [r3, #32]
	.loc 1 567 0
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #28]
	ldr	r2, [r7, #24]
	ldrh	r2, [r2, #10]
	lsl	r2, r2, #16
	asr	r2, r2, #16
	mul	r3, r2
	cmp	r3, #0
	bge	.L165
	add	r3, r3, #127
.L165:
	asr	r3, r3, #7
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [r7, #24]
	strh	r2, [r3, #34]
	.loc 1 568 0
	ldr	r2, [r7, #24]
	mov	r3, #72
	ldrh	r3, [r2, r3]
	lsl	r3, r3, #16
	asr	r3, r3, #16
	ldr	r2, [r7, #24]
	ldrh	r2, [r2, #32]
	lsl	r2, r2, #16
	asr	r2, r2, #16
	mul	r3, r2
	cmp	r3, #0
	bge	.L166
	add	r3, r3, #127
.L166:
	asr	r3, r3, #7
	str	r3, [r7, #16]
	.loc 1 569 0
	ldr	r2, [r7, #24]
	mov	r3, #72
	ldrh	r3, [r2, r3]
	lsl	r3, r3, #16
	asr	r3, r3, #16
	ldr	r2, [r7, #24]
	ldrh	r2, [r2, #34]
	lsl	r2, r2, #16
	asr	r2, r2, #16
	mul	r3, r2
	cmp	r3, #0
	bge	.L167
	add	r3, r3, #127
.L167:
	asr	r3, r3, #7
	str	r3, [r7, #20]
.L130:
.LBE16:
	.loc 1 572 0
	ldr	r3, [r7, #24]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #40]
	add	r2, r2, r3
	ldr	r3, [r7, #24]
	str	r2, [r3, #20]
	.loc 1 573 0
	ldr	r3, [r7, #24]
	ldr	r2, [r3, #20]
	ldr	r3, .L210+8
	cmp	r2, r3
	bhi	.LCB2831
	b	.L168	@long jump
.LCB2831:
	.loc 1 575 0
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #20]
	lsr	r3, r3, #16
	str	r3, [r7, #16]
	.loc 1 576 0
	ldr	r3, [r7, #24]
	ldr	r2, [r3, #124]
	ldr	r3, [r7, #16]
	add	r2, r2, r3
	ldr	r3, [r7, #24]
	str	r2, [r3, #124]
	.loc 1 577 0
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #20]
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [r7, #24]
	str	r2, [r3, #20]
	.loc 1 579 0
	ldr	r2, [r7, #24]
	mov	r3, #140
	ldrh	r1, [r2, r3]
	ldr	r2, [r7, #24]
	mov	r3, #72
	strh	r1, [r2, r3]
	.loc 1 580 0
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #124]
	cmp	r3, #15
	bls	.L169
	.loc 1 582 0
	ldr	r3, [r7, #24]
	ldr	r2, [r3, #124]
	ldr	r3, .L210+12
	cmp	r2, r3
	bls	.L170
	.loc 1 584 0
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #24]
	mov	r0, r2
	mov	r1, r3
	bl	_ZL20S9xAPUSetEndOfSampleiP7Channel
	.loc 1 585 0
	b	.L121
.L170:
	.loc 1 589 0
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #124]
	mov	r2, r3
	sub	r2, r2, #16
	ldr	r3, [r7, #24]
	str	r2, [r3, #124]
	.loc 1 590 0
	ldr	r2, [r7, #24]
	mov	r3, #118
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	beq	.L171
	.loc 1 592 0
	ldr	r3, [r7, #24]
	ldrb	r3, [r3, #24]
	cmp	r3, #0
	bne	.L172
	.loc 1 594 0
	ldr	r3, [r7, #24]
	ldr	r2, .L210+16
	str	r2, [r3, #124]
	.loc 1 595 0
	ldr	r2, [r7, #24]
	mov	r3, #72
	ldrh	r1, [r2, r3]
	ldr	r2, [r7, #24]
	mov	r3, #140
	strh	r1, [r2, r3]
	.loc 1 596 0
	b	.L173
.L211:
	.align	2
.L210:
	.word	-8323072
	.word	-65536
	.word	65535
	.word	16777214
	.word	16777215
.L172:
.LBB17:
	.loc 1 600 0
	ldr	r3, [r7, #12]
	mov	r0, r3
	bl	_ZL13S9xAPUSetEndXi
	.loc 1 601 0
	ldr	r2, [r7, #24]
	mov	r3, #118
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 1 602 0
	ldr	r2, [r7, #24]
	mov	r3, #116
	ldrh	r3, [r2, r3]
	mov	r0, r3
	bl	_ZL19S9xGetSampleAddressi
	mov	r3, r0
	str	r3, [r7, #48]
	.loc 1 603 0
	ldr	r3, [r7, #48]
	add	r3, r3, #2
	ldrh	r3, [r3]
	mov	r2, r3
	ldr	r3, [r7, #24]
	str	r2, [r3, #120]
.L171:
.LBE17:
	.loc 1 606 0
	ldr	r3, [r7, #24]
	mov	r0, r3
	bl	_ZL11DecodeBlockP7Channel
	.loc 1 587 0
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #124]
	mov	r2, #15
	cmp	r2, r3
	sbc	r3, r3, r3
	neg	r3, r3
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	bne	.L170
.L173:
	.loc 1 608 0
	ldr	r3, [r7, #24]
	ldr	r2, [r3, #124]
	ldr	r3, .L212
	cmp	r2, r3
	bhi	.L207
	.loc 1 609 0
	ldr	r3, [r7, #24]
	ldr	r2, [r3, #112]
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #124]
	lsl	r3, r3, #1
	add	r3, r2, r3
	ldrh	r1, [r3]
	ldr	r2, [r7, #24]
	mov	r3, #140
	strh	r1, [r2, r3]
	b	.L175
.L169:
	.loc 1 612 0
	ldr	r3, [r7, #24]
	ldr	r2, [r3, #112]
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #124]
	lsl	r3, r3, #1
	add	r3, r2, r3
	ldrh	r1, [r3]
	ldr	r2, [r7, #24]
	mov	r3, #140
	strh	r1, [r2, r3]
	b	.L175
.L207:
	.loc 1 609 0
	mov	r8, r8
.L175:
	.loc 1 614 0
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	bne	.L182
	.loc 1 616 0
	ldr	r2, .L212+4
	mov	r3, #109
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	beq	.L177
	ldr	r2, [r7, #40]
	ldr	r3, .L212+8
	cmp	r2, r3
	bhi	.L177
	mov	r3, r7
	add	r3, r3, #35
	ldrb	r3, [r3]
	cmp	r3, #0
	bne	.L177
	.loc 1 619 0
	ldr	r2, [r7, #24]
	mov	r3, #140
	ldrh	r3, [r2, r3]
	lsl	r3, r3, #16
	asr	r2, r3, #16
	ldr	r1, [r7, #24]
	mov	r3, #72
	ldrh	r3, [r1, r3]
	lsl	r3, r3, #16
	asr	r3, r3, #16
	sub	r3, r2, r3
	ldr	r2, [r7, #40]
	mul	r3, r2
	cmp	r3, #0
	bge	.L178
	ldr	r2, .L212+8
	add	r3, r3, r2
.L178:
	asr	r3, r3, #16
	mov	r1, r3
	ldr	r2, [r7, #24]
	mov	r3, #144
	str	r1, [r2, r3]
	.loc 1 621 0
	ldr	r2, [r7, #24]
	mov	r3, #72
	ldrh	r3, [r2, r3]
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r1, [r7, #24]
	mov	r3, #140
	ldrh	r3, [r1, r3]
	lsl	r3, r3, #16
	asr	r1, r3, #16
	ldr	r0, [r7, #24]
	mov	r3, #72
	ldrh	r3, [r0, r3]
	lsl	r3, r3, #16
	asr	r3, r3, #16
	sub	r1, r1, r3
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #20]
	mul	r3, r1
	cmp	r3, #0
	bge	.L179
	ldr	r1, .L212+8
	add	r3, r3, r1
.L179:
	asr	r3, r3, #16
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	mov	r1, r3
	ldr	r2, [r7, #24]
	mov	r3, #72
	strh	r1, [r2, r3]
	.loc 1 616 0
	mov	r8, r8
	b	.L181
.L177:
	.loc 1 624 0
	ldr	r2, [r7, #24]
	mov	r3, #144
	mov	r1, #0
	str	r1, [r2, r3]
	b	.L181
.L184:
	.loc 1 629 0
	ldr	r3, .L212+12
	ldr	r3, [r3, #8]
	lsl	r2, r3, #1
	ldr	r3, .L212+12
	str	r2, [r3, #8]
	ldr	r3, .L212+12
	ldr	r3, [r3, #8]
	lsr	r3, r3, #31
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	beq	.L183
	.loc 1 630 0
	ldr	r3, .L212+12
	ldr	r2, [r3, #8]
	ldr	r3, .L212+16
	eor	r2, r2, r3
	ldr	r3, .L212+12
	str	r2, [r3, #8]
.L183:
	.loc 1 628 0
	ldr	r3, [r7, #16]
	sub	r3, r3, #1
	str	r3, [r7, #16]
.L182:
	ldr	r3, [r7, #16]
	asr	r2, r3, #31
	sub	r3, r2, r3
	lsr	r3, r3, #31
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	bne	.L184
	.loc 1 631 0
	ldr	r3, .L212+12
	ldr	r3, [r3, #8]
	lsl	r3, r3, #17
	asr	r3, r3, #17
	lsl	r3, r3, #16
	lsr	r1, r3, #16
	ldr	r2, [r7, #24]
	mov	r3, #72
	strh	r1, [r2, r3]
	.loc 1 632 0
	ldr	r2, [r7, #24]
	mov	r3, #144
	mov	r1, #0
	str	r1, [r2, r3]
.L181:
	.loc 1 635 0
	ldr	r2, [r7, #24]
	mov	r3, #72
	ldrh	r3, [r2, r3]
	lsl	r3, r3, #16
	asr	r3, r3, #16
	ldr	r2, [r7, #24]
	ldrh	r2, [r2, #32]
	lsl	r2, r2, #16
	asr	r2, r2, #16
	mul	r3, r2
	cmp	r3, #0
	bge	.L185
	add	r3, r3, #127
.L185:
	asr	r3, r3, #7
	str	r3, [r7, #16]
	.loc 1 636 0
	ldr	r2, [r7, #24]
	mov	r3, #72
	ldrh	r3, [r2, r3]
	lsl	r3, r3, #16
	asr	r3, r3, #16
	ldr	r2, [r7, #24]
	ldrh	r2, [r2, #34]
	lsl	r2, r2, #16
	asr	r2, r2, #16
	mul	r3, r2
	cmp	r3, #0
	bge	.L186
	add	r3, r3, #127
.L186:
	asr	r3, r3, #7
	str	r3, [r7, #20]
	b	.L187
.L168:
	.loc 1 640 0
	ldr	r2, [r7, #24]
	mov	r3, #144
	ldr	r3, [r2, r3]
	cmp	r3, #0
	beq	.L187
.LBB18:
	.loc 1 642 0
	ldr	r2, [r7, #24]
	mov	r3, #72
	ldrh	r3, [r2, r3]
	lsl	r3, r3, #16
	asr	r2, r3, #16
	ldr	r1, [r7, #24]
	mov	r3, #144
	ldr	r3, [r1, r3]
	add	r3, r2, r3
	str	r3, [r7, #52]
	.loc 1 644 0
	ldr	r2, [r7, #52]
	ldr	r3, .L212+20
	cmp	r2, r3
	bge	.L188
	ldr	r3, .L212+20
	str	r3, [r7, #52]
	b	.L189
.L188:
	ldr	r2, [r7, #52]
	ldr	r3, .L212+24
	cmp	r2, r3
	ble	.L189
	ldr	r3, .L212+24
	str	r3, [r7, #52]
.L189:
	.loc 1 645 0
	ldr	r3, [r7, #52]
	lsl	r3, r3, #16
	lsr	r1, r3, #16
	ldr	r2, [r7, #24]
	mov	r3, #72
	strh	r1, [r2, r3]
	.loc 1 646 0
	ldr	r2, [r7, #24]
	mov	r3, #72
	ldrh	r3, [r2, r3]
	lsl	r3, r3, #16
	asr	r3, r3, #16
	ldr	r2, [r7, #24]
	ldrh	r2, [r2, #32]
	lsl	r2, r2, #16
	asr	r2, r2, #16
	mul	r3, r2
	cmp	r3, #0
	bge	.L190
	add	r3, r3, #127
.L190:
	asr	r3, r3, #7
	str	r3, [r7, #16]
	.loc 1 647 0
	ldr	r2, [r7, #24]
	mov	r3, #72
	ldrh	r3, [r2, r3]
	lsl	r3, r3, #16
	asr	r3, r3, #16
	ldr	r2, [r7, #24]
	ldrh	r2, [r2, #34]
	lsl	r2, r2, #16
	asr	r2, r2, #16
	mul	r3, r2
	cmp	r3, #0
	bge	.L191
	add	r3, r3, #127
.L191:
	asr	r3, r3, #7
	str	r3, [r7, #20]
.L187:
.LBE18:
	.loc 1 651 0
	ldr	r3, [r7, #12]
	add	r3, r3, #1
	ldr	r2, [r7, #8]
	asr	r2, r2, r3
	mov	r3, #1
	and	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	beq	.L192
	.loc 1 652 0
	ldr	r3, [r7, #36]
	lsr	r2, r3, #1
	ldr	r1, [r7, #24]
	mov	r3, #72
	ldrh	r3, [r1, r3]
	lsl	r3, r3, #16
	asr	r1, r3, #16
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #28]
	mul	r1, r3
	ldr	r3, .L212+28
	lsl	r2, r2, #2
	str	r1, [r2, r3]
.L192:
	.loc 1 654 0
	ldr	r2, [r7, #36]
	ldr	r1, [r7, #36]
	ldr	r3, .L212+32
	lsl	r1, r1, #2
	ldr	r1, [r1, r3]
	ldr	r3, [r7, #16]
	add	r1, r1, r3
	ldr	r3, .L212+32
	lsl	r2, r2, #2
	str	r1, [r2, r3]
	.loc 1 655 0
	ldr	r3, [r7, #36]
	add	r2, r3, #1
	ldr	r3, [r7, #36]
	add	r1, r3, #1
	ldr	r3, .L212+32
	lsl	r1, r1, #2
	ldr	r1, [r1, r3]
	ldr	r3, [r7, #20]
	add	r1, r1, r3
	ldr	r3, .L212+32
	lsl	r2, r2, #2
	str	r1, [r2, r3]
	.loc 1 656 0
	ldr	r2, [r7, #24]
	mov	r3, #128
	ldr	r3, [r2, r3]
	cmp	r3, #0
	beq	.L193
	.loc 1 658 0
	ldr	r2, [r7, #24]
	mov	r3, #128
	ldr	r2, [r2, r3]
	ldr	r3, [r7, #36]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r1, [r7, #24]
	mov	r2, #128
	ldr	r1, [r1, r2]
	ldr	r2, [r7, #36]
	lsl	r2, r2, #2
	add	r2, r1, r2
	ldr	r1, [r2]
	ldr	r2, [r7, #16]
	add	r2, r1, r2
	str	r2, [r3]
	.loc 1 659 0
	ldr	r2, [r7, #24]
	mov	r3, #128
	ldr	r2, [r2, r3]
	ldr	r3, [r7, #36]
	add	r3, r3, #1
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r1, [r7, #24]
	mov	r2, #128
	ldr	r1, [r1, r2]
	ldr	r2, [r7, #36]
	add	r2, r2, #1
	lsl	r2, r2, #2
	add	r2, r1, r2
	ldr	r1, [r2]
	ldr	r2, [r7, #20]
	add	r2, r1, r2
	str	r2, [r3]
.L193:
.LBE15:
	.loc 1 413 0
	ldr	r3, [r7, #36]
	add	r3, r3, #2
	str	r3, [r7, #36]
.L128:
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #36]
	cmp	r2, r3
	sbc	r3, r3, r3
	neg	r3, r3
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	beq	.LCB3337
	bl	.L194	@far jump
.LCB3337:
	b	.L121
.L197:
.LBE14:
	.loc 1 386 0
	mov	r8, r8
	b	.L121
.L198:
	mov	r8, r8
.L121:
.LBE13:
	.loc 1 379 0
	ldr	r3, [r7, #12]
	add	r3, r3, #1
	str	r3, [r7, #12]
.L118:
	ldr	r2, [r7, #12]
	mov	r1, #7
	mov	r3, #0
	cmp	r1, r2
	adc	r3, r3, r3
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	beq	.LCB3364
	bl	.L195	@far jump
.LCB3364:
.LBE12:
.LBE11:
	.loc 1 664 0
	mov	sp, r7
	add	sp, sp, #56
	@ sp needed for prologue
	pop	{r7, pc}
.L213:
	.align	2
.L212:
	.word	16777214
	.word	Settings
	.word	65535
	.word	so
	.word	262145
	.word	-32768
	.word	32767
	.word	_ZL4wave
	.word	MixBuffer
.LFE44:
	.cantunwind
	.fnend
	.size	_ZL9MixStereoi, .-_ZL9MixStereoi
	.align	2
	.code	16
	.thumb_func
	.type	_ZL7MixMonoi, %function
_ZL7MixMonoi:
	.fnstart
.LFB45:
	.loc 1 667 0
	.save	{r7, lr}
	push	{r7, lr}
.LCFI51:
	sub	sp, sp, #64
.LCFI52:
	add	r7, sp, #8
.LCFI53:
	str	r0, [r7, #4]
.LBB19:
	.loc 1 668 0
	ldr	r3, .L300
	ldr	r3, [r3, #32]
	mov	r2, r3
	ldr	r1, .L300+4
	mov	r3, #72
	ldrb	r3, [r1, r3]
	mvn	r3, r3
	and	r3, r3, r2
	str	r3, [r7, #12]
.LBB20:
	.loc 1 670 0
	mov	r3, #0
	str	r3, [r7, #16]
	bl	.L215	@ far jump
.L287:
.LBB21:
	.loc 1 672 0
	ldr	r3, [r7, #16]
	mov	r2, #212
	mul	r3, r2
	mov	r2, r3
	add	r2, r2, #48
	ldr	r3, .L300
	add	r3, r2, r3
	str	r3, [r7, #20]
	.loc 1 673 0
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #16]
	str	r3, [r7, #24]
	.loc 1 675 0
	ldr	r3, [r7, #20]
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.LCB3428
	bl	.L289	@far jump
.LCB3428:
	ldr	r3, .L300+8
	ldrb	r3, [r3, #6]
	mov	r2, r3
	ldr	r3, [r7, #16]
	asr	r2, r2, r3
	mov	r3, #1
	and	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r2, r3, #24
	mov	r3, #1
	eor	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	beq	.LCB3443
	bl	.L290	@far jump
.LCB3443:
.L217:
	.loc 1 680 0
	ldr	r3, [r7, #16]
	mov	r2, #1
	mov	r1, r2
	lsl	r1, r1, r3
	mov	r3, r1
	lsl	r3, r3, #24
	lsr	r2, r3, #24
	ldr	r3, [r7, #12]
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	and	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r2, r3, #24
	mov	r3, r7
	add	r3, r3, #31
	strb	r2, [r3]
	.loc 1 682 0
	ldr	r2, [r7, #20]
	mov	r3, #119
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	beq	.L219
	.loc 1 684 0
	ldr	r3, [r7, #20]
	mov	r0, r3
	bl	_ZL11DecodeBlockP7Channel
	.loc 1 685 0
	ldr	r2, [r7, #20]
	mov	r3, #119
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 1 686 0
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #112]
	ldrh	r1, [r3]
	ldr	r2, [r7, #20]
	mov	r3, #72
	strh	r1, [r2, r3]
	.loc 1 687 0
	ldr	r3, [r7, #24]
	lsr	r2, r3, #16
	ldr	r3, [r7, #20]
	str	r2, [r3, #124]
	.loc 1 688 0
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #124]
	cmp	r3, #0
	bne	.L220
	.loc 1 689 0
	ldr	r3, [r7, #20]
	mov	r2, #1
	str	r2, [r3, #124]
.L220:
	.loc 1 690 0
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #124]
	cmp	r3, #16
	bls	.L221
	.loc 1 691 0
	ldr	r3, [r7, #20]
	mov	r2, #15
	str	r2, [r3, #124]
.L221:
	.loc 1 692 0
	ldr	r3, [r7, #20]
	ldr	r2, [r3, #112]
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #124]
	lsl	r3, r3, #1
	add	r3, r2, r3
	ldrh	r1, [r3]
	ldr	r2, [r7, #20]
	mov	r3, #140
	strh	r1, [r2, r3]
	.loc 1 693 0
	ldr	r2, [r7, #20]
	mov	r3, #144
	mov	r1, #0
	str	r1, [r2, r3]
	.loc 1 695 0
	ldr	r2, .L300+12
	mov	r3, #109
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	beq	.L219
	ldr	r2, [r7, #24]
	ldr	r3, .L300+16
	cmp	r2, r3
	bhi	.L219
	mov	r3, r7
	add	r3, r3, #31
	ldrb	r3, [r3]
	cmp	r3, #0
	bne	.L219
	.loc 1 697 0
	ldr	r2, [r7, #20]
	mov	r3, #140
	ldrh	r3, [r2, r3]
	lsl	r3, r3, #16
	asr	r2, r3, #16
	ldr	r1, [r7, #20]
	mov	r3, #72
	ldrh	r3, [r1, r3]
	lsl	r3, r3, #16
	asr	r3, r3, #16
	sub	r3, r2, r3
	ldr	r2, [r7, #24]
	mul	r3, r2
	cmp	r3, #0
	bge	.L222
	ldr	r2, .L300+16
	add	r3, r3, r2
.L222:
	asr	r3, r3, #16
	mov	r1, r3
	ldr	r2, [r7, #20]
	mov	r3, #144
	str	r1, [r2, r3]
.L219:
	.loc 1 699 0
	ldr	r2, [r7, #20]
	mov	r3, #72
	ldrh	r3, [r2, r3]
	lsl	r3, r3, #16
	asr	r3, r3, #16
	ldr	r2, [r7, #20]
	ldrh	r2, [r2, #32]
	lsl	r2, r2, #16
	asr	r2, r2, #16
	mul	r3, r2
	cmp	r3, #0
	bge	.L223
	add	r3, r3, #127
.L223:
	asr	r3, r3, #7
	str	r3, [r7, #32]
.LBB22:
	.loc 1 701 0
	mov	r3, #0
	str	r3, [r7, #36]
	bl	.L224	@ far jump
.L286:
.LBB23:
	.loc 1 703 0
	ldr	r3, [r7, #24]
	str	r3, [r7, #40]
	.loc 1 705 0
	mov	r3, r7
	add	r3, r3, #31
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L225
	.loc 1 706 0
	ldr	r2, [r7, #36]
	ldr	r3, .L300+20
	lsl	r2, r2, #2
	ldr	r3, [r2, r3]
	mov	r1, #128
	lsl	r1, r1, #16
	add	r3, r3, r1
	lsr	r3, r3, #16
	ldr	r2, [r7, #40]
	mul	r3, r2
	lsr	r3, r3, #7
	str	r3, [r7, #40]
.L225:
	.loc 1 708 0
	ldr	r3, [r7, #20]
	ldr	r2, [r3, #40]
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #44]
	add	r2, r2, r3
	ldr	r3, [r7, #20]
	str	r2, [r3, #40]
	.loc 1 709 0
	ldr	r3, [r7, #20]
	ldr	r2, [r3, #40]
	ldr	r3, .L300+16
	cmp	r2, r3
	bhi	.LCB3612
	b	.L226	@long jump
.LCB3612:
.LBB24:
	.loc 1 711 0
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #40]
	lsr	r3, r3, #16
	str	r3, [r7, #44]
	.loc 1 713 0
	ldr	r3, [r7, #20]
	ldr	r3, [r3]
	cmp	r3, #9
	bls	.LCB3621
	b	.L227	@long jump
.LCB3621:
	lsl	r2, r3, #2
	ldr	r3, .L300+24
	add	r3, r2, r3
	ldr	r3, [r3]
	mov	pc, r3
	.section	.rodata
	.align	2
.L237:
	.word	.L227
	.word	.L228
	.word	.L240
	.word	.L244
	.word	.L247
	.word	.L232
	.word	.L233
	.word	.L234
	.word	.L235
	.word	.L257
	.text
.L228:
	.loc 1 716 0
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #40]
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [r7, #20]
	str	r2, [r3, #40]
	.loc 1 717 0
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #28]
	mov	r2, r3
	ldr	r3, [r7, #44]
	lsl	r3, r3, #1
	add	r3, r2, r3
	mov	r2, r3
	ldr	r3, [r7, #20]
	str	r2, [r3, #28]
	.loc 1 718 0
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #28]
	lsl	r1, r3, #24
	ldr	r2, [r7, #20]
	mov	r3, #136
	str	r1, [r2, r3]
	.loc 1 720 0
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #28]
	cmp	r3, #125
	bgt	.LCB3657
	b	.L291	@long jump
.LCB3657:
	.loc 1 722 0
	ldr	r3, [r7, #20]
	mov	r2, #127
	str	r2, [r3, #28]
	.loc 1 723 0
	ldr	r1, [r7, #20]
	mov	r2, #136
	mov	r3, #254
	lsl	r3, r3, #23
	str	r3, [r1, r2]
	.loc 1 724 0
	ldr	r3, [r7, #20]
	mov	r2, #2
	str	r2, [r3]
	.loc 1 725 0
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #68]
	cmp	r3, #8
	beq	.L239
	.loc 1 728 0
	ldr	r3, [r7, #20]
	ldr	r1, [r3, #56]
	ldr	r3, [r7, #20]
	ldr	r2, [r3, #68]
	mov	r3, r2
	lsl	r3, r3, #7
	sub	r3, r3, r2
	lsr	r3, r3, #3
	mov	ip, r3
	ldr	r0, [r7, #20]
	mov	r3, #1
	neg	r3, r3
	mov	r2, #128
	lsl	r2, r2, #21
	str	r2, [sp]
	mov	r2, r3
	mov	r3, ip
	bl	_ZL13S9xSetEnvRateP7Channelmiij
	.loc 1 729 0
	b	.L227
.L239:
	.loc 1 731 0
	ldr	r3, [r7, #20]
	mov	r2, #3
	str	r2, [r3]
	.loc 1 732 0
	ldr	r3, [r7, #20]
	ldr	r1, [r3, #60]
	ldr	r0, [r7, #20]
	mov	r3, #1
	neg	r3, r3
	mov	r2, #128
	lsl	r2, r2, #22
	str	r2, [sp]
	mov	r2, r3
	mov	r3, #0
	bl	_ZL13S9xSetEnvRateP7Channelmiij
	.loc 1 734 0
	b	.L227
.L241:
	.loc 1 739 0
	ldr	r2, [r7, #20]
	mov	r3, #136
	ldr	r3, [r2, r3]
	asr	r2, r3, #8
	mov	r3, r2
	lsl	r3, r3, #8
	sub	r1, r3, r2
	ldr	r2, [r7, #20]
	mov	r3, #136
	str	r1, [r2, r3]
	.loc 1 740 0
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #40]
	ldr	r1, .L300+28
	add	r2, r3, r1
	ldr	r3, [r7, #20]
	str	r2, [r3, #40]
.L240:
	.loc 1 737 0
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #40]
	ldr	r2, .L300+16
	cmp	r2, r3
	sbc	r3, r3, r3
	neg	r3, r3
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	bne	.L241
	.loc 1 742 0
	ldr	r2, [r7, #20]
	mov	r3, #136
	ldr	r3, [r2, r3]
	asr	r2, r3, #24
	ldr	r3, [r7, #20]
	str	r2, [r3, #28]
	.loc 1 743 0
	ldr	r3, [r7, #20]
	ldr	r2, [r3, #28]
	ldr	r3, [r7, #20]
	ldrh	r3, [r3, #36]
	lsl	r3, r3, #16
	asr	r3, r3, #16
	cmp	r2, r3
	ble	.LCB3753
	b	.L292	@long jump
.LCB3753:
	.loc 1 745 0
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #28]
	cmp	r3, #0
	bgt	.L243
	.loc 1 747 0
	ldr	r2, [r7, #16]
	ldr	r3, [r7, #20]
	mov	r0, r2
	mov	r1, r3
	bl	_ZL20S9xAPUSetEndOfSampleiP7Channel
	.loc 1 748 0
	b	.L218
.L243:
	.loc 1 750 0
	ldr	r3, [r7, #20]
	mov	r2, #3
	str	r2, [r3]
	.loc 1 751 0
	ldr	r3, [r7, #20]
	ldr	r1, [r3, #60]
	ldr	r0, [r7, #20]
	mov	r3, #1
	neg	r3, r3
	mov	r2, #128
	lsl	r2, r2, #22
	str	r2, [sp]
	mov	r2, r3
	mov	r3, #0
	bl	_ZL13S9xSetEnvRateP7Channelmiij
	.loc 1 753 0
	b	.L227
.L245:
	.loc 1 758 0
	ldr	r2, [r7, #20]
	mov	r3, #136
	ldr	r3, [r2, r3]
	asr	r2, r3, #8
	mov	r3, r2
	lsl	r3, r3, #8
	sub	r1, r3, r2
	ldr	r2, [r7, #20]
	mov	r3, #136
	str	r1, [r2, r3]
	.loc 1 759 0
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #40]
	ldr	r1, .L300+28
	add	r2, r3, r1
	ldr	r3, [r7, #20]
	str	r2, [r3, #40]
.L244:
	.loc 1 756 0
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #40]
	ldr	r2, .L300+16
	cmp	r2, r3
	sbc	r3, r3, r3
	neg	r3, r3
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	bne	.L245
	.loc 1 761 0
	ldr	r2, [r7, #20]
	mov	r3, #136
	ldr	r3, [r2, r3]
	asr	r2, r3, #24
	ldr	r3, [r7, #20]
	str	r2, [r3, #28]
	.loc 1 762 0
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #28]
	cmp	r3, #0
	ble	.LCB3821
	b	.L293	@long jump
.LCB3821:
	.loc 1 764 0
	ldr	r2, [r7, #16]
	ldr	r3, [r7, #20]
	mov	r0, r2
	mov	r1, r3
	bl	_ZL20S9xAPUSetEndOfSampleiP7Channel
	.loc 1 765 0
	b	.L218
.L301:
	.align	2
.L300:
	.word	SoundData
	.word	APU
	.word	so
	.word	Settings
	.word	65535
	.word	_ZL4wave
	.word	.L237
	.word	-65536
.L248:
	.loc 1 772 0
	ldr	r2, [r7, #20]
	mov	r3, #136
	ldr	r3, [r2, r3]
	ldr	r2, .L302
	add	r1, r3, r2
	ldr	r2, [r7, #20]
	mov	r3, #136
	str	r1, [r2, r3]
	.loc 1 773 0
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #40]
	ldr	r1, .L302+4
	add	r2, r3, r1
	ldr	r3, [r7, #20]
	str	r2, [r3, #40]
.L247:
	.loc 1 770 0
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #40]
	ldr	r2, .L302+8
	cmp	r2, r3
	sbc	r3, r3, r3
	neg	r3, r3
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	bne	.L248
	.loc 1 775 0
	ldr	r2, [r7, #20]
	mov	r3, #136
	ldr	r3, [r2, r3]
	asr	r2, r3, #24
	ldr	r3, [r7, #20]
	str	r2, [r3, #28]
	.loc 1 776 0
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #28]
	cmp	r3, #0
	ble	.LCB3878
	b	.L294	@long jump
.LCB3878:
	.loc 1 778 0
	ldr	r2, [r7, #16]
	ldr	r3, [r7, #20]
	mov	r0, r2
	mov	r1, r3
	bl	_ZL20S9xAPUSetEndOfSampleiP7Channel
	.loc 1 779 0
	b	.L218
.L233:
	.loc 1 784 0
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #40]
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [r7, #20]
	str	r2, [r3, #40]
	.loc 1 785 0
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #28]
	mov	r2, r3
	ldr	r3, [r7, #44]
	lsl	r3, r3, #1
	add	r3, r2, r3
	mov	r2, r3
	ldr	r3, [r7, #20]
	str	r2, [r3, #28]
	.loc 1 786 0
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #28]
	lsl	r1, r3, #24
	ldr	r2, [r7, #20]
	mov	r3, #136
	str	r1, [r2, r3]
	.loc 1 788 0
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #28]
	cmp	r3, #125
	bgt	.LCB3912
	b	.L295	@long jump
.LCB3912:
	.loc 1 790 0
	ldr	r3, [r7, #20]
	mov	r2, #127
	str	r2, [r3, #28]
	.loc 1 791 0
	ldr	r1, [r7, #20]
	mov	r2, #136
	mov	r3, #254
	lsl	r3, r3, #23
	str	r3, [r1, r2]
	.loc 1 792 0
	ldr	r3, [r7, #20]
	mov	r2, #5
	str	r2, [r3]
	.loc 1 793 0
	ldr	r2, [r7, #20]
	mov	r3, #132
	mov	r1, #5
	str	r1, [r2, r3]
	.loc 1 794 0
	ldr	r2, [r7, #20]
	mov	r3, #1
	neg	r3, r3
	mov	r1, #0
	str	r1, [sp]
	mov	r0, r2
	mov	r1, #0
	mov	r2, r3
	mov	r3, #0
	bl	_ZL13S9xSetEnvRateP7Channelmiij
	.loc 1 796 0
	b	.L227
.L234:
	.loc 1 799 0
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #28]
	cmp	r3, #94
	ble	.L251
	.loc 1 801 0
	b	.L252
.L253:
	.loc 1 803 0
	ldr	r2, [r7, #20]
	mov	r3, #136
	ldr	r3, [r2, r3]
	mov	r2, #254
	lsl	r2, r2, #15
	add	r1, r3, r2
	ldr	r2, [r7, #20]
	mov	r3, #136
	str	r1, [r2, r3]
	.loc 1 804 0
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #40]
	ldr	r1, .L302+4
	add	r2, r3, r1
	ldr	r3, [r7, #20]
	str	r2, [r3, #40]
.L252:
	.loc 1 801 0
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #40]
	ldr	r2, .L302+8
	cmp	r2, r3
	sbc	r3, r3, r3
	neg	r3, r3
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	bne	.L253
	.loc 1 806 0
	ldr	r2, [r7, #20]
	mov	r3, #136
	ldr	r3, [r2, r3]
	asr	r2, r3, #24
	ldr	r3, [r7, #20]
	str	r2, [r3, #28]
	b	.L254
.L251:
	.loc 1 810 0
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #40]
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [r7, #20]
	str	r2, [r3, #40]
	.loc 1 811 0
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #28]
	mov	r2, r3
	ldr	r3, [r7, #44]
	lsl	r3, r3, #1
	add	r3, r2, r3
	mov	r2, r3
	ldr	r3, [r7, #20]
	str	r2, [r3, #28]
	.loc 1 812 0
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #28]
	lsl	r1, r3, #24
	ldr	r2, [r7, #20]
	mov	r3, #136
	str	r1, [r2, r3]
.L254:
	.loc 1 815 0
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #28]
	cmp	r3, #125
	bgt	.LCB4012
	b	.L296	@long jump
.LCB4012:
	.loc 1 817 0
	ldr	r3, [r7, #20]
	mov	r2, #127
	str	r2, [r3, #28]
	.loc 1 818 0
	ldr	r1, [r7, #20]
	mov	r2, #136
	mov	r3, #254
	lsl	r3, r3, #23
	str	r3, [r1, r2]
	.loc 1 819 0
	ldr	r3, [r7, #20]
	mov	r2, #5
	str	r2, [r3]
	.loc 1 820 0
	ldr	r2, [r7, #20]
	mov	r3, #132
	mov	r1, #5
	str	r1, [r2, r3]
	.loc 1 821 0
	ldr	r2, [r7, #20]
	mov	r3, #1
	neg	r3, r3
	mov	r1, #0
	str	r1, [sp]
	mov	r0, r2
	mov	r1, #0
	mov	r2, r3
	mov	r3, #0
	bl	_ZL13S9xSetEnvRateP7Channelmiij
	.loc 1 823 0
	b	.L227
.L235:
	.loc 1 826 0
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #40]
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [r7, #20]
	str	r2, [r3, #40]
	.loc 1 827 0
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #28]
	mov	r2, r3
	ldr	r3, [r7, #44]
	lsl	r3, r3, #1
	sub	r3, r2, r3
	mov	r2, r3
	ldr	r3, [r7, #20]
	str	r2, [r3, #28]
	.loc 1 828 0
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #28]
	lsl	r1, r3, #24
	ldr	r2, [r7, #20]
	mov	r3, #136
	str	r1, [r2, r3]
	.loc 1 829 0
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #28]
	cmp	r3, #0
	bgt	.L297
	.loc 1 831 0
	ldr	r2, [r7, #16]
	ldr	r3, [r7, #20]
	mov	r0, r2
	mov	r1, r3
	bl	_ZL20S9xAPUSetEndOfSampleiP7Channel
	.loc 1 832 0
	b	.L218
.L258:
	.loc 1 839 0
	ldr	r2, [r7, #20]
	mov	r3, #136
	ldr	r3, [r2, r3]
	asr	r2, r3, #8
	mov	r3, r2
	lsl	r3, r3, #8
	sub	r1, r3, r2
	ldr	r2, [r7, #20]
	mov	r3, #136
	str	r1, [r2, r3]
	.loc 1 840 0
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #40]
	ldr	r1, .L302+4
	add	r2, r3, r1
	ldr	r3, [r7, #20]
	str	r2, [r3, #40]
.L257:
	.loc 1 837 0
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #40]
	ldr	r2, .L302+8
	cmp	r2, r3
	sbc	r3, r3, r3
	neg	r3, r3
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	bne	.L258
	.loc 1 842 0
	ldr	r2, [r7, #20]
	mov	r3, #136
	ldr	r3, [r2, r3]
	asr	r2, r3, #24
	ldr	r3, [r7, #20]
	str	r2, [r3, #28]
	.loc 1 843 0
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #28]
	cmp	r3, #0
	bgt	.L298
	.loc 1 845 0
	ldr	r2, [r7, #16]
	ldr	r3, [r7, #20]
	mov	r0, r2
	mov	r1, r3
	bl	_ZL20S9xAPUSetEndOfSampleiP7Channel
	.loc 1 846 0
	b	.L218
.L232:
	.loc 1 851 0
	ldr	r2, [r7, #20]
	mov	r3, #1
	neg	r3, r3
	mov	r1, #0
	str	r1, [sp]
	mov	r0, r2
	mov	r1, #0
	mov	r2, r3
	mov	r3, #0
	bl	_ZL13S9xSetEnvRateP7Channelmiij
	b	.L227
.L291:
	.loc 1 734 0
	mov	r8, r8
	b	.L227
.L292:
	.loc 1 753 0
	mov	r8, r8
	b	.L227
.L293:
	.loc 1 767 0
	mov	r8, r8
	b	.L227
.L294:
	.loc 1 781 0
	mov	r8, r8
	b	.L227
.L295:
	.loc 1 796 0
	mov	r8, r8
	b	.L227
.L296:
	.loc 1 823 0
	mov	r8, r8
	b	.L227
.L297:
	.loc 1 834 0
	mov	r8, r8
	b	.L227
.L298:
	.loc 1 848 0
	mov	r8, r8
.L227:
	.loc 1 854 0
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #28]
	ldr	r2, [r7, #20]
	ldrh	r2, [r2, #8]
	lsl	r2, r2, #16
	asr	r2, r2, #16
	mul	r3, r2
	cmp	r3, #0
	bge	.L260
	add	r3, r3, #127
.L260:
	asr	r3, r3, #7
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [r7, #20]
	strh	r2, [r3, #32]
	.loc 1 855 0
	ldr	r2, [r7, #20]
	mov	r3, #72
	ldrh	r3, [r2, r3]
	lsl	r3, r3, #16
	asr	r3, r3, #16
	ldr	r2, [r7, #20]
	ldrh	r2, [r2, #32]
	lsl	r2, r2, #16
	asr	r2, r2, #16
	mul	r3, r2
	cmp	r3, #0
	bge	.L261
	add	r3, r3, #127
.L261:
	asr	r3, r3, #7
	str	r3, [r7, #32]
.L226:
.LBE24:
	.loc 1 858 0
	ldr	r3, [r7, #20]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #40]
	add	r2, r2, r3
	ldr	r3, [r7, #20]
	str	r2, [r3, #20]
	.loc 1 859 0
	ldr	r3, [r7, #20]
	ldr	r2, [r3, #20]
	ldr	r3, .L302+8
	cmp	r2, r3
	bhi	.LCB4221
	b	.L262	@long jump
.LCB4221:
	.loc 1 861 0
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #20]
	lsr	r3, r3, #16
	str	r3, [r7, #32]
	.loc 1 862 0
	ldr	r3, [r7, #20]
	ldr	r2, [r3, #124]
	ldr	r3, [r7, #32]
	add	r2, r2, r3
	ldr	r3, [r7, #20]
	str	r2, [r3, #124]
	.loc 1 863 0
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #20]
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [r7, #20]
	str	r2, [r3, #20]
	.loc 1 865 0
	ldr	r2, [r7, #20]
	mov	r3, #140
	ldrh	r1, [r2, r3]
	ldr	r2, [r7, #20]
	mov	r3, #72
	strh	r1, [r2, r3]
	.loc 1 866 0
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #124]
	cmp	r3, #15
	bls	.L263
	.loc 1 868 0
	ldr	r3, [r7, #20]
	ldr	r2, [r3, #124]
	ldr	r3, .L302+12
	cmp	r2, r3
	bls	.L264
	.loc 1 870 0
	ldr	r2, [r7, #16]
	ldr	r3, [r7, #20]
	mov	r0, r2
	mov	r1, r3
	bl	_ZL20S9xAPUSetEndOfSampleiP7Channel
	.loc 1 871 0
	b	.L218
.L264:
	.loc 1 875 0
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #124]
	mov	r2, r3
	sub	r2, r2, #16
	ldr	r3, [r7, #20]
	str	r2, [r3, #124]
	.loc 1 876 0
	ldr	r2, [r7, #20]
	mov	r3, #118
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	beq	.L265
	.loc 1 878 0
	ldr	r3, [r7, #20]
	ldrb	r3, [r3, #24]
	cmp	r3, #0
	bne	.L266
	.loc 1 880 0
	ldr	r3, [r7, #20]
	ldr	r2, .L302+16
	str	r2, [r3, #124]
	.loc 1 881 0
	ldr	r2, [r7, #20]
	mov	r3, #72
	ldrh	r1, [r2, r3]
	ldr	r2, [r7, #20]
	mov	r3, #140
	strh	r1, [r2, r3]
	.loc 1 882 0
	b	.L267
.L303:
	.align	2
.L302:
	.word	-8323072
	.word	-65536
	.word	65535
	.word	16777214
	.word	16777215
.L266:
.LBB25:
	.loc 1 886 0
	ldr	r2, [r7, #20]
	mov	r3, #118
	mov	r1, #0
	strb	r1, [r2, r3]
	.loc 1 887 0
	ldr	r2, [r7, #20]
	mov	r3, #116
	ldrh	r3, [r2, r3]
	mov	r0, r3
	bl	_ZL19S9xGetSampleAddressi
	mov	r3, r0
	str	r3, [r7, #48]
	.loc 1 888 0
	ldr	r3, [r7, #48]
	add	r3, r3, #2
	ldrh	r3, [r3]
	mov	r2, r3
	ldr	r3, [r7, #20]
	str	r2, [r3, #120]
	.loc 1 889 0
	ldr	r3, [r7, #16]
	mov	r0, r3
	bl	_ZL13S9xAPUSetEndXi
.L265:
.LBE25:
	.loc 1 892 0
	ldr	r3, [r7, #20]
	mov	r0, r3
	bl	_ZL11DecodeBlockP7Channel
	.loc 1 873 0
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #124]
	mov	r2, #15
	cmp	r2, r3
	sbc	r3, r3, r3
	neg	r3, r3
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	bne	.L264
.L267:
	.loc 1 894 0
	ldr	r3, [r7, #20]
	ldr	r2, [r3, #124]
	ldr	r3, .L304
	cmp	r2, r3
	bhi	.L299
	.loc 1 895 0
	ldr	r3, [r7, #20]
	ldr	r2, [r3, #112]
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #124]
	lsl	r3, r3, #1
	add	r3, r2, r3
	ldrh	r1, [r3]
	ldr	r2, [r7, #20]
	mov	r3, #140
	strh	r1, [r2, r3]
	b	.L269
.L263:
	.loc 1 898 0
	ldr	r3, [r7, #20]
	ldr	r2, [r3, #112]
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #124]
	lsl	r3, r3, #1
	add	r3, r2, r3
	ldrh	r1, [r3]
	ldr	r2, [r7, #20]
	mov	r3, #140
	strh	r1, [r2, r3]
	b	.L269
.L299:
	.loc 1 895 0
	mov	r8, r8
.L269:
	.loc 1 900 0
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	bne	.L276
	.loc 1 902 0
	ldr	r2, .L304+4
	mov	r3, #109
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	beq	.L271
	ldr	r2, [r7, #40]
	ldr	r3, .L304+8
	cmp	r2, r3
	bhi	.L271
	mov	r3, r7
	add	r3, r3, #31
	ldrb	r3, [r3]
	cmp	r3, #0
	bne	.L271
	.loc 1 905 0
	ldr	r2, [r7, #20]
	mov	r3, #140
	ldrh	r3, [r2, r3]
	lsl	r3, r3, #16
	asr	r2, r3, #16
	ldr	r1, [r7, #20]
	mov	r3, #72
	ldrh	r3, [r1, r3]
	lsl	r3, r3, #16
	asr	r3, r3, #16
	sub	r3, r2, r3
	ldr	r2, [r7, #40]
	mul	r3, r2
	cmp	r3, #0
	bge	.L272
	ldr	r2, .L304+8
	add	r3, r3, r2
.L272:
	asr	r3, r3, #16
	mov	r1, r3
	ldr	r2, [r7, #20]
	mov	r3, #144
	str	r1, [r2, r3]
	.loc 1 907 0
	ldr	r2, [r7, #20]
	mov	r3, #72
	ldrh	r3, [r2, r3]
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r1, [r7, #20]
	mov	r3, #140
	ldrh	r3, [r1, r3]
	lsl	r3, r3, #16
	asr	r1, r3, #16
	ldr	r0, [r7, #20]
	mov	r3, #72
	ldrh	r3, [r0, r3]
	lsl	r3, r3, #16
	asr	r3, r3, #16
	sub	r1, r1, r3
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #20]
	mul	r3, r1
	cmp	r3, #0
	bge	.L273
	ldr	r1, .L304+8
	add	r3, r3, r1
.L273:
	asr	r3, r3, #16
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	mov	r1, r3
	ldr	r2, [r7, #20]
	mov	r3, #72
	strh	r1, [r2, r3]
	.loc 1 902 0
	mov	r8, r8
	b	.L275
.L271:
	.loc 1 910 0
	ldr	r2, [r7, #20]
	mov	r3, #144
	mov	r1, #0
	str	r1, [r2, r3]
	b	.L275
.L278:
	.loc 1 915 0
	ldr	r3, .L304+12
	ldr	r3, [r3, #8]
	lsl	r2, r3, #1
	ldr	r3, .L304+12
	str	r2, [r3, #8]
	ldr	r3, .L304+12
	ldr	r3, [r3, #8]
	lsr	r3, r3, #31
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	beq	.L277
	.loc 1 916 0
	ldr	r3, .L304+12
	ldr	r2, [r3, #8]
	ldr	r3, .L304+16
	eor	r2, r2, r3
	ldr	r3, .L304+12
	str	r2, [r3, #8]
.L277:
	.loc 1 914 0
	ldr	r3, [r7, #32]
	sub	r3, r3, #1
	str	r3, [r7, #32]
.L276:
	ldr	r3, [r7, #32]
	asr	r2, r3, #31
	sub	r3, r2, r3
	lsr	r3, r3, #31
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	bne	.L278
	.loc 1 917 0
	ldr	r3, .L304+12
	ldr	r3, [r3, #8]
	lsl	r3, r3, #17
	asr	r3, r3, #17
	lsl	r3, r3, #16
	lsr	r1, r3, #16
	ldr	r2, [r7, #20]
	mov	r3, #72
	strh	r1, [r2, r3]
	.loc 1 918 0
	ldr	r2, [r7, #20]
	mov	r3, #144
	mov	r1, #0
	str	r1, [r2, r3]
.L275:
	.loc 1 920 0
	ldr	r2, [r7, #20]
	mov	r3, #72
	ldrh	r3, [r2, r3]
	lsl	r3, r3, #16
	asr	r3, r3, #16
	ldr	r2, [r7, #20]
	ldrh	r2, [r2, #32]
	lsl	r2, r2, #16
	asr	r2, r2, #16
	mul	r3, r2
	cmp	r3, #0
	bge	.L279
	add	r3, r3, #127
.L279:
	asr	r3, r3, #7
	str	r3, [r7, #32]
	b	.L280
.L262:
	.loc 1 924 0
	ldr	r2, [r7, #20]
	mov	r3, #144
	ldr	r3, [r2, r3]
	cmp	r3, #0
	beq	.L280
.LBB26:
	.loc 1 926 0
	ldr	r2, [r7, #20]
	mov	r3, #72
	ldrh	r3, [r2, r3]
	lsl	r3, r3, #16
	asr	r2, r3, #16
	ldr	r1, [r7, #20]
	mov	r3, #144
	ldr	r3, [r1, r3]
	add	r3, r2, r3
	str	r3, [r7, #52]
	.loc 1 928 0
	ldr	r2, [r7, #52]
	ldr	r3, .L304+20
	cmp	r2, r3
	bge	.L281
	ldr	r3, .L304+20
	str	r3, [r7, #52]
	b	.L282
.L281:
	ldr	r2, [r7, #52]
	ldr	r3, .L304+24
	cmp	r2, r3
	ble	.L282
	ldr	r3, .L304+24
	str	r3, [r7, #52]
.L282:
	.loc 1 929 0
	ldr	r3, [r7, #52]
	lsl	r3, r3, #16
	lsr	r1, r3, #16
	ldr	r2, [r7, #20]
	mov	r3, #72
	strh	r1, [r2, r3]
	.loc 1 930 0
	ldr	r2, [r7, #20]
	mov	r3, #72
	ldrh	r3, [r2, r3]
	lsl	r3, r3, #16
	asr	r3, r3, #16
	ldr	r2, [r7, #20]
	ldrh	r2, [r2, #32]
	lsl	r2, r2, #16
	asr	r2, r2, #16
	mul	r3, r2
	cmp	r3, #0
	bge	.L283
	add	r3, r3, #127
.L283:
	asr	r3, r3, #7
	str	r3, [r7, #32]
.L280:
.LBE26:
	.loc 1 934 0
	ldr	r2, [r7, #36]
	ldr	r1, [r7, #36]
	ldr	r3, .L304+28
	lsl	r1, r1, #2
	ldr	r1, [r1, r3]
	ldr	r3, [r7, #32]
	add	r1, r1, r3
	ldr	r3, .L304+28
	lsl	r2, r2, #2
	str	r1, [r2, r3]
	.loc 1 935 0
	ldr	r2, [r7, #20]
	mov	r3, #128
	ldr	r3, [r2, r3]
	cmp	r3, #0
	beq	.L284
	.loc 1 936 0
	ldr	r2, [r7, #20]
	mov	r3, #128
	ldr	r2, [r2, r3]
	ldr	r3, [r7, #36]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r1, [r7, #20]
	mov	r2, #128
	ldr	r1, [r1, r2]
	ldr	r2, [r7, #36]
	lsl	r2, r2, #2
	add	r2, r1, r2
	ldr	r1, [r2]
	ldr	r2, [r7, #32]
	add	r2, r1, r2
	str	r2, [r3]
.L284:
	.loc 1 938 0
	ldr	r3, [r7, #16]
	add	r3, r3, #1
	ldr	r2, [r7, #12]
	asr	r2, r2, r3
	mov	r3, #1
	and	r3, r3, r2
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	beq	.L285
	.loc 1 939 0
	ldr	r2, [r7, #36]
	ldr	r1, [r7, #20]
	mov	r3, #72
	ldrh	r3, [r1, r3]
	lsl	r3, r3, #16
	asr	r1, r3, #16
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #28]
	mul	r1, r3
	ldr	r3, .L304+32
	lsl	r2, r2, #2
	str	r1, [r2, r3]
.L285:
.LBE23:
	.loc 1 701 0
	ldr	r3, [r7, #36]
	add	r3, r3, #1
	str	r3, [r7, #36]
.L224:
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #36]
	cmp	r2, r3
	sbc	r3, r3, r3
	neg	r3, r3
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	beq	.LCB4662
	b	.L286	@long jump
.LCB4662:
	b	.L218
.L289:
.LBE22:
	.loc 1 676 0
	mov	r8, r8
	b	.L218
.L290:
	mov	r8, r8
.L218:
.LBE21:
	.loc 1 670 0
	ldr	r3, [r7, #16]
	add	r3, r3, #1
	str	r3, [r7, #16]
.L215:
	ldr	r2, [r7, #16]
	mov	r1, #7
	mov	r3, #0
	cmp	r1, r2
	adc	r3, r3, r3
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	beq	.LCB4689
	bl	.L287	@far jump
.LCB4689:
.LBE20:
.LBE19:
	.loc 1 943 0
	mov	sp, r7
	add	sp, sp, #56
	@ sp needed for prologue
	pop	{r7, pc}
.L305:
	.align	2
.L304:
	.word	16777214
	.word	Settings
	.word	65535
	.word	so
	.word	262145
	.word	-32768
	.word	32767
	.word	MixBuffer
	.word	_ZL4wave
.LFE45:
	.cantunwind
	.fnend
	.size	_ZL7MixMonoi, .-_ZL7MixMonoi
	.align	2
	.global	S9xMixSamples
	.hidden	S9xMixSamples
	.code	16
	.thumb_func
	.type	S9xMixSamples, %function
S9xMixSamples:
	.fnstart
.LFB46:
	.loc 1 948 0
	.save	{r7, lr}
	push	{r7, lr}
.LCFI54:
	sub	sp, sp, #8
.LCFI55:
	add	r7, sp, #0
.LCFI56:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 949 0
	ldr	r2, [r7, #4]
	ldr	r3, [r7]
	mov	r0, r2
	mov	r1, r3
	mov	r2, #0
	bl	S9xMixSamplesO
	.loc 1 950 0
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed for prologue
	pop	{r7, pc}
.LFE46:
	.cantunwind
	.fnend
	.size	S9xMixSamples, .-S9xMixSamples
	.align	2
	.global	S9xMixSamplesO
	.hidden	S9xMixSamplesO
	.code	16
	.thumb_func
	.type	S9xMixSamplesO, %function
S9xMixSamplesO:
	.fnstart
.LFB47:
	.loc 1 954 0
	.save	{r4, r7, lr}
	push	{r4, r7, lr}
.LCFI57:
	sub	sp, sp, #84
.LCFI58:
	add	r7, sp, #0
.LCFI59:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
.LBB27:
	.loc 1 958 0
	ldr	r3, [r7, #4]
	lsl	r3, r3, #1
	ldr	r2, [r7, #12]
	add	r3, r2, r3
	str	r3, [r7, #12]
	.loc 1 960 0
	ldr	r3, .L379
	ldrb	r3, [r3, #5]
	cmp	r3, #0
	beq	.L309
	.loc 1 962 0
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #8]
	asr	r3, r3, #1
	mov	r0, r2
	mov	r1, #0
	mov	r2, r3
	bl	_ZL15sounduxmemset32Pvmm
	.loc 1 963 0
	bl	.L378	@ far jump
.L309:
	.loc 1 966 0
	ldr	r2, .L379+4
	ldr	r3, [r7, #8]
	mov	r0, r2
	mov	r1, #0
	mov	r2, r3
	bl	_ZL15sounduxmemset32Pvmm
	.loc 1 967 0
	ldr	r3, .L379+8
	ldr	r3, [r3, #8]
	cmp	r3, #0
	beq	.L311
	.loc 1 968 0
	ldr	r2, .L379+12
	ldr	r3, [r7, #8]
	mov	r0, r2
	mov	r1, #0
	mov	r2, r3
	bl	_ZL15sounduxmemset32Pvmm
.L311:
	.loc 1 970 0
	ldr	r3, .L379
	ldrb	r3, [r3, #4]
	cmp	r3, #0
	beq	.L312
	.loc 1 971 0
	ldr	r3, [r7, #8]
	mov	r0, r3
	bl	_ZL9MixStereoi
	b	.L313
.L312:
	.loc 1 973 0
	ldr	r3, [r7, #8]
	mov	r0, r3
	bl	_ZL7MixMonoi
.L313:
	.loc 1 976 0
	ldr	r3, .L379+8
	ldr	r3, [r3, #8]
	cmp	r3, #0
	bne	.LCB4803
	b	.L314	@long jump
.LCB4803:
	ldr	r3, .L379+8
	ldr	r3, [r3, #20]
	cmp	r3, #0
	bne	.LCB4807
	b	.L314	@long jump
.LCB4807:
	.loc 1 978 0
	ldr	r3, .L379
	ldrb	r3, [r3, #4]
	cmp	r3, #0
	bne	.LCB4811
	b	.L315	@long jump
.LCB4811:
.LBB28:
	.loc 1 981 0
	ldr	r2, .L379+8
	ldr	r3, .L379+16
	ldr	r3, [r2, r3]
	str	r3, [r7, #28]
	.loc 1 982 0
	ldr	r2, .L379+8
	mov	r3, #219
	lsl	r3, r3, #3
	ldr	r3, [r2, r3]
	str	r3, [r7, #32]
	.loc 1 983 0
	ldr	r2, .L379+8
	ldr	r3, .L379+20
	ldr	r3, [r2, r3]
	str	r3, [r7, #36]
	.loc 1 984 0
	ldr	r2, .L379+8
	mov	r3, #220
	lsl	r3, r3, #3
	ldr	r3, [r2, r3]
	str	r3, [r7, #40]
	.loc 1 987 0
	ldr	r2, .L379+8
	mov	r3, #218
	lsl	r3, r3, #3
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	bne	.LCB4836
	b	.L316	@long jump
.LCB4836:
	.loc 1 990 0
	mov	r3, #0
	str	r3, [r7, #16]
	b	.L317
.L328:
.LBB29:
	.loc 1 992 0
	ldr	r3, .L379+8
	ldr	r2, [r3, #16]
	ldr	r3, .L379+24
	lsl	r2, r2, #2
	ldr	r3, [r2, r3]
	str	r3, [r7, #44]
	.loc 1 994 0
	ldr	r3, .L379+8
	ldr	r2, [r3, #16]
	ldr	r3, .L379+8
	ldr	r3, [r3, #12]
	ldr	r1, [r7, #44]
	mul	r3, r1
	cmp	r3, #0
	bge	.L318
	add	r3, r3, #127
.L318:
	asr	r3, r3, #7
	mov	r1, r3
	ldr	r0, [r7, #16]
	ldr	r3, .L379+12
	lsl	r0, r0, #2
	ldr	r3, [r0, r3]
	add	r0, r1, r3
	ldr	r3, .L379+24
	lsl	r1, r2, #2
	str	r0, [r1, r3]
	add	r2, r2, #1
	ldr	r3, .L379+8
	str	r2, [r3, #16]
	.loc 1 995 0
	ldr	r3, .L379+8
	ldr	r2, [r3, #16]
	ldr	r3, .L379+8
	ldr	r3, [r3, #12]
	ldr	r1, [r7, #44]
	mul	r3, r1
	cmp	r3, #0
	bge	.L319
	add	r3, r3, #127
.L319:
	asr	r3, r3, #7
	mov	r1, r3
	ldr	r3, [r7, #16]
	add	r0, r3, #1
	ldr	r3, .L379+12
	lsl	r0, r0, #2
	ldr	r3, [r0, r3]
	add	r0, r1, r3
	ldr	r3, .L379+24
	lsl	r1, r2, #2
	str	r0, [r1, r3]
	add	r2, r2, #1
	ldr	r3, .L379+8
	str	r2, [r3, #16]
	.loc 1 997 0
	ldr	r3, .L379+8
	ldr	r2, [r3, #16]
	ldr	r3, .L379+8
	ldr	r3, [r3, #20]
	cmp	r2, r3
	blt	.L320
	.loc 1 998 0
	ldr	r3, .L379+8
	mov	r2, #0
	str	r2, [r3, #16]
.L320:
	.loc 1 1000 0
	ldr	r2, [r7, #16]
	ldr	r3, .L379+4
	lsl	r2, r2, #2
	ldr	r3, [r2, r3]
	ldr	r2, [r7, #28]
	mul	r2, r3
	ldr	r3, [r7, #44]
	ldr	r1, [r7, #36]
	mul	r3, r1
	add	r3, r2, r3
	cmp	r3, #0
	bge	.L321
	add	r3, r3, #127
.L321:
	asr	r3, r3, #7
	str	r3, [r7, #20]
	.loc 1 1001 0
	ldr	r3, [r7, #16]
	add	r2, r3, #1
	ldr	r3, .L379+4
	lsl	r2, r2, #2
	ldr	r3, [r2, r3]
	ldr	r2, [r7, #32]
	mul	r2, r3
	ldr	r3, [r7, #44]
	ldr	r1, [r7, #40]
	mul	r3, r1
	add	r3, r2, r3
	cmp	r3, #0
	bge	.L322
	add	r3, r3, #127
.L322:
	asr	r3, r3, #7
	str	r3, [r7, #24]
	.loc 1 1003 0
	ldr	r2, [r7, #20]
	ldr	r3, .L379+28
	cmp	r2, r3
	bge	.L323
	ldr	r3, .L379+28
	str	r3, [r7, #20]
	b	.L324
.L323:
	ldr	r2, [r7, #20]
	ldr	r3, .L379+32
	cmp	r2, r3
	ble	.L324
	ldr	r3, .L379+32
	str	r3, [r7, #20]
.L324:
	.loc 1 1004 0
	ldr	r2, [r7, #24]
	ldr	r3, .L379+28
	cmp	r2, r3
	bge	.L325
	ldr	r3, .L379+28
	str	r3, [r7, #24]
	b	.L326
.L325:
	ldr	r2, [r7, #24]
	ldr	r3, .L379+32
	cmp	r2, r3
	ble	.L326
	ldr	r3, .L379+32
	str	r3, [r7, #24]
.L326:
	.loc 1 1005 0
	ldr	r3, [r7, #16]
	lsl	r2, r3, #1
	ldr	r3, [r7, #12]
	add	r3, r2, r3
	ldr	r2, [r7, #20]
	lsl	r2, r2, #16
	lsr	r2, r2, #16
	strh	r2, [r3]
	.loc 1 1006 0
	ldr	r3, [r7, #16]
	add	r3, r3, #1
	lsl	r2, r3, #1
	ldr	r3, [r7, #12]
	add	r3, r2, r3
	ldr	r2, [r7, #24]
	lsl	r2, r2, #16
	lsr	r2, r2, #16
	strh	r2, [r3]
.LBE29:
	.loc 1 990 0
	ldr	r3, [r7, #16]
	add	r3, r3, #2
	str	r3, [r7, #16]
.L317:
	mov	r3, #1
	ldr	r1, [r7, #16]
	ldr	r2, [r7, #8]
	cmp	r1, r2
	blt	.L327
	mov	r3, #0
.L327:
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	beq	.LCB5015
	b	.L328	@long jump
.LCB5015:
.LBE28:
	.loc 1 976 0
	b	.L378
.L316:
.LBB31:
	.loc 1 1012 0
	mov	r3, #0
	str	r3, [r7, #16]
	b	.L330
.L380:
	.align	2
.L379:
	.word	so
	.word	MixBuffer
	.word	SoundData
	.word	EchoBuffer
	.word	1748
	.word	1756
	.word	Echo
	.word	-32768
	.word	32767
.L342:
.LBB30:
	.loc 1 1014 0
	ldr	r3, .L381
	ldr	r2, [r3, #16]
	ldr	r3, .L381+4
	lsl	r2, r2, #2
	ldr	r4, [r2, r3]
	.loc 1 1016 0
	ldr	r3, .L381+8
	ldr	r2, [r3]
	mov	r3, #15
	and	r2, r2, r3
	ldr	r3, .L381+12
	lsl	r2, r2, #2
	str	r4, [r2, r3]
	.loc 1 1017 0
	ldr	r3, .L381+16
	ldr	r3, [r3]
	mul	r4, r3
	.loc 1 1018 0
	ldr	r3, .L381+8
	ldr	r3, [r3]
	sub	r2, r3, #2
	mov	r3, #15
	and	r2, r2, r3
	ldr	r3, .L381+12
	lsl	r2, r2, #2
	ldr	r2, [r2, r3]
	ldr	r3, .L381+16
	ldr	r3, [r3, #4]
	mul	r3, r2
	add	r4, r4, r3
	.loc 1 1019 0
	ldr	r3, .L381+8
	ldr	r3, [r3]
	sub	r2, r3, #4
	mov	r3, #15
	and	r2, r2, r3
	ldr	r3, .L381+12
	lsl	r2, r2, #2
	ldr	r2, [r2, r3]
	ldr	r3, .L381+16
	ldr	r3, [r3, #8]
	mul	r3, r2
	add	r4, r4, r3
	.loc 1 1020 0
	ldr	r3, .L381+8
	ldr	r3, [r3]
	sub	r2, r3, #6
	mov	r3, #15
	and	r2, r2, r3
	ldr	r3, .L381+12
	lsl	r2, r2, #2
	ldr	r2, [r2, r3]
	ldr	r3, .L381+16
	ldr	r3, [r3, #12]
	mul	r3, r2
	add	r4, r4, r3
	.loc 1 1021 0
	ldr	r3, .L381+8
	ldr	r3, [r3]
	mov	r2, r3
	sub	r2, r2, #8
	mov	r3, #15
	and	r2, r2, r3
	ldr	r3, .L381+12
	lsl	r2, r2, #2
	ldr	r2, [r2, r3]
	ldr	r3, .L381+16
	ldr	r3, [r3, #16]
	mul	r3, r2
	add	r4, r4, r3
	.loc 1 1022 0
	ldr	r3, .L381+8
	ldr	r3, [r3]
	mov	r2, r3
	sub	r2, r2, #10
	mov	r3, #15
	and	r2, r2, r3
	ldr	r3, .L381+12
	lsl	r2, r2, #2
	ldr	r2, [r2, r3]
	ldr	r3, .L381+16
	ldr	r3, [r3, #20]
	mul	r3, r2
	add	r4, r4, r3
	.loc 1 1023 0
	ldr	r3, .L381+8
	ldr	r3, [r3]
	mov	r2, r3
	sub	r2, r2, #12
	mov	r3, #15
	and	r2, r2, r3
	ldr	r3, .L381+12
	lsl	r2, r2, #2
	ldr	r2, [r2, r3]
	ldr	r3, .L381+16
	ldr	r3, [r3, #24]
	mul	r3, r2
	add	r4, r4, r3
	.loc 1 1024 0
	ldr	r3, .L381+8
	ldr	r3, [r3]
	mov	r2, r3
	sub	r2, r2, #14
	mov	r3, #15
	and	r2, r2, r3
	ldr	r3, .L381+12
	lsl	r2, r2, #2
	ldr	r2, [r2, r3]
	ldr	r3, .L381+16
	ldr	r3, [r3, #28]
	mul	r3, r2
	add	r4, r4, r3
	.loc 1 1025 0
	mov	r3, r4
	cmp	r3, #0
	bge	.L331
	add	r3, r3, #127
.L331:
	asr	r3, r3, #7
	mov	r4, r3
	.loc 1 1026 0
	ldr	r3, .L381+8
	ldr	r3, [r3]
	add	r2, r3, #1
	ldr	r3, .L381+8
	str	r2, [r3]
	.loc 1 1028 0
	ldr	r3, .L381
	ldr	r2, [r3, #16]
	ldr	r3, .L381
	ldr	r3, [r3, #12]
	mul	r3, r4
	cmp	r3, #0
	bge	.L332
	add	r3, r3, #127
.L332:
	asr	r3, r3, #7
	mov	r1, r3
	ldr	r0, [r7, #16]
	ldr	r3, .L381+20
	lsl	r0, r0, #2
	ldr	r3, [r0, r3]
	add	r0, r1, r3
	ldr	r3, .L381+4
	lsl	r1, r2, #2
	str	r0, [r1, r3]
	add	r2, r2, #1
	ldr	r3, .L381
	str	r2, [r3, #16]
	.loc 1 1029 0
	ldr	r3, .L381
	ldr	r2, [r3, #16]
	ldr	r3, .L381
	ldr	r3, [r3, #12]
	mul	r3, r4
	cmp	r3, #0
	bge	.L333
	add	r3, r3, #127
.L333:
	asr	r3, r3, #7
	mov	r1, r3
	ldr	r3, [r7, #16]
	add	r0, r3, #1
	ldr	r3, .L381+20
	lsl	r0, r0, #2
	ldr	r3, [r0, r3]
	add	r0, r1, r3
	ldr	r3, .L381+4
	lsl	r1, r2, #2
	str	r0, [r1, r3]
	add	r2, r2, #1
	ldr	r3, .L381
	str	r2, [r3, #16]
	.loc 1 1031 0
	ldr	r3, .L381
	ldr	r2, [r3, #16]
	ldr	r3, .L381
	ldr	r3, [r3, #20]
	cmp	r2, r3
	blt	.L334
	.loc 1 1032 0
	ldr	r3, .L381
	mov	r2, #0
	str	r2, [r3, #16]
.L334:
	.loc 1 1034 0
	ldr	r2, [r7, #16]
	ldr	r3, .L381+24
	lsl	r2, r2, #2
	ldr	r3, [r2, r3]
	ldr	r2, [r7, #28]
	mul	r2, r3
	ldr	r3, [r7, #36]
	mul	r3, r4
	add	r3, r2, r3
	cmp	r3, #0
	bge	.L335
	add	r3, r3, #127
.L335:
	asr	r3, r3, #7
	str	r3, [r7, #20]
	.loc 1 1035 0
	ldr	r3, [r7, #16]
	add	r2, r3, #1
	ldr	r3, .L381+24
	lsl	r2, r2, #2
	ldr	r3, [r2, r3]
	ldr	r2, [r7, #32]
	mul	r2, r3
	ldr	r3, [r7, #40]
	mul	r3, r4
	add	r3, r2, r3
	cmp	r3, #0
	bge	.L336
	add	r3, r3, #127
.L336:
	asr	r3, r3, #7
	str	r3, [r7, #24]
	.loc 1 1037 0
	ldr	r2, [r7, #20]
	ldr	r3, .L381+28
	cmp	r2, r3
	bge	.L337
	ldr	r3, .L381+28
	str	r3, [r7, #20]
	b	.L338
.L337:
	ldr	r2, [r7, #20]
	ldr	r3, .L381+32
	cmp	r2, r3
	ble	.L338
	ldr	r3, .L381+32
	str	r3, [r7, #20]
.L338:
	.loc 1 1038 0
	ldr	r2, [r7, #24]
	ldr	r3, .L381+28
	cmp	r2, r3
	bge	.L339
	ldr	r3, .L381+28
	str	r3, [r7, #24]
	b	.L340
.L339:
	ldr	r2, [r7, #24]
	ldr	r3, .L381+32
	cmp	r2, r3
	ble	.L340
	ldr	r3, .L381+32
	str	r3, [r7, #24]
.L340:
	.loc 1 1039 0
	ldr	r3, [r7, #16]
	lsl	r2, r3, #1
	ldr	r3, [r7, #12]
	add	r3, r2, r3
	ldr	r2, [r7, #20]
	lsl	r2, r2, #16
	lsr	r2, r2, #16
	strh	r2, [r3]
	.loc 1 1040 0
	ldr	r3, [r7, #16]
	add	r3, r3, #1
	lsl	r2, r3, #1
	ldr	r3, [r7, #12]
	add	r3, r2, r3
	ldr	r2, [r7, #24]
	lsl	r2, r2, #16
	lsr	r2, r2, #16
	strh	r2, [r3]
.LBE30:
	.loc 1 1012 0
	ldr	r3, [r7, #16]
	add	r3, r3, #2
	str	r3, [r7, #16]
.L330:
	mov	r3, #1
	ldr	r1, [r7, #16]
	ldr	r2, [r7, #8]
	cmp	r1, r2
	blt	.L341
	mov	r3, #0
.L341:
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	beq	.LCB5320
	b	.L342	@long jump
.LCB5320:
.LBE31:
	.loc 1 976 0
	b	.L378
.L315:
.LBB32:
	.loc 1 1047 0
	ldr	r2, .L381
	ldr	r3, .L381+36
	ldr	r3, [r2, r3]
	str	r3, [r7, #52]
	.loc 1 1048 0
	ldr	r2, .L381
	ldr	r3, .L381+40
	ldr	r3, [r2, r3]
	str	r3, [r7, #56]
	.loc 1 1051 0
	ldr	r2, .L381
	mov	r3, #218
	lsl	r3, r3, #3
	ldrb	r3, [r2, r3]
	cmp	r3, #0
	beq	.L344
	.loc 1 1054 0
	mov	r3, #0
	str	r3, [r7, #16]
	b	.L345
.L352:
.LBB33:
	.loc 1 1056 0
	ldr	r3, .L381
	ldr	r2, [r3, #16]
	ldr	r3, .L381+4
	lsl	r2, r2, #2
	ldr	r3, [r2, r3]
	str	r3, [r7, #60]
	.loc 1 1058 0
	ldr	r3, .L381
	ldr	r2, [r3, #16]
	ldr	r3, .L381
	ldr	r3, [r3, #12]
	ldr	r1, [r7, #60]
	mul	r3, r1
	cmp	r3, #0
	bge	.L346
	add	r3, r3, #127
.L346:
	asr	r3, r3, #7
	mov	r1, r3
	ldr	r0, [r7, #16]
	ldr	r3, .L381+20
	lsl	r0, r0, #2
	ldr	r3, [r0, r3]
	add	r0, r1, r3
	ldr	r3, .L381+4
	lsl	r1, r2, #2
	str	r0, [r1, r3]
	add	r2, r2, #1
	ldr	r3, .L381
	str	r2, [r3, #16]
	.loc 1 1060 0
	ldr	r3, .L381
	ldr	r2, [r3, #16]
	ldr	r3, .L381
	ldr	r3, [r3, #20]
	cmp	r2, r3
	blt	.L347
	.loc 1 1061 0
	ldr	r3, .L381
	mov	r2, #0
	str	r2, [r3, #16]
.L347:
	.loc 1 1063 0
	ldr	r2, [r7, #16]
	ldr	r3, .L381+24
	lsl	r2, r2, #2
	ldr	r3, [r2, r3]
	ldr	r2, [r7, #52]
	mul	r2, r3
	ldr	r3, [r7, #60]
	ldr	r1, [r7, #56]
	mul	r3, r1
	add	r3, r2, r3
	cmp	r3, #0
	bge	.L348
	add	r3, r3, #127
.L348:
	asr	r3, r3, #7
	str	r3, [r7, #48]
	.loc 1 1064 0
	ldr	r2, [r7, #48]
	ldr	r3, .L381+28
	cmp	r2, r3
	bge	.L349
	ldr	r3, .L381+28
	str	r3, [r7, #48]
	b	.L350
.L349:
	ldr	r2, [r7, #48]
	ldr	r3, .L381+32
	cmp	r2, r3
	ble	.L350
	ldr	r3, .L381+32
	str	r3, [r7, #48]
.L350:
	.loc 1 1065 0
	ldr	r3, [r7, #16]
	lsl	r2, r3, #1
	ldr	r3, [r7, #12]
	add	r3, r2, r3
	ldr	r2, [r7, #48]
	lsl	r2, r2, #16
	lsr	r2, r2, #16
	strh	r2, [r3]
.LBE33:
	.loc 1 1054 0
	ldr	r3, [r7, #16]
	add	r3, r3, #1
	str	r3, [r7, #16]
.L345:
	mov	r3, #1
	ldr	r1, [r7, #16]
	ldr	r2, [r7, #8]
	cmp	r1, r2
	blt	.L351
	mov	r3, #0
.L351:
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	bne	.L352
.LBE32:
	.loc 1 976 0
	b	.L378
.L344:
.LBB35:
	.loc 1 1071 0
	mov	r3, #0
	str	r3, [r7, #16]
	b	.L353
.L382:
	.align	2
.L381:
	.word	SoundData
	.word	Echo
	.word	Z
	.word	Loop
	.word	FilterTaps
	.word	EchoBuffer
	.word	MixBuffer
	.word	-32768
	.word	32767
	.word	1748
	.word	1756
.L361:
.LBB34:
	.loc 1 1073 0
	ldr	r3, .L383
	ldr	r2, [r3, #16]
	ldr	r3, .L383+4
	lsl	r2, r2, #2
	ldr	r4, [r2, r3]
	.loc 1 1075 0
	ldr	r3, .L383+8
	ldr	r2, [r3]
	mov	r3, #7
	and	r2, r2, r3
	ldr	r3, .L383+12
	lsl	r2, r2, #2
	str	r4, [r2, r3]
	.loc 1 1076 0
	ldr	r3, .L383+16
	ldr	r3, [r3]
	mul	r4, r3
	.loc 1 1077 0
	ldr	r3, .L383+8
	ldr	r3, [r3]
	sub	r2, r3, #1
	mov	r3, #7
	and	r2, r2, r3
	ldr	r3, .L383+12
	lsl	r2, r2, #2
	ldr	r2, [r2, r3]
	ldr	r3, .L383+16
	ldr	r3, [r3, #4]
	mul	r3, r2
	add	r4, r4, r3
	.loc 1 1078 0
	ldr	r3, .L383+8
	ldr	r3, [r3]
	sub	r2, r3, #2
	mov	r3, #7
	and	r2, r2, r3
	ldr	r3, .L383+12
	lsl	r2, r2, #2
	ldr	r2, [r2, r3]
	ldr	r3, .L383+16
	ldr	r3, [r3, #8]
	mul	r3, r2
	add	r4, r4, r3
	.loc 1 1079 0
	ldr	r3, .L383+8
	ldr	r3, [r3]
	sub	r2, r3, #3
	mov	r3, #7
	and	r2, r2, r3
	ldr	r3, .L383+12
	lsl	r2, r2, #2
	ldr	r2, [r2, r3]
	ldr	r3, .L383+16
	ldr	r3, [r3, #12]
	mul	r3, r2
	add	r4, r4, r3
	.loc 1 1080 0
	ldr	r3, .L383+8
	ldr	r3, [r3]
	sub	r2, r3, #4
	mov	r3, #7
	and	r2, r2, r3
	ldr	r3, .L383+12
	lsl	r2, r2, #2
	ldr	r2, [r2, r3]
	ldr	r3, .L383+16
	ldr	r3, [r3, #16]
	mul	r3, r2
	add	r4, r4, r3
	.loc 1 1081 0
	ldr	r3, .L383+8
	ldr	r3, [r3]
	sub	r2, r3, #5
	mov	r3, #7
	and	r2, r2, r3
	ldr	r3, .L383+12
	lsl	r2, r2, #2
	ldr	r2, [r2, r3]
	ldr	r3, .L383+16
	ldr	r3, [r3, #20]
	mul	r3, r2
	add	r4, r4, r3
	.loc 1 1082 0
	ldr	r3, .L383+8
	ldr	r3, [r3]
	sub	r2, r3, #6
	mov	r3, #7
	and	r2, r2, r3
	ldr	r3, .L383+12
	lsl	r2, r2, #2
	ldr	r2, [r2, r3]
	ldr	r3, .L383+16
	ldr	r3, [r3, #24]
	mul	r3, r2
	add	r4, r4, r3
	.loc 1 1083 0
	ldr	r3, .L383+8
	ldr	r3, [r3]
	sub	r2, r3, #7
	mov	r3, #7
	and	r2, r2, r3
	ldr	r3, .L383+12
	lsl	r2, r2, #2
	ldr	r2, [r2, r3]
	ldr	r3, .L383+16
	ldr	r3, [r3, #28]
	mul	r3, r2
	add	r4, r4, r3
	.loc 1 1084 0
	mov	r3, r4
	cmp	r3, #0
	bge	.L354
	add	r3, r3, #127
.L354:
	asr	r3, r3, #7
	mov	r4, r3
	.loc 1 1085 0
	ldr	r3, .L383+8
	ldr	r3, [r3]
	add	r2, r3, #1
	ldr	r3, .L383+8
	str	r2, [r3]
	.loc 1 1087 0
	ldr	r3, .L383
	ldr	r2, [r3, #16]
	ldr	r3, .L383
	ldr	r3, [r3, #12]
	mul	r3, r4
	cmp	r3, #0
	bge	.L355
	add	r3, r3, #127
.L355:
	asr	r3, r3, #7
	mov	r1, r3
	ldr	r0, [r7, #16]
	ldr	r3, .L383+20
	lsl	r0, r0, #2
	ldr	r3, [r0, r3]
	add	r0, r1, r3
	ldr	r3, .L383+4
	lsl	r1, r2, #2
	str	r0, [r1, r3]
	add	r2, r2, #1
	ldr	r3, .L383
	str	r2, [r3, #16]
	.loc 1 1089 0
	ldr	r3, .L383
	ldr	r2, [r3, #16]
	ldr	r3, .L383
	ldr	r3, [r3, #20]
	cmp	r2, r3
	blt	.L356
	.loc 1 1090 0
	ldr	r3, .L383
	mov	r2, #0
	str	r2, [r3, #16]
.L356:
	.loc 1 1092 0
	ldr	r2, [r7, #16]
	ldr	r3, .L383+24
	lsl	r2, r2, #2
	ldr	r3, [r2, r3]
	ldr	r2, [r7, #52]
	mul	r2, r3
	ldr	r3, [r7, #56]
	mul	r3, r4
	add	r3, r2, r3
	cmp	r3, #0
	bge	.L357
	add	r3, r3, #127
.L357:
	asr	r3, r3, #7
	str	r3, [r7, #48]
	.loc 1 1093 0
	ldr	r2, [r7, #48]
	ldr	r3, .L383+28
	cmp	r2, r3
	bge	.L358
	ldr	r3, .L383+28
	str	r3, [r7, #48]
	b	.L359
.L358:
	ldr	r2, [r7, #48]
	ldr	r3, .L383+32
	cmp	r2, r3
	ble	.L359
	ldr	r3, .L383+32
	str	r3, [r7, #48]
.L359:
	.loc 1 1094 0
	ldr	r3, [r7, #16]
	lsl	r2, r3, #1
	ldr	r3, [r7, #12]
	add	r3, r2, r3
	ldr	r2, [r7, #48]
	lsl	r2, r2, #16
	lsr	r2, r2, #16
	strh	r2, [r3]
.LBE34:
	.loc 1 1071 0
	ldr	r3, [r7, #16]
	add	r3, r3, #1
	str	r3, [r7, #16]
.L353:
	mov	r3, #1
	ldr	r1, [r7, #16]
	ldr	r2, [r7, #8]
	cmp	r1, r2
	blt	.L360
	mov	r3, #0
.L360:
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	beq	.LCB5684
	b	.L361	@long jump
.LCB5684:
.LBE35:
	.loc 1 976 0
	b	.L378
.L314:
.LBB36:
	.loc 1 1101 0
	ldr	r2, .L383
	ldr	r3, .L383+36
	ldr	r3, [r2, r3]
	str	r3, [r7, #68]
	.loc 1 1103 0
	ldr	r3, .L383+40
	ldrb	r3, [r3, #4]
	cmp	r3, #0
	beq	.L362
.LBB37:
	.loc 1 1105 0
	ldr	r2, .L383
	mov	r3, #219
	lsl	r3, r3, #3
	ldr	r3, [r2, r3]
	str	r3, [r7, #76]
	.loc 1 1108 0
	mov	r3, #0
	str	r3, [r7, #16]
	b	.L363
.L371:
	.loc 1 1110 0
	ldr	r2, [r7, #16]
	ldr	r3, .L383+24
	lsl	r2, r2, #2
	ldr	r3, [r2, r3]
	ldr	r2, [r7, #68]
	mul	r3, r2
	cmp	r3, #0
	bge	.L364
	add	r3, r3, #127
.L364:
	asr	r3, r3, #7
	str	r3, [r7, #64]
	.loc 1 1111 0
	ldr	r3, [r7, #16]
	add	r2, r3, #1
	ldr	r3, .L383+24
	lsl	r2, r2, #2
	ldr	r3, [r2, r3]
	ldr	r2, [r7, #76]
	mul	r3, r2
	cmp	r3, #0
	bge	.L365
	add	r3, r3, #127
.L365:
	asr	r3, r3, #7
	str	r3, [r7, #72]
	.loc 1 1113 0
	ldr	r2, [r7, #64]
	ldr	r3, .L383+28
	cmp	r2, r3
	bge	.L366
	ldr	r3, .L383+28
	str	r3, [r7, #64]
	b	.L367
.L366:
	ldr	r2, [r7, #64]
	ldr	r3, .L383+32
	cmp	r2, r3
	ble	.L367
	ldr	r3, .L383+32
	str	r3, [r7, #64]
.L367:
	.loc 1 1114 0
	ldr	r2, [r7, #72]
	ldr	r3, .L383+28
	cmp	r2, r3
	bge	.L368
	ldr	r3, .L383+28
	str	r3, [r7, #72]
	b	.L369
.L368:
	ldr	r2, [r7, #72]
	ldr	r3, .L383+32
	cmp	r2, r3
	ble	.L369
	ldr	r3, .L383+32
	str	r3, [r7, #72]
.L369:
	.loc 1 1115 0
	ldr	r3, [r7, #16]
	lsl	r2, r3, #1
	ldr	r3, [r7, #12]
	add	r3, r2, r3
	ldr	r2, [r7, #64]
	lsl	r2, r2, #16
	lsr	r2, r2, #16
	strh	r2, [r3]
	.loc 1 1116 0
	ldr	r3, [r7, #16]
	add	r3, r3, #1
	lsl	r2, r3, #1
	ldr	r3, [r7, #12]
	add	r3, r2, r3
	ldr	r2, [r7, #72]
	lsl	r2, r2, #16
	lsr	r2, r2, #16
	strh	r2, [r3]
	.loc 1 1108 0
	ldr	r3, [r7, #16]
	add	r3, r3, #2
	str	r3, [r7, #16]
.L363:
	mov	r3, #1
	ldr	r1, [r7, #16]
	ldr	r2, [r7, #8]
	cmp	r1, r2
	blt	.L370
	mov	r3, #0
.L370:
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	bne	.L371
	b	.L378
.L362:
.LBE37:
	.loc 1 1122 0
	mov	r3, #0
	str	r3, [r7, #16]
	b	.L372
.L377:
	.loc 1 1124 0
	ldr	r2, [r7, #16]
	ldr	r3, .L383+24
	lsl	r2, r2, #2
	ldr	r3, [r2, r3]
	ldr	r2, [r7, #68]
	mul	r3, r2
	cmp	r3, #0
	bge	.L373
	add	r3, r3, #127
.L373:
	asr	r3, r3, #7
	str	r3, [r7, #64]
	.loc 1 1126 0
	ldr	r2, [r7, #64]
	ldr	r3, .L383+28
	cmp	r2, r3
	bge	.L374
	ldr	r3, .L383+28
	str	r3, [r7, #64]
	b	.L375
.L374:
	ldr	r2, [r7, #64]
	ldr	r3, .L383+32
	cmp	r2, r3
	ble	.L375
	ldr	r3, .L383+32
	str	r3, [r7, #64]
.L375:
	.loc 1 1127 0
	ldr	r3, [r7, #16]
	lsl	r2, r3, #1
	ldr	r3, [r7, #12]
	add	r3, r2, r3
	ldr	r2, [r7, #64]
	lsl	r2, r2, #16
	lsr	r2, r2, #16
	strh	r2, [r3]
	.loc 1 1122 0
	ldr	r3, [r7, #16]
	add	r3, r3, #1
	str	r3, [r7, #16]
.L372:
	mov	r3, #1
	ldr	r1, [r7, #16]
	ldr	r2, [r7, #8]
	cmp	r1, r2
	blt	.L376
	mov	r3, #0
.L376:
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	bne	.L377
.L378:
.LBE36:
.LBE27:
	.loc 1 1131 0
	mov	sp, r7
	add	sp, sp, #84
	@ sp needed for prologue
	pop	{r4, r7, pc}
.L384:
	.align	2
.L383:
	.word	SoundData
	.word	Echo
	.word	Z
	.word	Loop
	.word	FilterTaps
	.word	EchoBuffer
	.word	MixBuffer
	.word	-32768
	.word	32767
	.word	1748
	.word	so
.LFE47:
	.cantunwind
	.fnend
	.size	S9xMixSamplesO, .-S9xMixSamplesO
	.align	2
	.global	_Z13S9xResetSoundh
	.hidden	_Z13S9xResetSoundh
	.code	16
	.thumb_func
	.type	_Z13S9xResetSoundh, %function
_Z13S9xResetSoundh:
	.fnstart
.LFB48:
	.loc 1 1138 0
	.save	{r4, r7, lr}
	push	{r4, r7, lr}
.LCFI60:
	sub	sp, sp, #20
.LCFI61:
	add	r7, sp, #0
.LCFI62:
	mov	r2, r0
	add	r3, r7, #7
	strb	r2, [r3]
.LBB38:
.LBB39:
	.loc 1 1139 0
	mov	r3, #0
	str	r3, [r7, #12]
	b	.L386
.L387:
	.loc 1 1141 0
	ldr	r2, [r7, #12]
	ldr	r3, .L390
	mov	r1, #212
	mul	r2, r1
	add	r3, r2, r3
	add	r3, r3, #48
	mov	r2, #0
	str	r2, [r3]
	.loc 1 1142 0
	ldr	r1, [r7, #12]
	ldr	r2, .L390
	mov	r3, #180
	mov	r0, #212
	mul	r1, r0
	add	r2, r1, r2
	add	r3, r2, r3
	mov	r2, #0
	str	r2, [r3]
	.loc 1 1143 0
	ldr	r2, [r7, #12]
	ldr	r3, .L390
	mov	r1, #212
	mul	r2, r1
	add	r3, r2, r3
	add	r3, r3, #52
	mov	r2, #0
	str	r2, [r3]
	.loc 1 1144 0
	ldr	r1, [r7, #12]
	ldr	r2, .L390
	mov	r3, #56
	mov	r0, #212
	mul	r1, r0
	add	r2, r1, r2
	add	r3, r2, r3
	mov	r2, #0
	strh	r2, [r3]
	.loc 1 1145 0
	ldr	r1, [r7, #12]
	ldr	r2, .L390
	mov	r3, #56
	mov	r0, #212
	mul	r1, r0
	add	r2, r1, r2
	add	r3, r2, r3
	mov	r2, #0
	strh	r2, [r3, #2]
	.loc 1 1146 0
	ldr	r2, [r7, #12]
	ldr	r3, .L390
	mov	r1, #212
	mul	r2, r1
	add	r3, r2, r3
	add	r3, r3, #60
	mov	r2, #0
	str	r2, [r3]
	.loc 1 1147 0
	ldr	r2, [r7, #12]
	ldr	r3, .L390
	mov	r1, #212
	mul	r2, r1
	add	r3, r2, r3
	add	r3, r3, #68
	mov	r2, #0
	str	r2, [r3]
	.loc 1 1148 0
	ldr	r1, [r7, #12]
	ldr	r2, .L390
	mov	r3, #72
	mov	r0, #212
	mul	r1, r0
	add	r2, r1, r2
	add	r3, r2, r3
	mov	r2, #0
	strb	r2, [r3]
	.loc 1 1149 0
	ldr	r1, [r7, #12]
	ldr	r2, .L390
	mov	r3, #80
	mov	r0, #212
	mul	r1, r0
	add	r2, r1, r2
	add	r3, r2, r3
	mov	r2, #0
	strh	r2, [r3, #4]
	.loc 1 1150 0
	ldr	r2, [r7, #12]
	ldr	r3, .L390
	mov	r1, #212
	mul	r2, r1
	add	r3, r2, r3
	add	r3, r3, #88
	mov	r2, #0
	str	r2, [r3]
	.loc 1 1151 0
	ldr	r2, [r7, #12]
	ldr	r3, .L390
	mov	r1, #212
	mul	r2, r1
	add	r3, r2, r3
	add	r3, r3, #92
	mov	r2, #0
	str	r2, [r3]
	.loc 1 1152 0
	ldr	r2, [r7, #12]
	ldr	r3, .L390
	mov	r1, #212
	mul	r2, r1
	add	r3, r2, r3
	add	r3, r3, #76
	mov	r2, #0
	str	r2, [r3]
	.loc 1 1153 0
	ldr	r1, [r7, #12]
	ldr	r2, .L390
	mov	r3, #184
	mov	r0, #212
	mul	r1, r0
	add	r2, r1, r2
	add	r3, r2, r3
	mov	r2, #0
	str	r2, [r3]
	.loc 1 1154 0
	ldr	r1, [r7, #12]
	ldr	r2, .L390
	mov	r3, #80
	mov	r0, #212
	mul	r1, r0
	add	r2, r1, r2
	add	r3, r2, r3
	mov	r2, #0
	strh	r2, [r3]
	.loc 1 1155 0
	ldr	r1, [r7, #12]
	ldr	r2, .L390
	mov	r3, #80
	mov	r0, #212
	mul	r1, r0
	add	r2, r1, r2
	add	r3, r2, r3
	mov	r2, #0
	strh	r2, [r3, #2]
	.loc 1 1156 0
	ldr	r2, [r7, #12]
	ldr	r3, .L390
	mov	r1, #212
	mul	r2, r1
	add	r3, r2, r3
	add	r3, r3, #96
	mov	r2, #0
	str	r2, [r3]
	.loc 1 1157 0
	ldr	r2, [r7, #12]
	ldr	r3, .L390
	mov	r1, #212
	mul	r2, r1
	add	r3, r2, r3
	add	r3, r3, #100
	mov	r2, #0
	str	r2, [r3]
	.loc 1 1158 0
	ldr	r2, [r7, #12]
	ldr	r3, .L390
	mov	r1, #212
	mul	r2, r1
	add	r3, r2, r3
	add	r3, r3, #104
	mov	r2, #0
	str	r2, [r3]
	.loc 1 1159 0
	ldr	r2, [r7, #12]
	ldr	r3, .L390
	mov	r1, #212
	mul	r2, r1
	add	r3, r2, r3
	add	r3, r3, #108
	mov	r2, #0
	str	r2, [r3]
	.loc 1 1160 0
	ldr	r2, [r7, #12]
	ldr	r3, .L390
	mov	r1, #212
	mul	r2, r1
	add	r3, r2, r3
	add	r3, r3, #112
	mov	r2, #0
	str	r2, [r3]
	.loc 1 1161 0
	ldr	r2, [r7, #12]
	ldr	r3, .L390
	mov	r1, #212
	mul	r2, r1
	add	r3, r2, r3
	add	r3, r3, #116
	mov	r2, #0
	str	r2, [r3]
	.loc 1 1163 0
	ldr	r1, [r7, #12]
	ldr	r2, .L390
	mov	r3, #200
	mov	r0, #212
	mul	r1, r0
	add	r2, r1, r2
	add	r3, r2, r3
	mov	r2, #0
	strb	r2, [r3, #4]
	.loc 1 1164 0
	ldr	r1, [r7, #12]
	ldr	r2, .L390
	mov	r3, #200
	mov	r0, #212
	mul	r1, r0
	add	r2, r1, r2
	add	r3, r2, r3
	mov	r2, #0
	strb	r2, [r3, #5]
	.loc 1 1165 0
	ldr	r1, [r7, #12]
	ldr	r2, .L390
	mov	r3, #200
	mov	r0, #212
	mul	r1, r0
	add	r2, r1, r2
	add	r3, r2, r3
	mov	r2, #0
	strb	r2, [r3, #6]
	.loc 1 1166 0
	ldr	r3, .L390
	mov	r2, #0
	str	r2, [r3, #16]
	.loc 1 1167 0
	ldr	r3, .L390
	mov	r2, #0
	str	r2, [r3, #12]
	.loc 1 1168 0
	ldr	r3, .L390
	mov	r2, #1
	str	r2, [r3, #20]
	.loc 1 1139 0
	ldr	r3, [r7, #12]
	add	r3, r3, #1
	str	r3, [r7, #12]
.L386:
	ldr	r3, [r7, #12]
	mov	r2, #7
	lsr	r0, r3, #31
	asr	r1, r2, #31
	mov	r4, r0
	cmp	r2, r3
	adc	r4, r4, r1
	mov	r3, r4
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	beq	.LCB6147
	b	.L387	@long jump
.LCB6147:
.LBE39:
	.loc 1 1170 0
	ldr	r3, .L390+4
	mov	r2, #127
	str	r2, [r3]
	.loc 1 1171 0
	ldr	r3, .L390+4
	mov	r2, #0
	str	r2, [r3, #4]
	.loc 1 1172 0
	ldr	r3, .L390+4
	mov	r2, #0
	str	r2, [r3, #8]
	.loc 1 1173 0
	ldr	r3, .L390+4
	mov	r2, #0
	str	r2, [r3, #12]
	.loc 1 1174 0
	ldr	r3, .L390+4
	mov	r2, #0
	str	r2, [r3, #16]
	.loc 1 1175 0
	ldr	r3, .L390+4
	mov	r2, #0
	str	r2, [r3, #20]
	.loc 1 1176 0
	ldr	r3, .L390+4
	mov	r2, #0
	str	r2, [r3, #24]
	.loc 1 1177 0
	ldr	r3, .L390+4
	mov	r2, #0
	str	r2, [r3, #28]
	.loc 1 1178 0
	ldr	r3, .L390+8
	mov	r2, #1
	strb	r2, [r3, #5]
	.loc 1 1179 0
	ldr	r3, .L390+8
	mov	r2, #1
	str	r2, [r3, #8]
	.loc 1 1180 0
	ldr	r2, .L390+8
	mov	r3, #1
	neg	r3, r3
	strb	r3, [r2, #6]
	.loc 1 1182 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L388
	.loc 1 1184 0
	ldr	r3, .L390
	mov	r2, #0
	strh	r2, [r3]
	.loc 1 1185 0
	ldr	r3, .L390
	mov	r2, #0
	strh	r2, [r3, #2]
	.loc 1 1186 0
	ldr	r3, .L390
	mov	r2, #0
	strh	r2, [r3, #4]
	.loc 1 1187 0
	ldr	r3, .L390
	mov	r2, #0
	strh	r2, [r3, #6]
	.loc 1 1188 0
	ldr	r3, .L390
	mov	r2, #0
	str	r2, [r3, #8]
	.loc 1 1189 0
	ldr	r3, .L390
	mov	r2, #0
	str	r2, [r3, #24]
	.loc 1 1190 0
	ldr	r3, .L390
	mov	r2, #0
	str	r2, [r3, #28]
	.loc 1 1191 0
	ldr	r3, .L390
	mov	r2, #0
	str	r2, [r3, #32]
	.loc 1 1192 0
	ldr	r3, .L390
	mov	r2, #0
	str	r2, [r3, #36]
	.loc 1 1193 0
	ldr	r3, .L390
	mov	r2, #0
	str	r2, [r3, #40]
	.loc 1 1194 0
	ldr	r3, .L390
	mov	r2, #0
	str	r2, [r3, #44]
	.loc 1 1195 0
	ldr	r2, .L390
	ldr	r3, .L390+12
	mov	r1, #0
	str	r1, [r2, r3]
	.loc 1 1196 0
	ldr	r2, .L390
	mov	r3, #219
	lsl	r3, r3, #3
	mov	r1, #0
	str	r1, [r2, r3]
	.loc 1 1197 0
	ldr	r2, .L390
	ldr	r3, .L390+16
	mov	r1, #0
	str	r1, [r2, r3]
	.loc 1 1198 0
	ldr	r2, .L390
	mov	r3, #220
	lsl	r3, r3, #3
	mov	r1, #0
	str	r1, [r2, r3]
	.loc 1 1199 0
	ldr	r2, .L390
	ldr	r3, .L390+20
	mov	r1, #0
	str	r1, [r2, r3]
.L388:
	.loc 1 1202 0
	ldr	r3, .L390
	mov	r2, #127
	strh	r2, [r3]
	.loc 1 1203 0
	ldr	r3, .L390
	mov	r2, #127
	strh	r2, [r3, #2]
	.loc 1 1204 0
	ldr	r2, .L390
	mov	r3, #219
	lsl	r3, r3, #3
	mov	r1, #127
	str	r1, [r2, r3]
	ldr	r2, .L390
	mov	r3, #219
	lsl	r3, r3, #3
	ldr	r1, [r2, r3]
	ldr	r2, .L390
	ldr	r3, .L390+12
	str	r1, [r2, r3]
	.loc 1 1205 0
	ldr	r2, .L390
	mov	r3, #218
	lsl	r3, r3, #3
	mov	r1, #1
	strb	r1, [r2, r3]
.LBE38:
	.loc 1 1206 0
	mov	sp, r7
	add	sp, sp, #20
	@ sp needed for prologue
	pop	{r4, r7, pc}
.L391:
	.align	2
.L390:
	.word	SoundData
	.word	FilterTaps
	.word	so
	.word	1748
	.word	1756
	.word	1764
.LFE48:
	.cantunwind
	.fnend
	.size	_Z13S9xResetSoundh, .-_Z13S9xResetSoundh
	.global	__aeabi_uidiv
	.global	__aeabi_ldivmod
	.align	2
	.global	_Z18S9xSetPlaybackRatej
	.hidden	_Z18S9xSetPlaybackRatej
	.code	16
	.thumb_func
	.type	_Z18S9xSetPlaybackRatej, %function
_Z18S9xSetPlaybackRatej:
	.fnstart
.LFB49:
	.loc 1 1218 0
	.save	{r4, r5, r6, r7, lr}
	push	{r4, r5, r6, r7, lr}
.LCFI63:
	mov	r7, sl
	mov	r6, r8
	.save	{r8, sl}
	push	{r6, r7}
.LCFI64:
	sub	sp, sp, #260
.LCFI65:
	add	r7, sp, #0
.LCFI66:
	mov	r1, #236
	add	r1, r1, r7
	str	r0, [r1]
.LBB40:
	.loc 1 1219 0
	mov	r3, #236
	add	r3, r3, r7
	ldr	r2, [r3]
	ldr	r3, .L419
	str	r2, [r3]
	.loc 1 1221 0
	mov	r4, #236
	add	r4, r4, r7
	ldr	r3, [r4]
	cmp	r3, #0
	bne	.LCB6308
	b	.L393	@long jump
.LCB6308:
.LBB41:
	.loc 1 1223 0
	mov	r0, #128
	lsl	r0, r0, #20
	mov	r2, #236
	add	r2, r2, r7
	ldr	r1, [r2]
	bl	__aeabi_uidiv
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L419
	str	r2, [r3, #12]
	.loc 1 1231 0
	mov	r3, #0
	mov	r4, #244
	add	r4, r4, r7
	str	r3, [r4]
	b	.L394
.L397:
	.loc 1 1232 0
	mov	r3, #0
	mov	r0, #248
	add	r0, r0, r7
	str	r3, [r0]
	b	.L395
.L396:
	.loc 1 1233 0
	mov	r1, #244
	add	r1, r1, r7
	ldr	r1, [r1]
	mov	r8, r1
	mov	r2, #248
	add	r2, r2, r7
	ldr	r2, [r2]
	mov	sl, r2
	mov	r4, #248
	add	r4, r4, r7
	ldr	r3, [r4]
	ldr	r2, .L419+4
	lsl	r3, r3, #2
	ldr	r3, [r3, r2]
	.loc 1 1234 0
	mov	r5, r3
	asr	r3, r3, #31
	mov	r6, r3
	mov	r3, r5
	mov	r4, r6
	lsr	r2, r3, #27
	lsl	r0, r4, #5
	mov	r1, #140
	add	r1, r1, r7
	str	r0, [r1]
	mov	r1, #140
	add	r1, r1, r7
	ldr	r0, [r1]
	orr	r0, r0, r2
	str	r0, [r1]
	lsl	r2, r3, #5
	mov	r0, #136
	add	r0, r0, r7
	str	r2, [r0]
	mov	r1, #136
	add	r1, r1, r7
	ldr	r3, [r1]
	ldr	r4, [r1, #4]
	sub	r3, r3, r5
	sbc	r4, r4, r6
	lsr	r2, r3, #30
	lsl	r0, r4, #2
	mov	r1, #132
	add	r1, r1, r7
	str	r0, [r1]
	mov	r1, #132
	add	r1, r1, r7
	ldr	r0, [r1]
	orr	r0, r0, r2
	str	r0, [r1]
	lsl	r2, r3, #2
	mov	r0, #128
	add	r0, r0, r7
	str	r2, [r0]
	mov	r1, #128
	add	r1, r1, r7
	ldr	r3, [r1]
	ldr	r4, [r1, #4]
	add	r3, r3, r5
	adc	r4, r4, r6
	lsr	r2, r3, #13
	lsl	r0, r4, #19
	str	r0, [r7, #124]
	ldr	r1, [r7, #124]
	orr	r1, r1, r2
	str	r1, [r7, #124]
	lsl	r2, r3, #19
	str	r2, [r7, #120]
	ldr	r0, [r7, #120]
	ldr	r1, [r7, #124]
	mov	r4, #244
	add	r4, r4, r7
	ldr	r3, [r4]
	ldr	r2, .L419+8
	lsl	r3, r3, #2
	ldr	r2, [r3, r2]
	mov	r4, #236
	add	r4, r4, r7
	ldr	r3, [r4]
	mul	r3, r2
	mov	r2, #144
	add	r2, r2, r7
	str	r3, [r2]
	mov	r3, #0
	mov	r4, #148
	add	r4, r4, r7
	str	r3, [r4]
	mov	r4, #144
	add	r4, r4, r7
	ldr	r2, [r4]
	ldr	r3, [r4, #4]
	bl	__aeabi_ldivmod
	mov	r3, r0
	mov	r4, r1
	mov	r1, r3
	ldr	r2, .L419+12
	mov	r3, r8
	lsl	r3, r3, #2
	add	r3, r3, r8
	lsl	r3, r3, #1
	add	r3, r3, sl
	lsl	r3, r3, #2
	str	r1, [r3, r2]
	.loc 1 1232 0
	mov	r0, #248
	add	r0, r0, r7
	ldr	r3, [r0]
	add	r3, r3, #1
	mov	r1, #248
	add	r1, r1, r7
	str	r3, [r1]
.L395:
	mov	r2, #248
	add	r2, r2, r7
	ldr	r0, [r2]
	mov	r2, #9
	lsr	r1, r0, #31
	asr	r3, r2, #31
	cmp	r2, r0
	adc	r3, r3, r1
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	bne	.L396
	.loc 1 1231 0
	mov	r4, #244
	add	r4, r4, r7
	ldr	r3, [r4]
	add	r3, r3, #1
	mov	r0, #244
	add	r0, r0, r7
	str	r3, [r0]
.L394:
	mov	r1, #244
	add	r1, r1, r7
	ldr	r0, [r1]
	mov	r2, #15
	lsr	r1, r0, #31
	asr	r3, r2, #31
	cmp	r2, r0
	adc	r3, r3, r1
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	beq	.LCB6471
	b	.L397	@long jump
.LCB6471:
	.loc 1 1235 0
	mov	r3, #0
	mov	r2, #244
	add	r2, r2, r7
	str	r3, [r2]
	b	.L398
.L401:
	.loc 1 1236 0
	mov	r3, #0
	mov	r4, #248
	add	r4, r4, r7
	str	r3, [r4]
	b	.L399
.L400:
	.loc 1 1237 0
	mov	r0, #244
	add	r0, r0, r7
	ldr	r5, [r0]
	mov	r1, #248
	add	r1, r1, r7
	ldr	r6, [r1]
	mov	r2, #248
	add	r2, r2, r7
	ldr	r3, [r2]
	ldr	r2, .L419+4
	lsl	r3, r3, #2
	ldr	r3, [r3, r2]
	.loc 1 1238 0
	mov	r4, #152
	add	r4, r4, r7
	str	r3, [r4]
	asr	r3, r3, #31
	mov	r0, #156
	add	r0, r0, r7
	str	r3, [r0]
	mov	r1, #152
	add	r1, r1, r7
	ldr	r3, [r1]
	ldr	r4, [r1, #4]
	lsr	r2, r3, #27
	lsl	r0, r4, #5
	str	r0, [r7, #116]
	ldr	r1, [r7, #116]
	orr	r1, r1, r2
	str	r1, [r7, #116]
	lsl	r2, r3, #5
	str	r2, [r7, #112]
	ldr	r3, [r7, #112]
	ldr	r4, [r7, #116]
	mov	r1, #152
	add	r1, r1, r7
	ldr	r0, [r1]
	ldr	r1, [r1, #4]
	sub	r3, r3, r0
	sbc	r4, r4, r1
	lsr	r2, r3, #30
	lsl	r0, r4, #2
	str	r0, [r7, #108]
	ldr	r1, [r7, #108]
	orr	r1, r1, r2
	str	r1, [r7, #108]
	lsl	r2, r3, #2
	str	r2, [r7, #104]
	ldr	r3, [r7, #104]
	ldr	r4, [r7, #108]
	mov	r1, #152
	add	r1, r1, r7
	ldr	r0, [r1]
	ldr	r1, [r1, #4]
	add	r3, r3, r0
	adc	r4, r4, r1
	lsr	r2, r3, #13
	lsl	r0, r4, #19
	str	r0, [r7, #100]
	ldr	r1, [r7, #100]
	orr	r1, r1, r2
	str	r1, [r7, #100]
	lsl	r2, r3, #19
	str	r2, [r7, #96]
	ldr	r0, [r7, #96]
	ldr	r1, [r7, #100]
	mov	r4, #244
	add	r4, r4, r7
	ldr	r3, [r4]
	ldr	r2, .L419+16
	lsl	r3, r3, #2
	ldr	r2, [r3, r2]
	mov	r4, #236
	add	r4, r4, r7
	ldr	r3, [r4]
	mul	r3, r2
	mov	r2, #160
	add	r2, r2, r7
	str	r3, [r2]
	mov	r3, #0
	mov	r4, #164
	add	r4, r4, r7
	str	r3, [r4]
	mov	r4, #160
	add	r4, r4, r7
	ldr	r2, [r4]
	ldr	r3, [r4, #4]
	bl	__aeabi_ldivmod
	mov	r3, r0
	mov	r4, r1
	mov	r1, r3
	ldr	r2, .L419+20
	mov	r3, r5
	lsl	r3, r3, #2
	add	r3, r3, r5
	lsl	r3, r3, #1
	add	r3, r3, r6
	lsl	r3, r3, #2
	str	r1, [r3, r2]
	.loc 1 1236 0
	mov	r0, #248
	add	r0, r0, r7
	ldr	r3, [r0]
	add	r3, r3, #1
	mov	r1, #248
	add	r1, r1, r7
	str	r3, [r1]
.L399:
	mov	r2, #248
	add	r2, r2, r7
	ldr	r0, [r2]
	mov	r2, #9
	lsr	r1, r0, #31
	asr	r3, r2, #31
	cmp	r2, r0
	adc	r3, r3, r1
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	bne	.L400
	.loc 1 1235 0
	mov	r4, #244
	add	r4, r4, r7
	ldr	r3, [r4]
	add	r3, r3, #1
	mov	r0, #244
	add	r0, r0, r7
	str	r3, [r0]
.L398:
	mov	r1, #244
	add	r1, r1, r7
	ldr	r0, [r1]
	mov	r2, #7
	lsr	r1, r0, #31
	asr	r3, r2, #31
	cmp	r2, r0
	adc	r3, r3, r1
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	beq	.LCB6616
	b	.L401	@long jump
.LCB6616:
	.loc 1 1240 0
	mov	r3, #0
	mov	r2, #244
	add	r2, r2, r7
	str	r3, [r2]
	b	.L402
.L405:
	.loc 1 1241 0
	mov	r3, #0
	mov	r4, #248
	add	r4, r4, r7
	str	r3, [r4]
	b	.L403
.L420:
	.align	2
.L419:
	.word	so
	.word	_ZZ18S9xSetPlaybackRatejE5steps
	.word	AttackRate
	.word	AttackERate
	.word	DecayRate
	.word	DecayERate
.L404:
	.loc 1 1242 0
	mov	r0, #244
	add	r0, r0, r7
	ldr	r5, [r0]
	mov	r1, #248
	add	r1, r1, r7
	ldr	r6, [r1]
	mov	r2, #248
	add	r2, r2, r7
	ldr	r3, [r2]
	ldr	r2, .L421
	lsl	r3, r3, #2
	ldr	r3, [r3, r2]
	.loc 1 1243 0
	mov	r4, #168
	add	r4, r4, r7
	str	r3, [r4]
	asr	r3, r3, #31
	mov	r0, #172
	add	r0, r0, r7
	str	r3, [r0]
	mov	r1, #168
	add	r1, r1, r7
	ldr	r3, [r1]
	ldr	r4, [r1, #4]
	lsr	r2, r3, #27
	lsl	r0, r4, #5
	str	r0, [r7, #92]
	ldr	r1, [r7, #92]
	orr	r1, r1, r2
	str	r1, [r7, #92]
	lsl	r2, r3, #5
	str	r2, [r7, #88]
	ldr	r3, [r7, #88]
	ldr	r4, [r7, #92]
	mov	r1, #168
	add	r1, r1, r7
	ldr	r0, [r1]
	ldr	r1, [r1, #4]
	sub	r3, r3, r0
	sbc	r4, r4, r1
	lsr	r2, r3, #30
	lsl	r0, r4, #2
	str	r0, [r7, #84]
	ldr	r1, [r7, #84]
	orr	r1, r1, r2
	str	r1, [r7, #84]
	lsl	r2, r3, #2
	str	r2, [r7, #80]
	ldr	r3, [r7, #80]
	ldr	r4, [r7, #84]
	mov	r1, #168
	add	r1, r1, r7
	ldr	r0, [r1]
	ldr	r1, [r1, #4]
	add	r3, r3, r0
	adc	r4, r4, r1
	lsr	r2, r3, #13
	lsl	r0, r4, #19
	str	r0, [r7, #76]
	ldr	r1, [r7, #76]
	orr	r1, r1, r2
	str	r1, [r7, #76]
	lsl	r2, r3, #19
	str	r2, [r7, #72]
	ldr	r0, [r7, #72]
	ldr	r1, [r7, #76]
	mov	r4, #244
	add	r4, r4, r7
	ldr	r3, [r4]
	ldr	r2, .L421+4
	lsl	r3, r3, #2
	ldr	r2, [r3, r2]
	mov	r4, #236
	add	r4, r4, r7
	ldr	r3, [r4]
	mul	r3, r2
	mov	r2, #176
	add	r2, r2, r7
	str	r3, [r2]
	mov	r3, #0
	mov	r4, #180
	add	r4, r4, r7
	str	r3, [r4]
	mov	r4, #176
	add	r4, r4, r7
	ldr	r2, [r4]
	ldr	r3, [r4, #4]
	bl	__aeabi_ldivmod
	mov	r3, r0
	mov	r4, r1
	mov	r1, r3
	ldr	r2, .L421+8
	mov	r3, r5
	lsl	r3, r3, #2
	add	r3, r3, r5
	lsl	r3, r3, #1
	add	r3, r3, r6
	lsl	r3, r3, #2
	str	r1, [r3, r2]
	.loc 1 1241 0
	mov	r0, #248
	add	r0, r0, r7
	ldr	r3, [r0]
	add	r3, r3, #1
	mov	r1, #248
	add	r1, r1, r7
	str	r3, [r1]
.L403:
	mov	r2, #248
	add	r2, r2, r7
	ldr	r0, [r2]
	mov	r2, #9
	lsr	r1, r0, #31
	asr	r3, r2, #31
	cmp	r2, r0
	adc	r3, r3, r1
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	bne	.L404
	.loc 1 1240 0
	mov	r4, #244
	add	r4, r4, r7
	ldr	r3, [r4]
	add	r3, r3, #1
	mov	r0, #244
	add	r0, r0, r7
	str	r3, [r0]
.L402:
	mov	r1, #244
	add	r1, r1, r7
	ldr	r0, [r1]
	mov	r2, #31
	lsr	r1, r0, #31
	asr	r3, r2, #31
	cmp	r2, r0
	adc	r3, r3, r1
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	beq	.LCB6772
	b	.L405	@long jump
.LCB6772:
	.loc 1 1245 0
	mov	r3, #0
	mov	r2, #244
	add	r2, r2, r7
	str	r3, [r2]
	b	.L406
.L409:
	.loc 1 1246 0
	mov	r3, #0
	mov	r4, #248
	add	r4, r4, r7
	str	r3, [r4]
	b	.L407
.L408:
	.loc 1 1247 0
	mov	r0, #244
	add	r0, r0, r7
	ldr	r5, [r0]
	mov	r1, #248
	add	r1, r1, r7
	ldr	r6, [r1]
	mov	r2, #248
	add	r2, r2, r7
	ldr	r3, [r2]
	ldr	r2, .L421
	lsl	r3, r3, #2
	ldr	r3, [r3, r2]
	.loc 1 1248 0
	mov	r4, #184
	add	r4, r4, r7
	str	r3, [r4]
	asr	r3, r3, #31
	mov	r0, #188
	add	r0, r0, r7
	str	r3, [r0]
	mov	r1, #184
	add	r1, r1, r7
	ldr	r3, [r1]
	ldr	r4, [r1, #4]
	lsr	r2, r3, #27
	lsl	r0, r4, #5
	str	r0, [r7, #68]
	ldr	r1, [r7, #68]
	orr	r1, r1, r2
	str	r1, [r7, #68]
	lsl	r2, r3, #5
	str	r2, [r7, #64]
	ldr	r3, [r7, #64]
	ldr	r4, [r7, #68]
	mov	r1, #184
	add	r1, r1, r7
	ldr	r0, [r1]
	ldr	r1, [r1, #4]
	sub	r3, r3, r0
	sbc	r4, r4, r1
	lsr	r2, r3, #30
	lsl	r0, r4, #2
	str	r0, [r7, #60]
	ldr	r1, [r7, #60]
	orr	r1, r1, r2
	str	r1, [r7, #60]
	lsl	r2, r3, #2
	str	r2, [r7, #56]
	ldr	r3, [r7, #56]
	ldr	r4, [r7, #60]
	mov	r1, #184
	add	r1, r1, r7
	ldr	r0, [r1]
	ldr	r1, [r1, #4]
	add	r3, r3, r0
	adc	r4, r4, r1
	lsr	r2, r3, #13
	lsl	r0, r4, #19
	str	r0, [r7, #52]
	ldr	r1, [r7, #52]
	orr	r1, r1, r2
	str	r1, [r7, #52]
	lsl	r2, r3, #19
	str	r2, [r7, #48]
	ldr	r0, [r7, #48]
	ldr	r1, [r7, #52]
	mov	r4, #244
	add	r4, r4, r7
	ldr	r3, [r4]
	ldr	r2, .L421+12
	lsl	r3, r3, #2
	ldr	r2, [r3, r2]
	mov	r4, #236
	add	r4, r4, r7
	ldr	r3, [r4]
	mul	r3, r2
	mov	r2, #192
	add	r2, r2, r7
	str	r3, [r2]
	mov	r3, #0
	mov	r4, #196
	add	r4, r4, r7
	str	r3, [r4]
	mov	r4, #192
	add	r4, r4, r7
	ldr	r2, [r4]
	ldr	r3, [r4, #4]
	bl	__aeabi_ldivmod
	mov	r3, r0
	mov	r4, r1
	mov	r1, r3
	ldr	r2, .L421+16
	mov	r3, r5
	lsl	r3, r3, #2
	add	r3, r3, r5
	lsl	r3, r3, #1
	add	r3, r3, r6
	lsl	r3, r3, #2
	str	r1, [r3, r2]
	.loc 1 1246 0
	mov	r0, #248
	add	r0, r0, r7
	ldr	r3, [r0]
	add	r3, r3, #1
	mov	r1, #248
	add	r1, r1, r7
	str	r3, [r1]
.L407:
	mov	r2, #248
	add	r2, r2, r7
	ldr	r0, [r2]
	mov	r2, #9
	lsr	r1, r0, #31
	asr	r3, r2, #31
	cmp	r2, r0
	adc	r3, r3, r1
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	bne	.L408
	.loc 1 1245 0
	mov	r4, #244
	add	r4, r4, r7
	ldr	r3, [r4]
	add	r3, r3, #1
	mov	r0, #244
	add	r0, r0, r7
	str	r3, [r0]
.L406:
	mov	r1, #244
	add	r1, r1, r7
	ldr	r0, [r1]
	mov	r2, #31
	lsr	r1, r0, #31
	asr	r3, r2, #31
	cmp	r2, r0
	adc	r3, r3, r1
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	beq	.LCB6917
	b	.L409	@long jump
.LCB6917:
	.loc 1 1250 0
	mov	r3, #0
	mov	r2, #244
	add	r2, r2, r7
	str	r3, [r2]
	b	.L410
.L413:
	.loc 1 1251 0
	mov	r3, #0
	mov	r4, #248
	add	r4, r4, r7
	str	r3, [r4]
	b	.L411
.L412:
	.loc 1 1252 0
	mov	r0, #244
	add	r0, r0, r7
	ldr	r5, [r0]
	mov	r1, #248
	add	r1, r1, r7
	ldr	r6, [r1]
	mov	r2, #248
	add	r2, r2, r7
	ldr	r3, [r2]
	ldr	r2, .L421
	lsl	r3, r3, #2
	ldr	r3, [r3, r2]
	.loc 1 1253 0
	mov	r4, #200
	add	r4, r4, r7
	str	r3, [r4]
	asr	r3, r3, #31
	mov	r0, #204
	add	r0, r0, r7
	str	r3, [r0]
	mov	r1, #200
	add	r1, r1, r7
	ldr	r3, [r1]
	ldr	r4, [r1, #4]
	lsr	r2, r3, #27
	lsl	r0, r4, #5
	str	r0, [r7, #44]
	ldr	r1, [r7, #44]
	orr	r1, r1, r2
	str	r1, [r7, #44]
	lsl	r2, r3, #5
	str	r2, [r7, #40]
	ldr	r3, [r7, #40]
	ldr	r4, [r7, #44]
	mov	r1, #200
	add	r1, r1, r7
	ldr	r0, [r1]
	ldr	r1, [r1, #4]
	sub	r3, r3, r0
	sbc	r4, r4, r1
	lsr	r2, r3, #30
	lsl	r0, r4, #2
	str	r0, [r7, #36]
	ldr	r1, [r7, #36]
	orr	r1, r1, r2
	str	r1, [r7, #36]
	lsl	r2, r3, #2
	str	r2, [r7, #32]
	ldr	r3, [r7, #32]
	ldr	r4, [r7, #36]
	mov	r1, #200
	add	r1, r1, r7
	ldr	r0, [r1]
	ldr	r1, [r1, #4]
	add	r3, r3, r0
	adc	r4, r4, r1
	lsr	r2, r3, #13
	lsl	r0, r4, #19
	str	r0, [r7, #28]
	ldr	r1, [r7, #28]
	orr	r1, r1, r2
	str	r1, [r7, #28]
	lsl	r2, r3, #19
	str	r2, [r7, #24]
	ldr	r0, [r7, #24]
	ldr	r1, [r7, #28]
	mov	r4, #244
	add	r4, r4, r7
	ldr	r3, [r4]
	ldr	r2, .L421+20
	lsl	r3, r3, #2
	ldr	r3, [r3, r2]
	lsr	r2, r3, #1
	mov	r4, #236
	add	r4, r4, r7
	ldr	r3, [r4]
	mul	r3, r2
	mov	r2, #208
	add	r2, r2, r7
	str	r3, [r2]
	mov	r3, #0
	mov	r4, #212
	add	r4, r4, r7
	str	r3, [r4]
	mov	r4, #208
	add	r4, r4, r7
	ldr	r2, [r4]
	ldr	r3, [r4, #4]
	bl	__aeabi_ldivmod
	mov	r3, r0
	mov	r4, r1
	mov	r1, r3
	ldr	r2, .L421+24
	mov	r3, r5
	lsl	r3, r3, #2
	add	r3, r3, r5
	lsl	r3, r3, #1
	add	r3, r3, r6
	lsl	r3, r3, #2
	str	r1, [r3, r2]
	.loc 1 1251 0
	mov	r0, #248
	add	r0, r0, r7
	ldr	r3, [r0]
	add	r3, r3, #1
	mov	r1, #248
	add	r1, r1, r7
	str	r3, [r1]
.L411:
	mov	r2, #248
	add	r2, r2, r7
	ldr	r0, [r2]
	mov	r2, #9
	lsr	r1, r0, #31
	asr	r3, r2, #31
	cmp	r2, r0
	adc	r3, r3, r1
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	bne	.L412
	.loc 1 1250 0
	mov	r4, #244
	add	r4, r4, r7
	ldr	r3, [r4]
	add	r3, r3, #1
	mov	r0, #244
	add	r0, r0, r7
	str	r3, [r0]
.L410:
	mov	r1, #244
	add	r1, r1, r7
	ldr	r0, [r1]
	mov	r2, #31
	lsr	r1, r0, #31
	asr	r3, r2, #31
	cmp	r2, r0
	adc	r3, r3, r1
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	beq	.LCB7063
	b	.L413	@long jump
.LCB7063:
	.loc 1 1255 0
	mov	r3, #0
	mov	r2, #248
	add	r2, r2, r7
	str	r3, [r2]
	b	.L414
.L422:
	.align	2
.L421:
	.word	_ZZ18S9xSetPlaybackRatejE5steps
	.word	SustainRate
	.word	SustainERate
	.word	IncreaseRate
	.word	IncreaseERate
	.word	DecreaseRateExp
	.word	DecreaseERateExp
.L415:
	.loc 1 1256 0
	mov	r3, #248
	add	r3, r3, r7
	ldr	r5, [r3]
	mov	r4, #248
	add	r4, r4, r7
	ldr	r3, [r4]
	ldr	r2, .L423
	lsl	r3, r3, #2
	ldr	r3, [r3, r2]
	.loc 1 1257 0
	mov	r0, #216
	add	r0, r0, r7
	str	r3, [r0]
	asr	r3, r3, #31
	mov	r1, #220
	add	r1, r1, r7
	str	r3, [r1]
	mov	r2, #216
	add	r2, r2, r7
	ldr	r3, [r2]
	ldr	r4, [r2, #4]
	lsr	r2, r3, #27
	lsl	r0, r4, #5
	str	r0, [r7, #20]
	ldr	r1, [r7, #20]
	orr	r1, r1, r2
	str	r1, [r7, #20]
	lsl	r2, r3, #5
	str	r2, [r7, #16]
	ldr	r3, [r7, #16]
	ldr	r4, [r7, #20]
	mov	r1, #216
	add	r1, r1, r7
	ldr	r0, [r1]
	ldr	r1, [r1, #4]
	sub	r3, r3, r0
	sbc	r4, r4, r1
	lsr	r2, r3, #30
	lsl	r0, r4, #2
	str	r0, [r7, #12]
	ldr	r1, [r7, #12]
	orr	r1, r1, r2
	str	r1, [r7, #12]
	lsl	r2, r3, #2
	str	r2, [r7, #8]
	ldr	r3, [r7, #8]
	ldr	r4, [r7, #12]
	mov	r1, #216
	add	r1, r1, r7
	ldr	r0, [r1]
	ldr	r1, [r1, #4]
	add	r3, r3, r0
	adc	r4, r4, r1
	lsr	r2, r3, #13
	lsl	r0, r4, #19
	str	r0, [r7, #4]
	ldr	r1, [r7, #4]
	orr	r1, r1, r2
	str	r1, [r7, #4]
	lsl	r2, r3, #19
	str	r2, [r7]
	ldr	r1, [r7]
	ldr	r2, [r7, #4]
	mov	r4, #236
	add	r4, r4, r7
	ldr	r3, [r4]
	lsl	r3, r3, #3
	mov	r0, #224
	add	r0, r0, r7
	str	r3, [r0]
	mov	r3, #0
	mov	r4, #228
	add	r4, r4, r7
	str	r3, [r4]
	mov	r0, r1
	mov	r1, r2
	mov	r4, #224
	add	r4, r4, r7
	ldr	r2, [r4]
	ldr	r3, [r4, #4]
	bl	__aeabi_ldivmod
	mov	r3, r0
	mov	r4, r1
	mov	r1, r3
	ldr	r2, .L423+4
	lsl	r3, r5, #2
	str	r1, [r3, r2]
	.loc 1 1255 0
	mov	r0, #248
	add	r0, r0, r7
	ldr	r3, [r0]
	add	r3, r3, #1
	mov	r1, #248
	add	r1, r1, r7
	str	r3, [r1]
.L414:
	mov	r3, #248
	add	r3, r3, r7
	ldr	r2, [r3]
	mov	r1, #9
	lsr	r0, r2, #31
	asr	r3, r1, #31
	cmp	r1, r2
	adc	r3, r3, r0
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	bne	.L415
.L393:
.LBE41:
	.loc 1 1260 0
	ldr	r2, .L423+8
	mov	r3, #136
	ldrb	r3, [r2, r3]
	mov	r2, r3
	mov	r3, #15
	and	r3, r3, r2
	mov	r0, r3
	bl	_Z15S9xSetEchoDelayi
.LBB42:
	.loc 1 1261 0
	mov	r3, #0
	mov	r4, #252
	add	r4, r4, r7
	str	r3, [r4]
	b	.L416
.L417:
	.loc 1 1262 0
	mov	r0, #252
	add	r0, r0, r7
	ldr	r2, [r0]
	ldr	r3, .L423+12
	mov	r1, #212
	mul	r2, r1
	add	r3, r2, r3
	add	r3, r3, #60
	ldr	r3, [r3]
	mov	r1, #252
	add	r1, r1, r7
	ldr	r2, [r1]
	mov	r0, r2
	mov	r1, r3
	bl	_ZL20S9xSetSoundFrequencyii
	.loc 1 1261 0
	mov	r2, #252
	add	r2, r2, r7
	ldr	r3, [r2]
	add	r3, r3, #1
	mov	r4, #252
	add	r4, r4, r7
	str	r3, [r4]
.L416:
	mov	r0, #252
	add	r0, r0, r7
	ldr	r3, [r0]
	mov	r2, #7
	lsr	r0, r3, #31
	asr	r1, r2, #31
	mov	r4, r0
	cmp	r2, r3
	adc	r4, r4, r1
	mov	r3, r4
	lsl	r3, r3, #24
	lsr	r3, r3, #24
	cmp	r3, #0
	bne	.L417
.LBE42:
.LBE40:
	.loc 1 1263 0
	mov	sp, r7
	add	sp, sp, #260
	@ sp needed for prologue
	pop	{r2, r3}
	mov	r8, r2
	mov	sl, r3
	pop	{r4, r5, r6, r7, pc}
.L424:
	.align	2
.L423:
	.word	_ZZ18S9xSetPlaybackRatejE5steps
	.word	KeyOffERate
	.word	APU
	.word	SoundData
.LFE49:
	.cantunwind
	.fnend
	.size	_Z18S9xSetPlaybackRatej, .-_Z18S9xSetPlaybackRatej
	.align	2
	.global	S9xInitSound
	.hidden	S9xInitSound
	.code	16
	.thumb_func
	.type	S9xInitSound, %function
S9xInitSound:
	.fnstart
.LFB50:
	.loc 1 1266 0
	.save	{r7, lr}
	push	{r7, lr}
.LCFI67:
	add	r7, sp, #0
.LCFI68:
	.loc 1 1267 0
	ldr	r3, .L427
	mov	r2, #0
	str	r2, [r3]
	.loc 1 1268 0
	ldr	r3, .L427
	mov	r2, #0
	strb	r2, [r3, #4]
	.loc 1 1269 0
	ldr	r2, .L427
	mov	r3, #1
	neg	r3, r3
	strb	r3, [r2, #6]
	.loc 1 1271 0
	mov	r0, #1
	bl	_Z13S9xResetSoundh
	.loc 1 1272 0
	mov	r0, #1
	bl	_ZL15S9xSetSoundMuteh
	.loc 1 1274 0
	mov	r3, #1
	.loc 1 1275 0
	mov	r0, r3
	mov	sp, r7
	@ sp needed for prologue
	pop	{r7, pc}
.L428:
	.align	2
.L427:
	.word	so
.LFE50:
	.cantunwind
	.fnend
	.size	S9xInitSound, .-S9xInitSound
	.data
	.align	2
	.type	_ZZ18S9xSetPlaybackRatejE5steps, %object
	.size	_ZZ18S9xSetPlaybackRatejE5steps, 40
_ZZ18S9xSetPlaybackRatejE5steps:
	.word	0
	.word	64
	.word	619
	.word	619
	.word	128
	.word	1
	.word	64
	.word	55
	.word	64
	.word	619
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
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.byte	0x4
	.4byte	.LCFI0-.LFB0
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
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI2-.LCFI1
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.byte	0x4
	.4byte	.LCFI3-.LFB9
	.byte	0xe
	.uleb128 0x8
	.byte	0x11
	.uleb128 0x7
	.sleb128 2
	.byte	0x11
	.uleb128 0xe
	.sleb128 1
	.byte	0x4
	.4byte	.LCFI4-.LCFI3
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI5-.LCFI4
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.byte	0x4
	.4byte	.LCFI6-.LFB10
	.byte	0xe
	.uleb128 0x8
	.byte	0x11
	.uleb128 0x7
	.sleb128 2
	.byte	0x11
	.uleb128 0xe
	.sleb128 1
	.byte	0x4
	.4byte	.LCFI7-.LCFI6
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI8-.LCFI7
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.byte	0x4
	.4byte	.LCFI9-.LFB11
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
	.4byte	.LCFI10-.LCFI9
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI11-.LCFI10
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
	.4byte	.LCFI12-.LFB12
	.byte	0xe
	.uleb128 0x8
	.byte	0x11
	.uleb128 0x7
	.sleb128 2
	.byte	0x11
	.uleb128 0xe
	.sleb128 1
	.byte	0x4
	.4byte	.LCFI13-.LCFI12
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI14-.LCFI13
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.byte	0x4
	.4byte	.LCFI15-.LFB13
	.byte	0xe
	.uleb128 0x8
	.byte	0x11
	.uleb128 0x7
	.sleb128 2
	.byte	0x11
	.uleb128 0xe
	.sleb128 1
	.byte	0x4
	.4byte	.LCFI16-.LCFI15
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI17-.LCFI16
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.byte	0x4
	.4byte	.LCFI18-.LFB14
	.byte	0xe
	.uleb128 0x8
	.byte	0x11
	.uleb128 0x7
	.sleb128 2
	.byte	0x11
	.uleb128 0xe
	.sleb128 1
	.byte	0x4
	.4byte	.LCFI19-.LCFI18
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI20-.LCFI19
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE12:
.LSFDE14:
	.4byte	.LEFDE14-.LASFDE14
.LASFDE14:
	.4byte	.Lframe0
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.byte	0x4
	.4byte	.LCFI21-.LFB15
	.byte	0xe
	.uleb128 0x8
	.byte	0x11
	.uleb128 0x7
	.sleb128 2
	.byte	0x11
	.uleb128 0xe
	.sleb128 1
	.byte	0x4
	.4byte	.LCFI22-.LCFI21
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI23-.LCFI22
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.byte	0x4
	.4byte	.LCFI24-.LFB36
	.byte	0xe
	.uleb128 0x8
	.byte	0x11
	.uleb128 0x7
	.sleb128 2
	.byte	0x11
	.uleb128 0xe
	.sleb128 1
	.byte	0x4
	.4byte	.LCFI25-.LCFI24
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI26-.LCFI25
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE16:
.LSFDE18:
	.4byte	.LEFDE18-.LASFDE18
.LASFDE18:
	.4byte	.Lframe0
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.byte	0x4
	.4byte	.LCFI27-.LFB37
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
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI29-.LCFI28
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE18:
.LSFDE20:
	.4byte	.LEFDE20-.LASFDE20
.LASFDE20:
	.4byte	.Lframe0
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.byte	0x4
	.4byte	.LCFI30-.LFB38
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
	.4byte	.LCFI31-.LCFI30
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI32-.LCFI31
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE20:
.LSFDE22:
	.4byte	.LEFDE22-.LASFDE22
.LASFDE22:
	.4byte	.Lframe0
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.byte	0x4
	.4byte	.LCFI33-.LFB39
	.byte	0xe
	.uleb128 0x8
	.byte	0x11
	.uleb128 0x7
	.sleb128 2
	.byte	0x11
	.uleb128 0xe
	.sleb128 1
	.byte	0x4
	.4byte	.LCFI34-.LCFI33
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI35-.LCFI34
	.byte	0xc
	.uleb128 0x7
	.uleb128 0x18
	.align	2
.LEFDE22:
.LSFDE24:
	.4byte	.LEFDE24-.LASFDE24
.LASFDE24:
	.4byte	.Lframe0
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.byte	0x4
	.4byte	.LCFI36-.LFB40
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
	.4byte	.LCFI37-.LCFI36
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI38-.LCFI37
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE24:
.LSFDE26:
	.4byte	.LEFDE26-.LASFDE26
.LASFDE26:
	.4byte	.Lframe0
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.byte	0x4
	.4byte	.LCFI39-.LFB41
	.byte	0xe
	.uleb128 0x8
	.byte	0x11
	.uleb128 0x7
	.sleb128 2
	.byte	0x11
	.uleb128 0xe
	.sleb128 1
	.byte	0x4
	.4byte	.LCFI40-.LCFI39
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI41-.LCFI40
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE26:
.LSFDE28:
	.4byte	.LEFDE28-.LASFDE28
.LASFDE28:
	.4byte	.Lframe0
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.byte	0x4
	.4byte	.LCFI42-.LFB42
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
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI44-.LCFI43
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE28:
.LSFDE30:
	.4byte	.LEFDE30-.LASFDE30
.LASFDE30:
	.4byte	.Lframe0
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.byte	0x4
	.4byte	.LCFI45-.LFB43
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
	.uleb128 0x30
	.byte	0x4
	.4byte	.LCFI47-.LCFI46
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE30:
.LSFDE32:
	.4byte	.LEFDE32-.LASFDE32
.LASFDE32:
	.4byte	.Lframe0
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.byte	0x4
	.4byte	.LCFI48-.LFB44
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
	.byte	0xe
	.uleb128 0x48
	.byte	0x4
	.4byte	.LCFI50-.LCFI49
	.byte	0xc
	.uleb128 0x7
	.uleb128 0x40
	.align	2
.LEFDE32:
.LSFDE34:
	.4byte	.LEFDE34-.LASFDE34
.LASFDE34:
	.4byte	.Lframe0
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.byte	0x4
	.4byte	.LCFI51-.LFB45
	.byte	0xe
	.uleb128 0x8
	.byte	0x11
	.uleb128 0x7
	.sleb128 2
	.byte	0x11
	.uleb128 0xe
	.sleb128 1
	.byte	0x4
	.4byte	.LCFI52-.LCFI51
	.byte	0xe
	.uleb128 0x48
	.byte	0x4
	.4byte	.LCFI53-.LCFI52
	.byte	0xc
	.uleb128 0x7
	.uleb128 0x40
	.align	2
.LEFDE34:
.LSFDE36:
	.4byte	.LEFDE36-.LASFDE36
.LASFDE36:
	.4byte	.Lframe0
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.byte	0x4
	.4byte	.LCFI54-.LFB46
	.byte	0xe
	.uleb128 0x8
	.byte	0x11
	.uleb128 0x7
	.sleb128 2
	.byte	0x11
	.uleb128 0xe
	.sleb128 1
	.byte	0x4
	.4byte	.LCFI55-.LCFI54
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI56-.LCFI55
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE36:
.LSFDE38:
	.4byte	.LEFDE38-.LASFDE38
.LASFDE38:
	.4byte	.Lframe0
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.byte	0x4
	.4byte	.LCFI57-.LFB47
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
	.4byte	.LCFI58-.LCFI57
	.byte	0xe
	.uleb128 0x60
	.byte	0x4
	.4byte	.LCFI59-.LCFI58
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE38:
.LSFDE40:
	.4byte	.LEFDE40-.LASFDE40
.LASFDE40:
	.4byte	.Lframe0
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.byte	0x4
	.4byte	.LCFI60-.LFB48
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
	.4byte	.LCFI61-.LCFI60
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI62-.LCFI61
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE40:
.LSFDE42:
	.4byte	.LEFDE42-.LASFDE42
.LASFDE42:
	.4byte	.Lframe0
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.byte	0x4
	.4byte	.LCFI63-.LFB49
	.byte	0xe
	.uleb128 0x14
	.byte	0x11
	.uleb128 0x4
	.sleb128 5
	.byte	0x11
	.uleb128 0x5
	.sleb128 4
	.byte	0x11
	.uleb128 0x6
	.sleb128 3
	.byte	0x11
	.uleb128 0x7
	.sleb128 2
	.byte	0x11
	.uleb128 0xe
	.sleb128 1
	.byte	0x4
	.4byte	.LCFI64-.LCFI63
	.byte	0xe
	.uleb128 0x1c
	.byte	0x11
	.uleb128 0x8
	.sleb128 7
	.byte	0x11
	.uleb128 0xa
	.sleb128 6
	.byte	0x4
	.4byte	.LCFI65-.LCFI64
	.byte	0xe
	.uleb128 0x120
	.byte	0x4
	.4byte	.LCFI66-.LCFI65
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE42:
.LSFDE44:
	.4byte	.LEFDE44-.LASFDE44
.LASFDE44:
	.4byte	.Lframe0
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.byte	0x4
	.4byte	.LCFI67-.LFB50
	.byte	0xe
	.uleb128 0x8
	.byte	0x11
	.uleb128 0x7
	.sleb128 2
	.byte	0x11
	.uleb128 0xe
	.sleb128 1
	.byte	0x4
	.4byte	.LCFI68-.LCFI67
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE44:
	.text
.Letext0:
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LFB0-.Ltext0
	.4byte	.LCFI0-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LCFI0-.Ltext0
	.4byte	.LCFI1-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 8
	.4byte	.LCFI1-.Ltext0
	.4byte	.LCFI2-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 32
	.4byte	.LCFI2-.Ltext0
	.4byte	.LFE0-.Ltext0
	.2byte	0x2
	.byte	0x77
	.sleb128 32
	.4byte	0x0
	.4byte	0x0
.LLST1:
	.4byte	.LFB9-.Ltext0
	.4byte	.LCFI3-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LCFI3-.Ltext0
	.4byte	.LCFI4-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 8
	.4byte	.LCFI4-.Ltext0
	.4byte	.LCFI5-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 16
	.4byte	.LCFI5-.Ltext0
	.4byte	.LFE9-.Ltext0
	.2byte	0x2
	.byte	0x77
	.sleb128 16
	.4byte	0x0
	.4byte	0x0
.LLST2:
	.4byte	.LFB10-.Ltext0
	.4byte	.LCFI6-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LCFI6-.Ltext0
	.4byte	.LCFI7-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 8
	.4byte	.LCFI7-.Ltext0
	.4byte	.LCFI8-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 24
	.4byte	.LCFI8-.Ltext0
	.4byte	.LFE10-.Ltext0
	.2byte	0x2
	.byte	0x77
	.sleb128 24
	.4byte	0x0
	.4byte	0x0
.LLST3:
	.4byte	.LFB11-.Ltext0
	.4byte	.LCFI9-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LCFI9-.Ltext0
	.4byte	.LCFI10-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 12
	.4byte	.LCFI10-.Ltext0
	.4byte	.LCFI11-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 32
	.4byte	.LCFI11-.Ltext0
	.4byte	.LFE11-.Ltext0
	.2byte	0x2
	.byte	0x77
	.sleb128 32
	.4byte	0x0
	.4byte	0x0
.LLST4:
	.4byte	.LFB12-.Ltext0
	.4byte	.LCFI12-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LCFI12-.Ltext0
	.4byte	.LCFI13-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 8
	.4byte	.LCFI13-.Ltext0
	.4byte	.LCFI14-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 16
	.4byte	.LCFI14-.Ltext0
	.4byte	.LFE12-.Ltext0
	.2byte	0x2
	.byte	0x77
	.sleb128 16
	.4byte	0x0
	.4byte	0x0
.LLST5:
	.4byte	.LFB13-.Ltext0
	.4byte	.LCFI15-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LCFI15-.Ltext0
	.4byte	.LCFI16-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 8
	.4byte	.LCFI16-.Ltext0
	.4byte	.LCFI17-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 16
	.4byte	.LCFI17-.Ltext0
	.4byte	.LFE13-.Ltext0
	.2byte	0x2
	.byte	0x77
	.sleb128 16
	.4byte	0x0
	.4byte	0x0
.LLST6:
	.4byte	.LFB14-.Ltext0
	.4byte	.LCFI18-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LCFI18-.Ltext0
	.4byte	.LCFI19-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 8
	.4byte	.LCFI19-.Ltext0
	.4byte	.LCFI20-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 24
	.4byte	.LCFI20-.Ltext0
	.4byte	.LFE14-.Ltext0
	.2byte	0x2
	.byte	0x77
	.sleb128 24
	.4byte	0x0
	.4byte	0x0
.LLST7:
	.4byte	.LFB15-.Ltext0
	.4byte	.LCFI21-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LCFI21-.Ltext0
	.4byte	.LCFI22-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 8
	.4byte	.LCFI22-.Ltext0
	.4byte	.LCFI23-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 16
	.4byte	.LCFI23-.Ltext0
	.4byte	.LFE15-.Ltext0
	.2byte	0x2
	.byte	0x77
	.sleb128 16
	.4byte	0x0
	.4byte	0x0
.LLST8:
	.4byte	.LFB36-.Ltext0
	.4byte	.LCFI24-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LCFI24-.Ltext0
	.4byte	.LCFI25-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 8
	.4byte	.LCFI25-.Ltext0
	.4byte	.LCFI26-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 16
	.4byte	.LCFI26-.Ltext0
	.4byte	.LFE36-.Ltext0
	.2byte	0x2
	.byte	0x77
	.sleb128 16
	.4byte	0x0
	.4byte	0x0
.LLST9:
	.4byte	.LFB37-.Ltext0
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
	.sleb128 16
	.4byte	.LCFI29-.Ltext0
	.4byte	.LFE37-.Ltext0
	.2byte	0x2
	.byte	0x77
	.sleb128 16
	.4byte	0x0
	.4byte	0x0
.LLST10:
	.4byte	.LFB38-.Ltext0
	.4byte	.LCFI30-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LCFI30-.Ltext0
	.4byte	.LCFI31-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 12
	.4byte	.LCFI31-.Ltext0
	.4byte	.LCFI32-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 24
	.4byte	.LCFI32-.Ltext0
	.4byte	.LFE38-.Ltext0
	.2byte	0x2
	.byte	0x77
	.sleb128 24
	.4byte	0x0
	.4byte	0x0
.LLST11:
	.4byte	.LFB39-.Ltext0
	.4byte	.LCFI33-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LCFI33-.Ltext0
	.4byte	.LCFI34-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 8
	.4byte	.LCFI34-.Ltext0
	.4byte	.LCFI35-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 32
	.4byte	.LCFI35-.Ltext0
	.4byte	.LFE39-.Ltext0
	.2byte	0x2
	.byte	0x77
	.sleb128 24
	.4byte	0x0
	.4byte	0x0
.LLST12:
	.4byte	.LFB40-.Ltext0
	.4byte	.LCFI36-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LCFI36-.Ltext0
	.4byte	.LCFI37-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 12
	.4byte	.LCFI37-.Ltext0
	.4byte	.LCFI38-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 24
	.4byte	.LCFI38-.Ltext0
	.4byte	.LFE40-.Ltext0
	.2byte	0x2
	.byte	0x77
	.sleb128 24
	.4byte	0x0
	.4byte	0x0
.LLST13:
	.4byte	.LFB41-.Ltext0
	.4byte	.LCFI39-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LCFI39-.Ltext0
	.4byte	.LCFI40-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 8
	.4byte	.LCFI40-.Ltext0
	.4byte	.LCFI41-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 24
	.4byte	.LCFI41-.Ltext0
	.4byte	.LFE41-.Ltext0
	.2byte	0x2
	.byte	0x77
	.sleb128 24
	.4byte	0x0
	.4byte	0x0
.LLST14:
	.4byte	.LFB42-.Ltext0
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
	.sleb128 16
	.4byte	.LCFI44-.Ltext0
	.4byte	.LFE42-.Ltext0
	.2byte	0x2
	.byte	0x77
	.sleb128 16
	.4byte	0x0
	.4byte	0x0
.LLST15:
	.4byte	.LFB43-.Ltext0
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
	.sleb128 48
	.4byte	.LCFI47-.Ltext0
	.4byte	.LFE43-.Ltext0
	.2byte	0x2
	.byte	0x77
	.sleb128 48
	.4byte	0x0
	.4byte	0x0
.LLST16:
	.4byte	.LFB44-.Ltext0
	.4byte	.LCFI48-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LCFI48-.Ltext0
	.4byte	.LCFI49-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 8
	.4byte	.LCFI49-.Ltext0
	.4byte	.LCFI50-.Ltext0
	.2byte	0x3
	.byte	0x7d
	.sleb128 72
	.4byte	.LCFI50-.Ltext0
	.4byte	.LFE44-.Ltext0
	.2byte	0x3
	.byte	0x77
	.sleb128 64
	.4byte	0x0
	.4byte	0x0
.LLST17:
	.4byte	.LFB45-.Ltext0
	.4byte	.LCFI51-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LCFI51-.Ltext0
	.4byte	.LCFI52-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 8
	.4byte	.LCFI52-.Ltext0
	.4byte	.LCFI53-.Ltext0
	.2byte	0x3
	.byte	0x7d
	.sleb128 72
	.4byte	.LCFI53-.Ltext0
	.4byte	.LFE45-.Ltext0
	.2byte	0x3
	.byte	0x77
	.sleb128 64
	.4byte	0x0
	.4byte	0x0
.LLST18:
	.4byte	.LFB46-.Ltext0
	.4byte	.LCFI54-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LCFI54-.Ltext0
	.4byte	.LCFI55-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 8
	.4byte	.LCFI55-.Ltext0
	.4byte	.LCFI56-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 16
	.4byte	.LCFI56-.Ltext0
	.4byte	.LFE46-.Ltext0
	.2byte	0x2
	.byte	0x77
	.sleb128 16
	.4byte	0x0
	.4byte	0x0
.LLST19:
	.4byte	.LFB47-.Ltext0
	.4byte	.LCFI57-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LCFI57-.Ltext0
	.4byte	.LCFI58-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 12
	.4byte	.LCFI58-.Ltext0
	.4byte	.LCFI59-.Ltext0
	.2byte	0x3
	.byte	0x7d
	.sleb128 96
	.4byte	.LCFI59-.Ltext0
	.4byte	.LFE47-.Ltext0
	.2byte	0x3
	.byte	0x77
	.sleb128 96
	.4byte	0x0
	.4byte	0x0
.LLST20:
	.4byte	.LFB48-.Ltext0
	.4byte	.LCFI60-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LCFI60-.Ltext0
	.4byte	.LCFI61-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 12
	.4byte	.LCFI61-.Ltext0
	.4byte	.LCFI62-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 32
	.4byte	.LCFI62-.Ltext0
	.4byte	.LFE48-.Ltext0
	.2byte	0x2
	.byte	0x77
	.sleb128 32
	.4byte	0x0
	.4byte	0x0
.LLST21:
	.4byte	.LFB49-.Ltext0
	.4byte	.LCFI63-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LCFI63-.Ltext0
	.4byte	.LCFI64-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 20
	.4byte	.LCFI64-.Ltext0
	.4byte	.LCFI65-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 28
	.4byte	.LCFI65-.Ltext0
	.4byte	.LCFI66-.Ltext0
	.2byte	0x3
	.byte	0x7d
	.sleb128 288
	.4byte	.LCFI66-.Ltext0
	.4byte	.LFE49-.Ltext0
	.2byte	0x3
	.byte	0x77
	.sleb128 288
	.4byte	0x0
	.4byte	0x0
.LLST22:
	.4byte	.LFB50-.Ltext0
	.4byte	.LCFI67-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LCFI67-.Ltext0
	.4byte	.LCFI68-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 8
	.4byte	.LCFI68-.Ltext0
	.4byte	.LFE50-.Ltext0
	.2byte	0x2
	.byte	0x77
	.sleb128 8
	.4byte	0x0
	.4byte	0x0
	.file 3 "Z:/QtSDK_1.1_RC/Symbian/SDKs/Symbian3Qt472/epoc32/include/gcce/gcce.h"
	.file 4 "Z:/AntSnes/snes9x_asm_optimized/port.h"
	.file 5 "Z:/AntSnes/snes9x_asm_optimized/65c816.h"
	.file 6 "Z:/AntSnes/snes9x_asm_optimized/snes9x.h"
	.file 7 "Z:/AntSnes/snes9x_asm_optimized/spc700.h"
	.file 8 "Z:/AntSnes/snes9x_asm_optimized/apu.h"
	.file 9 "Z:/AntSnes/snes9x_asm_optimized/memmap.h"
	.file 10 "Z:/AntSnes/snes9x_asm_optimized/ppu.h"
	.file 11 "Z:/AntSnes/snes9x_asm_optimized/cpuexec.h"
	.file 12 "Z:/AntSnes/snes9x_asm_optimized/sa1.h"
	.file 13 "Z:/AntSnes/snes9x_asm_optimized/getset.h"
	.file 14 "<built-in>"
	.section	.debug_info
	.4byte	0x2f83
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF618
	.byte	0x4
	.4byte	.LASF619
	.4byte	.LASF620
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
	.4byte	.LASF621
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
	.byte	0x3
	.byte	0x78
	.4byte	0x66
	.uleb128 0x7
	.ascii	"std\000"
	.byte	0xe
	.byte	0x0
	.4byte	0x72
	.uleb128 0x8
	.4byte	.LASF8
	.byte	0x3
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
	.byte	0x4
	.byte	0x44
	.4byte	0x80
	.uleb128 0x8
	.4byte	.LASF10
	.byte	0x4
	.byte	0x45
	.4byte	0x80
	.uleb128 0x8
	.4byte	.LASF11
	.byte	0x4
	.byte	0x46
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
	.byte	0x4
	.byte	0x48
	.4byte	0x8e
	.uleb128 0x8
	.4byte	.LASF15
	.byte	0x4
	.byte	0x49
	.4byte	0x87
	.uleb128 0x8
	.4byte	.LASF16
	.byte	0x4
	.byte	0x4a
	.4byte	0x79
	.uleb128 0x8
	.4byte	.LASF17
	.byte	0x4
	.byte	0x4b
	.4byte	0x2c
	.uleb128 0x8
	.4byte	.LASF18
	.byte	0x4
	.byte	0x4d
	.4byte	0x80
	.uleb128 0xe
	.4byte	.LASF256
	.byte	0x2
	.byte	0x5
	.byte	0x65
	.4byte	0x161
	.uleb128 0xf
	.4byte	.LASF20
	.byte	0x2
	.byte	0x5
	.byte	0x67
	.4byte	0x14e
	.uleb128 0x10
	.ascii	"l\000"
	.byte	0x5
	.byte	0x67
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x10
	.ascii	"h\000"
	.byte	0x5
	.byte	0x67
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.byte	0x0
	.uleb128 0x11
	.ascii	"B\000"
	.byte	0x5
	.byte	0x67
	.4byte	0x129
	.uleb128 0x11
	.ascii	"W\000"
	.byte	0x5
	.byte	0x6b
	.4byte	0xcd
	.byte	0x0
	.uleb128 0xf
	.4byte	.LASF21
	.byte	0x10
	.byte	0x5
	.byte	0x6e
	.4byte	0x1dd
	.uleb128 0x10
	.ascii	"PB\000"
	.byte	0x5
	.byte	0x6f
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x10
	.ascii	"DB\000"
	.byte	0x5
	.byte	0x70
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0x10
	.ascii	"P\000"
	.byte	0x5
	.byte	0x71
	.4byte	0x11d
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x10
	.ascii	"A\000"
	.byte	0x5
	.byte	0x72
	.4byte	0x11d
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x10
	.ascii	"D\000"
	.byte	0x5
	.byte	0x73
	.4byte	0x11d
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x10
	.ascii	"X\000"
	.byte	0x5
	.byte	0x74
	.4byte	0x11d
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x10
	.ascii	"S\000"
	.byte	0x5
	.byte	0x75
	.4byte	0x11d
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0x10
	.ascii	"Y\000"
	.byte	0x5
	.byte	0x76
	.4byte	0x11d
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x10
	.ascii	"PC\000"
	.byte	0x5
	.byte	0x77
	.4byte	0xcd
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.byte	0x0
	.uleb128 0xf
	.4byte	.LASF22
	.byte	0x88
	.byte	0x6
	.byte	0xbd
	.4byte	0x41b
	.uleb128 0x12
	.4byte	.LASF23
	.byte	0x6
	.byte	0xbe
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x12
	.4byte	.LASF24
	.byte	0x6
	.byte	0xbf
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x12
	.4byte	.LASF25
	.byte	0x6
	.byte	0xc0
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x12
	.4byte	.LASF26
	.byte	0x6
	.byte	0xc1
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x12
	.4byte	.LASF27
	.byte	0x6
	.byte	0xc2
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x12
	.4byte	.LASF28
	.byte	0x6
	.byte	0xc3
	.4byte	0x161
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x10
	.ascii	"PC\000"
	.byte	0x6
	.byte	0xcd
	.4byte	0x41b
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x12
	.4byte	.LASF29
	.byte	0x6
	.byte	0xce
	.4byte	0xf1
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x12
	.4byte	.LASF30
	.byte	0x6
	.byte	0xcf
	.4byte	0x41b
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x12
	.4byte	.LASF31
	.byte	0x6
	.byte	0xd0
	.4byte	0x41b
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x12
	.4byte	.LASF32
	.byte	0x6
	.byte	0xd1
	.4byte	0x41b
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x12
	.4byte	.LASF33
	.byte	0x6
	.byte	0xd2
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0x12
	.4byte	.LASF34
	.byte	0x6
	.byte	0xd3
	.4byte	0xf1
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x12
	.4byte	.LASF35
	.byte	0x6
	.byte	0xd4
	.4byte	0xf1
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x12
	.4byte	.LASF36
	.byte	0x6
	.byte	0xd5
	.4byte	0xf1
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x12
	.4byte	.LASF37
	.byte	0x6
	.byte	0xd6
	.4byte	0xf1
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0x12
	.4byte	.LASF38
	.byte	0x6
	.byte	0xd7
	.4byte	0xf1
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x12
	.4byte	.LASF39
	.byte	0x6
	.byte	0xd8
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.uleb128 0x12
	.4byte	.LASF40
	.byte	0x6
	.byte	0xd9
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x12
	.4byte	.LASF41
	.byte	0x6
	.byte	0xda
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x4c
	.uleb128 0x12
	.4byte	.LASF42
	.byte	0x6
	.byte	0xdb
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0x12
	.4byte	.LASF43
	.byte	0x6
	.byte	0xdd
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x54
	.uleb128 0x12
	.4byte	.LASF44
	.byte	0x6
	.byte	0xde
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x55
	.uleb128 0x12
	.4byte	.LASF45
	.byte	0x6
	.byte	0xdf
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x56
	.uleb128 0x12
	.4byte	.LASF46
	.byte	0x6
	.byte	0xe0
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x57
	.uleb128 0x12
	.4byte	.LASF47
	.byte	0x6
	.byte	0xe1
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x58
	.uleb128 0x12
	.4byte	.LASF48
	.byte	0x6
	.byte	0xe2
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x5c
	.uleb128 0x12
	.4byte	.LASF49
	.byte	0x6
	.byte	0xe3
	.4byte	0x421
	.byte	0x2
	.byte	0x23
	.uleb128 0x5d
	.uleb128 0x12
	.4byte	.LASF50
	.byte	0x6
	.byte	0xe5
	.4byte	0x41b
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0x12
	.4byte	.LASF51
	.byte	0x6
	.byte	0xe6
	.4byte	0x41b
	.byte	0x2
	.byte	0x23
	.uleb128 0x64
	.uleb128 0x12
	.4byte	.LASF52
	.byte	0x6
	.byte	0xe7
	.4byte	0x41b
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0x12
	.4byte	.LASF53
	.byte	0x6
	.byte	0xe8
	.4byte	0x41b
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.uleb128 0x12
	.4byte	.LASF54
	.byte	0x6
	.byte	0xe9
	.4byte	0x41b
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0x12
	.4byte	.LASF55
	.byte	0x6
	.byte	0xea
	.4byte	0x41b
	.byte	0x2
	.byte	0x23
	.uleb128 0x74
	.uleb128 0x12
	.4byte	.LASF56
	.byte	0x6
	.byte	0xeb
	.4byte	0xcd
	.byte	0x2
	.byte	0x23
	.uleb128 0x78
	.uleb128 0x12
	.4byte	.LASF57
	.byte	0x6
	.byte	0xec
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x7a
	.uleb128 0x12
	.4byte	.LASF58
	.byte	0x6
	.byte	0xed
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x7b
	.uleb128 0x12
	.4byte	.LASF59
	.byte	0x6
	.byte	0xee
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x7c
	.uleb128 0x12
	.4byte	.LASF60
	.byte	0x6
	.byte	0xef
	.4byte	0xfc
	.byte	0x3
	.byte	0x23
	.uleb128 0x80
	.uleb128 0x12
	.4byte	.LASF61
	.byte	0x6
	.byte	0xf0
	.4byte	0xf1
	.byte	0x3
	.byte	0x23
	.uleb128 0x84
	.byte	0x0
	.uleb128 0xa
	.byte	0x4
	.4byte	0xc2
	.uleb128 0x13
	.4byte	0xb7
	.4byte	0x431
	.uleb128 0x14
	.4byte	0xad
	.byte	0x2
	.byte	0x0
	.uleb128 0x15
	.4byte	.LASF62
	.2byte	0x130
	.byte	0x6
	.byte	0xfa
	.4byte	0xa74
	.uleb128 0x12
	.4byte	.LASF63
	.byte	0x6
	.byte	0xfc
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x12
	.4byte	.LASF64
	.byte	0x6
	.byte	0xfd
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0x12
	.4byte	.LASF65
	.byte	0x6
	.byte	0xfe
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x12
	.4byte	.LASF66
	.byte	0x6
	.byte	0xff
	.4byte	0x72
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x16
	.4byte	.LASF67
	.byte	0x6
	.2byte	0x100
	.4byte	0x72
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x16
	.4byte	.LASF68
	.byte	0x6
	.2byte	0x101
	.4byte	0x72
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x16
	.4byte	.LASF69
	.byte	0x6
	.2byte	0x102
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x16
	.4byte	.LASF70
	.byte	0x6
	.2byte	0x103
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x11
	.uleb128 0x16
	.4byte	.LASF71
	.byte	0x6
	.2byte	0x104
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.uleb128 0x16
	.4byte	.LASF72
	.byte	0x6
	.2byte	0x105
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x13
	.uleb128 0x16
	.4byte	.LASF73
	.byte	0x6
	.2byte	0x108
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x16
	.4byte	.LASF74
	.byte	0x6
	.2byte	0x109
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x15
	.uleb128 0x16
	.4byte	.LASF75
	.byte	0x6
	.2byte	0x10a
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x16
	.uleb128 0x16
	.4byte	.LASF76
	.byte	0x6
	.2byte	0x10b
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x17
	.uleb128 0x16
	.4byte	.LASF77
	.byte	0x6
	.2byte	0x10c
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x16
	.4byte	.LASF78
	.byte	0x6
	.2byte	0x10f
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0x16
	.4byte	.LASF79
	.byte	0x6
	.2byte	0x110
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0x16
	.4byte	.LASF80
	.byte	0x6
	.2byte	0x113
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x1b
	.uleb128 0x16
	.4byte	.LASF81
	.byte	0x6
	.2byte	0x114
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x17
	.ascii	"PAL\000"
	.byte	0x6
	.2byte	0x115
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x1d
	.uleb128 0x16
	.4byte	.LASF82
	.byte	0x6
	.2byte	0x116
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x16
	.4byte	.LASF83
	.byte	0x6
	.2byte	0x117
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x16
	.4byte	.LASF84
	.byte	0x6
	.2byte	0x118
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x16
	.4byte	.LASF85
	.byte	0x6
	.2byte	0x119
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0x16
	.4byte	.LASF86
	.byte	0x6
	.2byte	0x11c
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x16
	.4byte	.LASF87
	.byte	0x6
	.2byte	0x11d
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x31
	.uleb128 0x16
	.4byte	.LASF88
	.byte	0x6
	.2byte	0x11e
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x32
	.uleb128 0x16
	.4byte	.LASF89
	.byte	0x6
	.2byte	0x11f
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x33
	.uleb128 0x16
	.4byte	.LASF90
	.byte	0x6
	.2byte	0x120
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x16
	.4byte	.LASF91
	.byte	0x6
	.2byte	0x121
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x35
	.uleb128 0x16
	.4byte	.LASF92
	.byte	0x6
	.2byte	0x122
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x36
	.uleb128 0x16
	.4byte	.LASF93
	.byte	0x6
	.2byte	0x125
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x37
	.uleb128 0x16
	.4byte	.LASF94
	.byte	0x6
	.2byte	0x126
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x16
	.4byte	.LASF95
	.byte	0x6
	.2byte	0x127
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x39
	.uleb128 0x16
	.4byte	.LASF96
	.byte	0x6
	.2byte	0x128
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x3a
	.uleb128 0x16
	.4byte	.LASF97
	.byte	0x6
	.2byte	0x129
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x3b
	.uleb128 0x16
	.4byte	.LASF98
	.byte	0x6
	.2byte	0x12a
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0x16
	.4byte	.LASF99
	.byte	0x6
	.2byte	0x12b
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x3d
	.uleb128 0x16
	.4byte	.LASF100
	.byte	0x6
	.2byte	0x12c
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x3e
	.uleb128 0x16
	.4byte	.LASF101
	.byte	0x6
	.2byte	0x12d
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x3f
	.uleb128 0x16
	.4byte	.LASF102
	.byte	0x6
	.2byte	0x12e
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x16
	.4byte	.LASF103
	.byte	0x6
	.2byte	0x12f
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x41
	.uleb128 0x16
	.4byte	.LASF104
	.byte	0x6
	.2byte	0x130
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x42
	.uleb128 0x16
	.4byte	.LASF105
	.byte	0x6
	.2byte	0x131
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x43
	.uleb128 0x16
	.4byte	.LASF106
	.byte	0x6
	.2byte	0x132
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.uleb128 0x16
	.4byte	.LASF107
	.byte	0x6
	.2byte	0x133
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x16
	.4byte	.LASF108
	.byte	0x6
	.2byte	0x135
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x4c
	.uleb128 0x16
	.4byte	.LASF109
	.byte	0x6
	.2byte	0x136
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x4d
	.uleb128 0x16
	.4byte	.LASF110
	.byte	0x6
	.2byte	0x137
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x4e
	.uleb128 0x16
	.4byte	.LASF111
	.byte	0x6
	.2byte	0x138
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x4f
	.uleb128 0x16
	.4byte	.LASF112
	.byte	0x6
	.2byte	0x139
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0x16
	.4byte	.LASF113
	.byte	0x6
	.2byte	0x13a
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x51
	.uleb128 0x17
	.ascii	"SA1\000"
	.byte	0x6
	.2byte	0x13b
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x52
	.uleb128 0x17
	.ascii	"C4\000"
	.byte	0x6
	.2byte	0x13c
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x53
	.uleb128 0x16
	.4byte	.LASF114
	.byte	0x6
	.2byte	0x13d
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x54
	.uleb128 0x16
	.4byte	.LASF115
	.byte	0x6
	.2byte	0x140
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x58
	.uleb128 0x16
	.4byte	.LASF116
	.byte	0x6
	.2byte	0x141
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x5c
	.uleb128 0x16
	.4byte	.LASF117
	.byte	0x6
	.2byte	0x142
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x5d
	.uleb128 0x16
	.4byte	.LASF118
	.byte	0x6
	.2byte	0x143
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x5e
	.uleb128 0x16
	.4byte	.LASF119
	.byte	0x6
	.2byte	0x144
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x5f
	.uleb128 0x16
	.4byte	.LASF120
	.byte	0x6
	.2byte	0x145
	.4byte	0x87
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0x16
	.4byte	.LASF121
	.byte	0x6
	.2byte	0x146
	.4byte	0x87
	.byte	0x2
	.byte	0x23
	.uleb128 0x64
	.uleb128 0x16
	.4byte	.LASF122
	.byte	0x6
	.2byte	0x147
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0x16
	.4byte	.LASF123
	.byte	0x6
	.2byte	0x148
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x69
	.uleb128 0x16
	.4byte	.LASF124
	.byte	0x6
	.2byte	0x149
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x6a
	.uleb128 0x16
	.4byte	.LASF125
	.byte	0x6
	.2byte	0x14a
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x6b
	.uleb128 0x16
	.4byte	.LASF126
	.byte	0x6
	.2byte	0x14b
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.uleb128 0x16
	.4byte	.LASF127
	.byte	0x6
	.2byte	0x14c
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x6d
	.uleb128 0x16
	.4byte	.LASF128
	.byte	0x6
	.2byte	0x14d
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x6e
	.uleb128 0x16
	.4byte	.LASF129
	.byte	0x6
	.2byte	0x14e
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x6f
	.uleb128 0x16
	.4byte	.LASF130
	.byte	0x6
	.2byte	0x150
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0x16
	.4byte	.LASF131
	.byte	0x6
	.2byte	0x151
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x71
	.uleb128 0x16
	.4byte	.LASF132
	.byte	0x6
	.2byte	0x154
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x72
	.uleb128 0x16
	.4byte	.LASF133
	.byte	0x6
	.2byte	0x155
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x73
	.uleb128 0x16
	.4byte	.LASF134
	.byte	0x6
	.2byte	0x156
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x74
	.uleb128 0x16
	.4byte	.LASF135
	.byte	0x6
	.2byte	0x157
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x75
	.uleb128 0x16
	.4byte	.LASF136
	.byte	0x6
	.2byte	0x15a
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x76
	.uleb128 0x16
	.4byte	.LASF137
	.byte	0x6
	.2byte	0x15b
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x77
	.uleb128 0x16
	.4byte	.LASF138
	.byte	0x6
	.2byte	0x15c
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x78
	.uleb128 0x16
	.4byte	.LASF139
	.byte	0x6
	.2byte	0x15d
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x79
	.uleb128 0x16
	.4byte	.LASF140
	.byte	0x6
	.2byte	0x15e
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x7a
	.uleb128 0x16
	.4byte	.LASF141
	.byte	0x6
	.2byte	0x15f
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x7b
	.uleb128 0x16
	.4byte	.LASF142
	.byte	0x6
	.2byte	0x162
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x7c
	.uleb128 0x16
	.4byte	.LASF143
	.byte	0x6
	.2byte	0x163
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x7d
	.uleb128 0x16
	.4byte	.LASF144
	.byte	0x6
	.2byte	0x164
	.4byte	0xa74
	.byte	0x2
	.byte	0x23
	.uleb128 0x7e
	.uleb128 0x16
	.4byte	.LASF145
	.byte	0x6
	.2byte	0x165
	.4byte	0x87
	.byte	0x3
	.byte	0x23
	.uleb128 0x100
	.uleb128 0x16
	.4byte	.LASF146
	.byte	0x6
	.2byte	0x166
	.4byte	0xb7
	.byte	0x3
	.byte	0x23
	.uleb128 0x104
	.uleb128 0x16
	.4byte	.LASF147
	.byte	0x6
	.2byte	0x167
	.4byte	0xb7
	.byte	0x3
	.byte	0x23
	.uleb128 0x105
	.uleb128 0x16
	.4byte	.LASF148
	.byte	0x6
	.2byte	0x168
	.4byte	0xf1
	.byte	0x3
	.byte	0x23
	.uleb128 0x108
	.uleb128 0x16
	.4byte	.LASF149
	.byte	0x6
	.2byte	0x169
	.4byte	0xb7
	.byte	0x3
	.byte	0x23
	.uleb128 0x10c
	.uleb128 0x16
	.4byte	.LASF150
	.byte	0x6
	.2byte	0x16a
	.4byte	0xb7
	.byte	0x3
	.byte	0x23
	.uleb128 0x10d
	.uleb128 0x16
	.4byte	.LASF151
	.byte	0x6
	.2byte	0x16b
	.4byte	0xfc
	.byte	0x3
	.byte	0x23
	.uleb128 0x110
	.uleb128 0x16
	.4byte	.LASF152
	.byte	0x6
	.2byte	0x16c
	.4byte	0xfc
	.byte	0x3
	.byte	0x23
	.uleb128 0x114
	.uleb128 0x16
	.4byte	.LASF153
	.byte	0x6
	.2byte	0x16d
	.4byte	0xfc
	.byte	0x3
	.byte	0x23
	.uleb128 0x118
	.uleb128 0x16
	.4byte	.LASF154
	.byte	0x6
	.2byte	0x170
	.4byte	0xfc
	.byte	0x3
	.byte	0x23
	.uleb128 0x11c
	.uleb128 0x16
	.4byte	.LASF155
	.byte	0x6
	.2byte	0x171
	.4byte	0xb7
	.byte	0x3
	.byte	0x23
	.uleb128 0x120
	.uleb128 0x16
	.4byte	.LASF156
	.byte	0x6
	.2byte	0x172
	.4byte	0xb7
	.byte	0x3
	.byte	0x23
	.uleb128 0x121
	.uleb128 0x16
	.4byte	.LASF157
	.byte	0x6
	.2byte	0x173
	.4byte	0xb7
	.byte	0x3
	.byte	0x23
	.uleb128 0x122
	.uleb128 0x16
	.4byte	.LASF158
	.byte	0x6
	.2byte	0x174
	.4byte	0xb7
	.byte	0x3
	.byte	0x23
	.uleb128 0x123
	.uleb128 0x16
	.4byte	.LASF159
	.byte	0x6
	.2byte	0x175
	.4byte	0xb7
	.byte	0x3
	.byte	0x23
	.uleb128 0x124
	.uleb128 0x17
	.ascii	"BS\000"
	.byte	0x6
	.2byte	0x176
	.4byte	0xb7
	.byte	0x3
	.byte	0x23
	.uleb128 0x125
	.uleb128 0x16
	.4byte	.LASF160
	.byte	0x6
	.2byte	0x177
	.4byte	0xb7
	.byte	0x3
	.byte	0x23
	.uleb128 0x126
	.uleb128 0x16
	.4byte	.LASF161
	.byte	0x6
	.2byte	0x178
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0x127
	.uleb128 0x16
	.4byte	.LASF162
	.byte	0x6
	.2byte	0x179
	.4byte	0xb7
	.byte	0x3
	.byte	0x23
	.uleb128 0x128
	.uleb128 0x16
	.4byte	.LASF163
	.byte	0x6
	.2byte	0x17c
	.4byte	0xfc
	.byte	0x3
	.byte	0x23
	.uleb128 0x12c
	.byte	0x0
	.uleb128 0x13
	.4byte	0x9b
	.4byte	0xa84
	.uleb128 0x14
	.4byte	0xad
	.byte	0x7f
	.byte	0x0
	.uleb128 0x18
	.4byte	.LASF168
	.byte	0x4
	.byte	0x2
	.byte	0x2c
	.4byte	0xaa9
	.uleb128 0x19
	.4byte	.LASF164
	.sleb128 0
	.uleb128 0x19
	.4byte	.LASF165
	.sleb128 1
	.uleb128 0x19
	.4byte	.LASF166
	.sleb128 2
	.uleb128 0x19
	.4byte	.LASF167
	.sleb128 3
	.byte	0x0
	.uleb128 0x18
	.4byte	.LASF168
	.byte	0x4
	.byte	0x2
	.byte	0x2d
	.4byte	0xaf2
	.uleb128 0x19
	.4byte	.LASF169
	.sleb128 0
	.uleb128 0x19
	.4byte	.LASF170
	.sleb128 1
	.uleb128 0x19
	.4byte	.LASF171
	.sleb128 2
	.uleb128 0x19
	.4byte	.LASF172
	.sleb128 3
	.uleb128 0x19
	.4byte	.LASF173
	.sleb128 4
	.uleb128 0x19
	.4byte	.LASF174
	.sleb128 5
	.uleb128 0x19
	.4byte	.LASF175
	.sleb128 6
	.uleb128 0x19
	.4byte	.LASF176
	.sleb128 7
	.uleb128 0x19
	.4byte	.LASF177
	.sleb128 8
	.uleb128 0x19
	.4byte	.LASF178
	.sleb128 9
	.byte	0x0
	.uleb128 0x18
	.4byte	.LASF168
	.byte	0x4
	.byte	0x2
	.byte	0x32
	.4byte	0xb2f
	.uleb128 0x19
	.4byte	.LASF179
	.sleb128 0
	.uleb128 0x19
	.4byte	.LASF180
	.sleb128 1
	.uleb128 0x19
	.4byte	.LASF181
	.sleb128 4
	.uleb128 0x19
	.4byte	.LASF182
	.sleb128 5
	.uleb128 0x19
	.4byte	.LASF183
	.sleb128 6
	.uleb128 0x19
	.4byte	.LASF184
	.sleb128 7
	.uleb128 0x19
	.4byte	.LASF185
	.sleb128 8
	.uleb128 0x19
	.4byte	.LASF186
	.sleb128 9
	.byte	0x0
	.uleb128 0xf
	.4byte	.LASF187
	.byte	0x10
	.byte	0x2
	.byte	0x44
	.4byte	0xb90
	.uleb128 0x12
	.4byte	.LASF188
	.byte	0x2
	.byte	0x45
	.4byte	0x87
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x12
	.4byte	.LASF189
	.byte	0x2
	.byte	0x46
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x12
	.4byte	.LASF190
	.byte	0x2
	.byte	0x47
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x12
	.4byte	.LASF191
	.byte	0x2
	.byte	0x48
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x12
	.4byte	.LASF192
	.byte	0x2
	.byte	0x49
	.4byte	0x87
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x12
	.4byte	.LASF193
	.byte	0x2
	.byte	0x4a
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0x0
	.uleb128 0xf
	.4byte	.LASF194
	.byte	0xd4
	.byte	0x2
	.byte	0x4f
	.4byte	0xe05
	.uleb128 0x12
	.4byte	.LASF195
	.byte	0x2
	.byte	0x50
	.4byte	0x87
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x12
	.4byte	.LASF196
	.byte	0x2
	.byte	0x51
	.4byte	0x87
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x12
	.4byte	.LASF197
	.byte	0x2
	.byte	0x52
	.4byte	0x8e
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x12
	.4byte	.LASF198
	.byte	0x2
	.byte	0x53
	.4byte	0x8e
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0x12
	.4byte	.LASF199
	.byte	0x2
	.byte	0x54
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x12
	.4byte	.LASF200
	.byte	0x2
	.byte	0x55
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x12
	.4byte	.LASF201
	.byte	0x2
	.byte	0x56
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x12
	.4byte	.LASF202
	.byte	0x2
	.byte	0x57
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x12
	.4byte	.LASF203
	.byte	0x2
	.byte	0x58
	.4byte	0x87
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x12
	.4byte	.LASF204
	.byte	0x2
	.byte	0x59
	.4byte	0x8e
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x12
	.4byte	.LASF205
	.byte	0x2
	.byte	0x5a
	.4byte	0x8e
	.byte	0x2
	.byte	0x23
	.uleb128 0x22
	.uleb128 0x12
	.4byte	.LASF206
	.byte	0x2
	.byte	0x5b
	.4byte	0x8e
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x12
	.4byte	.LASF207
	.byte	0x2
	.byte	0x5c
	.4byte	0xe05
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x12
	.4byte	.LASF208
	.byte	0x2
	.byte	0x5d
	.4byte	0xe05
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0x12
	.4byte	.LASF209
	.byte	0x2
	.byte	0x5e
	.4byte	0x87
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x12
	.4byte	.LASF210
	.byte	0x2
	.byte	0x5f
	.4byte	0xe05
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x12
	.4byte	.LASF211
	.byte	0x2
	.byte	0x60
	.4byte	0xe05
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x12
	.4byte	.LASF212
	.byte	0x2
	.byte	0x61
	.4byte	0xe05
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0x12
	.4byte	.LASF213
	.byte	0x2
	.byte	0x62
	.4byte	0xe05
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x12
	.4byte	.LASF214
	.byte	0x2
	.byte	0x63
	.4byte	0xe05
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.uleb128 0x12
	.4byte	.LASF215
	.byte	0x2
	.byte	0x64
	.4byte	0x8e
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x12
	.4byte	.LASF216
	.byte	0x2
	.byte	0x65
	.4byte	0xe0c
	.byte	0x2
	.byte	0x23
	.uleb128 0x4a
	.uleb128 0x12
	.4byte	.LASF217
	.byte	0x2
	.byte	0x66
	.4byte	0xe1c
	.byte	0x2
	.byte	0x23
	.uleb128 0x6a
	.uleb128 0x12
	.4byte	.LASF218
	.byte	0x2
	.byte	0x67
	.4byte	0xe2c
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0x12
	.4byte	.LASF219
	.byte	0x2
	.byte	0x68
	.4byte	0xcd
	.byte	0x2
	.byte	0x23
	.uleb128 0x74
	.uleb128 0x12
	.4byte	.LASF220
	.byte	0x2
	.byte	0x69
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x76
	.uleb128 0x12
	.4byte	.LASF221
	.byte	0x2
	.byte	0x6a
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x77
	.uleb128 0x12
	.4byte	.LASF222
	.byte	0x2
	.byte	0x6b
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x78
	.uleb128 0x12
	.4byte	.LASF223
	.byte	0x2
	.byte	0x6c
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x7c
	.uleb128 0x12
	.4byte	.LASF224
	.byte	0x2
	.byte	0x6d
	.4byte	0xe32
	.byte	0x3
	.byte	0x23
	.uleb128 0x80
	.uleb128 0x12
	.4byte	.LASF225
	.byte	0x2
	.byte	0x6e
	.4byte	0x87
	.byte	0x3
	.byte	0x23
	.uleb128 0x84
	.uleb128 0x12
	.4byte	.LASF226
	.byte	0x2
	.byte	0x6f
	.4byte	0xf1
	.byte	0x3
	.byte	0x23
	.uleb128 0x88
	.uleb128 0x12
	.4byte	.LASF227
	.byte	0x2
	.byte	0x70
	.4byte	0x8e
	.byte	0x3
	.byte	0x23
	.uleb128 0x8c
	.uleb128 0x12
	.4byte	.LASF228
	.byte	0x2
	.byte	0x71
	.4byte	0xf1
	.byte	0x3
	.byte	0x23
	.uleb128 0x90
	.uleb128 0x12
	.4byte	.LASF229
	.byte	0x2
	.byte	0x72
	.4byte	0xe38
	.byte	0x3
	.byte	0x23
	.uleb128 0x94
	.uleb128 0x12
	.4byte	.LASF230
	.byte	0x2
	.byte	0x74
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0x9c
	.uleb128 0x12
	.4byte	.LASF231
	.byte	0x2
	.byte	0x75
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0x9d
	.uleb128 0x12
	.4byte	.LASF232
	.byte	0x2
	.byte	0x76
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0x9e
	.uleb128 0x12
	.4byte	.LASF233
	.byte	0x2
	.byte	0x77
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0x9f
	.uleb128 0x12
	.4byte	.LASF234
	.byte	0x2
	.byte	0x79
	.4byte	0xe48
	.byte	0x3
	.byte	0x23
	.uleb128 0xa0
	.uleb128 0x12
	.4byte	.LASF235
	.byte	0x2
	.byte	0x7b
	.4byte	0xe58
	.byte	0x3
	.byte	0x23
	.uleb128 0xbc
	.uleb128 0x12
	.4byte	.LASF236
	.byte	0x2
	.byte	0x7c
	.4byte	0x87
	.byte	0x3
	.byte	0x23
	.uleb128 0xcc
	.uleb128 0x12
	.4byte	.LASF237
	.byte	0x2
	.byte	0x7d
	.4byte	0xd8
	.byte	0x3
	.byte	0x23
	.uleb128 0xd0
	.byte	0x0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF238
	.uleb128 0x13
	.4byte	0x8e
	.4byte	0xe1c
	.uleb128 0x14
	.4byte	0xad
	.byte	0xf
	.byte	0x0
	.uleb128 0x13
	.4byte	0x8e
	.4byte	0xe2c
	.uleb128 0x14
	.4byte	0xad
	.byte	0x1
	.byte	0x0
	.uleb128 0xa
	.byte	0x4
	.4byte	0x8e
	.uleb128 0xa
	.byte	0x4
	.4byte	0x87
	.uleb128 0x13
	.4byte	0xf1
	.4byte	0xe48
	.uleb128 0x14
	.4byte	0xad
	.byte	0x1
	.byte	0x0
	.uleb128 0x13
	.4byte	0xfc
	.4byte	0xe58
	.uleb128 0x14
	.4byte	0xad
	.byte	0x6
	.byte	0x0
	.uleb128 0x13
	.4byte	0x8e
	.4byte	0xe68
	.uleb128 0x14
	.4byte	0xad
	.byte	0x7
	.byte	0x0
	.uleb128 0x15
	.4byte	.LASF239
	.2byte	0x6e8
	.byte	0x2
	.byte	0x81
	.4byte	0xf68
	.uleb128 0x12
	.4byte	.LASF240
	.byte	0x2
	.byte	0x82
	.4byte	0x8e
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x12
	.4byte	.LASF241
	.byte	0x2
	.byte	0x83
	.4byte	0x8e
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x12
	.4byte	.LASF242
	.byte	0x2
	.byte	0x84
	.4byte	0x8e
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x12
	.4byte	.LASF243
	.byte	0x2
	.byte	0x85
	.4byte	0x8e
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x12
	.4byte	.LASF244
	.byte	0x2
	.byte	0x86
	.4byte	0x87
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x12
	.4byte	.LASF245
	.byte	0x2
	.byte	0x87
	.4byte	0x87
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x12
	.4byte	.LASF246
	.byte	0x2
	.byte	0x88
	.4byte	0x87
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x12
	.4byte	.LASF247
	.byte	0x2
	.byte	0x89
	.4byte	0x87
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x12
	.4byte	.LASF248
	.byte	0x2
	.byte	0x8a
	.4byte	0x87
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x12
	.4byte	.LASF249
	.byte	0x2
	.byte	0x8b
	.4byte	0x87
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x12
	.4byte	.LASF250
	.byte	0x2
	.byte	0x8c
	.4byte	0x87
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x12
	.4byte	.LASF234
	.byte	0x2
	.byte	0x8e
	.4byte	0xf68
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x12
	.4byte	.LASF251
	.byte	0x2
	.byte	0x8f
	.4byte	0xf78
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x12
	.4byte	.LASF252
	.byte	0x2
	.byte	0x90
	.4byte	0xb7
	.byte	0x3
	.byte	0x23
	.uleb128 0x6d0
	.uleb128 0x12
	.4byte	.LASF253
	.byte	0x2
	.byte	0x91
	.4byte	0xf88
	.byte	0x3
	.byte	0x23
	.uleb128 0x6d4
	.uleb128 0x12
	.4byte	.LASF254
	.byte	0x2
	.byte	0x92
	.4byte	0xf88
	.byte	0x3
	.byte	0x23
	.uleb128 0x6dc
	.uleb128 0x12
	.4byte	.LASF255
	.byte	0x2
	.byte	0x93
	.4byte	0x87
	.byte	0x3
	.byte	0x23
	.uleb128 0x6e4
	.byte	0x0
	.uleb128 0x13
	.4byte	0xfc
	.4byte	0xf78
	.uleb128 0x14
	.4byte	0xad
	.byte	0x2
	.byte	0x0
	.uleb128 0x13
	.4byte	0xb90
	.4byte	0xf88
	.uleb128 0x14
	.4byte	0xad
	.byte	0x7
	.byte	0x0
	.uleb128 0x13
	.4byte	0x87
	.4byte	0xf98
	.uleb128 0x14
	.4byte	0xad
	.byte	0x1
	.byte	0x0
	.uleb128 0xe
	.4byte	.LASF257
	.byte	0x4
	.byte	0x7
	.byte	0x5a
	.4byte	0xfe7
	.uleb128 0xf
	.4byte	.LASF20
	.byte	0x2
	.byte	0x7
	.byte	0x5c
	.4byte	0xfc9
	.uleb128 0x10
	.ascii	"A\000"
	.byte	0x7
	.byte	0x5c
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x10
	.ascii	"Y\000"
	.byte	0x7
	.byte	0x5c
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.byte	0x0
	.uleb128 0x11
	.ascii	"B\000"
	.byte	0x7
	.byte	0x5c
	.4byte	0xfa4
	.uleb128 0x11
	.ascii	"W\000"
	.byte	0x7
	.byte	0x60
	.4byte	0xcd
	.uleb128 0x1a
	.4byte	.LASF258
	.byte	0x7
	.byte	0x61
	.4byte	0xfc
	.byte	0x0
	.uleb128 0xf
	.4byte	.LASF259
	.byte	0x4c
	.byte	0x8
	.byte	0x37
	.4byte	0x1166
	.uleb128 0x12
	.4byte	.LASF260
	.byte	0x8
	.byte	0x38
	.4byte	0x41b
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x12
	.4byte	.LASF261
	.byte	0x8
	.byte	0x39
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x12
	.4byte	.LASF262
	.byte	0x8
	.byte	0x3a
	.4byte	0x41b
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x12
	.4byte	.LASF263
	.byte	0x8
	.byte	0x3b
	.4byte	0x41b
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x12
	.4byte	.LASF33
	.byte	0x8
	.byte	0x3c
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x12
	.4byte	.LASF264
	.byte	0x8
	.byte	0x3d
	.4byte	0x41b
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x12
	.4byte	.LASF265
	.byte	0x8
	.byte	0x3e
	.4byte	0x41b
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x12
	.4byte	.LASF266
	.byte	0x8
	.byte	0x3f
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x12
	.4byte	.LASF267
	.byte	0x8
	.byte	0x40
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x1d
	.uleb128 0x10
	.ascii	"Bit\000"
	.byte	0x8
	.byte	0x41
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x1e
	.uleb128 0x12
	.4byte	.LASF268
	.byte	0x8
	.byte	0x42
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x1f
	.uleb128 0x12
	.4byte	.LASF269
	.byte	0x8
	.byte	0x43
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x12
	.4byte	.LASF270
	.byte	0x8
	.byte	0x44
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x12
	.4byte	.LASF271
	.byte	0x8
	.byte	0x45
	.4byte	0xf1
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x12
	.4byte	.LASF272
	.byte	0x8
	.byte	0x46
	.4byte	0xf1
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0x12
	.4byte	.LASF273
	.byte	0x8
	.byte	0x48
	.4byte	0x1166
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x10
	.ascii	"PC\000"
	.byte	0x8
	.byte	0x49
	.4byte	0x41b
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x10
	.ascii	"YA\000"
	.byte	0x8
	.byte	0x4a
	.4byte	0xf98
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x10
	.ascii	"P\000"
	.byte	0x8
	.byte	0x4b
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0x12
	.4byte	.LASF274
	.byte	0x8
	.byte	0x4c
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x3d
	.uleb128 0x12
	.4byte	.LASF275
	.byte	0x8
	.byte	0x4d
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x3e
	.uleb128 0x12
	.4byte	.LASF276
	.byte	0x8
	.byte	0x4e
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x3f
	.uleb128 0x10
	.ascii	"X\000"
	.byte	0x8
	.byte	0x4f
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x10
	.ascii	"S\000"
	.byte	0x8
	.byte	0x50
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x41
	.uleb128 0x12
	.4byte	.LASF277
	.byte	0x8
	.byte	0x51
	.4byte	0xcd
	.byte	0x2
	.byte	0x23
	.uleb128 0x42
	.uleb128 0x10
	.ascii	"RAM\000"
	.byte	0x8
	.byte	0x52
	.4byte	0x41b
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.uleb128 0x12
	.4byte	.LASF278
	.byte	0x8
	.byte	0x54
	.4byte	0x41b
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.byte	0x0
	.uleb128 0xa
	.byte	0x4
	.4byte	0xfc
	.uleb128 0xf
	.4byte	.LASF279
	.byte	0xe0
	.byte	0x8
	.byte	0x58
	.4byte	0x1218
	.uleb128 0x12
	.4byte	.LASF29
	.byte	0x8
	.byte	0x59
	.4byte	0xf1
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x12
	.4byte	.LASF280
	.byte	0x8
	.byte	0x5a
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x12
	.4byte	.LASF23
	.byte	0x8
	.byte	0x5b
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x12
	.4byte	.LASF281
	.byte	0x8
	.byte	0x5c
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x12
	.4byte	.LASF282
	.byte	0x8
	.byte	0x5d
	.4byte	0x1218
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x10
	.ascii	"DSP\000"
	.byte	0x8
	.byte	0x5e
	.4byte	0x1228
	.byte	0x2
	.byte	0x23
	.uleb128 0xb
	.uleb128 0x12
	.4byte	.LASF278
	.byte	0x8
	.byte	0x5f
	.4byte	0x1238
	.byte	0x3
	.byte	0x23
	.uleb128 0x8b
	.uleb128 0x12
	.4byte	.LASF283
	.byte	0x8
	.byte	0x60
	.4byte	0x1248
	.byte	0x3
	.byte	0x23
	.uleb128 0xcc
	.uleb128 0x12
	.4byte	.LASF284
	.byte	0x8
	.byte	0x61
	.4byte	0x1248
	.byte	0x3
	.byte	0x23
	.uleb128 0xd2
	.uleb128 0x12
	.4byte	.LASF285
	.byte	0x8
	.byte	0x62
	.4byte	0x421
	.byte	0x3
	.byte	0x23
	.uleb128 0xd8
	.uleb128 0x12
	.4byte	.LASF286
	.byte	0x8
	.byte	0x63
	.4byte	0x421
	.byte	0x3
	.byte	0x23
	.uleb128 0xdb
	.byte	0x0
	.uleb128 0x13
	.4byte	0xc2
	.4byte	0x1228
	.uleb128 0x14
	.4byte	0xad
	.byte	0x3
	.byte	0x0
	.uleb128 0x13
	.4byte	0xc2
	.4byte	0x1238
	.uleb128 0x14
	.4byte	0xad
	.byte	0x7f
	.byte	0x0
	.uleb128 0x13
	.4byte	0xc2
	.4byte	0x1248
	.uleb128 0x14
	.4byte	0xad
	.byte	0x3f
	.byte	0x0
	.uleb128 0x13
	.4byte	0xcd
	.4byte	0x1258
	.uleb128 0x14
	.4byte	0xad
	.byte	0x2
	.byte	0x0
	.uleb128 0x1b
	.4byte	.LASF622
	.2byte	0xd174
	.byte	0x9
	.byte	0x50
	.4byte	0x1893
	.uleb128 0x10
	.ascii	"RAM\000"
	.byte	0x9
	.byte	0x84
	.4byte	0x41b
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x10
	.ascii	"ROM\000"
	.byte	0x9
	.byte	0x85
	.4byte	0x41b
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x12
	.4byte	.LASF287
	.byte	0x9
	.byte	0x86
	.4byte	0x41b
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x12
	.4byte	.LASF288
	.byte	0x9
	.byte	0x87
	.4byte	0x41b
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x12
	.4byte	.LASF289
	.byte	0x9
	.byte	0x88
	.4byte	0x41b
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x12
	.4byte	.LASF290
	.byte	0x9
	.byte	0x89
	.4byte	0x41b
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x12
	.4byte	.LASF291
	.byte	0x9
	.byte	0x8a
	.4byte	0x41b
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x12
	.4byte	.LASF292
	.byte	0x9
	.byte	0x8b
	.4byte	0x112
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x12
	.4byte	.LASF293
	.byte	0x9
	.byte	0x8c
	.4byte	0x112
	.byte	0x2
	.byte	0x23
	.uleb128 0x1d
	.uleb128 0x12
	.4byte	.LASF294
	.byte	0x9
	.byte	0x8d
	.4byte	0xcd
	.byte	0x2
	.byte	0x23
	.uleb128 0x1e
	.uleb128 0x12
	.4byte	.LASF295
	.byte	0x9
	.byte	0x8e
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x10
	.ascii	"Map\000"
	.byte	0x9
	.byte	0x8f
	.4byte	0x1893
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x12
	.4byte	.LASF296
	.byte	0x9
	.byte	0x90
	.4byte	0x1893
	.byte	0x4
	.byte	0x23
	.uleb128 0x4024
	.uleb128 0x12
	.4byte	.LASF297
	.byte	0x9
	.byte	0x91
	.4byte	0x18a4
	.byte	0x4
	.byte	0x23
	.uleb128 0x8024
	.uleb128 0x12
	.4byte	.LASF298
	.byte	0x9
	.byte	0x92
	.4byte	0x18a4
	.byte	0x4
	.byte	0x23
	.uleb128 0x9024
	.uleb128 0x12
	.4byte	.LASF299
	.byte	0x9
	.byte	0x93
	.4byte	0x18a4
	.byte	0x4
	.byte	0x23
	.uleb128 0xa024
	.uleb128 0x12
	.4byte	.LASF300
	.byte	0x9
	.byte	0x94
	.4byte	0x18b5
	.byte	0x4
	.byte	0x23
	.uleb128 0xb024
	.uleb128 0x12
	.4byte	.LASF301
	.byte	0x9
	.byte	0x95
	.4byte	0x18c5
	.byte	0x4
	.byte	0x23
	.uleb128 0xb03b
	.uleb128 0x12
	.4byte	.LASF302
	.byte	0x9
	.byte	0x96
	.4byte	0x18d5
	.byte	0x4
	.byte	0x23
	.uleb128 0xb040
	.uleb128 0x12
	.4byte	.LASF303
	.byte	0x9
	.byte	0x97
	.4byte	0xc2
	.byte	0x4
	.byte	0x23
	.uleb128 0xb043
	.uleb128 0x12
	.4byte	.LASF304
	.byte	0x9
	.byte	0x98
	.4byte	0xc2
	.byte	0x4
	.byte	0x23
	.uleb128 0xb044
	.uleb128 0x12
	.4byte	.LASF305
	.byte	0x9
	.byte	0x99
	.4byte	0xc2
	.byte	0x4
	.byte	0x23
	.uleb128 0xb045
	.uleb128 0x12
	.4byte	.LASF306
	.byte	0x9
	.byte	0x9a
	.4byte	0xf1
	.byte	0x4
	.byte	0x23
	.uleb128 0xb048
	.uleb128 0x12
	.4byte	.LASF307
	.byte	0x9
	.byte	0x9b
	.4byte	0xf1
	.byte	0x4
	.byte	0x23
	.uleb128 0xb04c
	.uleb128 0x12
	.4byte	.LASF308
	.byte	0x9
	.byte	0x9c
	.4byte	0xfc
	.byte	0x4
	.byte	0x23
	.uleb128 0xb050
	.uleb128 0x12
	.4byte	.LASF309
	.byte	0x9
	.byte	0x9d
	.4byte	0xfc
	.byte	0x4
	.byte	0x23
	.uleb128 0xb054
	.uleb128 0x12
	.4byte	.LASF310
	.byte	0x9
	.byte	0x9e
	.4byte	0xfc
	.byte	0x4
	.byte	0x23
	.uleb128 0xb058
	.uleb128 0x12
	.4byte	.LASF311
	.byte	0x9
	.byte	0x9f
	.4byte	0xfc
	.byte	0x4
	.byte	0x23
	.uleb128 0xb05c
	.uleb128 0x12
	.4byte	.LASF312
	.byte	0x9
	.byte	0xa0
	.4byte	0x41b
	.byte	0x4
	.byte	0x23
	.uleb128 0xb060
	.uleb128 0x12
	.4byte	.LASF313
	.byte	0x9
	.byte	0xa1
	.4byte	0x41b
	.byte	0x4
	.byte	0x23
	.uleb128 0xb064
	.uleb128 0x12
	.4byte	.LASF314
	.byte	0x9
	.byte	0xa2
	.4byte	0xfc
	.byte	0x4
	.byte	0x23
	.uleb128 0xb068
	.uleb128 0x12
	.4byte	.LASF315
	.byte	0x9
	.byte	0xa3
	.4byte	0xfc
	.byte	0x4
	.byte	0x23
	.uleb128 0xb06c
	.uleb128 0x12
	.4byte	.LASF316
	.byte	0x9
	.byte	0xa4
	.4byte	0xfc
	.byte	0x4
	.byte	0x23
	.uleb128 0xb070
	.uleb128 0x12
	.4byte	.LASF317
	.byte	0x9
	.byte	0xa5
	.4byte	0x18e5
	.byte	0x4
	.byte	0x23
	.uleb128 0xb074
	.uleb128 0x12
	.4byte	.LASF318
	.byte	0x9
	.byte	0xa6
	.4byte	0x18f6
	.byte	0x4
	.byte	0x23
	.uleb128 0xd074
	.uleb128 0x1c
	.byte	0x1
	.4byte	.LASF319
	.byte	0x9
	.byte	0x52
	.4byte	.LASF321
	.4byte	0x112
	.byte	0x1
	.4byte	0x149e
	.uleb128 0x1d
	.4byte	0x1906
	.byte	0x1
	.uleb128 0x1e
	.4byte	0xa2
	.byte	0x0
	.uleb128 0x1f
	.byte	0x1
	.4byte	.LASF327
	.byte	0x9
	.byte	0x53
	.4byte	.LASF329
	.byte	0x1
	.4byte	0x14bb
	.uleb128 0x1d
	.4byte	0x1906
	.byte	0x1
	.uleb128 0x1e
	.4byte	0x112
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.4byte	.LASF320
	.byte	0x9
	.byte	0x54
	.4byte	.LASF322
	.4byte	0x112
	.byte	0x1
	.4byte	0x14dc
	.uleb128 0x1d
	.4byte	0x1906
	.byte	0x1
	.uleb128 0x1e
	.4byte	0xa2
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.4byte	.LASF323
	.byte	0x9
	.byte	0x55
	.4byte	.LASF324
	.4byte	0x112
	.byte	0x1
	.4byte	0x14fd
	.uleb128 0x1d
	.4byte	0x1906
	.byte	0x1
	.uleb128 0x1e
	.4byte	0xa2
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.4byte	.LASF325
	.byte	0x9
	.byte	0x56
	.4byte	.LASF326
	.4byte	0x112
	.byte	0x1
	.4byte	0x1519
	.uleb128 0x1d
	.4byte	0x1906
	.byte	0x1
	.byte	0x0
	.uleb128 0x1f
	.byte	0x1
	.4byte	.LASF328
	.byte	0x9
	.byte	0x57
	.4byte	.LASF330
	.byte	0x1
	.4byte	0x1531
	.uleb128 0x1d
	.4byte	0x1906
	.byte	0x1
	.byte	0x0
	.uleb128 0x1f
	.byte	0x1
	.4byte	.LASF331
	.byte	0x9
	.byte	0x58
	.4byte	.LASF332
	.byte	0x1
	.4byte	0x1549
	.uleb128 0x1d
	.4byte	0x1906
	.byte	0x1
	.byte	0x0
	.uleb128 0x1f
	.byte	0x1
	.4byte	.LASF333
	.byte	0x9
	.byte	0x5a
	.4byte	.LASF334
	.byte	0x1
	.4byte	0x1561
	.uleb128 0x1d
	.4byte	0x1906
	.byte	0x1
	.byte	0x0
	.uleb128 0x1f
	.byte	0x1
	.4byte	.LASF335
	.byte	0x9
	.byte	0x5b
	.4byte	.LASF336
	.byte	0x1
	.4byte	0x1579
	.uleb128 0x1d
	.4byte	0x1906
	.byte	0x1
	.byte	0x0
	.uleb128 0x1f
	.byte	0x1
	.4byte	.LASF337
	.byte	0x9
	.byte	0x5c
	.4byte	.LASF338
	.byte	0x1
	.4byte	0x1591
	.uleb128 0x1d
	.4byte	0x1906
	.byte	0x1
	.byte	0x0
	.uleb128 0x1f
	.byte	0x1
	.4byte	.LASF339
	.byte	0x9
	.byte	0x5d
	.4byte	.LASF340
	.byte	0x1
	.4byte	0x15a9
	.uleb128 0x1d
	.4byte	0x1906
	.byte	0x1
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.4byte	.LASF341
	.byte	0x9
	.byte	0x5e
	.4byte	.LASF342
	.4byte	0x95
	.byte	0x1
	.4byte	0x15ca
	.uleb128 0x1d
	.4byte	0x1906
	.byte	0x1
	.uleb128 0x1e
	.4byte	0xa2
	.byte	0x0
	.uleb128 0x1f
	.byte	0x1
	.4byte	.LASF343
	.byte	0x9
	.byte	0x60
	.4byte	.LASF344
	.byte	0x1
	.4byte	0x15e2
	.uleb128 0x1d
	.4byte	0x1906
	.byte	0x1
	.byte	0x0
	.uleb128 0x1f
	.byte	0x1
	.4byte	.LASF345
	.byte	0x9
	.byte	0x61
	.4byte	.LASF346
	.byte	0x1
	.4byte	0x15fa
	.uleb128 0x1d
	.4byte	0x1906
	.byte	0x1
	.byte	0x0
	.uleb128 0x1f
	.byte	0x1
	.4byte	.LASF347
	.byte	0x9
	.byte	0x62
	.4byte	.LASF348
	.byte	0x1
	.4byte	0x1612
	.uleb128 0x1d
	.4byte	0x1906
	.byte	0x1
	.byte	0x0
	.uleb128 0x1f
	.byte	0x1
	.4byte	.LASF349
	.byte	0x9
	.byte	0x63
	.4byte	.LASF350
	.byte	0x1
	.4byte	0x162a
	.uleb128 0x1d
	.4byte	0x1906
	.byte	0x1
	.byte	0x0
	.uleb128 0x1f
	.byte	0x1
	.4byte	.LASF351
	.byte	0x9
	.byte	0x64
	.4byte	.LASF352
	.byte	0x1
	.4byte	0x1642
	.uleb128 0x1d
	.4byte	0x1906
	.byte	0x1
	.byte	0x0
	.uleb128 0x1f
	.byte	0x1
	.4byte	.LASF353
	.byte	0x9
	.byte	0x65
	.4byte	.LASF354
	.byte	0x1
	.4byte	0x165a
	.uleb128 0x1d
	.4byte	0x1906
	.byte	0x1
	.byte	0x0
	.uleb128 0x1f
	.byte	0x1
	.4byte	.LASF355
	.byte	0x9
	.byte	0x66
	.4byte	.LASF356
	.byte	0x1
	.4byte	0x1672
	.uleb128 0x1d
	.4byte	0x1906
	.byte	0x1
	.byte	0x0
	.uleb128 0x1f
	.byte	0x1
	.4byte	.LASF357
	.byte	0x9
	.byte	0x67
	.4byte	.LASF358
	.byte	0x1
	.4byte	0x168f
	.uleb128 0x1d
	.4byte	0x1906
	.byte	0x1
	.uleb128 0x1e
	.4byte	0x112
	.byte	0x0
	.uleb128 0x1f
	.byte	0x1
	.4byte	.LASF359
	.byte	0x9
	.byte	0x68
	.4byte	.LASF360
	.byte	0x1
	.4byte	0x16a7
	.uleb128 0x1d
	.4byte	0x1906
	.byte	0x1
	.byte	0x0
	.uleb128 0x1f
	.byte	0x1
	.4byte	.LASF361
	.byte	0x9
	.byte	0x69
	.4byte	.LASF362
	.byte	0x1
	.4byte	0x16bf
	.uleb128 0x1d
	.4byte	0x1906
	.byte	0x1
	.byte	0x0
	.uleb128 0x1f
	.byte	0x1
	.4byte	.LASF363
	.byte	0x9
	.byte	0x6a
	.4byte	.LASF364
	.byte	0x1
	.4byte	0x16d7
	.uleb128 0x1d
	.4byte	0x1906
	.byte	0x1
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.4byte	.LASF365
	.byte	0x9
	.byte	0x6b
	.4byte	.LASF366
	.4byte	0x112
	.byte	0x1
	.4byte	0x16fd
	.uleb128 0x1d
	.4byte	0x1906
	.byte	0x1
	.uleb128 0x1e
	.4byte	0x41b
	.uleb128 0x1e
	.4byte	0x87
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.4byte	.LASF367
	.byte	0x9
	.byte	0x6c
	.4byte	.LASF368
	.4byte	0x87
	.byte	0x1
	.4byte	0x171e
	.uleb128 0x1d
	.4byte	0x1906
	.byte	0x1
	.uleb128 0x1e
	.4byte	0x112
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.4byte	.LASF369
	.byte	0x9
	.byte	0x6d
	.4byte	.LASF370
	.4byte	0x87
	.byte	0x1
	.4byte	0x173f
	.uleb128 0x1d
	.4byte	0x1906
	.byte	0x1
	.uleb128 0x1e
	.4byte	0x112
	.byte	0x0
	.uleb128 0x1f
	.byte	0x1
	.4byte	.LASF371
	.byte	0x9
	.byte	0x6e
	.4byte	.LASF372
	.byte	0x1
	.4byte	0x1757
	.uleb128 0x1d
	.4byte	0x1906
	.byte	0x1
	.byte	0x0
	.uleb128 0x1f
	.byte	0x1
	.4byte	.LASF373
	.byte	0x9
	.byte	0x6f
	.4byte	.LASF374
	.byte	0x1
	.4byte	0x177e
	.uleb128 0x1d
	.4byte	0x1906
	.byte	0x1
	.uleb128 0x1e
	.4byte	0xa2
	.uleb128 0x1e
	.4byte	0x112
	.uleb128 0x1e
	.4byte	0x190c
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.4byte	.LASF375
	.byte	0x9
	.byte	0x72
	.4byte	.LASF376
	.4byte	0xa2
	.byte	0x1
	.4byte	0x179a
	.uleb128 0x1d
	.4byte	0x1906
	.byte	0x1
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.4byte	.LASF377
	.byte	0x9
	.byte	0x73
	.4byte	.LASF378
	.4byte	0xa2
	.byte	0x1
	.4byte	0x17b6
	.uleb128 0x1d
	.4byte	0x1906
	.byte	0x1
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.4byte	.LASF379
	.byte	0x9
	.byte	0x74
	.4byte	.LASF380
	.4byte	0xa2
	.byte	0x1
	.4byte	0x17d2
	.uleb128 0x1d
	.4byte	0x1906
	.byte	0x1
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.4byte	.LASF381
	.byte	0x9
	.byte	0x75
	.4byte	.LASF382
	.4byte	0xa2
	.byte	0x1
	.4byte	0x17ee
	.uleb128 0x1d
	.4byte	0x1906
	.byte	0x1
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.4byte	.LASF383
	.byte	0x9
	.byte	0x76
	.4byte	.LASF384
	.4byte	0xa2
	.byte	0x1
	.4byte	0x180a
	.uleb128 0x1d
	.4byte	0x1906
	.byte	0x1
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.4byte	.LASF385
	.byte	0x9
	.byte	0x77
	.4byte	.LASF386
	.4byte	0xa2
	.byte	0x1
	.4byte	0x1826
	.uleb128 0x1d
	.4byte	0x1906
	.byte	0x1
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.4byte	.LASF387
	.byte	0x9
	.byte	0x78
	.4byte	.LASF388
	.4byte	0xa2
	.byte	0x1
	.4byte	0x1842
	.uleb128 0x1d
	.4byte	0x1906
	.byte	0x1
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.4byte	.LASF389
	.byte	0x9
	.byte	0x79
	.4byte	.LASF390
	.4byte	0xa2
	.byte	0x1
	.4byte	0x185e
	.uleb128 0x1d
	.4byte	0x1906
	.byte	0x1
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.4byte	.LASF391
	.byte	0x9
	.byte	0x7a
	.4byte	.LASF392
	.4byte	0xa2
	.byte	0x1
	.4byte	0x187a
	.uleb128 0x1d
	.4byte	0x1906
	.byte	0x1
	.byte	0x0
	.uleb128 0x20
	.byte	0x1
	.4byte	.LASF393
	.byte	0x9
	.byte	0x7b
	.4byte	.LASF394
	.4byte	0xa2
	.byte	0x1
	.uleb128 0x1d
	.4byte	0x1906
	.byte	0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x13
	.4byte	0x41b
	.4byte	0x18a4
	.uleb128 0x21
	.4byte	0xad
	.2byte	0xfff
	.byte	0x0
	.uleb128 0x13
	.4byte	0xc2
	.4byte	0x18b5
	.uleb128 0x21
	.4byte	0xad
	.2byte	0xfff
	.byte	0x0
	.uleb128 0x13
	.4byte	0x9b
	.4byte	0x18c5
	.uleb128 0x14
	.4byte	0xad
	.byte	0x16
	.byte	0x0
	.uleb128 0x13
	.4byte	0x9b
	.4byte	0x18d5
	.uleb128 0x14
	.4byte	0xad
	.byte	0x4
	.byte	0x0
	.uleb128 0x13
	.4byte	0x9b
	.4byte	0x18e5
	.uleb128 0x14
	.4byte	0xad
	.byte	0x2
	.byte	0x0
	.uleb128 0x13
	.4byte	0xc2
	.4byte	0x18f6
	.uleb128 0x21
	.4byte	0xad
	.2byte	0x1fff
	.byte	0x0
	.uleb128 0x13
	.4byte	0x9b
	.4byte	0x1906
	.uleb128 0x14
	.4byte	0xad
	.byte	0xff
	.byte	0x0
	.uleb128 0xa
	.byte	0x4
	.4byte	0x1258
	.uleb128 0x22
	.byte	0x4
	.4byte	0xf1
	.uleb128 0x15
	.4byte	.LASF395
	.2byte	0x138
	.byte	0xa
	.byte	0x3f
	.4byte	0x194b
	.uleb128 0x12
	.4byte	.LASF396
	.byte	0xa
	.byte	0x40
	.4byte	0x194b
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x12
	.4byte	.LASF397
	.byte	0xa
	.byte	0x41
	.4byte	0x195b
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x12
	.4byte	.LASF398
	.byte	0xa
	.byte	0x42
	.4byte	0x195b
	.byte	0x3
	.byte	0x23
	.uleb128 0xa8
	.byte	0x0
	.uleb128 0x13
	.4byte	0xfc
	.4byte	0x195b
	.uleb128 0x14
	.4byte	0xad
	.byte	0x5
	.byte	0x0
	.uleb128 0x13
	.4byte	0xfc
	.4byte	0x1971
	.uleb128 0x14
	.4byte	0xad
	.byte	0x5
	.uleb128 0x14
	.4byte	0xad
	.byte	0x5
	.byte	0x0
	.uleb128 0x15
	.4byte	.LASF399
	.2byte	0x10f0
	.byte	0xa
	.byte	0x45
	.4byte	0x1b67
	.uleb128 0x12
	.4byte	.LASF400
	.byte	0xa
	.byte	0x46
	.4byte	0x112
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x12
	.4byte	.LASF401
	.byte	0xa
	.byte	0x47
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0x12
	.4byte	.LASF402
	.byte	0xa
	.byte	0x48
	.4byte	0x112
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x12
	.4byte	.LASF403
	.byte	0xa
	.byte	0x49
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0x12
	.4byte	.LASF404
	.byte	0xa
	.byte	0x4a
	.4byte	0x112
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x12
	.4byte	.LASF405
	.byte	0xa
	.byte	0x4b
	.4byte	0x112
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x12
	.4byte	.LASF406
	.byte	0xa
	.byte	0x4c
	.4byte	0x112
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x12
	.4byte	.LASF407
	.byte	0xa
	.byte	0x4d
	.4byte	0x112
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x12
	.4byte	.LASF408
	.byte	0xa
	.byte	0x4e
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x12
	.4byte	.LASF409
	.byte	0xa
	.byte	0x4f
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x12
	.4byte	.LASF410
	.byte	0xa
	.byte	0x50
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x12
	.4byte	.LASF411
	.byte	0xa
	.byte	0x51
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x12
	.4byte	.LASF412
	.byte	0xa
	.byte	0x52
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x12
	.4byte	.LASF413
	.byte	0xa
	.byte	0x53
	.4byte	0x1b67
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x12
	.4byte	.LASF414
	.byte	0xa
	.byte	0x54
	.4byte	0x1b67
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x12
	.4byte	.LASF415
	.byte	0xa
	.byte	0x55
	.4byte	0x112
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x12
	.4byte	.LASF416
	.byte	0xa
	.byte	0x56
	.4byte	0x112
	.byte	0x2
	.byte	0x23
	.uleb128 0x35
	.uleb128 0x12
	.4byte	.LASF417
	.byte	0xa
	.byte	0x57
	.4byte	0x112
	.byte	0x2
	.byte	0x23
	.uleb128 0x36
	.uleb128 0x12
	.4byte	.LASF418
	.byte	0xa
	.byte	0x58
	.4byte	0x87
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x12
	.4byte	.LASF419
	.byte	0xa
	.byte	0x59
	.4byte	0x87
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0x10
	.ascii	"Red\000"
	.byte	0xa
	.byte	0x5a
	.4byte	0x1b77
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x12
	.4byte	.LASF420
	.byte	0xa
	.byte	0x5b
	.4byte	0x1b77
	.byte	0x3
	.byte	0x23
	.uleb128 0x440
	.uleb128 0x12
	.4byte	.LASF421
	.byte	0xa
	.byte	0x5c
	.4byte	0x1b77
	.byte	0x3
	.byte	0x23
	.uleb128 0x840
	.uleb128 0x10
	.ascii	"XB\000"
	.byte	0xa
	.byte	0x5d
	.4byte	0x41b
	.byte	0x3
	.byte	0x23
	.uleb128 0xc40
	.uleb128 0x12
	.4byte	.LASF422
	.byte	0xa
	.byte	0x5e
	.4byte	0x1b87
	.byte	0x3
	.byte	0x23
	.uleb128 0xc44
	.uleb128 0x12
	.4byte	.LASF423
	.byte	0xa
	.byte	0x5f
	.4byte	0x87
	.byte	0x3
	.byte	0x23
	.uleb128 0xe44
	.uleb128 0x12
	.4byte	.LASF424
	.byte	0xa
	.byte	0x60
	.4byte	0x87
	.byte	0x3
	.byte	0x23
	.uleb128 0xe48
	.uleb128 0x12
	.4byte	.LASF425
	.byte	0xa
	.byte	0x61
	.4byte	0x87
	.byte	0x3
	.byte	0x23
	.uleb128 0xe4c
	.uleb128 0x12
	.4byte	.LASF426
	.byte	0xa
	.byte	0x62
	.4byte	0x1b97
	.byte	0x3
	.byte	0x23
	.uleb128 0xe50
	.uleb128 0x12
	.4byte	.LASF105
	.byte	0xa
	.byte	0x63
	.4byte	0xfc
	.byte	0x3
	.byte	0x23
	.uleb128 0xe64
	.uleb128 0x12
	.4byte	.LASF104
	.byte	0xa
	.byte	0x64
	.4byte	0x1ba7
	.byte	0x3
	.byte	0x23
	.uleb128 0xe68
	.uleb128 0x12
	.4byte	.LASF427
	.byte	0xa
	.byte	0x65
	.4byte	0xf88
	.byte	0x3
	.byte	0x23
	.uleb128 0xe70
	.uleb128 0x12
	.4byte	.LASF428
	.byte	0xa
	.byte	0x66
	.4byte	0xf88
	.byte	0x3
	.byte	0x23
	.uleb128 0xe78
	.uleb128 0x12
	.4byte	.LASF429
	.byte	0xa
	.byte	0x67
	.4byte	0x1bb7
	.byte	0x3
	.byte	0x23
	.uleb128 0xe80
	.byte	0x0
	.uleb128 0x13
	.4byte	0x41b
	.4byte	0x1b77
	.uleb128 0x14
	.4byte	0xad
	.byte	0x2
	.byte	0x0
	.uleb128 0x13
	.4byte	0xfc
	.4byte	0x1b87
	.uleb128 0x14
	.4byte	0xad
	.byte	0xff
	.byte	0x0
	.uleb128 0x13
	.4byte	0xcd
	.4byte	0x1b97
	.uleb128 0x14
	.4byte	0xad
	.byte	0xff
	.byte	0x0
	.uleb128 0x13
	.4byte	0xfc
	.4byte	0x1ba7
	.uleb128 0x14
	.4byte	0xad
	.byte	0x4
	.byte	0x0
	.uleb128 0x13
	.4byte	0xfc
	.4byte	0x1bb7
	.uleb128 0x14
	.4byte	0xad
	.byte	0x1
	.byte	0x0
	.uleb128 0x13
	.4byte	0x1912
	.4byte	0x1bc7
	.uleb128 0x14
	.4byte	0xad
	.byte	0x1
	.byte	0x0
	.uleb128 0xf
	.4byte	.LASF430
	.byte	0xc
	.byte	0xa
	.byte	0x6b
	.4byte	0x1c44
	.uleb128 0x12
	.4byte	.LASF431
	.byte	0xa
	.byte	0x6c
	.4byte	0x8e
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x12
	.4byte	.LASF432
	.byte	0xa
	.byte	0x6d
	.4byte	0xcd
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x12
	.4byte	.LASF433
	.byte	0xa
	.byte	0x6e
	.4byte	0xcd
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x12
	.4byte	.LASF434
	.byte	0xa
	.byte	0x6f
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x12
	.4byte	.LASF435
	.byte	0xa
	.byte	0x70
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x12
	.4byte	.LASF436
	.byte	0xa
	.byte	0x71
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x12
	.4byte	.LASF437
	.byte	0xa
	.byte	0x72
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.uleb128 0x12
	.4byte	.LASF387
	.byte	0xa
	.byte	0x73
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.byte	0x0
	.uleb128 0x15
	.4byte	.LASF438
	.2byte	0xad8
	.byte	0xa
	.byte	0x76
	.4byte	0x2117
	.uleb128 0xf
	.4byte	.LASF20
	.byte	0xa
	.byte	0xa
	.byte	0x7b
	.4byte	0x1cb2
	.uleb128 0x12
	.4byte	.LASF439
	.byte	0xa
	.byte	0x7c
	.4byte	0x112
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x12
	.4byte	.LASF440
	.byte	0xa
	.byte	0x7d
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0x12
	.4byte	.LASF261
	.byte	0xa
	.byte	0x7e
	.4byte	0xcd
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x12
	.4byte	.LASF441
	.byte	0xa
	.byte	0x7f
	.4byte	0xcd
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x12
	.4byte	.LASF442
	.byte	0xa
	.byte	0x80
	.4byte	0xcd
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x12
	.4byte	.LASF443
	.byte	0xa
	.byte	0x81
	.4byte	0xcd
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0xf
	.4byte	.LASF20
	.byte	0xc
	.byte	0xa
	.byte	0x84
	.4byte	0x1d13
	.uleb128 0x12
	.4byte	.LASF444
	.byte	0xa
	.byte	0x85
	.4byte	0xcd
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x12
	.4byte	.LASF445
	.byte	0xa
	.byte	0x86
	.4byte	0xcd
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x12
	.4byte	.LASF446
	.byte	0xa
	.byte	0x87
	.4byte	0xcd
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x12
	.4byte	.LASF447
	.byte	0xa
	.byte	0x88
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x12
	.4byte	.LASF448
	.byte	0xa
	.byte	0x89
	.4byte	0xcd
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x12
	.4byte	.LASF449
	.byte	0xa
	.byte	0x8a
	.4byte	0xcd
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.byte	0x0
	.uleb128 0x12
	.4byte	.LASF450
	.byte	0xa
	.byte	0x77
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x12
	.4byte	.LASF451
	.byte	0xa
	.byte	0x78
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0x12
	.4byte	.LASF452
	.byte	0xa
	.byte	0x79
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x10
	.ascii	"VMA\000"
	.byte	0xa
	.byte	0x82
	.4byte	0x1c51
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x10
	.ascii	"BG\000"
	.byte	0xa
	.byte	0x8b
	.4byte	0x2117
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0x12
	.4byte	.LASF453
	.byte	0xa
	.byte	0x8d
	.4byte	0x112
	.byte	0x2
	.byte	0x23
	.uleb128 0x3e
	.uleb128 0x12
	.4byte	.LASF454
	.byte	0xa
	.byte	0x8e
	.4byte	0x1b87
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x12
	.4byte	.LASF455
	.byte	0xa
	.byte	0x8f
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0x240
	.uleb128 0x12
	.4byte	.LASF456
	.byte	0xa
	.byte	0x90
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0x241
	.uleb128 0x10
	.ascii	"OBJ\000"
	.byte	0xa
	.byte	0x91
	.4byte	0x2127
	.byte	0x3
	.byte	0x23
	.uleb128 0x242
	.uleb128 0x12
	.4byte	.LASF457
	.byte	0xa
	.byte	0x92
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0x842
	.uleb128 0x12
	.4byte	.LASF458
	.byte	0xa
	.byte	0x93
	.4byte	0xcd
	.byte	0x3
	.byte	0x23
	.uleb128 0x844
	.uleb128 0x12
	.4byte	.LASF459
	.byte	0xa
	.byte	0x95
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0x846
	.uleb128 0x12
	.4byte	.LASF460
	.byte	0xa
	.byte	0x96
	.4byte	0xcd
	.byte	0x3
	.byte	0x23
	.uleb128 0x848
	.uleb128 0x12
	.4byte	.LASF461
	.byte	0xa
	.byte	0x97
	.4byte	0xcd
	.byte	0x3
	.byte	0x23
	.uleb128 0x84a
	.uleb128 0x12
	.4byte	.LASF462
	.byte	0xa
	.byte	0x98
	.4byte	0xcd
	.byte	0x3
	.byte	0x23
	.uleb128 0x84c
	.uleb128 0x12
	.4byte	.LASF463
	.byte	0xa
	.byte	0x99
	.4byte	0xcd
	.byte	0x3
	.byte	0x23
	.uleb128 0x84e
	.uleb128 0x12
	.4byte	.LASF464
	.byte	0xa
	.byte	0x9a
	.4byte	0xcd
	.byte	0x3
	.byte	0x23
	.uleb128 0x850
	.uleb128 0x12
	.4byte	.LASF465
	.byte	0xa
	.byte	0x9c
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0x852
	.uleb128 0x12
	.4byte	.LASF466
	.byte	0xa
	.byte	0x9d
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0x853
	.uleb128 0x12
	.4byte	.LASF467
	.byte	0xa
	.byte	0x9e
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0x854
	.uleb128 0x12
	.4byte	.LASF468
	.byte	0xa
	.byte	0xa0
	.4byte	0x8e
	.byte	0x3
	.byte	0x23
	.uleb128 0x856
	.uleb128 0x12
	.4byte	.LASF469
	.byte	0xa
	.byte	0xa1
	.4byte	0x8e
	.byte	0x3
	.byte	0x23
	.uleb128 0x858
	.uleb128 0x12
	.4byte	.LASF470
	.byte	0xa
	.byte	0xa2
	.4byte	0x8e
	.byte	0x3
	.byte	0x23
	.uleb128 0x85a
	.uleb128 0x12
	.4byte	.LASF471
	.byte	0xa
	.byte	0xa3
	.4byte	0x8e
	.byte	0x3
	.byte	0x23
	.uleb128 0x85c
	.uleb128 0x12
	.4byte	.LASF472
	.byte	0xa
	.byte	0xa4
	.4byte	0x8e
	.byte	0x3
	.byte	0x23
	.uleb128 0x85e
	.uleb128 0x12
	.4byte	.LASF473
	.byte	0xa
	.byte	0xa5
	.4byte	0x8e
	.byte	0x3
	.byte	0x23
	.uleb128 0x860
	.uleb128 0x12
	.4byte	.LASF474
	.byte	0xa
	.byte	0xa6
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0x862
	.uleb128 0x12
	.4byte	.LASF475
	.byte	0xa
	.byte	0xa7
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0x863
	.uleb128 0x12
	.4byte	.LASF476
	.byte	0xa
	.byte	0xa9
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0x864
	.uleb128 0x12
	.4byte	.LASF477
	.byte	0xa
	.byte	0xaa
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0x865
	.uleb128 0x12
	.4byte	.LASF478
	.byte	0xa
	.byte	0xab
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0x866
	.uleb128 0x12
	.4byte	.LASF479
	.byte	0xa
	.byte	0xac
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0x867
	.uleb128 0x12
	.4byte	.LASF480
	.byte	0xa
	.byte	0xad
	.4byte	0xcd
	.byte	0x3
	.byte	0x23
	.uleb128 0x868
	.uleb128 0x12
	.4byte	.LASF481
	.byte	0xa
	.byte	0xae
	.4byte	0xcd
	.byte	0x3
	.byte	0x23
	.uleb128 0x86a
	.uleb128 0x12
	.4byte	.LASF482
	.byte	0xa
	.byte	0xaf
	.4byte	0xfc
	.byte	0x3
	.byte	0x23
	.uleb128 0x86c
	.uleb128 0x12
	.4byte	.LASF483
	.byte	0xa
	.byte	0xb0
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0x870
	.uleb128 0x12
	.4byte	.LASF484
	.byte	0xa
	.byte	0xb1
	.4byte	0x112
	.byte	0x3
	.byte	0x23
	.uleb128 0x871
	.uleb128 0x12
	.4byte	.LASF485
	.byte	0xa
	.byte	0xb2
	.4byte	0x112
	.byte	0x3
	.byte	0x23
	.uleb128 0x872
	.uleb128 0x12
	.4byte	.LASF486
	.byte	0xa
	.byte	0xb3
	.4byte	0x112
	.byte	0x3
	.byte	0x23
	.uleb128 0x873
	.uleb128 0x12
	.4byte	.LASF487
	.byte	0xa
	.byte	0xb4
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0x874
	.uleb128 0x12
	.4byte	.LASF488
	.byte	0xa
	.byte	0xb5
	.4byte	0xcd
	.byte	0x3
	.byte	0x23
	.uleb128 0x876
	.uleb128 0x12
	.4byte	.LASF489
	.byte	0xa
	.byte	0xb6
	.4byte	0x112
	.byte	0x3
	.byte	0x23
	.uleb128 0x878
	.uleb128 0x12
	.4byte	.LASF490
	.byte	0xa
	.byte	0xb7
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0x879
	.uleb128 0x12
	.4byte	.LASF491
	.byte	0xa
	.byte	0xb8
	.4byte	0x2137
	.byte	0x3
	.byte	0x23
	.uleb128 0x87a
	.uleb128 0x12
	.4byte	.LASF492
	.byte	0xa
	.byte	0xb9
	.4byte	0x112
	.byte	0x3
	.byte	0x23
	.uleb128 0xa9a
	.uleb128 0x12
	.4byte	.LASF493
	.byte	0xa
	.byte	0xba
	.4byte	0x112
	.byte	0x3
	.byte	0x23
	.uleb128 0xa9b
	.uleb128 0x12
	.4byte	.LASF494
	.byte	0xa
	.byte	0xbb
	.4byte	0x8e
	.byte	0x3
	.byte	0x23
	.uleb128 0xa9c
	.uleb128 0x12
	.4byte	.LASF495
	.byte	0xa
	.byte	0xbc
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0xa9e
	.uleb128 0x12
	.4byte	.LASF496
	.byte	0xa
	.byte	0xbd
	.4byte	0x2148
	.byte	0x3
	.byte	0x23
	.uleb128 0xa9f
	.uleb128 0x12
	.4byte	.LASF497
	.byte	0xa
	.byte	0xbe
	.4byte	0x112
	.byte	0x3
	.byte	0x23
	.uleb128 0xaa3
	.uleb128 0x12
	.4byte	.LASF498
	.byte	0xa
	.byte	0xbf
	.4byte	0x112
	.byte	0x3
	.byte	0x23
	.uleb128 0xaa4
	.uleb128 0x12
	.4byte	.LASF499
	.byte	0xa
	.byte	0xc0
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0xaa5
	.uleb128 0x12
	.4byte	.LASF500
	.byte	0xa
	.byte	0xc1
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0xaa6
	.uleb128 0x12
	.4byte	.LASF501
	.byte	0xa
	.byte	0xc2
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0xaa7
	.uleb128 0x12
	.4byte	.LASF502
	.byte	0xa
	.byte	0xc3
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0xaa8
	.uleb128 0x12
	.4byte	.LASF503
	.byte	0xa
	.byte	0xc4
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0xaa9
	.uleb128 0x12
	.4byte	.LASF504
	.byte	0xa
	.byte	0xc5
	.4byte	0x2158
	.byte	0x3
	.byte	0x23
	.uleb128 0xaaa
	.uleb128 0x12
	.4byte	.LASF505
	.byte	0xa
	.byte	0xc6
	.4byte	0x2158
	.byte	0x3
	.byte	0x23
	.uleb128 0xab0
	.uleb128 0x12
	.4byte	.LASF506
	.byte	0xa
	.byte	0xc7
	.4byte	0x2158
	.byte	0x3
	.byte	0x23
	.uleb128 0xab6
	.uleb128 0x12
	.4byte	.LASF507
	.byte	0xa
	.byte	0xc8
	.4byte	0x2158
	.byte	0x3
	.byte	0x23
	.uleb128 0xabc
	.uleb128 0x12
	.4byte	.LASF508
	.byte	0xa
	.byte	0xc9
	.4byte	0x2168
	.byte	0x3
	.byte	0x23
	.uleb128 0xac2
	.uleb128 0x12
	.4byte	.LASF509
	.byte	0xa
	.byte	0xca
	.4byte	0x2168
	.byte	0x3
	.byte	0x23
	.uleb128 0xac8
	.uleb128 0x12
	.4byte	.LASF510
	.byte	0xa
	.byte	0xcb
	.4byte	0x112
	.byte	0x3
	.byte	0x23
	.uleb128 0xace
	.uleb128 0x12
	.4byte	.LASF511
	.byte	0xa
	.byte	0xcc
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0xacf
	.uleb128 0x12
	.4byte	.LASF512
	.byte	0xa
	.byte	0xcd
	.4byte	0xcd
	.byte	0x3
	.byte	0x23
	.uleb128 0xad0
	.uleb128 0x12
	.4byte	.LASF513
	.byte	0xa
	.byte	0xce
	.4byte	0x112
	.byte	0x3
	.byte	0x23
	.uleb128 0xad2
	.uleb128 0x12
	.4byte	.LASF514
	.byte	0xa
	.byte	0xcf
	.4byte	0xc2
	.byte	0x3
	.byte	0x23
	.uleb128 0xad3
	.uleb128 0x12
	.4byte	.LASF515
	.byte	0xa
	.byte	0xd0
	.4byte	0x2178
	.byte	0x3
	.byte	0x23
	.uleb128 0xad4
	.byte	0x0
	.uleb128 0x13
	.4byte	0x1cb2
	.4byte	0x2127
	.uleb128 0x14
	.4byte	0xad
	.byte	0x3
	.byte	0x0
	.uleb128 0x13
	.4byte	0x1bc7
	.4byte	0x2137
	.uleb128 0x14
	.4byte	0xad
	.byte	0x7f
	.byte	0x0
	.uleb128 0x13
	.4byte	0xc2
	.4byte	0x2148
	.uleb128 0x21
	.4byte	0xad
	.2byte	0x21f
	.byte	0x0
	.uleb128 0x13
	.4byte	0x112
	.4byte	0x2158
	.uleb128 0x14
	.4byte	0xad
	.byte	0x3
	.byte	0x0
	.uleb128 0x13
	.4byte	0xc2
	.4byte	0x2168
	.uleb128 0x14
	.4byte	0xad
	.byte	0x5
	.byte	0x0
	.uleb128 0x13
	.4byte	0x112
	.4byte	0x2178
	.uleb128 0x14
	.4byte	0xad
	.byte	0x5
	.byte	0x0
	.uleb128 0x13
	.4byte	0xc2
	.4byte	0x2188
	.uleb128 0x14
	.4byte	0xad
	.byte	0x1
	.byte	0x0
	.uleb128 0xa
	.byte	0x4
	.4byte	0xcd
	.uleb128 0xf
	.4byte	.LASF516
	.byte	0x4
	.byte	0xb
	.byte	0x33
	.4byte	0x21a9
	.uleb128 0x12
	.4byte	.LASF517
	.byte	0xb
	.byte	0x37
	.4byte	0xb1
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0xa
	.byte	0x4
	.4byte	0x218e
	.uleb128 0x15
	.4byte	.LASF518
	.2byte	0x8058
	.byte	0xc
	.byte	0x3a
	.4byte	0x238e
	.uleb128 0x12
	.4byte	.LASF519
	.byte	0xc
	.byte	0x3b
	.4byte	0x21a9
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x12
	.4byte	.LASF266
	.byte	0xc
	.byte	0x3c
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x12
	.4byte	.LASF276
	.byte	0xc
	.byte	0x3d
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x12
	.4byte	.LASF520
	.byte	0xc
	.byte	0x3e
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x12
	.4byte	.LASF267
	.byte	0xc
	.byte	0x3f
	.4byte	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x12
	.4byte	.LASF521
	.byte	0xc
	.byte	0x40
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x12
	.4byte	.LASF522
	.byte	0xc
	.byte	0x41
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x12
	.4byte	.LASF523
	.byte	0xc
	.byte	0x42
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x12
	.4byte	.LASF23
	.byte	0xc
	.byte	0x43
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x12
	.4byte	.LASF524
	.byte	0xc
	.byte	0x44
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x12
	.4byte	.LASF25
	.byte	0xc
	.byte	0x45
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0x12
	.4byte	.LASF26
	.byte	0xc
	.byte	0x46
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0x12
	.4byte	.LASF27
	.byte	0xc
	.byte	0x47
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x1b
	.uleb128 0x12
	.4byte	.LASF525
	.byte	0xc
	.byte	0x48
	.4byte	0xb7
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x10
	.ascii	"PC\000"
	.byte	0xc
	.byte	0x4a
	.4byte	0x41b
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x12
	.4byte	.LASF30
	.byte	0xc
	.byte	0x4b
	.4byte	0x41b
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x12
	.4byte	.LASF289
	.byte	0xc
	.byte	0x4c
	.4byte	0x41b
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x12
	.4byte	.LASF31
	.byte	0xc
	.byte	0x4d
	.4byte	0x41b
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0x12
	.4byte	.LASF32
	.byte	0xc
	.byte	0x4e
	.4byte	0x41b
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x12
	.4byte	.LASF33
	.byte	0xc
	.byte	0x4f
	.4byte	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x12
	.4byte	.LASF526
	.byte	0xc
	.byte	0x50
	.4byte	0x41b
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x12
	.4byte	.LASF527
	.byte	0xc
	.byte	0x51
	.4byte	0x41b
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0x10
	.ascii	"Map\000"
	.byte	0xc
	.byte	0x55
	.4byte	0x1893
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x12
	.4byte	.LASF296
	.byte	0xc
	.byte	0x56
	.4byte	0x1893
	.byte	0x4
	.byte	0x23
	.uleb128 0x4040
	.uleb128 0x10
	.ascii	"op1\000"
	.byte	0xc
	.byte	0x57
	.4byte	0xe6
	.byte	0x4
	.byte	0x23
	.uleb128 0x8040
	.uleb128 0x10
	.ascii	"op2\000"
	.byte	0xc
	.byte	0x58
	.4byte	0xe6
	.byte	0x4
	.byte	0x23
	.uleb128 0x8042
	.uleb128 0x12
	.4byte	.LASF528
	.byte	0xc
	.byte	0x59
	.4byte	0x87
	.byte	0x4
	.byte	0x23
	.uleb128 0x8044
	.uleb128 0x10
	.ascii	"sum\000"
	.byte	0xc
	.byte	0x5a
	.4byte	0x107
	.byte	0x4
	.byte	0x23
	.uleb128 0x8048
	.uleb128 0x12
	.4byte	.LASF529
	.byte	0xc
	.byte	0x5b
	.4byte	0xb7
	.byte	0x4
	.byte	0x23
	.uleb128 0x8050
	.uleb128 0x12
	.4byte	.LASF530
	.byte	0xc
	.byte	0x5c
	.4byte	0xc2
	.byte	0x4
	.byte	0x23
	.uleb128 0x8051
	.uleb128 0x12
	.4byte	.LASF531
	.byte	0xc
	.byte	0x5d
	.4byte	0xb7
	.byte	0x4
	.byte	0x23
	.uleb128 0x8052
	.uleb128 0x12
	.4byte	.LASF532
	.byte	0xc
	.byte	0x5e
	.4byte	0xc2
	.byte	0x4
	.byte	0x23
	.uleb128 0x8053
	.byte	0x0
	.uleb128 0x23
	.4byte	.LASF533
	.byte	0x1
	.byte	0x40
	.4byte	.LFB0
	.4byte	.LFE0
	.4byte	.LLST0
	.4byte	0x23e1
	.uleb128 0x24
	.ascii	"d\000"
	.byte	0x1
	.byte	0x40
	.4byte	0x52
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x24
	.ascii	"v\000"
	.byte	0x1
	.byte	0x40
	.4byte	0xe05
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x24
	.ascii	"c\000"
	.byte	0x1
	.byte	0x40
	.4byte	0xe05
	.byte	0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x25
	.4byte	.LBB2
	.4byte	.LBE2
	.uleb128 0x26
	.ascii	"dl\000"
	.byte	0x1
	.byte	0x42
	.4byte	0x23e1
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.byte	0x0
	.byte	0x0
	.uleb128 0xa
	.byte	0x4
	.4byte	0xe05
	.uleb128 0x23
	.4byte	.LASF534
	.byte	0x2
	.byte	0xc9
	.4byte	.LFB9
	.4byte	.LFE9
	.4byte	.LLST1
	.4byte	0x240d
	.uleb128 0x27
	.4byte	.LASF535
	.byte	0x2
	.byte	0xc9
	.4byte	0xb7
	.byte	0x2
	.byte	0x91
	.sleb128 -9
	.byte	0x0
	.uleb128 0x23
	.4byte	.LASF536
	.byte	0x2
	.byte	0xd0
	.4byte	.LFB10
	.4byte	.LFE10
	.4byte	.LLST2
	.4byte	0x246a
	.uleb128 0x24
	.ascii	"ch\000"
	.byte	0x2
	.byte	0xd0
	.4byte	0x246a
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x27
	.4byte	.LASF537
	.byte	0x2
	.byte	0xd0
	.4byte	0xe05
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x27
	.4byte	.LASF209
	.byte	0x2
	.byte	0xd0
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x27
	.4byte	.LASF538
	.byte	0x2
	.byte	0xd0
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x27
	.4byte	.LASF225
	.byte	0x2
	.byte	0xd0
	.4byte	0x79
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.byte	0x0
	.uleb128 0xa
	.byte	0x4
	.4byte	0xb90
	.uleb128 0x28
	.4byte	.LASF539
	.byte	0x2
	.2byte	0x10e
	.4byte	.LFB11
	.4byte	.LFE11
	.4byte	.LLST3
	.4byte	0x24af
	.uleb128 0x29
	.4byte	.LASF540
	.byte	0x2
	.2byte	0x10e
	.4byte	0xc2
	.byte	0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x25
	.4byte	.LBB4
	.4byte	.LBE4
	.uleb128 0x2a
	.ascii	"i\000"
	.byte	0x2
	.2byte	0x11a
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.byte	0x0
	.byte	0x0
	.uleb128 0x28
	.4byte	.LASF541
	.byte	0x2
	.2byte	0x123
	.4byte	.LFB12
	.4byte	.LFE12
	.4byte	.LLST4
	.4byte	0x24d7
	.uleb128 0x29
	.4byte	.LASF542
	.byte	0x2
	.2byte	0x123
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.byte	0x0
	.uleb128 0x28
	.4byte	.LASF543
	.byte	0x2
	.2byte	0x129
	.4byte	.LFB13
	.4byte	.LFE13
	.4byte	.LLST5
	.4byte	0x250e
	.uleb128 0x2b
	.ascii	"tap\000"
	.byte	0x2
	.2byte	0x129
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x29
	.4byte	.LASF544
	.byte	0x2
	.2byte	0x129
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.byte	0x0
	.uleb128 0x2c
	.4byte	.LASF623
	.byte	0x2
	.2byte	0x136
	.4byte	0x2188
	.4byte	.LFB14
	.4byte	.LFE14
	.4byte	.LLST6
	.4byte	0x2553
	.uleb128 0x29
	.4byte	.LASF219
	.byte	0x2
	.2byte	0x136
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x25
	.4byte	.LBB5
	.4byte	.LBE5
	.uleb128 0x2d
	.4byte	.LASF545
	.byte	0x2
	.2byte	0x138
	.4byte	0xfc
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.byte	0x0
	.byte	0x0
	.uleb128 0x28
	.4byte	.LASF546
	.byte	0x2
	.2byte	0x13c
	.4byte	.LFB15
	.4byte	.LFE15
	.4byte	.LLST7
	.4byte	0x258a
	.uleb128 0x29
	.4byte	.LASF547
	.byte	0x2
	.2byte	0x13c
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x29
	.4byte	.LASF199
	.byte	0x2
	.2byte	0x13c
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.byte	0x0
	.uleb128 0x23
	.4byte	.LASF548
	.byte	0x1
	.byte	0x8f
	.4byte	.LFB36
	.4byte	.LFE36
	.4byte	.LLST8
	.4byte	0x25bb
	.uleb128 0x24
	.ascii	"i\000"
	.byte	0x1
	.byte	0x8f
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x24
	.ascii	"ch\000"
	.byte	0x1
	.byte	0x8f
	.4byte	0x246a
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.byte	0x0
	.uleb128 0x23
	.4byte	.LASF549
	.byte	0x1
	.byte	0x9c
	.4byte	.LFB37
	.4byte	.LFE37
	.4byte	.LLST9
	.4byte	0x25e0
	.uleb128 0x24
	.ascii	"ch\000"
	.byte	0x1
	.byte	0x9c
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.byte	0x0
	.uleb128 0x2e
	.byte	0x1
	.4byte	.LASF551
	.byte	0x1
	.byte	0xa4
	.4byte	.LASF553
	.4byte	.LFB38
	.4byte	.LFE38
	.4byte	.LLST10
	.4byte	0x260b
	.uleb128 0x27
	.4byte	.LASF550
	.byte	0x1
	.byte	0xa4
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.byte	0x0
	.uleb128 0x2e
	.byte	0x1
	.4byte	.LASF552
	.byte	0x1
	.byte	0xb1
	.4byte	.LASF554
	.4byte	.LFB39
	.4byte	.LFE39
	.4byte	.LLST11
	.4byte	0x264d
	.uleb128 0x27
	.4byte	.LASF547
	.byte	0x1
	.byte	0xb1
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x25
	.4byte	.LBB6
	.4byte	.LBE6
	.uleb128 0x26
	.ascii	"ch\000"
	.byte	0x1
	.byte	0xb3
	.4byte	0x246a
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.byte	0x0
	.byte	0x0
	.uleb128 0x2e
	.byte	0x1
	.4byte	.LASF555
	.byte	0x1
	.byte	0xbd
	.4byte	.LASF556
	.4byte	.LFB40
	.4byte	.LFE40
	.4byte	.LLST12
	.4byte	0x2680
	.uleb128 0x25
	.4byte	.LBB8
	.4byte	.LBE8
	.uleb128 0x26
	.ascii	"i\000"
	.byte	0x1
	.byte	0xcc
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.byte	0x0
	.byte	0x0
	.uleb128 0x2e
	.byte	0x1
	.4byte	.LASF557
	.byte	0x1
	.byte	0xdd
	.4byte	.LASF558
	.4byte	.LFB41
	.4byte	.LFE41
	.4byte	.LLST13
	.4byte	0x26d0
	.uleb128 0x27
	.4byte	.LASF547
	.byte	0x1
	.byte	0xdd
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x27
	.4byte	.LASF559
	.byte	0x1
	.byte	0xdd
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x25
	.4byte	.LBB9
	.4byte	.LBE9
	.uleb128 0x26
	.ascii	"ch\000"
	.byte	0x1
	.byte	0xdf
	.4byte	0x246a
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.byte	0x0
	.byte	0x0
	.uleb128 0x2e
	.byte	0x1
	.4byte	.LASF560
	.byte	0x1
	.byte	0xee
	.4byte	.LASF561
	.4byte	.LFB42
	.4byte	.LFE42
	.4byte	.LLST14
	.4byte	0x26fd
	.uleb128 0x2f
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x2f
	.4byte	0xcd
	.byte	0x2
	.byte	0x91
	.sleb128 -14
	.byte	0x0
	.uleb128 0x28
	.4byte	.LASF562
	.byte	0x1
	.2byte	0x107
	.4byte	.LFB43
	.4byte	.LFE43
	.4byte	.LLST15
	.4byte	0x27c2
	.uleb128 0x2b
	.ascii	"ch\000"
	.byte	0x1
	.2byte	0x107
	.4byte	0x246a
	.byte	0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x25
	.4byte	.LBB10
	.4byte	.LBE10
	.uleb128 0x2d
	.4byte	.LASF563
	.byte	0x1
	.2byte	0x111
	.4byte	0x27c2
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2d
	.4byte	.LASF564
	.byte	0x1
	.2byte	0x113
	.4byte	0x80
	.byte	0x2
	.byte	0x91
	.sleb128 -33
	.uleb128 0x2a
	.ascii	"raw\000"
	.byte	0x1
	.2byte	0x117
	.4byte	0x27c8
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x2a
	.ascii	"out\000"
	.byte	0x1
	.2byte	0x11c
	.4byte	0xf1
	.byte	0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x2d
	.4byte	.LASF565
	.byte	0x1
	.2byte	0x11d
	.4byte	0x80
	.byte	0x2
	.byte	0x91
	.sleb128 -23
	.uleb128 0x2d
	.4byte	.LASF566
	.byte	0x1
	.2byte	0x11e
	.4byte	0xdf
	.byte	0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x2d
	.4byte	.LASF567
	.byte	0x1
	.2byte	0x11e
	.4byte	0xdf
	.byte	0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x2a
	.ascii	"i\000"
	.byte	0x1
	.2byte	0x11f
	.4byte	0x79
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x2d
	.4byte	.LASF568
	.byte	0x1
	.2byte	0x123
	.4byte	0xf1
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x2d
	.4byte	.LASF569
	.byte	0x1
	.2byte	0x124
	.4byte	0xf1
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.byte	0x0
	.byte	0x0
	.uleb128 0xa
	.byte	0x4
	.4byte	0xdf
	.uleb128 0xa
	.byte	0x4
	.4byte	0xe6
	.uleb128 0x28
	.4byte	.LASF570
	.byte	0x1
	.2byte	0x177
	.4byte	.LFB44
	.4byte	.LFE44
	.4byte	.LLST16
	.4byte	0x2905
	.uleb128 0x29
	.4byte	.LASF571
	.byte	0x1
	.2byte	0x177
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x30
	.4byte	.LASF576
	.byte	0x1
	.2byte	0x296
	.4byte	.L121
	.uleb128 0x25
	.4byte	.LBB11
	.4byte	.LBE11
	.uleb128 0x2d
	.4byte	.LASF250
	.byte	0x1
	.2byte	0x179
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x25
	.4byte	.LBB12
	.4byte	.LBE12
	.uleb128 0x2a
	.ascii	"J\000"
	.byte	0x1
	.2byte	0x17b
	.4byte	0xfc
	.byte	0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x25
	.4byte	.LBB13
	.4byte	.LBE13
	.uleb128 0x2a
	.ascii	"VL\000"
	.byte	0x1
	.2byte	0x17d
	.4byte	0xf1
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x2a
	.ascii	"VR\000"
	.byte	0x1
	.2byte	0x17d
	.4byte	0xf1
	.byte	0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x2a
	.ascii	"ch\000"
	.byte	0x1
	.2byte	0x17e
	.4byte	0x246a
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2d
	.4byte	.LASF572
	.byte	0x1
	.2byte	0x17f
	.4byte	0xe05
	.byte	0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x2a
	.ascii	"mod\000"
	.byte	0x1
	.2byte	0x186
	.4byte	0xb7
	.byte	0x2
	.byte	0x91
	.sleb128 -29
	.uleb128 0x25
	.4byte	.LBB14
	.4byte	.LBE14
	.uleb128 0x2a
	.ascii	"I\000"
	.byte	0x1
	.2byte	0x19d
	.4byte	0xfc
	.byte	0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x25
	.4byte	.LBB15
	.4byte	.LBE15
	.uleb128 0x2d
	.4byte	.LASF573
	.byte	0x1
	.2byte	0x19f
	.4byte	0xe05
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x31
	.4byte	.LBB16
	.4byte	.LBE16
	.4byte	0x28cb
	.uleb128 0x2d
	.4byte	.LASF574
	.byte	0x1
	.2byte	0x1a7
	.4byte	0xfc
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.byte	0x0
	.uleb128 0x31
	.4byte	.LBB17
	.4byte	.LBE17
	.4byte	0x28e8
	.uleb128 0x2a
	.ascii	"dir\000"
	.byte	0x1
	.2byte	0x25a
	.4byte	0x2188
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.byte	0x0
	.uleb128 0x25
	.4byte	.LBB18
	.4byte	.LBE18
	.uleb128 0x2a
	.ascii	"s\000"
	.byte	0x1
	.2byte	0x282
	.4byte	0xf1
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x28
	.4byte	.LASF575
	.byte	0x1
	.2byte	0x29a
	.4byte	.LFB45
	.4byte	.LFE45
	.4byte	.LLST17
	.4byte	0x2a2d
	.uleb128 0x29
	.4byte	.LASF571
	.byte	0x1
	.2byte	0x29a
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x30
	.4byte	.LASF577
	.byte	0x1
	.2byte	0x3ad
	.4byte	.L218
	.uleb128 0x25
	.4byte	.LBB19
	.4byte	.LBE19
	.uleb128 0x2d
	.4byte	.LASF250
	.byte	0x1
	.2byte	0x29c
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x25
	.4byte	.LBB20
	.4byte	.LBE20
	.uleb128 0x2a
	.ascii	"J\000"
	.byte	0x1
	.2byte	0x29e
	.4byte	0xfc
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x25
	.4byte	.LBB21
	.4byte	.LBE21
	.uleb128 0x2a
	.ascii	"ch\000"
	.byte	0x1
	.2byte	0x2a0
	.4byte	0x246a
	.byte	0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x2d
	.4byte	.LASF572
	.byte	0x1
	.2byte	0x2a1
	.4byte	0xe05
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2a
	.ascii	"mod\000"
	.byte	0x1
	.2byte	0x2a8
	.4byte	0xb7
	.byte	0x2
	.byte	0x91
	.sleb128 -33
	.uleb128 0x2a
	.ascii	"V\000"
	.byte	0x1
	.2byte	0x2bb
	.4byte	0xf1
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x25
	.4byte	.LBB22
	.4byte	.LBE22
	.uleb128 0x2a
	.ascii	"I\000"
	.byte	0x1
	.2byte	0x2bd
	.4byte	0xfc
	.byte	0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x25
	.4byte	.LBB23
	.4byte	.LBE23
	.uleb128 0x2d
	.4byte	.LASF573
	.byte	0x1
	.2byte	0x2bf
	.4byte	0xe05
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x31
	.4byte	.LBB24
	.4byte	.LBE24
	.4byte	0x29f3
	.uleb128 0x2d
	.4byte	.LASF574
	.byte	0x1
	.2byte	0x2c7
	.4byte	0xfc
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.byte	0x0
	.uleb128 0x31
	.4byte	.LBB25
	.4byte	.LBE25
	.4byte	0x2a10
	.uleb128 0x2a
	.ascii	"dir\000"
	.byte	0x1
	.2byte	0x377
	.4byte	0x2188
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.byte	0x0
	.uleb128 0x25
	.4byte	.LBB26
	.4byte	.LBE26
	.uleb128 0x2a
	.ascii	"s\000"
	.byte	0x1
	.2byte	0x39e
	.4byte	0xf1
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x32
	.byte	0x1
	.4byte	.LASF578
	.byte	0x1
	.2byte	0x3b3
	.4byte	.LFB46
	.4byte	.LFE46
	.4byte	.LLST18
	.4byte	0x2a65
	.uleb128 0x29
	.4byte	.LASF579
	.byte	0x1
	.2byte	0x3b3
	.4byte	0xe2c
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x29
	.4byte	.LASF571
	.byte	0x1
	.2byte	0x3b3
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.byte	0x0
	.uleb128 0x32
	.byte	0x1
	.4byte	.LASF580
	.byte	0x1
	.2byte	0x3b9
	.4byte	.LFB47
	.4byte	.LFE47
	.4byte	.LLST19
	.4byte	0x2c0d
	.uleb128 0x29
	.4byte	.LASF579
	.byte	0x1
	.2byte	0x3b9
	.4byte	0xe2c
	.byte	0x3
	.byte	0x91
	.sleb128 -84
	.uleb128 0x29
	.4byte	.LASF571
	.byte	0x1
	.2byte	0x3b9
	.4byte	0x87
	.byte	0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x29
	.4byte	.LASF581
	.byte	0x1
	.2byte	0x3b9
	.4byte	0x87
	.byte	0x3
	.byte	0x91
	.sleb128 -92
	.uleb128 0x25
	.4byte	.LBB27
	.4byte	.LBE27
	.uleb128 0x2a
	.ascii	"J\000"
	.byte	0x1
	.2byte	0x3bc
	.4byte	0x87
	.byte	0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x33
	.4byte	.Ldebug_ranges0+0x0
	.4byte	0x2b59
	.uleb128 0x2a
	.ascii	"l\000"
	.byte	0x1
	.2byte	0x3d4
	.4byte	0x87
	.byte	0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x2a
	.ascii	"r\000"
	.byte	0x1
	.2byte	0x3d4
	.4byte	0x87
	.byte	0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x2d
	.4byte	.LASF582
	.byte	0x1
	.2byte	0x3d5
	.4byte	0x87
	.byte	0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x2d
	.4byte	.LASF583
	.byte	0x1
	.2byte	0x3d6
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x2d
	.4byte	.LASF584
	.byte	0x1
	.2byte	0x3d7
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x2d
	.4byte	.LASF585
	.byte	0x1
	.2byte	0x3d8
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x31
	.4byte	.LBB29
	.4byte	.LBE29
	.4byte	0x2b42
	.uleb128 0x2a
	.ascii	"E\000"
	.byte	0x1
	.2byte	0x3e0
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -52
	.byte	0x0
	.uleb128 0x25
	.4byte	.LBB30
	.4byte	.LBE30
	.uleb128 0x2a
	.ascii	"E\000"
	.byte	0x1
	.2byte	0x3f6
	.4byte	0x87
	.byte	0x1
	.byte	0x54
	.byte	0x0
	.byte	0x0
	.uleb128 0x33
	.4byte	.Ldebug_ranges0+0x18
	.4byte	0x2bbf
	.uleb128 0x2a
	.ascii	"I\000"
	.byte	0x1
	.2byte	0x416
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x2d
	.4byte	.LASF582
	.byte	0x1
	.2byte	0x417
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x2d
	.4byte	.LASF584
	.byte	0x1
	.2byte	0x418
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x31
	.4byte	.LBB33
	.4byte	.LBE33
	.4byte	0x2ba8
	.uleb128 0x2a
	.ascii	"E\000"
	.byte	0x1
	.2byte	0x420
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -36
	.byte	0x0
	.uleb128 0x25
	.4byte	.LBB34
	.4byte	.LBE34
	.uleb128 0x2a
	.ascii	"E\000"
	.byte	0x1
	.2byte	0x431
	.4byte	0x87
	.byte	0x1
	.byte	0x54
	.byte	0x0
	.byte	0x0
	.uleb128 0x25
	.4byte	.LBB36
	.4byte	.LBE36
	.uleb128 0x2a
	.ascii	"l\000"
	.byte	0x1
	.2byte	0x44d
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x2d
	.4byte	.LASF582
	.byte	0x1
	.2byte	0x44d
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x25
	.4byte	.LBB37
	.4byte	.LBE37
	.uleb128 0x2a
	.ascii	"r\000"
	.byte	0x1
	.2byte	0x451
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x2d
	.4byte	.LASF583
	.byte	0x1
	.2byte	0x451
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x34
	.byte	0x1
	.4byte	.LASF586
	.byte	0x1
	.2byte	0x471
	.4byte	.LASF589
	.4byte	.LFB48
	.4byte	.LFE48
	.4byte	.LLST20
	.4byte	0x2c51
	.uleb128 0x29
	.4byte	.LASF587
	.byte	0x1
	.2byte	0x471
	.4byte	0xb7
	.byte	0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x25
	.4byte	.LBB39
	.4byte	.LBE39
	.uleb128 0x2a
	.ascii	"i\000"
	.byte	0x1
	.2byte	0x473
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.byte	0x0
	.byte	0x0
	.uleb128 0x34
	.byte	0x1
	.4byte	.LASF588
	.byte	0x1
	.2byte	0x4c1
	.4byte	.LASF590
	.4byte	.LFB49
	.4byte	.LFE49
	.4byte	.LLST21
	.4byte	0x2ccf
	.uleb128 0x29
	.4byte	.LASF188
	.byte	0x1
	.2byte	0x4c1
	.4byte	0xfc
	.byte	0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x31
	.4byte	.LBB41
	.4byte	.LBE41
	.4byte	0x2cb7
	.uleb128 0x2d
	.4byte	.LASF591
	.byte	0x1
	.2byte	0x4c9
	.4byte	0x2ccf
	.byte	0x5
	.byte	0x3
	.4byte	_ZZ18S9xSetPlaybackRatejE5steps
	.uleb128 0x2a
	.ascii	"i\000"
	.byte	0x1
	.2byte	0x4ce
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x2a
	.ascii	"u\000"
	.byte	0x1
	.2byte	0x4ce
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.byte	0x0
	.uleb128 0x25
	.4byte	.LBB42
	.4byte	.LBE42
	.uleb128 0x2a
	.ascii	"i\000"
	.byte	0x1
	.2byte	0x4ed
	.4byte	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -36
	.byte	0x0
	.byte	0x0
	.uleb128 0x13
	.4byte	0x87
	.4byte	0x2cdf
	.uleb128 0x14
	.4byte	0xad
	.byte	0x9
	.byte	0x0
	.uleb128 0x35
	.byte	0x1
	.4byte	.LASF624
	.byte	0x1
	.2byte	0x4f1
	.4byte	0xb7
	.4byte	.LFB50
	.4byte	.LFE50
	.4byte	.LLST22
	.uleb128 0x36
	.4byte	.LASF592
	.byte	0x6
	.2byte	0x190
	.4byte	0x431
	.byte	0x1
	.byte	0x1
	.uleb128 0x37
	.ascii	"CPU\000"
	.byte	0x6
	.2byte	0x191
	.4byte	0x1dd
	.byte	0x1
	.byte	0x1
	.uleb128 0x38
	.ascii	"so\000"
	.byte	0x2
	.byte	0x4d
	.4byte	0xb2f
	.byte	0x1
	.byte	0x1
	.uleb128 0x39
	.4byte	.LASF593
	.byte	0x2
	.byte	0x96
	.4byte	0xe68
	.byte	0x1
	.byte	0x1
	.uleb128 0x38
	.ascii	"APU\000"
	.byte	0x8
	.byte	0x66
	.4byte	0x116c
	.byte	0x1
	.byte	0x1
	.uleb128 0x39
	.4byte	.LASF594
	.byte	0x8
	.byte	0x67
	.4byte	0xfe7
	.byte	0x1
	.byte	0x1
	.uleb128 0x13
	.4byte	0x87
	.4byte	0x2d58
	.uleb128 0x21
	.4byte	0xad
	.2byte	0x5dbf
	.byte	0x0
	.uleb128 0x39
	.4byte	.LASF595
	.byte	0x2
	.byte	0xb2
	.4byte	0x2d47
	.byte	0x1
	.byte	0x1
	.uleb128 0x13
	.4byte	0x87
	.4byte	0x2d75
	.uleb128 0x14
	.4byte	0xad
	.byte	0xf
	.byte	0x0
	.uleb128 0x39
	.4byte	.LASF596
	.byte	0x2
	.byte	0xb3
	.4byte	0x2d65
	.byte	0x1
	.byte	0x1
	.uleb128 0x13
	.4byte	0x87
	.4byte	0x2d92
	.uleb128 0x14
	.4byte	0xad
	.byte	0x7
	.byte	0x0
	.uleb128 0x39
	.4byte	.LASF597
	.byte	0x2
	.byte	0xb4
	.4byte	0x2d82
	.byte	0x1
	.byte	0x1
	.uleb128 0x13
	.4byte	0x87
	.4byte	0x2db0
	.uleb128 0x21
	.4byte	0xad
	.2byte	0x6e3
	.byte	0x0
	.uleb128 0x39
	.4byte	.LASF598
	.byte	0x2
	.byte	0xb5
	.4byte	0x2d9f
	.byte	0x1
	.byte	0x1
	.uleb128 0x13
	.4byte	0x87
	.4byte	0x2dcd
	.uleb128 0x14
	.4byte	0xad
	.byte	0x1f
	.byte	0x0
	.uleb128 0x39
	.4byte	.LASF599
	.byte	0x2
	.byte	0xb6
	.4byte	0x2dbd
	.byte	0x1
	.byte	0x1
	.uleb128 0x13
	.4byte	0xe05
	.4byte	0x2df0
	.uleb128 0x14
	.4byte	0xad
	.byte	0xf
	.uleb128 0x14
	.4byte	0xad
	.byte	0x9
	.byte	0x0
	.uleb128 0x39
	.4byte	.LASF600
	.byte	0x2
	.byte	0xb9
	.4byte	0x2dda
	.byte	0x1
	.byte	0x1
	.uleb128 0x13
	.4byte	0xe05
	.4byte	0x2e13
	.uleb128 0x14
	.4byte	0xad
	.byte	0x7
	.uleb128 0x14
	.4byte	0xad
	.byte	0x9
	.byte	0x0
	.uleb128 0x39
	.4byte	.LASF601
	.byte	0x2
	.byte	0xba
	.4byte	0x2dfd
	.byte	0x1
	.byte	0x1
	.uleb128 0x13
	.4byte	0xe05
	.4byte	0x2e36
	.uleb128 0x14
	.4byte	0xad
	.byte	0x1f
	.uleb128 0x14
	.4byte	0xad
	.byte	0x9
	.byte	0x0
	.uleb128 0x39
	.4byte	.LASF602
	.byte	0x2
	.byte	0xbb
	.4byte	0x2e20
	.byte	0x1
	.byte	0x1
	.uleb128 0x39
	.4byte	.LASF603
	.byte	0x2
	.byte	0xbc
	.4byte	0x2e20
	.byte	0x1
	.byte	0x1
	.uleb128 0x39
	.4byte	.LASF604
	.byte	0x2
	.byte	0xbd
	.4byte	0x2e20
	.byte	0x1
	.byte	0x1
	.uleb128 0x13
	.4byte	0xe05
	.4byte	0x2e6d
	.uleb128 0x14
	.4byte	0xad
	.byte	0x9
	.byte	0x0
	.uleb128 0x39
	.4byte	.LASF605
	.byte	0x2
	.byte	0xbe
	.4byte	0x2e5d
	.byte	0x1
	.byte	0x1
	.uleb128 0x39
	.4byte	.LASF606
	.byte	0x9
	.byte	0xaa
	.4byte	0x1258
	.byte	0x1
	.byte	0x1
	.uleb128 0x39
	.4byte	.LASF607
	.byte	0xa
	.byte	0x2e
	.4byte	0xc2
	.byte	0x1
	.byte	0x1
	.uleb128 0x13
	.4byte	0xcd
	.4byte	0x2ea4
	.uleb128 0x14
	.4byte	0xad
	.byte	0x1
	.byte	0x0
	.uleb128 0x39
	.4byte	.LASF608
	.byte	0xa
	.byte	0x2f
	.4byte	0x2e94
	.byte	0x1
	.byte	0x1
	.uleb128 0x37
	.ascii	"PPU\000"
	.byte	0xa
	.2byte	0x104
	.4byte	0x1c44
	.byte	0x1
	.byte	0x1
	.uleb128 0x36
	.4byte	.LASF609
	.byte	0xa
	.2byte	0x106
	.4byte	0x1971
	.byte	0x1
	.byte	0x1
	.uleb128 0x38
	.ascii	"SA1\000"
	.byte	0xc
	.byte	0x63
	.4byte	0x21af
	.byte	0x1
	.byte	0x1
	.uleb128 0x39
	.4byte	.LASF610
	.byte	0xd
	.byte	0x36
	.4byte	0xcd
	.byte	0x1
	.byte	0x1
	.uleb128 0x3a
	.4byte	.LASF611
	.byte	0x1
	.byte	0x6e
	.4byte	0x2d9f
	.byte	0x5
	.byte	0x3
	.4byte	_ZL4wave
	.uleb128 0x39
	.4byte	.LASF612
	.byte	0x1
	.byte	0x72
	.4byte	0x2d9f
	.byte	0x1
	.byte	0x1
	.uleb128 0x38
	.ascii	"Z\000"
	.byte	0x1
	.byte	0x75
	.4byte	0xe05
	.byte	0x1
	.byte	0x1
	.uleb128 0x13
	.4byte	0xe05
	.4byte	0x2f20
	.uleb128 0x14
	.4byte	0xad
	.byte	0xf
	.byte	0x0
	.uleb128 0x36
	.4byte	.LASF613
	.byte	0x1
	.2byte	0x4ba
	.4byte	0x2f10
	.byte	0x1
	.byte	0x1
	.uleb128 0x13
	.4byte	0xe05
	.4byte	0x2f3e
	.uleb128 0x14
	.4byte	0xad
	.byte	0x7
	.byte	0x0
	.uleb128 0x36
	.4byte	.LASF614
	.byte	0x1
	.2byte	0x4bb
	.4byte	0x2f2e
	.byte	0x1
	.byte	0x1
	.uleb128 0x13
	.4byte	0xe05
	.4byte	0x2f5c
	.uleb128 0x14
	.4byte	0xad
	.byte	0x1f
	.byte	0x0
	.uleb128 0x36
	.4byte	.LASF615
	.byte	0x1
	.2byte	0x4bc
	.4byte	0x2f4c
	.byte	0x1
	.byte	0x1
	.uleb128 0x36
	.4byte	.LASF616
	.byte	0x1
	.2byte	0x4bd
	.4byte	0x2f4c
	.byte	0x1
	.byte	0x1
	.uleb128 0x36
	.4byte	.LASF617
	.byte	0x1
	.2byte	0x4be
	.4byte	0x2f4c
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
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x14
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
	.uleb128 0x28
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0x0
	.byte	0x0
	.uleb128 0x1a
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
	.uleb128 0x24
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
	.uleb128 0x25
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x26
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
	.uleb128 0x27
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
	.uleb128 0x28
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
	.uleb128 0x29
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
	.uleb128 0x5
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
	.uleb128 0x2c
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x2d
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
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x30
	.uleb128 0xa
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x11
	.uleb128 0x1
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
	.uleb128 0x35
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
	.uleb128 0x36
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
	.uleb128 0x37
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
	.uleb128 0x38
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
	.byte	0x0
	.section	.debug_pubnames,"",%progbits
	.4byte	0xe7
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x2f87
	.4byte	0x25e0
	.ascii	"S9xSetEchoDelay\000"
	.4byte	0x260b
	.ascii	"S9xSetSoundKeyOff\000"
	.4byte	0x264d
	.ascii	"S9xFixSoundAfterSnapshotLoad\000"
	.4byte	0x2680
	.ascii	"S9xSetEnvelopeHeight\000"
	.4byte	0x26d0
	.ascii	"S9xSetSoundSample\000"
	.4byte	0x2a2d
	.ascii	"S9xMixSamples\000"
	.4byte	0x2a65
	.ascii	"S9xMixSamplesO\000"
	.4byte	0x2c0d
	.ascii	"S9xResetSound\000"
	.4byte	0x2c51
	.ascii	"S9xSetPlaybackRate\000"
	.4byte	0x2cdf
	.ascii	"S9xInitSound\000"
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
	.4byte	.LBB28-.Ltext0
	.4byte	.LBE28-.Ltext0
	.4byte	.LBB31-.Ltext0
	.4byte	.LBE31-.Ltext0
	.4byte	0x0
	.4byte	0x0
	.4byte	.LBB32-.Ltext0
	.4byte	.LBE32-.Ltext0
	.4byte	.LBB35-.Ltext0
	.4byte	.LBE35-.Ltext0
	.4byte	0x0
	.4byte	0x0
	.section	.debug_str,"MS",%progbits,1
.LASF497:
	.ascii	"Mode7HFlip\000"
.LASF559:
	.ascii	"level\000"
.LASF135:
	.ascii	"Mode7Interpolate\000"
.LASF304:
	.ascii	"ROMType\000"
.LASF229:
	.ascii	"previous\000"
.LASF162:
	.ascii	"SDD1Pack\000"
.LASF220:
	.ascii	"last_block\000"
.LASF414:
	.ascii	"TileCached\000"
.LASF63:
	.ascii	"APUEnabled\000"
.LASF79:
	.ascii	"JoystickEnabled\000"
.LASF245:
	.ascii	"echo_feedback\000"
.LASF386:
	.ascii	"_ZN7CMemory12KartContentsEv\000"
.LASF539:
	.ascii	"S9xSetEchoEnable\000"
.LASF120:
	.ascii	"SoundBufferSize\000"
.LASF406:
	.ascii	"RenderThisFrame\000"
.LASF525:
	.ascii	"Waiting\000"
.LASF486:
	.ascii	"OBJThroughSub\000"
.LASF329:
	.ascii	"_ZN7CMemory7InitROMEh\000"
.LASF510:
	.ascii	"RecomputeClipWindows\000"
.LASF17:
	.ascii	"int64\000"
.LASF435:
	.ascii	"HFlip\000"
.LASF405:
	.ascii	"OBJChanged\000"
.LASF16:
	.ascii	"uint32\000"
.LASF490:
	.ascii	"OAMReadFlip\000"
.LASF568:
	.ascii	"prev0\000"
.LASF450:
	.ascii	"BGMode\000"
.LASF421:
	.ascii	"Blue\000"
.LASF477:
	.ascii	"FixedColourRed\000"
.LASF172:
	.ascii	"SOUND_SUSTAIN\000"
.LASF463:
	.ascii	"VBeamPosLatched\000"
.LASF408:
	.ascii	"FrameCount\000"
.LASF624:
	.ascii	"S9xInitSound\000"
.LASF418:
	.ascii	"RenderedScreenHeight\000"
.LASF524:
	.ascii	"Executing\000"
.LASF315:
	.ascii	"SDD1LoggedDataCountPrev\000"
.LASF324:
	.ascii	"_ZN7CMemory8SaveSRAMEPKc\000"
.LASF264:
	.ascii	"ShadowRAM\000"
.LASF298:
	.ascii	"BlockIsRAM\000"
.LASF154:
	.ascii	"StrikeGunnerOffsetHack\000"
.LASF195:
	.ascii	"state\000"
.LASF211:
	.ascii	"decay_rate\000"
.LASF347:
	.ascii	"SRAM512KLoROMMap\000"
.LASF80:
	.ascii	"ForcePAL\000"
.LASF321:
	.ascii	"_ZN7CMemory7LoadROMEPKc\000"
.LASF96:
	.ascii	"ForceNoDSP1\000"
.LASF337:
	.ascii	"MapRAM\000"
.LASF209:
	.ascii	"direction\000"
.LASF68:
	.ascii	"CyclesPercentage\000"
.LASF88:
	.ascii	"ForceHeader\000"
.LASF43:
	.ascii	"InDMA\000"
.LASF196:
	.ascii	"type\000"
.LASF554:
	.ascii	"_Z17S9xSetSoundKeyOffi\000"
.LASF538:
	.ascii	"target\000"
.LASF356:
	.ascii	"_ZN7CMemory13SuperFXROMMapEv\000"
.LASF36:
	.ascii	"MemSpeed\000"
.LASF40:
	.ascii	"NMITriggerPoint\000"
.LASF271:
	.ascii	"OneCycle\000"
.LASF257:
	.ascii	"YAndA\000"
.LASF253:
	.ascii	"master_volume\000"
.LASF174:
	.ascii	"SOUND_GAIN\000"
.LASF116:
	.ascii	"TraceSoundDSP\000"
.LASF430:
	.ascii	"SOBJ\000"
.LASF29:
	.ascii	"Cycles\000"
.LASF104:
	.ascii	"Mouse\000"
.LASF379:
	.ascii	"StaticRAMSize\000"
.LASF295:
	.ascii	"SRAMSize\000"
.LASF186:
	.ascii	"MODE_DECREASE_EXPONENTIAL\000"
.LASF570:
	.ascii	"MixStereo\000"
.LASF382:
	.ascii	"_ZN7CMemory7MapTypeEv\000"
.LASF576:
	.ascii	"stereo_exit\000"
.LASF412:
	.ascii	"FrameSkip\000"
.LASF89:
	.ascii	"ForceNoHeader\000"
.LASF373:
	.ascii	"CheckForIPSPatch\000"
.LASF398:
	.ascii	"Right\000"
.LASF358:
	.ascii	"_ZN7CMemory11TalesROMMapEh\000"
.LASF284:
	.ascii	"TimerTarget\000"
.LASF105:
	.ascii	"SuperScope\000"
.LASF125:
	.ascii	"DisableMasterVolume\000"
.LASF355:
	.ascii	"SuperFXROMMap\000"
.LASF132:
	.ascii	"SixteenBit\000"
.LASF155:
	.ascii	"ChuckRock\000"
.LASF560:
	.ascii	"S9xSetSoundSample\000"
.LASF87:
	.ascii	"ForceHiROM\000"
.LASF85:
	.ascii	"SkipFrames\000"
.LASF3:
	.ascii	"long int\000"
.LASF291:
	.ascii	"C4RAM\000"
.LASF349:
	.ascii	"SRAM1024KLoROMMap\000"
.LASF101:
	.ascii	"ForceSDD1\000"
.LASF530:
	.ascii	"VirtualBitmapFormat\000"
.LASF48:
	.ascii	"TriedInterleavedMode2\000"
.LASF448:
	.ascii	"NameBase\000"
.LASF622:
	.ascii	"CMemory\000"
.LASF440:
	.ascii	"Increment\000"
.LASF66:
	.ascii	"H_Max\000"
.LASF416:
	.ascii	"LatchedInterlace\000"
.LASF207:
	.ascii	"env_error\000"
.LASF561:
	.ascii	"_Z17S9xSetSoundSampleit\000"
.LASF233:
	.ascii	"dummy1\000"
.LASF436:
	.ascii	"Priority\000"
.LASF248:
	.ascii	"echo_write_enabled\000"
.LASF254:
	.ascii	"echo_volume\000"
.LASF429:
	.ascii	"Clip\000"
.LASF565:
	.ascii	"shift\000"
.LASF511:
	.ascii	"CGFLIPRead\000"
.LASF366:
	.ascii	"_ZN7CMemory8AllASCIIEPhi\000"
.LASF157:
	.ascii	"WinterGold\000"
.LASF176:
	.ascii	"SOUND_INCREASE_BENT_LINE\000"
.LASF59:
	.ascii	"_PALMSOS_R9\000"
.LASF214:
	.ascii	"sustain_level\000"
.LASF261:
	.ascii	"Address\000"
.LASF35:
	.ascii	"V_Counter\000"
.LASF194:
	.ascii	"Channel\000"
.LASF496:
	.ascii	"BGMosaic\000"
.LASF387:
	.ascii	"Size\000"
.LASF402:
	.ascii	"HDMAStarted\000"
.LASF287:
	.ascii	"VRAM\000"
.LASF523:
	.ascii	"ShiftedDB\000"
.LASF159:
	.ascii	"WrestlemaniaArcade\000"
.LASF13:
	.ascii	"signed char\000"
.LASF457:
	.ascii	"OAMPriorityRotation\000"
.LASF397:
	.ascii	"Left\000"
.LASF458:
	.ascii	"OAMAddr\000"
.LASF536:
	.ascii	"S9xSetEnvRate\000"
.LASF313:
	.ascii	"SDD1Data\000"
.LASF109:
	.ascii	"MultiPlayer5Master\000"
.LASF623:
	.ascii	"S9xGetSampleAddress\000"
.LASF27:
	.ascii	"WaitingForInterrupt\000"
.LASF365:
	.ascii	"AllASCII\000"
.LASF574:
	.ascii	"step\000"
.LASF552:
	.ascii	"S9xSetSoundKeyOff\000"
.LASF107:
	.ascii	"ControllerOption\000"
.LASF44:
	.ascii	"WhichEvent\000"
.LASF603:
	.ascii	"IncreaseERate\000"
.LASF5:
	.ascii	"unsigned char\000"
.LASF237:
	.ascii	"last_valid_header\000"
.LASF513:
	.ascii	"Need16x8Mulitply\000"
.LASF404:
	.ascii	"LatchedBlanking\000"
.LASF327:
	.ascii	"InitROM\000"
.LASF439:
	.ascii	"High\000"
.LASF340:
	.ascii	"_ZN7CMemory11MapExtraRAMEv\000"
.LASF102:
	.ascii	"ForceNoSDD1\000"
.LASF447:
	.ascii	"BGSize\000"
.LASF75:
	.ascii	"TraceVRAM\000"
.LASF614:
	.ascii	"DecayRate\000"
.LASF294:
	.ascii	"SRAMMask\000"
.LASF165:
	.ascii	"SOUND_NOISE\000"
.LASF164:
	.ascii	"SOUND_SAMPLE\000"
.LASF557:
	.ascii	"S9xSetEnvelopeHeight\000"
.LASF317:
	.ascii	"SDD1LoggedData\000"
.LASF459:
	.ascii	"OAMFlip\000"
.LASF424:
	.ascii	"CurrentLine\000"
.LASF38:
	.ascii	"FastROMSpeed\000"
.LASF142:
	.ascii	"NetPlay\000"
.LASF544:
	.ascii	"value\000"
.LASF266:
	.ascii	"_Carry\000"
.LASF100:
	.ascii	"ForceNoC4\000"
.LASF23:
	.ascii	"Flags\000"
.LASF7:
	.ascii	"char\000"
.LASF492:
	.ascii	"VTimerEnabled\000"
.LASF342:
	.ascii	"_ZN7CMemory4SafeEPKc\000"
.LASF593:
	.ascii	"SoundData\000"
.LASF531:
	.ascii	"in_char_dma\000"
.LASF28:
	.ascii	"Regs\000"
.LASF190:
	.ascii	"mute_sound\000"
.LASF598:
	.ascii	"EchoBuffer\000"
.LASF115:
	.ascii	"SoundPlaybackRate\000"
.LASF308:
	.ascii	"CalculatedSize\000"
.LASF130:
	.ascii	"AltSampleDecode\000"
.LASF456:
	.ascii	"LastSprite\000"
.LASF620:
	.ascii	"Z:\\\\AntSnes\\\\snes9x_asm_optimized\000"
.LASF484:
	.ascii	"ForcedBlanking\000"
.LASF506:
	.ascii	"ClipWindow1Enable\000"
.LASF320:
	.ascii	"LoadSRAM\000"
.LASF246:
	.ascii	"echo_ptr\000"
.LASF106:
	.ascii	"SRTC\000"
.LASF280:
	.ascii	"ShowROM\000"
.LASF584:
	.ascii	"echo_vol_l\000"
.LASF600:
	.ascii	"AttackERate\000"
.LASF515:
	.ascii	"MouseSpeed\000"
.LASF605:
	.ascii	"KeyOffERate\000"
.LASF585:
	.ascii	"echo_vol_r\000"
.LASF566:
	.ascii	"sample1\000"
.LASF567:
	.ascii	"sample2\000"
.LASF519:
	.ascii	"S9xOpcodes\000"
.LASF199:
	.ascii	"hertz\000"
.LASF219:
	.ascii	"sample_number\000"
.LASF215:
	.ascii	"sample\000"
.LASF178:
	.ascii	"SOUND_DECREASE_EXPONENTIAL\000"
.LASF432:
	.ascii	"VPos\000"
.LASF239:
	.ascii	"SSoundData\000"
.LASF34:
	.ascii	"NextEvent\000"
.LASF93:
	.ascii	"ForceSuperFX\000"
.LASF296:
	.ascii	"WriteMap\000"
.LASF149:
	.ascii	"ApplyCheats\000"
.LASF616:
	.ascii	"IncreaseRate\000"
.LASF473:
	.ascii	"CentreY\000"
.LASF595:
	.ascii	"Echo\000"
.LASF597:
	.ascii	"FilterTaps\000"
.LASF502:
	.ascii	"Window2Left\000"
.LASF50:
	.ascii	"Memory_Map\000"
.LASF188:
	.ascii	"playback_rate\000"
.LASF244:
	.ascii	"echo_enable\000"
.LASF156:
	.ascii	"StarfoxHack\000"
.LASF30:
	.ascii	"PCBase\000"
.LASF270:
	.ascii	"Scanline\000"
.LASF259:
	.ascii	"SIAPU\000"
.LASF441:
	.ascii	"Mask1\000"
.LASF610:
	.ascii	"mem_check\000"
.LASF81:
	.ascii	"ForceNTSC\000"
.LASF179:
	.ascii	"MODE_NONE\000"
.LASF84:
	.ascii	"FrameTime\000"
.LASF122:
	.ascii	"SoundEnvelopeHeightReading\000"
.LASF392:
	.ascii	"_ZN7CMemory5ROMIDEv\000"
.LASF152:
	.ascii	"AutoMaxSkipFrames\000"
.LASF169:
	.ascii	"SOUND_SILENT\000"
.LASF331:
	.ascii	"FreeSDD1Data\000"
.LASF171:
	.ascii	"SOUND_DECAY\000"
.LASF312:
	.ascii	"SDD1Index\000"
.LASF173:
	.ascii	"SOUND_RELEASE\000"
.LASF71:
	.ascii	"ForcedPause\000"
.LASF537:
	.ascii	"rate\000"
.LASF374:
	.ascii	"_ZN7CMemory16CheckForIPSPatchEPKchRi\000"
.LASF139:
	.ascii	"ForceNoTransparency\000"
.LASF381:
	.ascii	"MapType\000"
.LASF213:
	.ascii	"release_rate\000"
.LASF479:
	.ascii	"FixedColourBlue\000"
.LASF425:
	.ascii	"Controller\000"
.LASF316:
	.ascii	"SDD1LoggedDataCount\000"
.LASF332:
	.ascii	"_ZN7CMemory12FreeSDD1DataEv\000"
.LASF549:
	.ascii	"S9xAPUSetEndX\000"
.LASF129:
	.ascii	"Mute\000"
.LASF612:
	.ascii	"MixBuffer\000"
.LASF369:
	.ascii	"ScoreLoROM\000"
.LASF290:
	.ascii	"FillRAM\000"
.LASF9:
	.ascii	"bool8\000"
.LASF468:
	.ascii	"MatrixA\000"
.LASF469:
	.ascii	"MatrixB\000"
.LASF442:
	.ascii	"FullGraphicCount\000"
.LASF471:
	.ascii	"MatrixD\000"
.LASF540:
	.ascii	"byte\000"
.LASF42:
	.ascii	"IRQCycleCount\000"
.LASF318:
	.ascii	"ROMFilename\000"
.LASF541:
	.ascii	"S9xSetEchoFeedback\000"
.LASF133:
	.ascii	"Transparency\000"
.LASF555:
	.ascii	"S9xFixSoundAfterSnapshotLoad\000"
.LASF238:
	.ascii	"long unsigned int\000"
.LASF305:
	.ascii	"ROMSize\000"
.LASF476:
	.ascii	"CGADD\000"
.LASF621:
	.ascii	"__va_list\000"
.LASF466:
	.ascii	"VBeamFlip\000"
.LASF57:
	.ascii	"APU_APUExecuting\000"
.LASF370:
	.ascii	"_ZN7CMemory10ScoreLoROMEh\000"
.LASF260:
	.ascii	"DirectPage\000"
.LASF451:
	.ascii	"BG3Priority\000"
.LASF480:
	.ascii	"SavedOAMAddr\000"
.LASF606:
	.ascii	"Memory\000"
.LASF378:
	.ascii	"_ZN7CMemory5SpeedEv\000"
.LASF181:
	.ascii	"MODE_RELEASE\000"
.LASF592:
	.ascii	"Settings\000"
.LASF547:
	.ascii	"channel\000"
.LASF45:
	.ascii	"SRAMModified\000"
.LASF19:
	.ascii	"__ap\000"
.LASF90:
	.ascii	"ForceInterleaved\000"
.LASF183:
	.ascii	"MODE_INCREASE_LINEAR\000"
.LASF572:
	.ascii	"freq0\000"
.LASF18:
	.ascii	"bool8_32\000"
.LASF388:
	.ascii	"_ZN7CMemory4SizeEv\000"
.LASF599:
	.ascii	"NoiseFreq\000"
.LASF231:
	.ascii	"env_ind_decay\000"
.LASF118:
	.ascii	"ReverseStereo\000"
.LASF437:
	.ascii	"Palette\000"
.LASF383:
	.ascii	"MapMode\000"
.LASF283:
	.ascii	"Timer\000"
.LASF83:
	.ascii	"FrameTimeNTSC\000"
.LASF297:
	.ascii	"MemorySpeed\000"
.LASF426:
	.ascii	"Joypads\000"
.LASF191:
	.ascii	"sound_switch\000"
.LASF336:
	.ascii	"_ZN7CMemory11FixROMSpeedEv\000"
.LASF556:
	.ascii	"_Z28S9xFixSoundAfterSnapshotLoadv\000"
.LASF276:
	.ascii	"_Zero\000"
.LASF581:
	.ascii	"sample_offset\000"
.LASF518:
	.ascii	"SSA1\000"
.LASF241:
	.ascii	"master_volume_right\000"
.LASF319:
	.ascii	"LoadROM\000"
.LASF516:
	.ascii	"SOpcodes\000"
.LASF128:
	.ascii	"ThreadSound\000"
.LASF420:
	.ascii	"Green\000"
.LASF151:
	.ascii	"TurboSkipFrames\000"
.LASF216:
	.ascii	"decoded\000"
.LASF514:
	.ascii	"Joypad3ButtonReadPos\000"
.LASF126:
	.ascii	"SoundSync\000"
.LASF268:
	.ascii	"pad0\000"
.LASF274:
	.ascii	"pad1\000"
.LASF275:
	.ascii	"pad2\000"
.LASF277:
	.ascii	"pad3\000"
.LASF242:
	.ascii	"echo_volume_left\000"
.LASF119:
	.ascii	"SixteenBitSound\000"
.LASF1:
	.ascii	"long long int\000"
.LASF8:
	.ascii	"va_list\000"
.LASF465:
	.ascii	"HBeamFlip\000"
.LASF307:
	.ascii	"HeaderCount\000"
.LASF41:
	.ascii	"NMICycleCount\000"
.LASF548:
	.ascii	"S9xAPUSetEndOfSample\000"
.LASF396:
	.ascii	"Count\000"
.LASF184:
	.ascii	"MODE_INCREASE_BENT_LINE\000"
.LASF455:
	.ascii	"FirstSprite\000"
.LASF529:
	.ascii	"overflow\000"
.LASF189:
	.ascii	"stereo\000"
.LASF112:
	.ascii	"SuperFX\000"
.LASF103:
	.ascii	"MultiPlayer5\000"
.LASF325:
	.ascii	"Init\000"
.LASF217:
	.ascii	"previous16\000"
.LASF596:
	.ascii	"Loop\000"
.LASF410:
	.ascii	"DisplayedRenderedFrameCount\000"
.LASF588:
	.ascii	"S9xSetPlaybackRate\000"
.LASF228:
	.ascii	"interpolate\000"
.LASF282:
	.ascii	"OutPorts\000"
.LASF91:
	.ascii	"ForceInterleaved2\000"
.LASF299:
	.ascii	"BlockIsROM\000"
.LASF124:
	.ascii	"DisableSampleCaching\000"
.LASF333:
	.ascii	"WriteProtectROM\000"
.LASF415:
	.ascii	"FirstVRAMRead\000"
.LASF314:
	.ascii	"SDD1Entries\000"
.LASF586:
	.ascii	"S9xResetSound\000"
.LASF235:
	.ascii	"gaussian\000"
.LASF200:
	.ascii	"frequency\000"
.LASF185:
	.ascii	"MODE_DECREASE_LINEAR\000"
.LASF24:
	.ascii	"BranchSkip\000"
.LASF99:
	.ascii	"ForceC4\000"
.LASF201:
	.ascii	"count\000"
.LASF545:
	.ascii	"addr\000"
.LASF353:
	.ascii	"HiROMMap\000"
.LASF69:
	.ascii	"DisableIRQ\000"
.LASF20:
	.ascii	"<anonymous struct>\000"
.LASF86:
	.ascii	"ForceLoROM\000"
.LASF37:
	.ascii	"MemSpeedx2\000"
.LASF521:
	.ascii	"CPUExecuting\000"
.LASF535:
	.ascii	"mute\000"
.LASF4:
	.ascii	"unsigned int\000"
.LASF158:
	.ascii	"Dezaemon\000"
.LASF249:
	.ascii	"echo_channel_enable\000"
.LASF533:
	.ascii	"sounduxmemset32\000"
.LASF423:
	.ascii	"PreviousLine\000"
.LASF504:
	.ascii	"ClipCounts\000"
.LASF117:
	.ascii	"Stereo\000"
.LASF78:
	.ascii	"SwapJoypads\000"
.LASF136:
	.ascii	"BGLayering\000"
.LASF534:
	.ascii	"S9xSetSoundMute\000"
.LASF138:
	.ascii	"ForceTransparency\000"
.LASF55:
	.ascii	"Memory_BWRAM\000"
.LASF108:
	.ascii	"ShutdownMaster\000"
.LASF293:
	.ascii	"LoROM\000"
.LASF395:
	.ascii	"ClipData\000"
.LASF522:
	.ascii	"ShiftedPB\000"
.LASF527:
	.ascii	"WaitByteAddress2\000"
.LASF489:
	.ascii	"OBJAddition\000"
.LASF344:
	.ascii	"_ZN7CMemory8LoROMMapEv\000"
.LASF512:
	.ascii	"OBJNameSelect\000"
.LASF499:
	.ascii	"Mode7Repeat\000"
.LASF345:
	.ascii	"LoROM24MBSMap\000"
.LASF72:
	.ascii	"StopEmulation\000"
.LASF292:
	.ascii	"HiROM\000"
.LASF359:
	.ascii	"AlphaROMMap\000"
.LASF218:
	.ascii	"block\000"
.LASF467:
	.ascii	"HVBeamCounterLatched\000"
.LASF444:
	.ascii	"SCBase\000"
.LASF255:
	.ascii	"noise_hertz\000"
.LASF375:
	.ascii	"TVStandard\000"
.LASF150:
	.ascii	"TurboMode\000"
.LASF121:
	.ascii	"SoundMixInterval\000"
.LASF419:
	.ascii	"RenderedScreenWidth\000"
.LASF31:
	.ascii	"PCAtOpcodeStart\000"
.LASF613:
	.ascii	"AttackRate\000"
.LASF520:
	.ascii	"_Negative\000"
.LASF306:
	.ascii	"ROMFramesPerSecond\000"
.LASF70:
	.ascii	"Paused\000"
.LASF483:
	.ascii	"BG_Forced\000"
.LASF341:
	.ascii	"Safe\000"
.LASF604:
	.ascii	"DecreaseERateExp\000"
.LASF163:
	.ascii	"GfxLayerMask\000"
.LASF433:
	.ascii	"Name\000"
.LASF400:
	.ascii	"ColorsChanged\000"
.LASF491:
	.ascii	"OAMData\000"
.LASF145:
	.ascii	"Port\000"
.LASF431:
	.ascii	"HPos\000"
.LASF553:
	.ascii	"_Z15S9xSetEchoDelayi\000"
.LASF166:
	.ascii	"SOUND_EXTRA_NOISE\000"
.LASF113:
	.ascii	"DSP1Master\000"
.LASF94:
	.ascii	"ForceNoSuperFX\000"
.LASF446:
	.ascii	"HOffset\000"
.LASF346:
	.ascii	"_ZN7CMemory13LoROM24MBSMapEv\000"
.LASF485:
	.ascii	"OBJThroughMain\000"
.LASF144:
	.ascii	"ServerName\000"
.LASF240:
	.ascii	"master_volume_left\000"
.LASF393:
	.ascii	"CompanyID\000"
.LASF56:
	.ascii	"Memory_SRAMMask\000"
.LASF256:
	.ascii	"mypair\000"
.LASF198:
	.ascii	"volume_right\000"
.LASF205:
	.ascii	"right_vol_level\000"
.LASF21:
	.ascii	"SRegisters\000"
.LASF73:
	.ascii	"TraceDMA\000"
.LASF348:
	.ascii	"_ZN7CMemory16SRAM512KLoROMMapEv\000"
.LASF97:
	.ascii	"ForceSA1\000"
.LASF569:
	.ascii	"prev1\000"
.LASF302:
	.ascii	"CompanyId\000"
.LASF445:
	.ascii	"VOffset\000"
.LASF334:
	.ascii	"_ZN7CMemory15WriteProtectROMEv\000"
.LASF601:
	.ascii	"DecayERate\000"
.LASF309:
	.ascii	"CalculatedChecksum\000"
.LASF288:
	.ascii	"SRAM\000"
.LASF578:
	.ascii	"S9xMixSamples\000"
.LASF363:
	.ascii	"BSHiROMMap\000"
.LASF461:
	.ascii	"IRQVBeamPos\000"
.LASF202:
	.ascii	"loop\000"
.LASF223:
	.ascii	"sample_pointer\000"
.LASF350:
	.ascii	"_ZN7CMemory17SRAM1024KLoROMMapEv\000"
.LASF376:
	.ascii	"_ZN7CMemory10TVStandardEv\000"
.LASF417:
	.ascii	"DoubleWidthPixels\000"
.LASF47:
	.ascii	"_ARM_asm_reserved_1\000"
.LASF2:
	.ascii	"long long unsigned int\000"
.LASF401:
	.ascii	"HDMA\000"
.LASF577:
	.ascii	"mono_exit\000"
.LASF311:
	.ascii	"ROMComplementChecksum\000"
.LASF594:
	.ascii	"IAPU\000"
.LASF252:
	.ascii	"no_filter\000"
.LASF243:
	.ascii	"echo_volume_right\000"
.LASF250:
	.ascii	"pitch_mod\000"
.LASF281:
	.ascii	"KeyedChannels\000"
.LASF427:
	.ascii	"PrevMouseX\000"
.LASF428:
	.ascii	"PrevMouseY\000"
.LASF26:
	.ascii	"IRQActive\000"
.LASF273:
	.ascii	"asmJumpTab\000"
.LASF64:
	.ascii	"Shutdown\000"
.LASF475:
	.ascii	"Joypad2ButtonReadPos\000"
.LASF482:
	.ascii	"WRAM\000"
.LASF251:
	.ascii	"channels\000"
.LASF607:
	.ascii	"GetBank\000"
.LASF528:
	.ascii	"arithmetic_op\000"
.LASF505:
	.ascii	"ClipWindowOverlapLogic\000"
.LASF609:
	.ascii	"IPPU\000"
.LASF131:
	.ascii	"FixFrequency\000"
.LASF460:
	.ascii	"OAMTileAddress\000"
.LASF60:
	.ascii	"_PALMSOS_R10\000"
.LASF508:
	.ascii	"ClipWindow1Inside\000"
.LASF53:
	.ascii	"Memory_BlockIsRAM\000"
.LASF301:
	.ascii	"ROMId\000"
.LASF462:
	.ascii	"IRQHBeamPos\000"
.LASF232:
	.ascii	"env_ind_sustain\000"
.LASF411:
	.ascii	"SkippedFrames\000"
.LASF384:
	.ascii	"_ZN7CMemory7MapModeEv\000"
.LASF608:
	.ascii	"SignExtend\000"
.LASF74:
	.ascii	"TraceHDMA\000"
.LASF272:
	.ascii	"TwoCycles\000"
.LASF580:
	.ascii	"S9xMixSamplesO\000"
.LASF589:
	.ascii	"_Z13S9xResetSoundh\000"
.LASF258:
	.ascii	"_padder\000"
.LASF22:
	.ascii	"SCPUState\000"
.LASF51:
	.ascii	"Memory_WriteMap\000"
.LASF180:
	.ascii	"MODE_ADSR\000"
.LASF222:
	.ascii	"block_pointer\000"
.LASF111:
	.ascii	"MouseMaster\000"
.LASF61:
	.ascii	"APU_Cycles\000"
.LASF279:
	.ascii	"SAPU\000"
.LASF507:
	.ascii	"ClipWindow2Enable\000"
.LASF488:
	.ascii	"OBJNameBase\000"
.LASF619:
	.ascii	"Z:/AntSnes/snes9x_asm_optimized/soundux.cpp\000"
.LASF591:
	.ascii	"steps\000"
.LASF394:
	.ascii	"_ZN7CMemory9CompanyIDEv\000"
.LASF360:
	.ascii	"_ZN7CMemory11AlphaROMMapEv\000"
.LASF543:
	.ascii	"S9xSetFilterCoefficient\000"
.LASF224:
	.ascii	"echo_buf_ptr\000"
.LASF481:
	.ascii	"ScreenHeight\000"
.LASF323:
	.ascii	"SaveSRAM\000"
.LASF587:
	.ascii	"full\000"
.LASF49:
	.ascii	"_ARM_asm_padding1\000"
.LASF58:
	.ascii	"_ARM_asm_padding2\000"
.LASF203:
	.ascii	"envx\000"
.LASF372:
	.ascii	"_ZN7CMemory13ApplyROMFixesEv\000"
.LASF110:
	.ascii	"SuperScopeMaster\000"
.LASF391:
	.ascii	"ROMID\000"
.LASF438:
	.ascii	"SPPU\000"
.LASF495:
	.ascii	"Mosaic\000"
.LASF509:
	.ascii	"ClipWindow2Inside\000"
.LASF234:
	.ascii	"dummy\000"
.LASF167:
	.ascii	"SOUND_MUTE\000"
.LASF227:
	.ascii	"next_sample\000"
.LASF503:
	.ascii	"Window2Right\000"
.LASF546:
	.ascii	"S9xSetSoundFrequency\000"
.LASF285:
	.ascii	"TimerEnabled\000"
.LASF62:
	.ascii	"SSettings\000"
.LASF32:
	.ascii	"WaitAddress\000"
.LASF265:
	.ascii	"CachedSamples\000"
.LASF175:
	.ascii	"SOUND_INCREASE_LINEAR\000"
.LASF493:
	.ascii	"HTimerEnabled\000"
.LASF380:
	.ascii	"_ZN7CMemory13StaticRAMSizeEv\000"
.LASF134:
	.ascii	"SupportHiRes\000"
.LASF210:
	.ascii	"attack_rate\000"
.LASF579:
	.ascii	"buffer\000"
.LASF10:
	.ascii	"uint8\000"
.LASF46:
	.ascii	"BRKTriggered\000"
.LASF443:
	.ascii	"Shift\000"
.LASF226:
	.ascii	"envxx\000"
.LASF617:
	.ascii	"DecreaseRateExp\000"
.LASF6:
	.ascii	"short int\000"
.LASF550:
	.ascii	"delay\000"
.LASF92:
	.ascii	"ForceNotInterleaved\000"
.LASF470:
	.ascii	"MatrixC\000"
.LASF39:
	.ascii	"AutoSaveTimer\000"
.LASF542:
	.ascii	"feedback\000"
.LASF225:
	.ascii	"mode\000"
.LASF453:
	.ascii	"CGFLIP\000"
.LASF551:
	.ascii	"S9xSetEchoDelay\000"
.LASF170:
	.ascii	"SOUND_ATTACK\000"
.LASF278:
	.ascii	"ExtraRAM\000"
.LASF147:
	.ascii	"OpenGLEnable\000"
.LASF472:
	.ascii	"CentreX\000"
.LASF286:
	.ascii	"TimerValueWritten\000"
.LASF146:
	.ascii	"GlideEnable\000"
.LASF338:
	.ascii	"_ZN7CMemory6MapRAMEv\000"
.LASF389:
	.ascii	"Headers\000"
.LASF494:
	.ascii	"HTimerPosition\000"
.LASF602:
	.ascii	"SustainERate\000"
.LASF498:
	.ascii	"Mode7VFlip\000"
.LASF326:
	.ascii	"_ZN7CMemory4InitEv\000"
.LASF182:
	.ascii	"MODE_GAIN\000"
.LASF140:
	.ascii	"DisableHDMA\000"
.LASF413:
	.ascii	"TileCache\000"
.LASF330:
	.ascii	"_ZN7CMemory6DeinitEv\000"
.LASF247:
	.ascii	"echo_buffer_size\000"
.LASF385:
	.ascii	"KartContents\000"
.LASF328:
	.ascii	"Deinit\000"
.LASF300:
	.ascii	"ROMName\000"
.LASF212:
	.ascii	"sustain_rate\000"
.LASF137:
	.ascii	"DisableGraphicWindows\000"
.LASF478:
	.ascii	"FixedColourGreen\000"
.LASF269:
	.ascii	"TimerErrorCounter\000"
.LASF590:
	.ascii	"_Z18S9xSetPlaybackRatej\000"
.LASF76:
	.ascii	"TraceUnknownRegisters\000"
.LASF564:
	.ascii	"filter\000"
.LASF310:
	.ascii	"ROMChecksum\000"
.LASF407:
	.ascii	"DirectColourMapsNeedRebuild\000"
.LASF33:
	.ascii	"WaitCounter\000"
.LASF236:
	.ascii	"g_index\000"
.LASF343:
	.ascii	"LoROMMap\000"
.LASF77:
	.ascii	"TraceDSP\000"
.LASF143:
	.ascii	"NetPlayServer\000"
.LASF434:
	.ascii	"VFlip\000"
.LASF267:
	.ascii	"_Overflow\000"
.LASF14:
	.ascii	"int16\000"
.LASF368:
	.ascii	"_ZN7CMemory10ScoreHiROMEh\000"
.LASF409:
	.ascii	"RenderedFramesCount\000"
.LASF123:
	.ascii	"DisableSoundEcho\000"
.LASF339:
	.ascii	"MapExtraRAM\000"
.LASF377:
	.ascii	"Speed\000"
.LASF571:
	.ascii	"sample_count\000"
.LASF575:
	.ascii	"MixMono\000"
.LASF517:
	.ascii	"S9xOpcode\000"
.LASF335:
	.ascii	"FixROMSpeed\000"
.LASF357:
	.ascii	"TalesROMMap\000"
.LASF352:
	.ascii	"_ZN7CMemory19SufamiTurboLoROMMapEv\000"
.LASF361:
	.ascii	"SA1ROMMap\000"
.LASF206:
	.ascii	"envx_target\000"
.LASF177:
	.ascii	"SOUND_DECREASE_LINEAR\000"
.LASF501:
	.ascii	"Window1Right\000"
.LASF500:
	.ascii	"Window1Left\000"
.LASF168:
	.ascii	"<anonymous enum>\000"
.LASF452:
	.ascii	"Brightness\000"
.LASF487:
	.ascii	"OBJSizeSelect\000"
.LASF464:
	.ascii	"HBeamPosLatched\000"
.LASF322:
	.ascii	"_ZN7CMemory8LoadSRAMEPKc\000"
.LASF208:
	.ascii	"erate\000"
.LASF161:
	.ascii	"APURAMInitialValue\000"
.LASF25:
	.ascii	"NMIActive\000"
.LASF303:
	.ascii	"ROMSpeed\000"
.LASF65:
	.ascii	"SoundSkipMethod\000"
.LASF54:
	.ascii	"Memory_SRAM\000"
.LASF351:
	.ascii	"SufamiTurboLoROMMap\000"
.LASF230:
	.ascii	"env_ind_attack\000"
.LASF403:
	.ascii	"MaxBrightness\000"
.LASF371:
	.ascii	"ApplyROMFixes\000"
.LASF127:
	.ascii	"InterpolatedSound\000"
.LASF52:
	.ascii	"Memory_MemorySpeed\000"
.LASF558:
	.ascii	"_Z20S9xSetEnvelopeHeightii\000"
.LASF573:
	.ascii	"freq\000"
.LASF12:
	.ascii	"short unsigned int\000"
.LASF532:
	.ascii	"variable_bit_pos\000"
.LASF204:
	.ascii	"left_vol_level\000"
.LASF364:
	.ascii	"_ZN7CMemory10BSHiROMMapEv\000"
.LASF399:
	.ascii	"InternalPPU\000"
.LASF141:
	.ascii	"DisplayFrameRate\000"
.LASF15:
	.ascii	"int32\000"
.LASF422:
	.ascii	"ScreenColors\000"
.LASF114:
	.ascii	"SDD1\000"
.LASF474:
	.ascii	"Joypad1ButtonReadPos\000"
.LASF67:
	.ascii	"HBlankStart\000"
.LASF449:
	.ascii	"SCSize\000"
.LASF197:
	.ascii	"volume_left\000"
.LASF454:
	.ascii	"CGDATA\000"
.LASF148:
	.ascii	"AutoSaveDelay\000"
.LASF153:
	.ascii	"os9x_hack\000"
.LASF618:
	.ascii	"GNU C++ 4.4.1\000"
.LASF582:
	.ascii	"master_vol_l\000"
.LASF611:
	.ascii	"wave\000"
.LASF583:
	.ascii	"master_vol_r\000"
.LASF526:
	.ascii	"WaitByteAddress1\000"
.LASF221:
	.ascii	"needs_decode\000"
.LASF98:
	.ascii	"ForceNoSA1\000"
.LASF160:
	.ascii	"DaffyDuck\000"
.LASF390:
	.ascii	"_ZN7CMemory7HeadersEv\000"
.LASF563:
	.ascii	"compressed\000"
.LASF193:
	.ascii	"freqbase\000"
.LASF615:
	.ascii	"SustainRate\000"
.LASF367:
	.ascii	"ScoreHiROM\000"
.LASF11:
	.ascii	"uint16\000"
.LASF289:
	.ascii	"BWRAM\000"
.LASF562:
	.ascii	"DecodeBlock\000"
.LASF0:
	.ascii	"wchar_t\000"
.LASF262:
	.ascii	"WaitAddress1\000"
.LASF263:
	.ascii	"WaitAddress2\000"
.LASF362:
	.ascii	"_ZN7CMemory9SA1ROMMapEv\000"
.LASF192:
	.ascii	"noise_gen\000"
.LASF354:
	.ascii	"_ZN7CMemory8HiROMMapEv\000"
.LASF187:
	.ascii	"SoundStatus\000"
.LASF95:
	.ascii	"ForceDSP1\000"
.LASF82:
	.ascii	"FrameTimePAL\000"
	.ident	"GCC: (Symbian ADT Sourcery G++ Lite 4.4-172) 4.4.1"
