	.arch armv7-a
	.eabi_attribute 27, 3
	.eabi_attribute 28, 1
	.fpu neon
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 18, 4
	.file	"spc700.cpp"
	.text
	.align	2
	.global	S9xAPUGetByteZ
	.type	S9xAPUGetByteZ, %function
S9xAPUGetByteZ:
	.fnstart
.LFB28:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	.pad #16
	sub	sp, sp, #16
	mov	r3, r0
	strb	r3, [fp, #-13]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #239
	bls	.L2
	movw	r3, #:lower16:IAPU
	movt	r3, #:upper16:IAPU
	ldr	r2, [r3, #0]
	movw	r3, #:lower16:IAPU
	movt	r3, #:upper16:IAPU
	ldr	r3, [r3, #68]
	cmp	r2, r3
	bne	.L2
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #243
	bls	.L3
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #247
	bhi	.L3
	movw	r3, #:lower16:IAPU
	movt	r3, #:upper16:IAPU
	ldr	r2, [r3, #68]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	b	.L4
.L3:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #252
	bls	.L5
	movw	r3, #:lower16:IAPU
	movt	r3, #:upper16:IAPU
	ldr	r2, [r3, #68]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	add	r3, r2, r3
	ldrb	r3, [r3, #0]
	strb	r3, [fp, #-5]
	movw	r3, #:lower16:IAPU
	movt	r3, #:upper16:IAPU
	ldr	r2, [r3, #68]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	add	r3, r2, r3
	mov	r2, #0
	strb	r2, [r3, #0]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	b	.L4
.L5:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #243
	bne	.L6
	bl	S9xGetAPUDSP
	mov	r3, r0
	b	.L4
.L6:
	movw	r3, #:lower16:IAPU
	movt	r3, #:upper16:IAPU
	ldr	r2, [r3, #68]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	b	.L4
.L2:
	movw	r3, #:lower16:IAPU
	movt	r3, #:upper16:IAPU
	ldr	r2, [r3, #0]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
.L4:
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.fnend
	.size	S9xAPUGetByteZ, .-S9xAPUGetByteZ
	.align	2
	.global	S9xAPUSetByteZ
	.type	S9xAPUSetByteZ, %function
S9xAPUSetByteZ:
	.fnstart
.LFB29:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	.pad #8
	sub	sp, sp, #8
	mov	r2, r0
	mov	r3, r1
	strb	r2, [fp, #-5]
	strb	r3, [fp, #-6]
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	cmp	r3, #239
	bls	.L9
	movw	r3, #:lower16:IAPU
	movt	r3, #:upper16:IAPU
	ldr	r2, [r3, #0]
	movw	r3, #:lower16:IAPU
	movt	r3, #:upper16:IAPU
	ldr	r3, [r3, #68]
	cmp	r2, r3
	bne	.L9
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	cmp	r3, #243
	bne	.L10
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	mov	r0, r3
	bl	S9xSetAPUDSP
	b	.L16
.L10:
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	cmp	r3, #243
	bls	.L12
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	cmp	r3, #247
	bhi	.L12
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	sub	r1, r3, #244
	movw	r3, #:lower16:APU
	movt	r3, #:upper16:APU
	mov	r2, #7
	add	r3, r3, r1
	add	r3, r3, r2
	ldrb	r2, [fp, #-5]
	strb	r2, [r3, #0]
	mov	r0, r0	@ nop
	b	.L16
.L12:
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	cmp	r3, #241
	bne	.L13
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	mov	r0, r3
	bl	S9xSetAPUControl
	b	.L16
.L13:
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	cmp	r3, #252
	bhi	.L17
	movw	r3, #:lower16:IAPU
	movt	r3, #:upper16:IAPU
	ldr	r2, [r3, #68]
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	add	r3, r2, r3
	ldrb	r2, [fp, #-5]
	strb	r2, [r3, #0]
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	cmp	r3, #249
	bls	.L18
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L14
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	sub	r2, r3, #250
	movw	r3, #:lower16:APU
	movt	r3, #:upper16:APU
	add	r1, r2, #104
	mov	r2, #2
	mov	r1, r1, asl #1
	add	r3, r1, r3
	add	r3, r3, r2
	mov	r2, #256
	strh	r2, [r3, #0]	@ movhi
	b	.L16
.L14:
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	sub	r1, r3, #250
	ldrb	r2, [fp, #-5]	@ zero_extendqisi2
	movw	r3, #:lower16:APU
	movt	r3, #:upper16:APU
	add	r0, r1, #104
	mov	r1, #2
	mov	r0, r0, asl #1
	add	r3, r0, r3
	add	r3, r3, r1
	strh	r2, [r3, #0]	@ movhi
	b	.L16
.L9:
	movw	r3, #:lower16:IAPU
	movt	r3, #:upper16:IAPU
	ldr	r2, [r3, #0]
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	add	r3, r2, r3
	ldrb	r2, [fp, #-5]
	strb	r2, [r3, #0]
	b	.L16
.L17:
	mov	r0, r0	@ nop
	b	.L16
.L18:
	mov	r0, r0	@ nop
.L16:
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.fnend
	.size	S9xAPUSetByteZ, .-S9xAPUSetByteZ
	.align	2
	.global	S9xAPUGetByte
	.type	S9xAPUGetByte, %function
S9xAPUGetByte:
	.fnstart
.LFB30:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	.pad #16
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #255
	bhi	.L20
	ldr	r3, [fp, #-16]
	cmp	r3, #239
	bls	.L20
	ldr	r3, [fp, #-16]
	cmp	r3, #243
	bls	.L21
	ldr	r3, [fp, #-16]
	cmp	r3, #247
	bhi	.L21
	movw	r3, #:lower16:IAPU
	movt	r3, #:upper16:IAPU
	ldr	r2, [r3, #68]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	b	.L22
.L21:
	ldr	r3, [fp, #-16]
	cmp	r3, #243
	bne	.L23
	bl	S9xGetAPUDSP
	mov	r3, r0
	b	.L22
.L23:
	ldr	r3, [fp, #-16]
	cmp	r3, #252
	bls	.L24
	movw	r3, #:lower16:IAPU
	movt	r3, #:upper16:IAPU
	ldr	r2, [r3, #68]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]
	strb	r3, [fp, #-5]
	movw	r3, #:lower16:IAPU
	movt	r3, #:upper16:IAPU
	ldr	r2, [r3, #68]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	mov	r2, #0
	strb	r2, [r3, #0]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	b	.L22
.L24:
	movw	r3, #:lower16:IAPU
	movt	r3, #:upper16:IAPU
	ldr	r2, [r3, #68]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	b	.L22
.L20:
	movw	r3, #:lower16:IAPU
	movt	r3, #:upper16:IAPU
	ldr	r2, [r3, #68]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
.L22:
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.fnend
	.size	S9xAPUGetByte, .-S9xAPUGetByte
	.align	2
	.global	S9xAPUSetByte
	.type	S9xAPUSetByte, %function
S9xAPUSetByte:
	.fnstart
.LFB31:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	.pad #8
	sub	sp, sp, #8
	mov	r3, r0
	str	r1, [fp, #-12]
	strb	r3, [fp, #-5]
	ldr	r3, [fp, #-12]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	cmp	r3, #255
	bhi	.L27
	ldr	r3, [fp, #-12]
	cmp	r3, #239
	bls	.L27
	ldr	r3, [fp, #-12]
	cmp	r3, #243
	bne	.L28
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	mov	r0, r3
	bl	S9xSetAPUDSP
	b	.L35
.L28:
	ldr	r3, [fp, #-12]
	cmp	r3, #243
	bls	.L30
	ldr	r3, [fp, #-12]
	cmp	r3, #247
	bhi	.L30
	ldr	r3, [fp, #-12]
	sub	r1, r3, #244
	movw	r3, #:lower16:APU
	movt	r3, #:upper16:APU
	mov	r2, #7
	add	r3, r3, r1
	add	r3, r3, r2
	ldrb	r2, [fp, #-5]
	strb	r2, [r3, #0]
	mov	r0, r0	@ nop
	b	.L35
.L30:
	ldr	r3, [fp, #-12]
	cmp	r3, #241
	bne	.L31
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	mov	r0, r3
	bl	S9xSetAPUControl
	b	.L35
.L31:
	ldr	r3, [fp, #-12]
	cmp	r3, #252
	bhi	.L36
	movw	r3, #:lower16:IAPU
	movt	r3, #:upper16:IAPU
	ldr	r2, [r3, #68]
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	ldrb	r2, [fp, #-5]
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-12]
	cmp	r3, #249
	bls	.L37
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L32
	ldr	r3, [fp, #-12]
	sub	r2, r3, #250
	movw	r3, #:lower16:APU
	movt	r3, #:upper16:APU
	add	r1, r2, #104
	mov	r2, #2
	mov	r1, r1, asl #1
	add	r3, r1, r3
	add	r3, r3, r2
	mov	r2, #256
	strh	r2, [r3, #0]	@ movhi
	b	.L35
.L32:
	ldr	r3, [fp, #-12]
	sub	r1, r3, #250
	ldrb	r2, [fp, #-5]	@ zero_extendqisi2
	movw	r3, #:lower16:APU
	movt	r3, #:upper16:APU
	add	r0, r1, #104
	mov	r1, #2
	mov	r0, r0, asl #1
	add	r3, r0, r3
	add	r3, r3, r1
	strh	r2, [r3, #0]	@ movhi
	b	.L35
.L27:
	ldr	r2, [fp, #-12]
	movw	r3, #65471
	cmp	r2, r3
	bhi	.L34
	movw	r3, #:lower16:IAPU
	movt	r3, #:upper16:IAPU
	ldr	r2, [r3, #68]
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	ldrb	r2, [fp, #-5]
	strb	r2, [r3, #0]
	b	.L35
.L34:
	ldr	r3, [fp, #-12]
	sub	r2, r3, #65280
	sub	r2, r2, #192
	movw	r3, #:lower16:APU
	movt	r3, #:upper16:APU
	mov	r1, #136
	add	r3, r2, r3
	add	r3, r3, r1
	ldrb	r2, [fp, #-5]
	strb	r2, [r3, #3]
	movw	r3, #:lower16:APU
	movt	r3, #:upper16:APU
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L35
	movw	r3, #:lower16:IAPU
	movt	r3, #:upper16:IAPU
	ldr	r2, [r3, #68]
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	ldrb	r2, [fp, #-5]
	strb	r2, [r3, #0]
	b	.L35
.L36:
	mov	r0, r0	@ nop
	b	.L35
.L37:
	mov	r0, r0	@ nop
.L35:
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.fnend
	.size	S9xAPUSetByte, .-S9xAPUSetByte
	.ident	"GCC: (GNU) 4.4.1"
	.section	.note.GNU-stack,"",%progbits
