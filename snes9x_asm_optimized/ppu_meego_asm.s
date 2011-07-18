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
	.file	"ppu.cpp"
	.text
	.align	2
	.type	_ZL13REGISTER_4212v, %function
_ZL13REGISTER_4212v:
	.fnstart
.LFB6:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	.save {fp}
	.setfp fp, sp, #0
	add	fp, sp, #0
	movw	r3, #:lower16:GetBank
	movt	r3, #:upper16:GetBank
	mov	r2, #0
	strb	r2, [r3, #0]
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	ldr	r2, [r3, #52]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r1, #2154
	ldrh	r3, [r3, r1]
	add	r3, r3, #1
	cmp	r2, r3
	blt	.L2
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	ldr	r2, [r3, #52]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r1, #2154
	ldrh	r3, [r3, r1]
	add	r3, r3, #4
	cmp	r2, r3
	bge	.L2
	movw	r3, #:lower16:GetBank
	movt	r3, #:upper16:GetBank
	mov	r2, #1
	strb	r2, [r3, #0]
.L2:
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	ldr	r2, [r3, #28]
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldr	r3, [r3, #8]
	cmp	r2, r3
	blt	.L3
	mov	r2, #64
	b	.L4
.L3:
	mov	r2, #0
.L4:
	movw	r3, #:lower16:GetBank
	movt	r3, #:upper16:GetBank
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	orr	r3, r2, r3
	uxtb	r3, r3
	uxtb	r2, r3
	movw	r3, #:lower16:GetBank
	movt	r3, #:upper16:GetBank
	strb	r2, [r3, #0]
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	ldr	r2, [r3, #52]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r1, #2154
	ldrh	r3, [r3, r1]
	add	r3, r3, #1
	cmp	r2, r3
	blt	.L5
	movw	r3, #:lower16:GetBank
	movt	r3, #:upper16:GetBank
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mvn	r3, r3, asl #25
	mvn	r3, r3, lsr #25
	uxtb	r2, r3
	movw	r3, #:lower16:GetBank
	movt	r3, #:upper16:GetBank
	strb	r2, [r3, #0]
.L5:
	movw	r3, #:lower16:GetBank
	movt	r3, #:upper16:GetBank
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.fnend
	.size	_ZL13REGISTER_4212v, .-_ZL13REGISTER_4212v
	.align	2
	.type	_ZL12FLUSH_REDRAWv, %function
_ZL12FLUSH_REDRAWv:
	.fnstart
.LFB7:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	ldr	r2, [r3, #3652]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	ldr	r3, [r3, #3656]
	cmp	r2, r3
	beq	.L9
	bl	S9xUpdateScreen
.L9:
	ldmfd	sp!, {fp, pc}
	.fnend
	.size	_ZL12FLUSH_REDRAWv, .-_ZL12FLUSH_REDRAWv
	.align	2
	.type	_ZL13REGISTER_2104h, %function
_ZL13REGISTER_2104h:
	.fnstart
.LFB8:
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
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2116
	ldrh	r2, [r3, r2]
	movw	r3, #271
	cmp	r2, r3
	bhi	.L21
.L11:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2116
	ldrh	r3, [r3, r2]
	mov	r2, r3, asl #1
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2118]	@ zero_extendqisi2
	and	r3, r3, #1
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r1, [fp, #-12]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2168
	add	r3, r1, r3
	add	r3, r3, r2
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L13
	bl	_ZL12FLUSH_REDRAWv
	ldr	r1, [fp, #-12]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2168
	add	r3, r1, r3
	add	r3, r3, r2
	ldrb	r2, [fp, #-13]
	strb	r2, [r3, #2]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	mov	r2, #1
	strb	r2, [r3, #5]
	ldr	r3, [fp, #-12]
	and	r3, r3, #512
	cmp	r3, #0
	beq	.L14
	ldr	r3, [fp, #-12]
	and	r3, r3, #31
	mov	r2, r3, asl #2
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r2, r3, #576
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	add	r3, r2, r3
	add	r3, r3, #2
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldrh	r3, [r3, #0]
	uxth	r3, r3
	and	r3, r3, #255
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	and	r1, r2, #1
	movw	r2, #:lower16:SignExtend
	movt	r2, #:upper16:SignExtend
	mov	r1, r1, asl #1
	add	r2, r1, r2
	ldrh	r2, [r2, #0]
	mov	r1, r2
	mov	r2, r3	@ movhi
	mov	r3, r1	@ movhi
	orr	r3, r2, r3
	uxth	r2, r3
	ldr	r3, [fp, #-8]
	strh	r2, [r3, #0]	@ movhi
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #2
	ldr	r2, [fp, #-8]
	strb	r3, [r2, #10]
	ldr	r3, [fp, #-8]
	add	r3, r3, #12
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldrh	r3, [r3, #0]
	uxth	r3, r3
	and	r3, r3, #255
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	mov	r2, r2, asr #2
	and	r1, r2, #1
	movw	r2, #:lower16:SignExtend
	movt	r2, #:upper16:SignExtend
	mov	r1, r1, asl #1
	add	r2, r1, r2
	ldrh	r2, [r2, #0]
	mov	r1, r2
	mov	r2, r3	@ movhi
	mov	r3, r1	@ movhi
	orr	r3, r2, r3
	uxth	r2, r3
	ldr	r3, [fp, #-8]
	strh	r2, [r3, #0]	@ movhi
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #8
	ldr	r2, [fp, #-8]
	strb	r3, [r2, #10]
	ldr	r3, [fp, #-8]
	add	r3, r3, #12
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldrh	r3, [r3, #0]
	uxth	r3, r3
	and	r3, r3, #255
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	mov	r2, r2, asr #4
	and	r1, r2, #1
	movw	r2, #:lower16:SignExtend
	movt	r2, #:upper16:SignExtend
	mov	r1, r1, asl #1
	add	r2, r1, r2
	ldrh	r2, [r2, #0]
	mov	r1, r2
	mov	r2, r3	@ movhi
	mov	r3, r1	@ movhi
	orr	r3, r2, r3
	uxth	r2, r3
	ldr	r3, [fp, #-8]
	strh	r2, [r3, #0]	@ movhi
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #32
	ldr	r2, [fp, #-8]
	strb	r3, [r2, #10]
	ldr	r3, [fp, #-8]
	add	r3, r3, #12
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldrh	r3, [r3, #0]
	uxth	r3, r3
	and	r3, r3, #255
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	mov	r2, r2, asr #6
	and	r1, r2, #1
	movw	r2, #:lower16:SignExtend
	movt	r2, #:upper16:SignExtend
	mov	r1, r1, asl #1
	add	r2, r1, r2
	ldrh	r2, [r2, #0]
	mov	r1, r2
	mov	r2, r3	@ movhi
	mov	r3, r1	@ movhi
	orr	r3, r2, r3
	uxth	r2, r3
	ldr	r3, [fp, #-8]
	strh	r2, [r3, #0]	@ movhi
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #128
	ldr	r2, [fp, #-8]
	strb	r3, [r2, #10]
	b	.L13
.L14:
	ldr	r3, [fp, #-12]
	and	r3, r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L15
	ldr	r3, [fp, #-12]
	and	r3, r3, #2
	cmp	r3, #0
	beq	.L16
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2116
	ldrh	r3, [r3, r2]
	mov	r3, r3, asr #1
	str	r3, [fp, #-12]
	ldr	r0, [fp, #-12]
	ldr	r1, [fp, #-12]
	movw	r2, #:lower16:PPU
	movt	r2, #:upper16:PPU
	mov	ip, #576
	mov	r3, r1
	mov	r3, r3, asl #1
	add	r3, r3, r1
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, ip
	ldrh	r3, [r3, #6]
	mov	r2, r3
	and	r2, r2, #255
	movw	r1, #:lower16:PPU
	movt	r1, #:upper16:PPU
	mov	ip, #576
	mov	r3, r0
	mov	r3, r3, asl #1
	add	r3, r3, r0
	mov	r3, r3, asl #2
	add	r3, r3, r1
	add	r3, r3, ip
	strh	r2, [r3, #6]	@ movhi
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-12]
	movw	r2, #:lower16:PPU
	movt	r2, #:upper16:PPU
	mov	ip, #576
	mov	r3, r0
	mov	r3, r3, asl #1
	add	r3, r3, r0
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, ip
	ldrh	r3, [r3, #6]
	mov	r2, r3
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #1
	mov	r3, r3, asl #8
	uxth	r3, r3
	orr	r3, r2, r3
	uxth	r3, r3
	uxth	r0, r3
	movw	r2, #:lower16:PPU
	movt	r2, #:upper16:PPU
	mov	ip, #576
	mov	r3, r1
	mov	r3, r3, asl #1
	add	r3, r3, r1
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, ip
	strh	r0, [r3, #6]	@ movhi
	ldr	r0, [fp, #-12]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	mov	r3, r3, asr #1
	uxtb	r3, r3
	mov	r2, r3
	and	r2, r2, #7
	movw	r1, #:lower16:PPU
	movt	r1, #:upper16:PPU
	mov	ip, #584
	mov	r3, r0
	mov	r3, r3, asl #1
	add	r3, r3, r0
	mov	r3, r3, asl #2
	add	r3, r3, r1
	add	r3, r3, ip
	strb	r2, [r3, #3]
	ldr	r0, [fp, #-12]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	mov	r3, r3, asr #4
	uxtb	r3, r3
	mov	r2, r3
	and	r2, r2, #3
	movw	r1, #:lower16:PPU
	movt	r1, #:upper16:PPU
	mov	ip, #584
	mov	r3, r0
	mov	r3, r3, asl #1
	add	r3, r3, r0
	mov	r3, r3, asl #2
	add	r3, r3, r1
	add	r3, r3, ip
	strb	r2, [r3, #2]
	ldr	r0, [fp, #-12]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	mov	r3, r3, asr #6
	uxtb	r3, r3
	mov	r2, r3
	and	r2, r2, #1
	movw	r1, #:lower16:PPU
	movt	r1, #:upper16:PPU
	mov	ip, #576
	mov	r3, r0
	mov	r3, r3, asl #1
	add	r3, r3, r0
	mov	r3, r3, asl #2
	add	r3, r3, r1
	add	r3, r3, ip
	strb	r2, [r3, #9]
	ldr	r1, [fp, #-12]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	mov	r3, r3, lsr #7
	uxtb	r0, r3
	movw	r2, #:lower16:PPU
	movt	r2, #:upper16:PPU
	mov	ip, #576
	mov	r3, r1
	mov	r3, r3, asl #1
	add	r3, r3, r1
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, ip
	mov	r2, r0
	strb	r2, [r3, #8]
	b	.L13
.L16:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2116
	ldrh	r3, [r3, r2]
	mov	r1, r3, asr #1
	ldrb	r0, [fp, #-13]	@ zero_extendqisi2
	movw	r2, #:lower16:PPU
	movt	r2, #:upper16:PPU
	mov	ip, #576
	mov	r3, r1
	mov	r3, r3, asl #1
	add	r3, r3, r1
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, ip
	strh	r0, [r3, #4]	@ movhi
	b	.L13
.L15:
	ldr	r3, [fp, #-12]
	and	r3, r3, #2
	cmp	r3, #0
	beq	.L18
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2116
	ldrh	r3, [r3, r2]
	mov	r3, r3, asr #1
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	mov	r0, r3
	mov	r1, r3
	movw	r2, #:lower16:PPU
	movt	r2, #:upper16:PPU
	mov	ip, #576
	mov	r3, r1
	mov	r3, r3, asl #1
	add	r3, r3, r1
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, ip
	ldrh	r3, [r3, #6]
	mov	r2, r3
	and	r2, r2, #256
	movw	r1, #:lower16:PPU
	movt	r1, #:upper16:PPU
	mov	ip, #576
	mov	r3, r0
	mov	r3, r3, asl #1
	add	r3, r3, r0
	mov	r3, r3, asl #2
	add	r3, r3, r1
	add	r3, r3, ip
	strh	r2, [r3, #6]	@ movhi
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-12]
	movw	r2, #:lower16:PPU
	movt	r2, #:upper16:PPU
	mov	ip, #576
	mov	r3, r0
	mov	r3, r3, asl #1
	add	r3, r3, r0
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, ip
	ldrh	r2, [r3, #6]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	orr	r3, r2, r3
	uxth	r0, r3
	movw	r2, #:lower16:PPU
	movt	r2, #:upper16:PPU
	mov	ip, #576
	mov	r3, r1
	mov	r3, r3, asl #1
	add	r3, r3, r1
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, ip
	strh	r0, [r3, #6]	@ movhi
	b	.L13
.L18:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2116
	ldrh	r3, [r3, r2]
	mov	r3, r3, asr #1
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	mov	r0, r3
	mov	r1, r3
	movw	r2, #:lower16:PPU
	movt	r2, #:upper16:PPU
	mov	ip, #576
	mov	r3, r1
	mov	r3, r3, asl #1
	add	r3, r3, r1
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, ip
	ldrh	r3, [r3, #2]
	uxth	r2, r3
	and	r2, r2, #65280
	movw	r1, #:lower16:PPU
	movt	r1, #:upper16:PPU
	mov	ip, #576
	mov	r3, r0
	mov	r3, r3, asl #1
	add	r3, r3, r0
	mov	r3, r3, asl #2
	add	r3, r3, r1
	add	r3, r3, ip
	strh	r2, [r3, #2]	@ movhi
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-12]
	movw	r2, #:lower16:PPU
	movt	r2, #:upper16:PPU
	mov	ip, #576
	mov	r3, r0
	mov	r3, r3, asl #1
	add	r3, r3, r0
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, ip
	ldrh	r2, [r3, #2]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	orr	r3, r2, r3
	uxth	r0, r3
	movw	r2, #:lower16:PPU
	movt	r2, #:upper16:PPU
	mov	ip, #576
	mov	r3, r1
	mov	r3, r3, asl #1
	add	r3, r3, r1
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, ip
	strh	r0, [r3, #2]	@ movhi
.L13:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2118]	@ zero_extendqisi2
	eor	r3, r3, #1
	uxtb	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2118]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2118]	@ zero_extendqisi2
	and	r3, r3, #1
	uxtb	r3, r3
	eor	r3, r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L19
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2116
	ldrh	r3, [r3, r2]
	add	r3, r3, #1
	uxth	r1, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2116
	strh	r1, [r3, r2]	@ movhi
.L19:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #8448
	add	r3, r3, #4
	ldrb	r2, [fp, #-13]
	strb	r2, [r3, #0]
	b	.L20
.L21:
	mov	r0, r0	@ nop
.L20:
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.fnend
	.size	_ZL13REGISTER_2104h, .-_ZL13REGISTER_2104h
	.align	2
	.type	_ZL13REGISTER_2118h, %function
_ZL13REGISTER_2118h:
	.fnstart
.LFB9:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	.save {fp}
	.setfp fp, sp, #0
	add	fp, sp, #0
	.pad #20
	sub	sp, sp, #20
	mov	r3, r0
	strb	r3, [fp, #-13]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r3, [r3, #10]
	cmp	r3, #0
	beq	.L23
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r2, [r3, #6]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r3, [r3, #8]
	and	r3, r2, r3
	uxth	r3, r3
	str	r3, [fp, #-8]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r3, [r3, #6]
	mov	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r3, [r3, #8]
	mvn	r3, r3
	and	r3, r2, r3
	mov	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r3, [r3, #12]
	ldr	r1, [fp, #-8]
	mov	r3, r1, lsr r3
	add	r2, r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r3, [r3, #10]
	sub	r3, r3, #1
	mov	r1, r3
	ldr	r3, [fp, #-8]
	and	r3, r1, r3
	mov	r3, r3, asl #3
	add	r3, r2, r3
	mov	r3, r3, asl #1
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	str	r3, [fp, #-12]
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	ldrb	r2, [fp, #-13]
	strb	r2, [r3, #0]
	b	.L24
.L23:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #8]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r3, [r3, #6]
	mov	r3, r3, asl #1
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	ldrb	r2, [fp, #-13]
	strb	r2, [r3, #0]
.L24:
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	ldr	r2, [r3, #40]
	ldr	r3, [fp, #-12]
	mov	r3, r3, lsr #4
	add	r3, r2, r3
	mov	r2, #0
	strb	r2, [r3, #0]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	ldr	r2, [r3, #44]
	ldr	r3, [fp, #-12]
	mov	r3, r3, lsr #5
	add	r3, r2, r3
	mov	r2, #0
	strb	r2, [r3, #0]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	ldr	r2, [r3, #48]
	ldr	r3, [fp, #-12]
	mov	r3, r3, lsr #6
	add	r3, r2, r3
	mov	r2, #0
	strb	r2, [r3, #0]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L26
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r2, [r3, #6]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #5]	@ zero_extendqisi2
	add	r3, r2, r3
	uxth	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strh	r2, [r3, #6]	@ movhi
.L26:
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.fnend
	.size	_ZL13REGISTER_2118h, .-_ZL13REGISTER_2118h
	.align	2
	.type	_ZL13REGISTER_2119h, %function
_ZL13REGISTER_2119h:
	.fnstart
.LFB12:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	.save {fp}
	.setfp fp, sp, #0
	add	fp, sp, #0
	.pad #20
	sub	sp, sp, #20
	mov	r3, r0
	strb	r3, [fp, #-13]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r3, [r3, #10]
	cmp	r3, #0
	beq	.L28
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r2, [r3, #6]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r3, [r3, #8]
	and	r3, r2, r3
	uxth	r3, r3
	str	r3, [fp, #-8]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r3, [r3, #6]
	mov	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r3, [r3, #8]
	mvn	r3, r3
	and	r3, r2, r3
	mov	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r3, [r3, #12]
	ldr	r1, [fp, #-8]
	mov	r3, r1, lsr r3
	add	r2, r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r3, [r3, #10]
	sub	r3, r3, #1
	mov	r1, r3
	ldr	r3, [fp, #-8]
	and	r3, r1, r3
	mov	r3, r3, asl #3
	add	r3, r2, r3
	mov	r3, r3, asl #1
	add	r3, r3, #1
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	str	r3, [fp, #-12]
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	ldrb	r2, [fp, #-13]
	strb	r2, [r3, #0]
	b	.L29
.L28:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #8]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r3, [r3, #6]
	mov	r3, r3, asl #1
	add	r3, r3, #1
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	ldrb	r2, [fp, #-13]
	strb	r2, [r3, #0]
.L29:
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	ldr	r2, [r3, #40]
	ldr	r3, [fp, #-12]
	mov	r3, r3, lsr #4
	add	r3, r2, r3
	mov	r2, #0
	strb	r2, [r3, #0]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	ldr	r2, [r3, #44]
	ldr	r3, [fp, #-12]
	mov	r3, r3, lsr #5
	add	r3, r2, r3
	mov	r2, #0
	strb	r2, [r3, #0]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	ldr	r2, [r3, #48]
	ldr	r3, [fp, #-12]
	mov	r3, r3, lsr #6
	add	r3, r2, r3
	mov	r2, #0
	strb	r2, [r3, #0]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L31
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r2, [r3, #6]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #5]	@ zero_extendqisi2
	add	r3, r2, r3
	uxth	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strh	r2, [r3, #6]	@ movhi
.L31:
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.fnend
	.size	_ZL13REGISTER_2119h, .-_ZL13REGISTER_2119h
	.align	2
	.type	_ZL13REGISTER_2122h, %function
_ZL13REGISTER_2122h:
	.fnstart
.LFB15:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	.pad #8
	sub	sp, sp, #8
	mov	r3, r0
	strb	r3, [fp, #-5]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #62]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L33
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	and	r2, r3, #127
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2148]	@ zero_extendqisi2
	mov	r1, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	add	r1, r1, #32
	mov	r1, r1, asl #1
	add	r3, r1, r3
	ldrh	r3, [r3, #0]
	mov	r3, r3, asr #8
	cmp	r2, r3
	beq	.L34
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldrb	r3, [r3, #114]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L35
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldr	r3, [r3, #280]
	and	r3, r3, #8
	cmp	r3, #0
	bne	.L35
	bl	_ZL12FLUSH_REDRAWv
.L35:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2148]	@ zero_extendqisi2
	mov	r1, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2148]	@ zero_extendqisi2
	mov	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	add	r2, r2, #32
	mov	r2, r2, asl #1
	add	r3, r2, r3
	ldrh	r3, [r3, #0]
	and	r3, r3, #255
	movw	r2, #:lower16:PPU
	movt	r2, #:upper16:PPU
	add	r1, r1, #32
	mov	r1, r1, asl #1
	add	r2, r1, r2
	strh	r3, [r2, #0]	@ movhi
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2148]	@ zero_extendqisi2
	mov	r1, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2148]	@ zero_extendqisi2
	mov	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	add	r2, r2, #32
	mov	r2, r2, asl #1
	add	r3, r2, r3
	ldrh	r3, [r3, #0]
	mov	r2, r3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	and	r3, r3, #127
	mov	r3, r3, asl #8
	uxth	r3, r3
	orr	r3, r2, r3
	uxth	r3, r3
	uxth	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	add	r1, r1, #32
	mov	r1, r1, asl #1
	add	r3, r1, r3
	strh	r2, [r3, #0]	@ movhi
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	mov	r2, #1
	strb	r2, [r3, #0]
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldrb	r3, [r3, #114]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L34
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2148]	@ zero_extendqisi2
	mov	r2, r3
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	ldr	r1, [r3, #3136]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	mov	r3, r3, asr #2
	and	r3, r3, #31
	add	r3, r1, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r1, r3
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r2, r2, #528
	str	r1, [r3, r2, asl #2]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2148]	@ zero_extendqisi2
	mov	r2, r3
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	ldr	r1, [r3, #3136]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2148]	@ zero_extendqisi2
	mov	r0, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	add	r0, r0, #32
	mov	r0, r0, asl #1
	add	r3, r0, r3
	ldrh	r3, [r3, #0]
	mov	r3, r3, asr #5
	and	r3, r3, #31
	add	r3, r1, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r1, r3
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r2, r2, #272
	str	r1, [r3, r2, asl #2]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2148]	@ zero_extendqisi2
	mov	r1, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2148]	@ zero_extendqisi2
	mov	r2, r3
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r2, r2, #16
	ldr	r3, [r3, r2, asl #2]
	mov	r3, r3, asl #11
	uxth	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2148]	@ zero_extendqisi2
	mov	r0, r3
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r0, r0, #272
	ldr	r3, [r3, r0, asl #2]
	mov	r3, r3, asl #6
	uxth	r3, r3
	orr	r3, r2, r3
	uxth	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2148]	@ zero_extendqisi2
	mov	r0, r3
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r0, r0, #528
	ldr	r3, [r3, r0, asl #2]
	uxth	r3, r3
	orr	r3, r2, r3
	uxth	r3, r3
	uxth	r2, r3
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r0, r1, #1568
	mov	r1, #4
	mov	r0, r0, asl #1
	add	r3, r0, r3
	add	r3, r3, r1
	strh	r2, [r3, #0]	@ movhi
.L34:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2148]	@ zero_extendqisi2
	add	r3, r3, #1
	uxtb	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2148]
	b	.L36
.L33:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2148]	@ zero_extendqisi2
	mov	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	add	r2, r2, #32
	mov	r2, r2, asl #1
	add	r3, r2, r3
	ldrh	r3, [r3, #0]
	uxtb	r3, r3
	ldrb	r2, [fp, #-5]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L36
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldrb	r3, [r3, #114]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L37
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldr	r3, [r3, #280]
	and	r3, r3, #8
	cmp	r3, #0
	bne	.L37
	bl	_ZL12FLUSH_REDRAWv
.L37:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2148]	@ zero_extendqisi2
	mov	r1, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2148]	@ zero_extendqisi2
	mov	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	add	r2, r2, #32
	mov	r2, r2, asl #1
	add	r3, r2, r3
	ldrh	r3, [r3, #0]
	and	r3, r3, #32512
	movw	r2, #:lower16:PPU
	movt	r2, #:upper16:PPU
	add	r1, r1, #32
	mov	r1, r1, asl #1
	add	r2, r1, r2
	strh	r3, [r2, #0]	@ movhi
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2148]	@ zero_extendqisi2
	mov	r1, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2148]	@ zero_extendqisi2
	mov	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	add	r2, r2, #32
	mov	r2, r2, asl #1
	add	r3, r2, r3
	ldrh	r2, [r3, #0]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	orr	r3, r2, r3
	uxth	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	add	r1, r1, #32
	mov	r1, r1, asl #1
	add	r3, r1, r3
	strh	r2, [r3, #0]	@ movhi
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	mov	r2, #1
	strb	r2, [r3, #0]
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldrb	r3, [r3, #114]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L36
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2148]	@ zero_extendqisi2
	mov	r2, r3
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	ldr	r1, [r3, #3136]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	and	r3, r3, #31
	add	r3, r1, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r1, r3
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r2, r2, #16
	str	r1, [r3, r2, asl #2]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2148]	@ zero_extendqisi2
	mov	r2, r3
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	ldr	r1, [r3, #3136]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2148]	@ zero_extendqisi2
	mov	r0, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	add	r0, r0, #32
	mov	r0, r0, asl #1
	add	r3, r0, r3
	ldrh	r3, [r3, #0]
	mov	r3, r3, asr #5
	and	r3, r3, #31
	add	r3, r1, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r1, r3
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r2, r2, #272
	str	r1, [r3, r2, asl #2]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2148]	@ zero_extendqisi2
	mov	r1, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2148]	@ zero_extendqisi2
	mov	r2, r3
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r2, r2, #16
	ldr	r3, [r3, r2, asl #2]
	mov	r3, r3, asl #11
	uxth	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2148]	@ zero_extendqisi2
	mov	r0, r3
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r0, r0, #272
	ldr	r3, [r3, r0, asl #2]
	mov	r3, r3, asl #6
	uxth	r3, r3
	orr	r3, r2, r3
	uxth	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2148]	@ zero_extendqisi2
	mov	r0, r3
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r0, r0, #528
	ldr	r3, [r3, r0, asl #2]
	uxth	r3, r3
	orr	r3, r2, r3
	uxth	r3, r3
	uxth	r2, r3
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r0, r1, #1568
	mov	r1, #4
	mov	r0, r0, asl #1
	add	r3, r0, r3
	add	r3, r3, r1
	strh	r2, [r3, #0]	@ movhi
.L36:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #62]	@ zero_extendqisi2
	eor	r3, r3, #1
	uxtb	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #62]
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.fnend
	.size	_ZL13REGISTER_2122h, .-_ZL13REGISTER_2122h
	.align	2
	.type	_ZL13REGISTER_2180h, %function
_ZL13REGISTER_2180h:
	.fnstart
.LFB16:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	.save {fp}
	.setfp fp, sp, #0
	add	fp, sp, #0
	.pad #12
	sub	sp, sp, #12
	mov	r3, r0
	strb	r3, [fp, #-5]
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #0]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldr	r3, [r3, #2156]
	add	r2, r2, r3
	ldrb	r1, [fp, #-5]
	strb	r1, [r2, #0]
	add	r2, r3, #1
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	str	r2, [r3, #2156]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldr	r3, [r3, #2156]
	bic	r2, r3, #-16777216
	bic	r2, r2, #16646144
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	str	r2, [r3, #2156]
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #8576
	ldrb	r2, [fp, #-5]
	strb	r2, [r3, #0]
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.fnend
	.size	_ZL13REGISTER_2180h, .-_ZL13REGISTER_2180h
	.align	2
	.type	_ZL16CLEAR_IRQ_SOURCEj, %function
_ZL16CLEAR_IRQ_SOURCEj:
	.fnstart
.LFB17:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	.save {fp}
	.setfp fp, sp, #0
	add	fp, sp, #0
	.pad #12
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	ldrb	r2, [r3, #6]	@ zero_extendqisi2
	ldr	r3, [fp, #-8]
	uxtb	r3, r3
	mvn	r3, r3
	uxtb	r3, r3
	and	r3, r2, r3
	uxtb	r2, r3
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	strb	r2, [r3, #6]
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	ldrb	r3, [r3, #6]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L43
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	ldr	r3, [r3, #0]
	bic	r2, r3, #2048
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	str	r2, [r3, #0]
.L43:
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.fnend
	.size	_ZL16CLEAR_IRQ_SOURCEj, .-_ZL16CLEAR_IRQ_SOURCEj
	.align	2
	.global	_Z15S9xUpdateHTimerv
	.type	_Z15S9xUpdateHTimerv, %function
_Z15S9xUpdateHTimerv:
	.fnstart
.LFB28:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	.save {fp}
	.setfp fp, sp, #0
	add	fp, sp, #0
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2715]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L57
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2124
	ldrh	r3, [r3, r2]
	mov	r2, r3
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldr	r3, [r3, #4]
	mul	r3, r3, r2
	movw	r2, #:lower16:-1080021015
	movt	r2, #:upper16:-1080021015
	smull	r1, r2, r2, r3
	add	r2, r2, r3
	mov	r2, r2, asr #8
	mov	r3, r3, asr #31
	rsb	r3, r3, r2
	uxth	r1, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2716
	strh	r1, [r3, r2]	@ movhi
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2716
	ldrh	r3, [r3, r2]
	sxth	r2, r3
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldr	r3, [r3, #4]
	cmp	r2, r3
	beq	.L46
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2716
	ldrh	r3, [r3, r2]
	sxth	r2, r3
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L47
.L46:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2716
	ldrh	r3, [r3, r2]
	sub	r3, r3, #1
	uxth	r1, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2716
	strh	r1, [r3, r2]	@ movhi
.L47:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2714]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L48
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	ldr	r2, [r3, #52]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r1, #2122
	ldrh	r3, [r3, r1]
	cmp	r2, r3
	bne	.L57
.L48:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2716
	ldrh	r3, [r3, r2]
	sxth	r2, r3
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	ldr	r3, [r3, #28]
	cmp	r2, r3
	bge	.L49
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	ldrb	r3, [r3, #85]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L50
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	ldrb	r3, [r3, #85]	@ zero_extendqisi2
	cmp	r3, #3
	bne	.L51
.L50:
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	mov	r2, #1
	strb	r2, [r3, #85]
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldr	r2, [r3, #4]
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	str	r2, [r3, #48]
	mov	r0, r0	@ nop
	b	.L57
.L51:
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	mov	r2, #0
	strb	r2, [r3, #85]
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldr	r2, [r3, #8]
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	str	r2, [r3, #48]
	b	.L57
.L49:
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	ldrb	r3, [r3, #85]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L53
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	ldrb	r3, [r3, #85]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L54
.L53:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2716
	ldrh	r3, [r3, r2]
	sxth	r2, r3
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldr	r3, [r3, #8]
	cmp	r2, r3
	ble	.L55
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldr	r2, [r3, #8]
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	str	r2, [r3, #48]
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	mov	r2, #0
	strb	r2, [r3, #85]
	b	.L57
.L55:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2716
	ldrh	r3, [r3, r2]
	sxth	r2, r3
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	str	r2, [r3, #48]
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	mov	r2, #2
	strb	r2, [r3, #85]
	b	.L57
.L54:
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	mov	r2, #3
	strb	r2, [r3, #85]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2716
	ldrh	r3, [r3, r2]
	sxth	r2, r3
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	str	r2, [r3, #48]
.L57:
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.fnend
	.size	_Z15S9xUpdateHTimerv, .-_Z15S9xUpdateHTimerv
	.align	2
	.global	S9xFixColourBrightness
	.type	S9xFixColourBrightness, %function
S9xFixColourBrightness:
	.fnstart
.LFB29:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	.save {fp}
	.setfp fp, sp, #0
	add	fp, sp, #0
	.pad #12
	sub	sp, sp, #12
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	mov	r2, r3, asl #5
	movw	r3, #:lower16:mul_brightness
	movt	r3, #:upper16:mul_brightness
	add	r3, r2, r3
	mov	r2, r3
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	str	r2, [r3, #3136]
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldrb	r3, [r3, #114]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L62
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L60
.L61:
	ldr	r2, [fp, #-8]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	ldr	r1, [r3, #3136]
	ldr	r0, [fp, #-8]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	add	r0, r0, #32
	mov	r0, r0, asl #1
	add	r3, r0, r3
	ldrh	r3, [r3, #0]
	and	r3, r3, #31
	add	r3, r1, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r1, r3
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r2, r2, #16
	str	r1, [r3, r2, asl #2]
	ldr	r2, [fp, #-8]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	ldr	r1, [r3, #3136]
	ldr	r0, [fp, #-8]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	add	r0, r0, #32
	mov	r0, r0, asl #1
	add	r3, r0, r3
	ldrh	r3, [r3, #0]
	mov	r3, r3, asr #5
	and	r3, r3, #31
	add	r3, r1, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r1, r3
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r2, r2, #272
	str	r1, [r3, r2, asl #2]
	ldr	r2, [fp, #-8]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	ldr	r1, [r3, #3136]
	ldr	r0, [fp, #-8]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	add	r0, r0, #32
	mov	r0, r0, asl #1
	add	r3, r0, r3
	ldrh	r3, [r3, #0]
	mov	r3, r3, asr #10
	and	r3, r3, #31
	add	r3, r1, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r1, r3
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r2, r2, #528
	str	r1, [r3, r2, asl #2]
	ldr	r1, [fp, #-8]
	ldr	r2, [fp, #-8]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r2, r2, #16
	ldr	r3, [r3, r2, asl #2]
	mov	r3, r3, asl #11
	uxth	r2, r3
	ldr	r0, [fp, #-8]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r0, r0, #272
	ldr	r3, [r3, r0, asl #2]
	mov	r3, r3, asl #6
	uxth	r3, r3
	orr	r3, r2, r3
	uxth	r2, r3
	ldr	r0, [fp, #-8]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r0, r0, #528
	ldr	r3, [r3, r0, asl #2]
	uxth	r3, r3
	orr	r3, r2, r3
	uxth	r3, r3
	uxth	r2, r3
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r0, r1, #1568
	mov	r1, #4
	mov	r0, r0, asl #1
	add	r3, r0, r3
	add	r3, r3, r1
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L60:
	ldr	r3, [fp, #-8]
	cmp	r3, #255
	movgt	r3, #0
	movle	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L61
.L62:
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.fnend
	.size	S9xFixColourBrightness, .-S9xFixColourBrightness
	.align	2
	.global	S9xSetPPU
	.type	S9xSetPPU, %function
S9xSetPPU:
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
	mov	r2, r0
	mov	r3, r1
	strb	r2, [fp, #-13]
	strh	r3, [fp, #-16]	@ movhi
	ldrh	r2, [fp, #-16]
	movw	r3, #8579
	cmp	r2, r3
	bhi	.L64
	ldrh	r3, [fp, #-16]
	sub	r3, r3, #8448
	cmp	r3, #131
	ldrls	pc, [pc, r3, asl #2]
	b	.L222
.L131:
	.word	.L66
	.word	.L67
	.word	.L68
	.word	.L69
	.word	.L70
	.word	.L71
	.word	.L72
	.word	.L73
	.word	.L74
	.word	.L75
	.word	.L76
	.word	.L77
	.word	.L78
	.word	.L79
	.word	.L80
	.word	.L81
	.word	.L82
	.word	.L83
	.word	.L84
	.word	.L85
	.word	.L86
	.word	.L87
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
	.word	.L223
	.word	.L223
	.word	.L223
	.word	.L223
	.word	.L223
	.word	.L223
	.word	.L223
	.word	.L223
	.word	.L223
	.word	.L223
	.word	.L223
	.word	.L223
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L126
	.word	.L127
	.word	.L128
	.word	.L129
	.word	.L130
.L66:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #8448
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L224
	bl	_ZL12FLUSH_REDRAWv
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	mov	r2, r3
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #15
	cmp	r2, r3
	beq	.L133
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	mov	r2, #1
	strb	r2, [r3, #0]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	mov	r2, #1
	strb	r2, [r3, #7]
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	and	r2, r2, #15
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2]
	bl	S9xFixColourBrightness
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r2, [r3, #2]	@ zero_extendqisi2
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	ldrb	r3, [r3, #3]	@ zero_extendqisi2
	cmp	r2, r3
	bls	.L133
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r2, [r3, #2]	@ zero_extendqisi2
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	strb	r2, [r3, #3]
.L133:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #8448
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	eor	r3, r2, r3
	and	r3, r3, #128
	cmp	r3, #0
	beq	.L225
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	mov	r2, #1
	strb	r2, [r3, #0]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	mov	r3, r3, lsr #7
	uxtb	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2161]
	b	.L198
.L67:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #8448
	add	r3, r3, #1
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L226
	bl	_ZL12FLUSH_REDRAWv
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	mov	r3, r3, asl #14
	uxth	r1, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2166
	strh	r1, [r3, r2]	@ movhi
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	mov	r3, r3, asr #3
	uxth	r3, r3
	and	r3, r3, #3
	mov	r3, r3, asl #13
	uxth	r1, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #2768
	strh	r1, [r3, r2]	@ movhi
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	mov	r3, r3, lsr #5
	uxtb	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2164]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	mov	r2, #1
	strb	r2, [r3, #5]
	b	.L198
.L68:
	ldrb	r1, [fp, #-13]	@ zero_extendqisi2
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2116
	strh	r1, [r3, r2]	@ movhi
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #2
	strb	r2, [r3, #2118]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2169]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2116
	ldrh	r1, [r3, r2]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2152
	strh	r1, [r3, r2]	@ movhi
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2114]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L227
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2116
	ldrh	r3, [r3, r2]
	uxtb	r3, r3
	mov	r2, r3
	and	r2, r2, #127
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #576]
	b	.L198
.L69:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	sxtb	r3, r3
	mov	r2, r3, lsr #31
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2114]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2114]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L136
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2116
	ldrh	r3, [r3, r2]
	uxtb	r3, r3
	mov	r2, r3
	and	r2, r2, #127
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #576]
.L136:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2118]	@ zero_extendqisi2
	and	r3, r3, #2
	cmp	r3, #0
	beq	.L137
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2116
	ldrh	r3, [r3, r2]
	mov	r2, r3
	and	r2, r2, #255
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r1, #2116
	strh	r2, [r3, r1]	@ movhi
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2116
	ldrh	r3, [r3, r2]
	mov	r2, r3
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #1
	mov	r3, r3, asl #8
	uxth	r3, r3
	orr	r3, r2, r3
	uxth	r3, r3
	uxth	r1, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2116
	strh	r1, [r3, r2]	@ movhi
.L137:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2118]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2169]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2116
	ldrh	r1, [r3, r2]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2152
	strh	r1, [r3, r2]	@ movhi
	b	.L198
.L70:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	mov	r0, r3
	bl	_ZL13REGISTER_2104h
	b	.L198
.L71:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #8448
	add	r3, r3, #5
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L228
	bl	_ZL12FLUSH_REDRAWv
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	mov	r3, r3, asr #4
	uxtb	r3, r3
	mov	r2, r3
	and	r2, r2, #1
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #20]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	mov	r3, r3, asr #5
	uxtb	r3, r3
	mov	r2, r3
	and	r2, r2, #1
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #32]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	mov	r3, r3, asr #6
	uxtb	r3, r3
	mov	r2, r3
	and	r2, r2, #1
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #44]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	mov	r3, r3, lsr #7
	uxtb	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #56]
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	and	r2, r2, #7
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #0]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #15
	cmp	r3, #9
	movne	r2, #0
	moveq	r2, #1
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #1]
	b	.L198
.L72:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #8448
	add	r3, r3, #6
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L229
	bl	_ZL12FLUSH_REDRAWv
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	mov	r3, r3, asr #4
	uxtb	r3, r3
	add	r3, r3, #1
	uxtb	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2718]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L140
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2718]	@ zero_extendqisi2
	cmp	r3, #1
	bls	.L140
	mov	r3, #1
	b	.L141
.L140:
	mov	r3, #0
.L141:
	mov	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2719]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #2
	cmp	r3, #0
	beq	.L142
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2718]	@ zero_extendqisi2
	cmp	r3, #1
	bls	.L142
	mov	r3, #1
	b	.L143
.L142:
	mov	r3, #0
.L143:
	mov	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2720]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #4
	cmp	r3, #0
	beq	.L144
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2718]	@ zero_extendqisi2
	cmp	r3, #1
	bls	.L144
	mov	r3, #1
	b	.L145
.L144:
	mov	r3, #0
.L145:
	mov	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2721]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #8
	cmp	r3, #0
	beq	.L146
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2718]	@ zero_extendqisi2
	cmp	r3, #1
	bls	.L146
	mov	r3, #1
	b	.L147
.L146:
	mov	r3, #0
.L147:
	mov	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2722]
	b	.L198
.L73:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #8448
	add	r3, r3, #7
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L230
	bl	_ZL12FLUSH_REDRAWv
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	mov	r2, r3
	and	r2, r2, #3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strh	r2, [r3, #24]	@ movhi
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #124
	mov	r3, r3, asl #8
	uxth	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strh	r2, [r3, #14]	@ movhi
	b	.L198
.L74:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #8448
	add	r3, r3, #8
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L231
	bl	_ZL12FLUSH_REDRAWv
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	mov	r2, r3
	and	r2, r2, #3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strh	r2, [r3, #36]	@ movhi
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #124
	mov	r3, r3, asl #8
	uxth	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strh	r2, [r3, #26]	@ movhi
	b	.L198
.L75:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #8448
	add	r3, r3, #9
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L232
	bl	_ZL12FLUSH_REDRAWv
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	mov	r2, r3
	and	r2, r2, #3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strh	r2, [r3, #48]	@ movhi
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #124
	mov	r3, r3, asl #8
	uxth	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strh	r2, [r3, #38]	@ movhi
	b	.L198
.L76:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #8448
	add	r3, r3, #10
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L233
	bl	_ZL12FLUSH_REDRAWv
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	mov	r2, r3
	and	r2, r2, #3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strh	r2, [r3, #60]	@ movhi
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #124
	mov	r3, r3, asl #8
	uxth	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strh	r2, [r3, #50]	@ movhi
	b	.L198
.L77:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #8448
	add	r3, r3, #11
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L234
	bl	_ZL12FLUSH_REDRAWv
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #7
	mov	r3, r3, asl #12
	uxth	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strh	r2, [r3, #22]	@ movhi
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	mov	r3, r3, asr #4
	uxth	r3, r3
	and	r3, r3, #7
	mov	r3, r3, asl #12
	uxth	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strh	r2, [r3, #34]	@ movhi
	b	.L198
.L78:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #8448
	add	r3, r3, #12
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L235
	bl	_ZL12FLUSH_REDRAWv
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #7
	mov	r3, r3, asl #12
	uxth	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strh	r2, [r3, #46]	@ movhi
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	mov	r3, r3, asr #4
	uxth	r3, r3
	and	r3, r3, #7
	mov	r3, r3, asl #12
	uxth	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strh	r2, [r3, #58]	@ movhi
	b	.L198
.L79:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r3, [r3, #18]
	mov	r3, r3, lsr #8
	uxth	r3, r3
	mov	r2, r3
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	mov	r3, r3, asl #8
	uxth	r3, r3
	orr	r3, r2, r3
	uxth	r3, r3
	uxth	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strh	r2, [r3, #18]	@ movhi
	b	.L198
.L80:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r3, [r3, #16]
	mov	r3, r3, lsr #8
	uxth	r3, r3
	mov	r2, r3
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	mov	r3, r3, asl #8
	uxth	r3, r3
	orr	r3, r2, r3
	uxth	r3, r3
	uxth	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strh	r2, [r3, #16]	@ movhi
	b	.L198
.L81:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r3, [r3, #30]
	mov	r3, r3, lsr #8
	uxth	r3, r3
	mov	r2, r3
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	mov	r3, r3, asl #8
	uxth	r3, r3
	orr	r3, r2, r3
	uxth	r3, r3
	uxth	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strh	r2, [r3, #30]	@ movhi
	b	.L198
.L82:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r3, [r3, #28]
	mov	r3, r3, lsr #8
	uxth	r3, r3
	mov	r2, r3
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	mov	r3, r3, asl #8
	uxth	r3, r3
	orr	r3, r2, r3
	uxth	r3, r3
	uxth	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strh	r2, [r3, #28]	@ movhi
	b	.L198
.L83:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r3, [r3, #42]
	mov	r3, r3, lsr #8
	uxth	r3, r3
	mov	r2, r3
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	mov	r3, r3, asl #8
	uxth	r3, r3
	orr	r3, r2, r3
	uxth	r3, r3
	uxth	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strh	r2, [r3, #42]	@ movhi
	b	.L198
.L84:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r3, [r3, #40]
	mov	r3, r3, lsr #8
	uxth	r3, r3
	mov	r2, r3
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	mov	r3, r3, asl #8
	uxth	r3, r3
	orr	r3, r2, r3
	uxth	r3, r3
	uxth	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strh	r2, [r3, #40]	@ movhi
	b	.L198
.L85:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r3, [r3, #54]
	mov	r3, r3, lsr #8
	uxth	r3, r3
	mov	r2, r3
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	mov	r3, r3, asl #8
	uxth	r3, r3
	orr	r3, r2, r3
	uxth	r3, r3
	uxth	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strh	r2, [r3, #54]	@ movhi
	b	.L198
.L86:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r3, [r3, #52]
	mov	r3, r3, lsr #8
	uxth	r3, r3
	mov	r2, r3
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	mov	r3, r3, asl #8
	uxth	r3, r3
	orr	r3, r2, r3
	uxth	r3, r3
	uxth	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strh	r2, [r3, #52]	@ movhi
	b	.L198
.L87:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	sxtb	r3, r3
	mov	r2, r3, lsr #31
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #4]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #3
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L154
.L159:
	.word	.L155
	.word	.L156
	.word	.L157
	.word	.L158
.L155:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #1
	strb	r2, [r3, #5]
	b	.L154
.L156:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #32
	strb	r2, [r3, #5]
	b	.L154
.L157:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mvn	r2, #127
	strb	r2, [r3, #5]
	b	.L154
.L158:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mvn	r2, #127
	strb	r2, [r3, #5]
.L154:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #12
	cmp	r3, #0
	beq	.L160
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #1
	strb	r2, [r3, #5]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #12
	mov	r3, r3, asr #2
	strb	r3, [fp, #-9]
	ldrb	r2, [fp, #-9]	@ zero_extendqisi2
	movw	r3, #:lower16:_ZZ9S9xSetPPUE8IncCount
	movt	r3, #:upper16:_ZZ9S9xSetPPUE8IncCount
	mov	r2, r2, asl #1
	add	r3, r2, r3
	ldrh	r2, [r3, #0]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strh	r2, [r3, #10]	@ movhi
	ldrb	r2, [fp, #-9]	@ zero_extendqisi2
	movw	r3, #:lower16:_ZZ9S9xSetPPUE8IncCount
	movt	r3, #:upper16:_ZZ9S9xSetPPUE8IncCount
	mov	r2, r2, asl #1
	add	r3, r2, r3
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #3
	uxth	r3, r3
	sub	r3, r3, #1
	uxth	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strh	r2, [r3, #8]	@ movhi
	ldrb	r2, [fp, #-9]	@ zero_extendqisi2
	movw	r3, #:lower16:_ZZ9S9xSetPPUE5Shift
	movt	r3, #:upper16:_ZZ9S9xSetPPUE5Shift
	mov	r2, r2, asl #1
	add	r3, r2, r3
	ldrh	r2, [r3, #0]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strh	r2, [r3, #12]	@ movhi
	b	.L198
.L160:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strh	r2, [r3, #10]	@ movhi
	b	.L198
.L88:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r3, [r3, #6]
	mov	r2, r3
	and	r2, r2, #65280
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strh	r2, [r3, #6]	@ movhi
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r2, [r3, #6]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	orr	r3, r2, r3
	uxth	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strh	r2, [r3, #6]	@ movhi
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	mov	r2, #1
	strb	r2, [r3, #52]
	b	.L198
.L89:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r3, [r3, #6]
	mov	r2, r3
	and	r2, r2, #255
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strh	r2, [r3, #6]	@ movhi
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r3, [r3, #6]
	mov	r2, r3
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	mov	r3, r3, asl #8
	uxth	r3, r3
	orr	r3, r2, r3
	uxth	r3, r3
	uxth	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strh	r2, [r3, #6]	@ movhi
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	mov	r2, #1
	strb	r2, [r3, #52]
	b	.L198
.L90:
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	mov	r2, #1
	strb	r2, [r3, #52]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	mov	r0, r3
	bl	_ZL13REGISTER_2118h
	b	.L198
.L91:
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	mov	r2, #1
	strb	r2, [r3, #52]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	mov	r0, r3
	bl	_ZL13REGISTER_2119h
	b	.L198
.L92:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #8448
	add	r3, r3, #26
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L236
	bl	_ZL12FLUSH_REDRAWv
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	mov	r3, r3, asr #6
	uxtb	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2725]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #2
	mov	r3, r3, asr #1
	uxtb	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2724]
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	and	r2, r2, #1
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2723]
	b	.L198
.L93:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2134
	ldrh	r3, [r3, r2]
	sxth	r3, r3
	mov	r3, r3, asr #8
	uxth	r3, r3
	uxth	r3, r3
	and	r3, r3, #255
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	mov	r2, r2, asl #8
	uxth	r1, r2
	mov	r2, r3	@ movhi
	mov	r3, r1	@ movhi
	orr	r3, r2, r3
	uxth	r1, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2134
	strh	r1, [r3, r2]	@ movhi
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #1
	strb	r2, [r3, #2770]
	b	.L198
.L94:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2136
	ldrh	r3, [r3, r2]
	sxth	r3, r3
	mov	r3, r3, asr #8
	uxth	r3, r3
	uxth	r3, r3
	and	r3, r3, #255
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	mov	r2, r2, asl #8
	uxth	r1, r2
	mov	r2, r3	@ movhi
	mov	r3, r1	@ movhi
	orr	r3, r2, r3
	uxth	r1, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2136
	strh	r1, [r3, r2]	@ movhi
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #1
	strb	r2, [r3, #2770]
	b	.L198
.L95:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2138
	ldrh	r3, [r3, r2]
	sxth	r3, r3
	mov	r3, r3, asr #8
	uxth	r3, r3
	uxth	r3, r3
	and	r3, r3, #255
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	mov	r2, r2, asl #8
	uxth	r1, r2
	mov	r2, r3	@ movhi
	mov	r3, r1	@ movhi
	orr	r3, r2, r3
	uxth	r1, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2138
	strh	r1, [r3, r2]	@ movhi
	b	.L198
.L96:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2140
	ldrh	r3, [r3, r2]
	sxth	r3, r3
	mov	r3, r3, asr #8
	uxth	r3, r3
	uxth	r3, r3
	and	r3, r3, #255
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	mov	r2, r2, asl #8
	uxth	r1, r2
	mov	r2, r3	@ movhi
	mov	r3, r1	@ movhi
	orr	r3, r2, r3
	uxth	r1, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2140
	strh	r1, [r3, r2]	@ movhi
	b	.L198
.L97:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2142
	ldrh	r3, [r3, r2]
	sxth	r3, r3
	mov	r3, r3, asr #8
	uxth	r3, r3
	uxth	r3, r3
	and	r3, r3, #255
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	mov	r2, r2, asl #8
	uxth	r1, r2
	mov	r2, r3	@ movhi
	mov	r3, r1	@ movhi
	orr	r3, r2, r3
	uxth	r1, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2142
	strh	r1, [r3, r2]	@ movhi
	b	.L198
.L98:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #2144
	ldrh	r3, [r3, r2]
	sxth	r3, r3
	mov	r3, r3, asr #8
	uxth	r3, r3
	uxth	r3, r3
	and	r3, r3, #255
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	mov	r2, r2, asl #8
	uxth	r1, r2
	mov	r2, r3	@ movhi
	mov	r3, r1	@ movhi
	orr	r3, r2, r3
	uxth	r1, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #2144
	strh	r1, [r3, r2]	@ movhi
	b	.L198
.L99:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #62]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2767]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r2, [fp, #-13]
	strb	r2, [r3, #2148]
	b	.L198
.L100:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	mov	r0, r3
	bl	_ZL13REGISTER_2122h
	b	.L198
.L101:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #8448
	add	r3, r3, #35
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L237
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldr	r3, [r3, #280]
	and	r3, r3, #2
	cmp	r3, #0
	bne	.L238
.L164:
	bl	_ZL12FLUSH_REDRAWv
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #2
	cmp	r3, #0
	moveq	r2, #0
	movne	r2, #1
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2742]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #32
	cmp	r3, #0
	moveq	r2, #0
	movne	r2, #1
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2743]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #8
	cmp	r3, #0
	moveq	r2, #0
	movne	r2, #1
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2748]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	sxtb	r3, r3
	mov	r2, r3, lsr #31
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2749]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #1
	uxtb	r3, r3
	eor	r3, r3, #1
	uxtb	r3, r3
	mov	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2754]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #16
	cmp	r3, #0
	movne	r2, #0
	moveq	r2, #1
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2755]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #4
	cmp	r3, #0
	movne	r2, #0
	moveq	r2, #1
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2760]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #64
	cmp	r3, #0
	movne	r2, #0
	moveq	r2, #1
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2761]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #1
	strb	r2, [r3, #2766]
	b	.L198
.L102:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #8448
	add	r3, r3, #36
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L239
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldr	r3, [r3, #280]
	and	r3, r3, #2
	cmp	r3, #0
	bne	.L240
.L167:
	bl	_ZL12FLUSH_REDRAWv
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #2
	cmp	r3, #0
	moveq	r2, #0
	movne	r2, #1
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2744]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #32
	cmp	r3, #0
	moveq	r2, #0
	movne	r2, #1
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2745]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #8
	cmp	r3, #0
	moveq	r2, #0
	movne	r2, #1
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2750]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	sxtb	r3, r3
	mov	r2, r3, lsr #31
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2751]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #1
	uxtb	r3, r3
	eor	r3, r3, #1
	uxtb	r3, r3
	mov	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2756]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #16
	cmp	r3, #0
	movne	r2, #0
	moveq	r2, #1
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2757]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #4
	cmp	r3, #0
	movne	r2, #0
	moveq	r2, #1
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2762]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #64
	cmp	r3, #0
	movne	r2, #0
	moveq	r2, #1
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2763]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #1
	strb	r2, [r3, #2766]
	b	.L198
.L103:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #8448
	add	r3, r3, #37
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L241
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldr	r3, [r3, #280]
	and	r3, r3, #2
	cmp	r3, #0
	bne	.L242
.L169:
	bl	_ZL12FLUSH_REDRAWv
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #2
	cmp	r3, #0
	moveq	r2, #0
	movne	r2, #1
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2746]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #32
	cmp	r3, #0
	moveq	r2, #0
	movne	r2, #1
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2747]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #8
	cmp	r3, #0
	moveq	r2, #0
	movne	r2, #1
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2752]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	sxtb	r3, r3
	mov	r2, r3, lsr #31
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2753]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #1
	uxtb	r3, r3
	eor	r3, r3, #1
	uxtb	r3, r3
	mov	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2758]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #16
	cmp	r3, #0
	movne	r2, #0
	moveq	r2, #1
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2759]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #4
	cmp	r3, #0
	movne	r2, #0
	moveq	r2, #1
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2764]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #64
	cmp	r3, #0
	movne	r2, #0
	moveq	r2, #1
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2765]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #1
	strb	r2, [r3, #2766]
	b	.L198
.L104:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #8448
	add	r3, r3, #38
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L243
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldr	r3, [r3, #280]
	and	r3, r3, #2
	cmp	r3, #0
	bne	.L244
.L171:
	bl	_ZL12FLUSH_REDRAWv
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r2, [fp, #-13]
	strb	r2, [r3, #2726]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #1
	strb	r2, [r3, #2766]
	b	.L198
.L105:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #8448
	add	r3, r3, #39
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L245
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldr	r3, [r3, #280]
	and	r3, r3, #2
	cmp	r3, #0
	bne	.L246
.L173:
	bl	_ZL12FLUSH_REDRAWv
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r2, [fp, #-13]
	strb	r2, [r3, #2727]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #1
	strb	r2, [r3, #2766]
	b	.L198
.L106:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #8448
	add	r3, r3, #40
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L247
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldr	r3, [r3, #280]
	and	r3, r3, #2
	cmp	r3, #0
	bne	.L248
.L175:
	bl	_ZL12FLUSH_REDRAWv
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r2, [fp, #-13]
	strb	r2, [r3, #2728]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #1
	strb	r2, [r3, #2766]
	b	.L198
.L107:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #8448
	add	r3, r3, #41
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L249
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldr	r3, [r3, #280]
	and	r3, r3, #2
	cmp	r3, #0
	bne	.L250
.L177:
	bl	_ZL12FLUSH_REDRAWv
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r2, [fp, #-13]
	strb	r2, [r3, #2729]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #1
	strb	r2, [r3, #2766]
	b	.L198
.L108:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #8448
	add	r3, r3, #42
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L251
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldr	r3, [r3, #280]
	and	r3, r3, #2
	cmp	r3, #0
	bne	.L252
.L179:
	bl	_ZL12FLUSH_REDRAWv
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	and	r2, r2, #3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2736]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #12
	mov	r3, r3, asr #2
	uxtb	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2737]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #48
	mov	r3, r3, asr #4
	uxtb	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2738]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	mov	r3, r3, lsr #6
	uxtb	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2739]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #1
	strb	r2, [r3, #2766]
	b	.L198
.L109:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #8448
	add	r3, r3, #43
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L253
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldr	r3, [r3, #280]
	and	r3, r3, #2
	cmp	r3, #0
	bne	.L254
.L181:
	bl	_ZL12FLUSH_REDRAWv
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	and	r2, r2, #3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2740]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #12
	mov	r3, r3, asr #2
	uxtb	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2741]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #1
	strb	r2, [r3, #2766]
	b	.L198
.L110:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #8448
	add	r3, r3, #44
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L255
	bl	_ZL12FLUSH_REDRAWv
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #1
	strb	r2, [r3, #2766]
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #20]
	ldrh	r3, [fp, #-16]
	add	r3, r2, r3
	ldrb	r2, [fp, #-13]
	strb	r2, [r3, #0]
	b	.L221
.L111:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #8448
	add	r3, r3, #45
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L256
	bl	_ZL12FLUSH_REDRAWv
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #1
	strb	r2, [r3, #2766]
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #20]
	ldrh	r3, [fp, #-16]
	add	r3, r2, r3
	ldrb	r2, [fp, #-13]
	strb	r2, [r3, #0]
	b	.L221
.L112:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #8448
	add	r3, r3, #46
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L257
	bl	_ZL12FLUSH_REDRAWv
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #1
	strb	r2, [r3, #2766]
	b	.L198
.L113:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #8448
	add	r3, r3, #47
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L258
	bl	_ZL12FLUSH_REDRAWv
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #1
	strb	r2, [r3, #2766]
	b	.L198
.L114:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #8448
	add	r3, r3, #48
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L259
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldr	r3, [r3, #280]
	and	r3, r3, #4
	cmp	r3, #0
	bne	.L260
.L187:
	bl	_ZL12FLUSH_REDRAWv
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #1
	strb	r2, [r3, #2766]
	b	.L198
.L115:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #8448
	add	r3, r3, #49
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L261
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldr	r3, [r3, #280]
	and	r3, r3, #4
	cmp	r3, #0
	bne	.L262
.L189:
	bl	_ZL12FLUSH_REDRAWv
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #8448
	add	r3, r3, #49
	ldrb	r2, [fp, #-13]
	strb	r2, [r3, #0]
	b	.L198
.L116:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #8448
	add	r3, r3, #50
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L263
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	sxtb	r3, r3
	cmp	r3, #0
	bge	.L191
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #31
	str	r3, [fp, #-8]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2151]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	beq	.L191
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldr	r3, [r3, #280]
	and	r3, r3, #1
	uxtb	r3, r3
	eor	r3, r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L192
	bl	_ZL12FLUSH_REDRAWv
.L192:
	ldr	r3, [fp, #-8]
	uxtb	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2151]
.L191:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #64
	cmp	r3, #0
	beq	.L193
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #31
	str	r3, [fp, #-8]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2150]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	beq	.L193
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldr	r3, [r3, #280]
	and	r3, r3, #1
	uxtb	r3, r3
	eor	r3, r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L194
	bl	_ZL12FLUSH_REDRAWv
.L194:
	ldr	r3, [fp, #-8]
	uxtb	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2150]
.L193:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #32
	cmp	r3, #0
	beq	.L264
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #31
	str	r3, [fp, #-8]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2149]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	beq	.L265
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldr	r3, [r3, #280]
	and	r3, r3, #1
	uxtb	r3, r3
	eor	r3, r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L195
	bl	_ZL12FLUSH_REDRAWv
.L195:
	ldr	r3, [fp, #-8]
	uxtb	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2149]
	b	.L198
.L117:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #8448
	add	r3, r3, #51
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L266
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #4
	cmp	r3, #0
	beq	.L197
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2154
	mov	r1, #239
	strh	r1, [r3, r2]	@ movhi
	b	.L198
.L197:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2154
	mov	r1, #224
	strh	r1, [r3, r2]	@ movhi
	b	.L198
.L126:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #20]
	ldrh	r3, [fp, #-16]
	add	r3, r2, r3
	ldrb	r2, [fp, #-13]
	strb	r2, [r3, #0]
	movw	r3, #:lower16:IAPU
	movt	r3, #:upper16:IAPU
	ldr	r2, [r3, #68]
	ldrh	r3, [fp, #-16]
	and	r3, r3, #3
	add	r3, r3, #244
	add	r3, r2, r3
	ldrb	r2, [fp, #-13]
	strb	r2, [r3, #0]
	b	.L198
.L127:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	mov	r0, r3
	bl	_ZL13REGISTER_2180h
	b	.L198
.L128:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldr	r2, [r3, #2156]
	movw	r3, #:lower16:130816
	movt	r3, #:upper16:130816
	and	r3, r2, r3
	movw	r2, #:lower16:PPU
	movt	r2, #:upper16:PPU
	str	r3, [r2, #2156]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldr	r2, [r3, #2156]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	orr	r2, r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	str	r2, [r3, #2156]
	b	.L198
.L129:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldr	r2, [r3, #2156]
	movw	r3, #:lower16:65791
	movt	r3, #:upper16:65791
	and	r3, r2, r3
	movw	r2, #:lower16:PPU
	movt	r2, #:upper16:PPU
	str	r3, [r2, #2156]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldr	r2, [r3, #2156]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	mov	r3, r3, asl #8
	orr	r2, r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	str	r2, [r3, #2156]
	mov	r0, r0	@ nop
	b	.L198
.L130:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldr	r3, [r3, #2156]
	mov	r2, r3, asl #16
	mov	r2, r2, lsr #16
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	str	r2, [r3, #2156]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldr	r2, [r3, #2156]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	mov	r3, r3, asl #16
	orr	r2, r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	str	r2, [r3, #2156]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldr	r3, [r3, #2156]
	bic	r2, r3, #-16777216
	bic	r2, r2, #16646144
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	str	r2, [r3, #2156]
	b	.L198
.L64:
	ldrh	r2, [fp, #-16]
	movw	r3, #10241
	cmp	r2, r3
	bne	.L199
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldrb	r3, [r3, #68]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L199
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	ldrh	r3, [fp, #-16]
	mov	r0, r2
	mov	r1, r3
	bl	_Z10S9xSetSRTCht
	b	.L198
.L199:
	ldrh	r2, [fp, #-16]
	movw	r3, #12287
	cmp	r2, r3
	bls	.L198
	ldrh	r2, [fp, #-16]
	movw	r3, #13055
	cmp	r2, r3
	bhi	.L198
.L200:
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldrb	r3, [r3, #80]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L267
.L201:
	ldrh	r3, [fp, #-16]
	sub	r3, r3, #12288
	sub	r3, r3, #31
	cmp	r3, #32
	ldrls	pc, [pc, r3, asl #2]
	b	.L202
.L215:
	.word	.L203
	.word	.L202
	.word	.L202
	.word	.L202
	.word	.L202
	.word	.L202
	.word	.L202
	.word	.L202
	.word	.L202
	.word	.L202
	.word	.L202
	.word	.L202
	.word	.L202
	.word	.L202
	.word	.L202
	.word	.L202
	.word	.L202
	.word	.L204
	.word	.L205
	.word	.L202
	.word	.L206
	.word	.L207
	.word	.L202
	.word	.L208
	.word	.L209
	.word	.L210
	.word	.L211
	.word	.L212
	.word	.L213
	.word	.L202
	.word	.L202
	.word	.L202
	.word	.L214
.L204:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #12288
	add	r3, r3, #48
	ldrb	r2, [r3, #0]	@ zero_extendqisi2
	ldrb	r3, [fp, #-13]
	eor	r3, r2, r3
	uxtb	r3, r3
	and	r3, r3, #32
	cmp	r3, #0
	beq	.L216
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #20]
	ldrh	r3, [fp, #-16]
	add	r3, r2, r3
	ldrb	r2, [fp, #-13]
	strb	r2, [r3, #0]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #32
	cmp	r3, #0
	beq	.L217
	bl	S9xSuperFXExec
	b	.L218
.L217:
	bl	_Z12FxFlushCachev
.L218:
	b	.L219
.L216:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #20]
	ldrh	r3, [fp, #-16]
	add	r3, r2, r3
	ldrb	r2, [fp, #-13]
	strb	r2, [r3, #0]
.L219:
	b	.L220
.L205:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #20]
	ldrh	r3, [fp, #-16]
	add	r3, r2, r3
	ldrb	r2, [fp, #-13]
	strb	r2, [r3, #0]
	b	.L220
.L206:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #20]
	ldrh	r3, [fp, #-16]
	add	r3, r2, r3
	ldrb	r2, [fp, #-13]
	strb	r2, [r3, #0]
	b	.L220
.L207:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #20]
	ldrh	r3, [fp, #-16]
	add	r2, r2, r3
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #127
	strb	r3, [r2, #0]
	b	.L220
.L208:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #20]
	ldrh	r3, [fp, #-16]
	add	r2, r2, r3
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #127
	strb	r3, [r2, #0]
	b	.L220
.L209:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #20]
	ldrh	r3, [fp, #-16]
	add	r3, r2, r3
	ldrb	r2, [fp, #-13]
	strb	r2, [r3, #0]
	b	.L220
.L210:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #20]
	ldrh	r3, [fp, #-16]
	add	r3, r2, r3
	ldrb	r2, [fp, #-13]
	strb	r2, [r3, #0]
	b	.L220
.L211:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #20]
	ldrh	r3, [fp, #-16]
	add	r3, r2, r3
	ldrb	r2, [fp, #-13]
	strb	r2, [r3, #0]
	b	.L220
.L212:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #20]
	ldrh	r3, [fp, #-16]
	add	r3, r2, r3
	ldrb	r2, [fp, #-13]
	strb	r2, [r3, #0]
	b	.L220
.L213:
	b	.L220
.L214:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #20]
	ldrh	r3, [fp, #-16]
	add	r3, r2, r3
	ldrb	r2, [fp, #-13]
	strb	r2, [r3, #0]
	b	.L220
.L203:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #20]
	ldrh	r3, [fp, #-16]
	add	r3, r2, r3
	ldrb	r2, [fp, #-13]
	strb	r2, [r3, #0]
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #12288
	add	r3, r3, #48
	movw	r2, #:lower16:Memory
	movt	r2, #:upper16:Memory
	ldr	r2, [r2, #20]
	add	r2, r2, #12288
	add	r2, r2, #48
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	orr	r2, r2, #32
	uxtb	r2, r2
	strb	r2, [r3, #0]
	bl	S9xSuperFXExec
	b	.L221
.L202:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #20]
	ldrh	r3, [fp, #-16]
	add	r3, r2, r3
	ldrb	r2, [fp, #-13]
	strb	r2, [r3, #0]
	ldrh	r2, [fp, #-16]
	movw	r3, #12543
	cmp	r2, r3
	bls	.L268
	ldrh	r3, [fp, #-16]
	mov	r0, r3
	bl	_Z18FxCacheWriteAccesst
	b	.L221
.L220:
	b	.L221
.L222:
	mov	r0, r0	@ nop
	b	.L198
.L224:
	mov	r0, r0	@ nop
	b	.L198
.L225:
	mov	r0, r0	@ nop
	b	.L198
.L226:
	mov	r0, r0	@ nop
	b	.L198
.L227:
	mov	r0, r0	@ nop
	b	.L198
.L228:
	mov	r0, r0	@ nop
	b	.L198
.L229:
	mov	r0, r0	@ nop
	b	.L198
.L230:
	mov	r0, r0	@ nop
	b	.L198
.L231:
	mov	r0, r0	@ nop
	b	.L198
.L232:
	mov	r0, r0	@ nop
	b	.L198
.L233:
	mov	r0, r0	@ nop
	b	.L198
.L234:
	mov	r0, r0	@ nop
	b	.L198
.L235:
	mov	r0, r0	@ nop
	b	.L198
.L236:
	mov	r0, r0	@ nop
	b	.L198
.L237:
	mov	r0, r0	@ nop
	b	.L198
.L239:
	mov	r0, r0	@ nop
	b	.L198
.L241:
	mov	r0, r0	@ nop
	b	.L198
.L243:
	mov	r0, r0	@ nop
	b	.L198
.L245:
	mov	r0, r0	@ nop
	b	.L198
.L247:
	mov	r0, r0	@ nop
	b	.L198
.L249:
	mov	r0, r0	@ nop
	b	.L198
.L251:
	mov	r0, r0	@ nop
	b	.L198
.L253:
	mov	r0, r0	@ nop
	b	.L198
.L255:
	mov	r0, r0	@ nop
	b	.L198
.L256:
	mov	r0, r0	@ nop
	b	.L198
.L257:
	mov	r0, r0	@ nop
	b	.L198
.L258:
	mov	r0, r0	@ nop
	b	.L198
.L259:
	mov	r0, r0	@ nop
	b	.L198
.L261:
	mov	r0, r0	@ nop
	b	.L198
.L263:
	mov	r0, r0	@ nop
	b	.L198
.L264:
	mov	r0, r0	@ nop
	b	.L198
.L265:
	mov	r0, r0	@ nop
	b	.L198
.L266:
	mov	r0, r0	@ nop
.L198:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #20]
	ldrh	r3, [fp, #-16]
	add	r3, r2, r3
	ldrb	r2, [fp, #-13]
	strb	r2, [r3, #0]
	b	.L221
.L223:
	mov	r0, r0	@ nop
	b	.L221
.L238:
	mov	r0, r0	@ nop
	b	.L221
.L240:
	mov	r0, r0	@ nop
	b	.L221
.L242:
	mov	r0, r0	@ nop
	b	.L221
.L244:
	mov	r0, r0	@ nop
	b	.L221
.L246:
	mov	r0, r0	@ nop
	b	.L221
.L248:
	mov	r0, r0	@ nop
	b	.L221
.L250:
	mov	r0, r0	@ nop
	b	.L221
.L252:
	mov	r0, r0	@ nop
	b	.L221
.L254:
	mov	r0, r0	@ nop
	b	.L221
.L260:
	mov	r0, r0	@ nop
	b	.L221
.L262:
	mov	r0, r0	@ nop
	b	.L221
.L267:
	mov	r0, r0	@ nop
	b	.L221
.L268:
	mov	r0, r0	@ nop
.L221:
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.fnend
	.size	S9xSetPPU, .-S9xSetPPU
	.global	__aeabi_idiv
	.align	2
	.global	S9xGetPPU
	.type	S9xGetPPU, %function
S9xGetPPU:
	.fnstart
.LFB31:
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	.pad #48
	sub	sp, sp, #48
	mov	r3, r0
	strh	r3, [fp, #-46]	@ movhi
	mov	r3, #0
	strb	r3, [fp, #-41]
	ldrh	r2, [fp, #-46]
	movw	r3, #8592
	cmp	r2, r3
	bhi	.L270
	ldrh	r3, [fp, #-46]
	sub	r3, r3, #8448
	cmp	r3, #144
	ldrls	pc, [pc, r3, asl #2]
	b	.L271
.L298:
	.word	.L272
	.word	.L272
	.word	.L273
	.word	.L274
	.word	.L275
	.word	.L275
	.word	.L275
	.word	.L275
	.word	.L275
	.word	.L275
	.word	.L275
	.word	.L275
	.word	.L275
	.word	.L276
	.word	.L276
	.word	.L276
	.word	.L276
	.word	.L276
	.word	.L276
	.word	.L276
	.word	.L276
	.word	.L277
	.word	.L278
	.word	.L279
	.word	.L280
	.word	.L280
	.word	.L280
	.word	.L281
	.word	.L281
	.word	.L281
	.word	.L281
	.word	.L281
	.word	.L281
	.word	.L282
	.word	.L283
	.word	.L283
	.word	.L283
	.word	.L283
	.word	.L283
	.word	.L283
	.word	.L283
	.word	.L283
	.word	.L283
	.word	.L283
	.word	.L283
	.word	.L283
	.word	.L283
	.word	.L283
	.word	.L283
	.word	.L283
	.word	.L283
	.word	.L283
	.word	.L284
	.word	.L284
	.word	.L284
	.word	.L285
	.word	.L286
	.word	.L287
	.word	.L288
	.word	.L289
	.word	.L290
	.word	.L291
	.word	.L292
	.word	.L293
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L294
	.word	.L295
	.word	.L296
	.word	.L296
	.word	.L296
	.word	.L271
	.word	.L271
	.word	.L271
	.word	.L271
	.word	.L271
	.word	.L271
	.word	.L271
	.word	.L271
	.word	.L271
	.word	.L271
	.word	.L271
	.word	.L271
	.word	.L297
.L272:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #20]
	ldrh	r3, [fp, #-46]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	b	.L299
.L273:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2116
	ldrh	r3, [r3, r2]
	uxtb	r3, r3
	b	.L299
.L274:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2116
	ldrh	r3, [r3, r2]
	mov	r3, r3, asr #8
	uxtb	r3, r3
	uxtb	r3, r3
	and	r3, r3, #1
	movw	r2, #:lower16:PPU
	movt	r2, #:upper16:PPU
	ldrb	r2, [r2, #2114]	@ zero_extendqisi2
	mov	r2, r2, asl #7
	uxtb	r1, r2
	mov	r2, r3
	mov	r3, r1
	orr	r3, r2, r3
	uxtb	r3, r3
	uxtb	r3, r3
	b	.L299
.L275:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #20]
	ldrh	r3, [fp, #-46]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	b	.L299
.L276:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #20]
	ldrh	r3, [fp, #-46]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	b	.L299
.L277:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #20]
	ldrh	r3, [fp, #-46]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	b	.L299
.L278:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r3, [r3, #6]
	uxtb	r3, r3
	b	.L299
.L279:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r3, [r3, #6]
	mov	r3, r3, asr #8
	uxtb	r3, r3
	b	.L299
.L280:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #20]
	ldrh	r3, [fp, #-46]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	b	.L299
.L281:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #20]
	ldrh	r3, [fp, #-46]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	b	.L299
.L282:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2148]	@ zero_extendqisi2
	b	.L299
.L283:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #20]
	ldrh	r3, [fp, #-46]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	b	.L299
.L284:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2770]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L300
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2134
	ldrh	r3, [r3, r2]
	sxth	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r1, #2136
	ldrh	r3, [r3, r1]
	sxth	r3, r3
	mov	r3, r3, asr #8
	mul	r3, r3, r2
	str	r3, [fp, #-40]
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #8448
	add	r3, r3, #52
	ldr	r2, [fp, #-40]
	uxtb	r2, r2
	strb	r2, [r3, #0]
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #8448
	add	r3, r3, #53
	ldr	r2, [fp, #-40]
	mov	r2, r2, asr #8
	uxtb	r2, r2
	strb	r2, [r3, #0]
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #8448
	add	r3, r3, #54
	ldr	r2, [fp, #-40]
	mov	r2, r2, asr #16
	uxtb	r2, r2
	strb	r2, [r3, #0]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2770]
.L300:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #20]
	ldrh	r3, [fp, #-46]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	b	.L299
.L285:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #1
	strb	r2, [r3, #2132]
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	ldr	r3, [r3, #52]
	uxth	r1, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2126
	strh	r1, [r3, r2]	@ movhi
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	ldr	r3, [r3, #28]
	movw	r2, #342
	mul	r2, r2, r3
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldr	r3, [r3, #4]
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_idiv
	mov	r3, r0
	uxth	r1, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #2128
	strh	r1, [r3, r2]	@ movhi
	movw	r3, #:lower16:SNESGameFixes
	movt	r3, #:upper16:SNESGameFixes
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L301
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2131]
.L301:
	mov	r3, #0
	b	.L299
.L286:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2169]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L302
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2116
	ldrh	r3, [r3, r2]
	mov	r1, r3, asl #1
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2168
	add	r3, r1, r3
	add	r3, r3, r2
	ldrb	r3, [r3, #2]
	strb	r3, [fp, #-41]
	b	.L303
.L302:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2116
	ldrh	r3, [r3, r2]
	mov	r3, r3, asl #1
	add	r1, r3, #1
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2168
	add	r3, r1, r3
	add	r3, r3, r2
	ldrb	r3, [r3, #2]
	strb	r3, [fp, #-41]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2116
	ldrh	r3, [r3, r2]
	add	r3, r3, #1
	uxth	r1, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2116
	strh	r1, [r3, r2]	@ movhi
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2116
	ldrh	r2, [r3, r2]
	movw	r3, #271
	cmp	r2, r3
	movls	r3, #0
	movhi	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L303
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2116
	mov	r1, #0
	strh	r1, [r3, r2]	@ movhi
.L303:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2169]	@ zero_extendqisi2
	eor	r3, r3, #1
	uxtb	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2169]
	ldrb	r3, [fp, #-41]	@ zero_extendqisi2
	b	.L299
.L287:
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	ldrb	r3, [r3, #52]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L304
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #8]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r3, [r3, #6]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrb	r3, [r3, #0]
	strb	r3, [fp, #-41]
	b	.L305
.L304:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r3, [r3, #10]
	cmp	r3, #0
	beq	.L306
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r3, [r3, #6]
	sub	r3, r3, #1
	str	r3, [fp, #-36]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r3, [r3, #8]
	mov	r2, r3
	ldr	r3, [fp, #-36]
	and	r3, r2, r3
	str	r3, [fp, #-32]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r3, [r3, #8]
	mvn	r3, r3
	mov	r2, r3
	ldr	r3, [fp, #-36]
	and	r2, r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r3, [r3, #12]
	ldr	r1, [fp, #-32]
	mov	r3, r1, lsr r3
	add	r2, r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r3, [r3, #10]
	sub	r3, r3, #1
	mov	r1, r3
	ldr	r3, [fp, #-32]
	and	r3, r1, r3
	mov	r3, r3, asl #3
	add	r3, r2, r3
	str	r3, [fp, #-28]
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-28]
	mov	r3, r3, asl #1
	sub	r3, r3, #2
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r2, r3
	ldrb	r3, [r3, #0]
	strb	r3, [fp, #-41]
	b	.L305
.L306:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #8]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r3, [r3, #6]
	mov	r3, r3, asl #1
	sub	r3, r3, #2
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r2, r3
	ldrb	r3, [r3, #0]
	strb	r3, [fp, #-41]
.L305:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L345
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r2, [r3, #6]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #5]	@ zero_extendqisi2
	add	r3, r2, r3
	uxth	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strh	r2, [r3, #6]	@ movhi
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	mov	r2, #0
	strb	r2, [r3, #52]
	b	.L271
.L288:
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	ldrb	r3, [r3, #52]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L308
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #8]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r3, [r3, #6]
	mov	r3, r3, asl #1
	add	r3, r3, #1
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r2, r3
	ldrb	r3, [r3, #0]
	strb	r3, [fp, #-41]
	b	.L309
.L308:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r3, [r3, #10]
	cmp	r3, #0
	beq	.L310
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r3, [r3, #6]
	sub	r3, r3, #1
	str	r3, [fp, #-24]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r3, [r3, #8]
	mov	r2, r3
	ldr	r3, [fp, #-24]
	and	r3, r2, r3
	str	r3, [fp, #-20]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r3, [r3, #8]
	mvn	r3, r3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	and	r2, r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r3, [r3, #12]
	ldr	r1, [fp, #-20]
	mov	r3, r1, lsr r3
	add	r2, r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r3, [r3, #10]
	sub	r3, r3, #1
	mov	r1, r3
	ldr	r3, [fp, #-20]
	and	r3, r1, r3
	mov	r3, r3, asl #3
	add	r3, r2, r3
	str	r3, [fp, #-16]
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #1
	sub	r3, r3, #1
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r2, r3
	ldrb	r3, [r3, #0]
	strb	r3, [fp, #-41]
	b	.L309
.L310:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #8]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r3, [r3, #6]
	mov	r3, r3, asl #1
	sub	r3, r3, #1
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r2, r3
	ldrb	r3, [r3, #0]
	strb	r3, [fp, #-41]
.L309:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L346
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrh	r2, [r3, #6]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #5]	@ zero_extendqisi2
	add	r3, r2, r3
	uxth	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strh	r2, [r3, #6]	@ movhi
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	mov	r2, #0
	strb	r2, [r3, #52]
	b	.L271
.L289:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2767]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L312
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r2, [r3, #2148]	@ zero_extendqisi2
	mov	r1, r2
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	add	r1, r1, #32
	mov	r1, r1, asl #1
	add	r3, r1, r3
	ldrh	r3, [r3, #0]
	mov	r3, r3, asr #8
	strb	r3, [fp, #-41]
	add	r3, r2, #1
	uxtb	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2148]
	b	.L313
.L312:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2148]	@ zero_extendqisi2
	mov	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	add	r2, r2, #32
	mov	r2, r2, asl #1
	add	r3, r2, r3
	ldrh	r3, [r3, #0]
	strb	r3, [fp, #-41]
.L313:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2767]	@ zero_extendqisi2
	eor	r3, r3, #1
	uxtb	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2767]
	ldrb	r3, [fp, #-41]	@ zero_extendqisi2
	b	.L299
.L290:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2130]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L314
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #2128
	ldrh	r3, [r3, r2]
	mov	r3, r3, asr #8
	strb	r3, [fp, #-41]
	b	.L315
.L314:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #2128
	ldrh	r3, [r3, r2]
	strb	r3, [fp, #-41]
.L315:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2130]	@ zero_extendqisi2
	eor	r3, r3, #1
	uxtb	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2130]
	b	.L271
.L291:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2131]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L316
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2126
	ldrh	r3, [r3, r2]
	mov	r3, r3, asr #8
	strb	r3, [fp, #-41]
	b	.L317
.L316:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2126
	ldrh	r3, [r3, r2]
	strb	r3, [fp, #-41]
.L317:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2131]	@ zero_extendqisi2
	eor	r3, r3, #1
	uxtb	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2131]
	b	.L271
.L292:
	movw	r3, #:lower16:SNESGameFixes
	movt	r3, #:upper16:SNESGameFixes
	ldrb	r3, [r3, #5]	@ zero_extendqisi2
	b	.L299
.L293:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2130]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r2, [r3, #2130]	@ zero_extendqisi2
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2131]
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldrb	r3, [r3, #29]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L318
	mov	r2, #16
	b	.L319
.L318:
	mov	r2, #0
.L319:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #8448
	add	r3, r3, #63
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	uxtb	r3, r3
	and	r3, r3, #192
	orr	r3, r2, r3
	uxtb	r3, r3
	uxtb	r3, r3
	b	.L299
.L294:
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L320
	movw	r3, #:lower16:SNESGameFixes
	movt	r3, #:upper16:SNESGameFixes
	ldrb	r3, [r3, #3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L321
	ldrh	r2, [fp, #-46]
	movw	r3, #8511
	cmp	r2, r3
	bls	.L321
	ldrh	r2, [fp, #-46]
	movw	r3, #8515
	cmp	r2, r3
	bhi	.L321
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	ldr	r3, [r3, #52]
	cmp	r3, #0
	bne	.L321
	ldrh	r3, [fp, #-46]
	and	r3, r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L322
	bl	rand
	mov	r3, r0
	and	r3, r3, #65280
	mov	r3, r3, asr #8
	uxtb	r3, r3
	b	.L323
.L322:
	bl	rand
	mov	r3, r0
	uxtb	r3, r3
.L323:
	b	.L299
.L321:
	ldrh	r3, [fp, #-46]
	and	r1, r3, #3
	movw	r3, #:lower16:APU
	movt	r3, #:upper16:APU
	mov	r2, #7
	add	r3, r3, r1
	add	r3, r3, r2
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	b	.L299
.L320:
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L324
.L328:
	.word	.L325
	.word	.L325
	.word	.L324
	.word	.L327
.L325:
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	mov	r2, #1
	strb	r2, [r3, #4]
	b	.L324
.L327:
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	mov	r2, #1
	strb	r2, [r3, #4]
.L324:
	ldrh	r3, [fp, #-46]
	and	r3, r3, #3
	cmp	r3, #1
	bgt	.L329
	bl	rand
	mov	r3, r0
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	and	r3, r3, #2
	cmp	r3, #0
	beq	.L347
	ldr	r3, [fp, #-12]
	and	r3, r3, #4
	cmp	r3, #0
	beq	.L331
	ldrh	r3, [fp, #-46]
	and	r3, r3, #3
	cmp	r3, #1
	bne	.L332
	mov	r3, #170
	b	.L333
.L332:
	mov	r3, #187
.L333:
	b	.L299
.L331:
	ldr	r3, [fp, #-12]
	mov	r3, r3, asr #3
	uxtb	r3, r3
	b	.L299
.L329:
	bl	rand
	mov	r3, r0
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	and	r3, r3, #2
	cmp	r3, #0
	beq	.L334
	ldr	r3, [fp, #-8]
	mov	r3, r3, asr #3
	uxtb	r3, r3
	b	.L299
.L347:
	mov	r0, r0	@ nop
.L334:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #20]
	ldrh	r3, [fp, #-46]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	b	.L299
.L295:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #0]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldr	r3, [r3, #2156]
	add	r2, r2, r3
	ldrb	r2, [r2, #0]
	strb	r2, [fp, #-41]
	add	r2, r3, #1
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	str	r2, [r3, #2156]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldr	r3, [r3, #2156]
	bic	r2, r3, #-16777216
	bic	r2, r2, #16646144
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	str	r2, [r3, #2156]
	b	.L271
.L296:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #20]
	ldrh	r3, [fp, #-46]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	b	.L299
.L297:
	mov	r3, #1
	b	.L299
.L345:
	mov	r0, r0	@ nop
	b	.L271
.L346:
	mov	r0, r0	@ nop
.L271:
	ldrb	r3, [fp, #-41]	@ zero_extendqisi2
	b	.L299
.L270:
	ldrh	r2, [fp, #-46]
	movw	r3, #12287
	cmp	r2, r3
	bls	.L335
	ldrh	r2, [fp, #-46]
	movw	r3, #13055
	cmp	r2, r3
	bls	.L336
.L335:
	ldrh	r3, [fp, #-46]
	movw	r2, #8643
	cmp	r3, r2
	beq	.L339
	cmp	r3, #10240
	beq	.L340
	movw	r2, #8642
	cmp	r3, r2
	bne	.L337
.L338:
	mov	r3, #32
	b	.L299
.L339:
	mov	r3, #0
	b	.L299
.L340:
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldrb	r3, [r3, #68]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L337
	ldrh	r3, [fp, #-46]
	mov	r0, r3
	bl	_Z10S9xGetSRTCt
	mov	r3, r0
	b	.L299
.L337:
	mov	r3, #0
	b	.L299
.L336:
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldrb	r3, [r3, #80]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L341
	mov	r3, #48
	b	.L299
.L341:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #20]
	ldrh	r3, [fp, #-46]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]
	strb	r3, [fp, #-41]
	ldrh	r2, [fp, #-46]
	movw	r3, #12336
	cmp	r2, r3
	bne	.L342
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	ldr	r2, [r3, #36]
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	str	r2, [r3, #40]
	b	.L343
.L342:
	ldrh	r2, [fp, #-46]
	movw	r3, #12337
	cmp	r2, r3
	bne	.L343
	mov	r0, #4
	bl	_ZL16CLEAR_IRQ_SOURCEj
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #12288
	add	r3, r3, #49
	ldrb	r2, [fp, #-41]	@ zero_extendqisi2
	and	r2, r2, #127
	strb	r2, [r3, #0]
.L343:
	ldrb	r3, [fp, #-41]	@ zero_extendqisi2
.L299:
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.fnend
	.size	S9xGetPPU, .-S9xGetPPU
	.global	__aeabi_idivmod
	.align	2
	.global	S9xSetCPU
	.type	S9xSetCPU, %function
S9xSetCPU:
	.fnstart
.LFB32:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	.pad #24
	sub	sp, sp, #24
	mov	r2, r0
	mov	r3, r1
	strb	r2, [fp, #-21]
	strh	r3, [fp, #-24]	@ movhi
	ldrh	r2, [fp, #-24]
	movw	r3, #16895
	cmp	r2, r3
	bhi	.L349
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	ldr	r3, [r3, #28]
	add	r2, r3, #6
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	str	r2, [r3, #28]
	ldrh	r2, [fp, #-24]
	movw	r3, #16406
	cmp	r2, r3
	bne	.L458
.L351:
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	and	r3, r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L459
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #20]
	ldrh	r3, [fp, #-24]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	and	r3, r3, #1
	uxtb	r3, r3
	eor	r3, r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L460
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2146]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2147]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2771]
	b	.L352
.L349:
	ldrh	r3, [fp, #-24]
	movw	r2, #17201
	cmp	r3, r2
	beq	.L371
	movw	r2, #17201
	cmp	r3, r2
	bgt	.L383
	movw	r2, #17157
	cmp	r3, r2
	beq	.L375
	movw	r2, #17157
	cmp	r3, r2
	bgt	.L384
	movw	r2, #16909
	cmp	r3, r2
	beq	.L364
	movw	r2, #16909
	cmp	r3, r2
	bgt	.L385
	movw	r2, #16902
	cmp	r3, r2
	beq	.L357
	movw	r2, #16902
	cmp	r3, r2
	bgt	.L386
	movw	r2, #16898
	cmp	r3, r2
	bgt	.L387
	movw	r2, #16897
	cmp	r3, r2
	bge	.L461
	cmp	r3, #16896
	beq	.L353
	b	.L352
.L387:
	movw	r2, #16899
	cmp	r3, r2
	beq	.L355
	b	.L352
.L386:
	movw	r2, #16905
	cmp	r3, r2
	beq	.L360
	movw	r2, #16905
	cmp	r3, r2
	bgt	.L388
	movw	r2, #16903
	cmp	r3, r2
	beq	.L358
	movw	r2, #16904
	cmp	r3, r2
	beq	.L359
	b	.L352
.L388:
	movw	r2, #16907
	cmp	r3, r2
	beq	.L362
	movw	r2, #16907
	cmp	r3, r2
	bgt	.L363
	b	.L456
.L385:
	movw	r2, #16927
	cmp	r3, r2
	bgt	.L389
	movw	r2, #16920
	cmp	r3, r2
	bge	.L462
	movw	r2, #16912
	cmp	r3, r2
	beq	.L366
	movw	r2, #16912
	cmp	r3, r2
	blt	.L463
	movw	r2, #16913
	cmp	r3, r2
	beq	.L367
	b	.L455
.L389:
	movw	r2, #17154
	cmp	r3, r2
	beq	.L372
	movw	r2, #17154
	cmp	r3, r2
	bgt	.L390
	cmp	r3, #17152
	beq	.L370
	movw	r2, #17153
	cmp	r3, r2
	beq	.L371
	b	.L352
.L390:
	movw	r2, #17155
	cmp	r3, r2
	beq	.L373
	movw	r2, #17156
	cmp	r3, r2
	beq	.L374
	b	.L352
.L384:
	movw	r2, #17176
	cmp	r3, r2
	beq	.L378
	movw	r2, #17176
	cmp	r3, r2
	bgt	.L391
	movw	r2, #17169
	cmp	r3, r2
	beq	.L371
	movw	r2, #17169
	cmp	r3, r2
	bgt	.L392
	movw	r2, #17160
	cmp	r3, r2
	beq	.L378
	movw	r2, #17160
	cmp	r3, r2
	bgt	.L393
	movw	r2, #17158
	cmp	r3, r2
	beq	.L376
	movw	r2, #17159
	cmp	r3, r2
	beq	.L377
	b	.L352
.L393:
	movw	r2, #17162
	cmp	r3, r2
	beq	.L380
	movw	r2, #17162
	cmp	r3, r2
	blt	.L379
	movw	r2, #17168
	cmp	r3, r2
	beq	.L370
	b	.L352
.L392:
	movw	r2, #17172
	cmp	r3, r2
	beq	.L374
	movw	r2, #17172
	cmp	r3, r2
	bgt	.L394
	movw	r2, #17170
	cmp	r3, r2
	beq	.L372
	movw	r2, #17171
	cmp	r3, r2
	beq	.L373
	b	.L352
.L394:
	movw	r2, #17174
	cmp	r3, r2
	beq	.L376
	movw	r2, #17174
	cmp	r3, r2
	bgt	.L377
	b	.L375
.L391:
	movw	r2, #17188
	cmp	r3, r2
	beq	.L374
	movw	r2, #17188
	cmp	r3, r2
	bgt	.L395
	movw	r2, #17184
	cmp	r3, r2
	beq	.L370
	movw	r2, #17184
	cmp	r3, r2
	bgt	.L396
	movw	r2, #17177
	cmp	r3, r2
	beq	.L379
	movw	r2, #17178
	cmp	r3, r2
	beq	.L380
	b	.L352
.L396:
	movw	r2, #17186
	cmp	r3, r2
	beq	.L372
	movw	r2, #17186
	cmp	r3, r2
	bgt	.L373
	b	.L371
.L395:
	movw	r2, #17192
	cmp	r3, r2
	beq	.L378
	movw	r2, #17192
	cmp	r3, r2
	bgt	.L397
	movw	r2, #17190
	cmp	r3, r2
	beq	.L376
	movw	r2, #17190
	cmp	r3, r2
	bgt	.L377
	b	.L375
.L397:
	movw	r2, #17194
	cmp	r3, r2
	beq	.L380
	movw	r2, #17194
	cmp	r3, r2
	blt	.L379
	movw	r2, #17200
	cmp	r3, r2
	beq	.L370
	b	.L352
.L383:
	movw	r2, #17240
	cmp	r3, r2
	beq	.L378
	movw	r2, #17240
	cmp	r3, r2
	bgt	.L398
	movw	r2, #17220
	cmp	r3, r2
	beq	.L374
	movw	r2, #17220
	cmp	r3, r2
	bgt	.L399
	movw	r2, #17208
	cmp	r3, r2
	beq	.L378
	movw	r2, #17208
	cmp	r3, r2
	bgt	.L400
	movw	r2, #17204
	cmp	r3, r2
	beq	.L374
	movw	r2, #17204
	cmp	r3, r2
	bgt	.L401
	movw	r2, #17202
	cmp	r3, r2
	beq	.L372
	movw	r2, #17203
	cmp	r3, r2
	beq	.L373
	b	.L352
.L401:
	movw	r2, #17206
	cmp	r3, r2
	beq	.L376
	movw	r2, #17206
	cmp	r3, r2
	bgt	.L377
	b	.L375
.L400:
	movw	r2, #17216
	cmp	r3, r2
	beq	.L370
	movw	r2, #17216
	cmp	r3, r2
	bgt	.L402
	movw	r2, #17209
	cmp	r3, r2
	beq	.L379
	movw	r2, #17210
	cmp	r3, r2
	beq	.L380
	b	.L352
.L402:
	movw	r2, #17218
	cmp	r3, r2
	beq	.L372
	movw	r2, #17218
	cmp	r3, r2
	bgt	.L373
	b	.L371
.L399:
	movw	r2, #17232
	cmp	r3, r2
	beq	.L370
	movw	r2, #17232
	cmp	r3, r2
	bgt	.L403
	movw	r2, #17223
	cmp	r3, r2
	beq	.L377
	movw	r2, #17223
	cmp	r3, r2
	bgt	.L404
	movw	r2, #17221
	cmp	r3, r2
	beq	.L375
	movw	r2, #17222
	cmp	r3, r2
	beq	.L376
	b	.L352
.L404:
	movw	r2, #17225
	cmp	r3, r2
	beq	.L379
	movw	r2, #17225
	cmp	r3, r2
	blt	.L378
	movw	r2, #17226
	cmp	r3, r2
	beq	.L380
	b	.L352
.L403:
	movw	r2, #17236
	cmp	r3, r2
	beq	.L374
	movw	r2, #17236
	cmp	r3, r2
	bgt	.L405
	movw	r2, #17234
	cmp	r3, r2
	beq	.L372
	movw	r2, #17234
	cmp	r3, r2
	bgt	.L373
	b	.L371
.L405:
	movw	r2, #17238
	cmp	r3, r2
	beq	.L376
	movw	r2, #17238
	cmp	r3, r2
	bgt	.L377
	b	.L375
.L398:
	movw	r2, #17264
	cmp	r3, r2
	beq	.L370
	movw	r2, #17264
	cmp	r3, r2
	bgt	.L406
	movw	r2, #17252
	cmp	r3, r2
	beq	.L374
	movw	r2, #17252
	cmp	r3, r2
	bgt	.L407
	movw	r2, #17248
	cmp	r3, r2
	beq	.L370
	movw	r2, #17248
	cmp	r3, r2
	bgt	.L408
	movw	r2, #17241
	cmp	r3, r2
	beq	.L379
	movw	r2, #17242
	cmp	r3, r2
	beq	.L380
	b	.L352
.L408:
	movw	r2, #17250
	cmp	r3, r2
	beq	.L372
	movw	r2, #17250
	cmp	r3, r2
	bgt	.L373
	b	.L371
.L407:
	movw	r2, #17255
	cmp	r3, r2
	beq	.L377
	movw	r2, #17255
	cmp	r3, r2
	bgt	.L409
	movw	r2, #17253
	cmp	r3, r2
	beq	.L375
	movw	r2, #17254
	cmp	r3, r2
	beq	.L376
	b	.L352
.L409:
	movw	r2, #17257
	cmp	r3, r2
	beq	.L379
	movw	r2, #17257
	cmp	r3, r2
	blt	.L378
	movw	r2, #17258
	cmp	r3, r2
	beq	.L380
	b	.L352
.L406:
	movw	r2, #17271
	cmp	r3, r2
	beq	.L377
	movw	r2, #17271
	cmp	r3, r2
	bgt	.L410
	movw	r2, #17267
	cmp	r3, r2
	beq	.L373
	movw	r2, #17267
	cmp	r3, r2
	bgt	.L411
	movw	r2, #17265
	cmp	r3, r2
	beq	.L371
	movw	r2, #17266
	cmp	r3, r2
	beq	.L372
	b	.L352
.L411:
	movw	r2, #17269
	cmp	r3, r2
	beq	.L375
	movw	r2, #17269
	cmp	r3, r2
	bgt	.L376
	b	.L374
.L410:
	movw	r2, #18435
	cmp	r3, r2
	bgt	.L412
	cmp	r3, #18432
	bge	.L464
	movw	r2, #17273
	cmp	r3, r2
	beq	.L379
	movw	r2, #17273
	cmp	r3, r2
	blt	.L378
	movw	r2, #17274
	cmp	r3, r2
	beq	.L380
	b	.L352
.L412:
	movw	r2, #18439
	cmp	r3, r2
	bgt	.L352
	b	.L457
.L353:
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	and	r3, r3, #32
	cmp	r3, #0
	beq	.L413
	movw	r3, #:lower16:SNESGameFixes
	movt	r3, #:upper16:SNESGameFixes
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L414
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2122
	ldrh	r3, [r3, r2]
	cmp	r3, #208
	bhi	.L413
.L414:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2714]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L465
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #1
	strb	r2, [r3, #2714]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2715]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L416
	bl	_Z15S9xUpdateHTimerv
	b	.L417
.L416:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2122
	ldrh	r3, [r3, r2]
	mov	r2, r3
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	ldr	r3, [r3, #52]
	cmp	r2, r3
	bne	.L466
	mov	r0, #2
	bl	S9xSetIRQ
	b	.L417
.L413:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2714]
	movw	r3, #:lower16:SNESGameFixes
	movt	r3, #:upper16:SNESGameFixes
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L417
	ldrb	r3, [fp, #-21]
	bic	r3, r3, #32
	strb	r3, [fp, #-21]
	b	.L417
.L465:
	mov	r0, r0	@ nop
	b	.L417
.L466:
	mov	r0, r0	@ nop
.L417:
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	and	r3, r3, #16
	cmp	r3, #0
	beq	.L418
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2715]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L467
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #1
	strb	r2, [r3, #2715]
	bl	_Z15S9xUpdateHTimerv
	b	.L420
.L418:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2715]
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldr	r3, [r3, #4]
	uxth	r3, r3
	add	r3, r3, #1
	uxth	r3, r3
	mov	r1, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2716
	strh	r1, [r3, r2]	@ movhi
	b	.L420
.L467:
	mov	r0, r0	@ nop
.L420:
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldrb	r3, [r3, #294]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L421
	mov	r0, #3
	bl	_ZL16CLEAR_IRQ_SOURCEj
.L421:
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	sxtb	r3, r3
	cmp	r3, #0
	bge	.L468
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #16896
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	sxtb	r3, r3
	cmp	r3, #0
	blt	.L469
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	ldr	r2, [r3, #52]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r1, #2154
	ldrh	r3, [r3, r1]
	add	r3, r3, #1
	cmp	r2, r3
	blt	.L470
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	ldr	r2, [r3, #52]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r1, #2154
	ldrh	r3, [r3, r1]
	mov	r1, r3
	movw	r3, #:lower16:SNESGameFixes
	movt	r3, #:upper16:SNESGameFixes
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L423
	mov	r3, #25
	b	.L424
.L423:
	mov	r3, #15
.L424:
	add	r3, r1, r3
	cmp	r2, r3
	bgt	.L471
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #16896
	add	r3, r3, #16
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	sxtb	r3, r3
	cmp	r3, #0
	bge	.L472
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	ldrb	r3, [r3, #5]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L473
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	ldr	r3, [r3, #0]
	orr	r2, r3, #128
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	str	r2, [r3, #0]
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	mov	r2, #1
	strb	r2, [r3, #5]
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	ldr	r2, [r3, #72]
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	str	r2, [r3, #76]
	b	.L352
.L355:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #16896
	add	r3, r3, #2
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldrb	r2, [fp, #-21]	@ zero_extendqisi2
	mul	r3, r2, r3
	str	r3, [fp, #-16]
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #16896
	add	r3, r3, #22
	ldr	r2, [fp, #-16]
	uxtb	r2, r2
	strb	r2, [r3, #0]
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #16896
	add	r3, r3, #23
	ldr	r2, [fp, #-16]
	mov	r2, r2, lsr #8
	uxtb	r2, r2
	strb	r2, [r3, #0]
	b	.L352
.L357:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #16896
	add	r3, r3, #4
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #16896
	add	r3, r3, #5
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r3, r3, asl #8
	uxth	r3, r3
	add	r3, r2, r3
	strh	r3, [fp, #-10]	@ movhi
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L425
	ldrh	r2, [fp, #-10]
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_idiv
	mov	r3, r0
	uxth	r3, r3
	b	.L426
.L425:
	movw	r3, #65535
.L426:
	strh	r3, [fp, #-8]	@ movhi
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L427
	ldrh	r2, [fp, #-10]
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_idivmod
	mov	r3, r1
	uxth	r3, r3
	b	.L428
.L427:
	ldrh	r3, [fp, #-10]
.L428:
	strh	r3, [fp, #-6]	@ movhi
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #16896
	add	r3, r3, #20
	ldrh	r2, [fp, #-8]	@ movhi
	uxtb	r2, r2
	strb	r2, [r3, #0]
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #16896
	add	r3, r3, #21
	ldrh	r2, [fp, #-8]
	mov	r2, r2, asr #8
	uxtb	r2, r2
	strb	r2, [r3, #0]
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #16896
	add	r3, r3, #22
	ldrh	r2, [fp, #-6]	@ movhi
	uxtb	r2, r2
	strb	r2, [r3, #0]
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #16896
	add	r3, r3, #23
	ldrh	r2, [fp, #-6]
	mov	r2, r2, asr #8
	uxtb	r2, r2
	strb	r2, [r3, #0]
	b	.L352
.L358:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2124
	ldrh	r3, [r3, r2]
	str	r3, [fp, #-20]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2124
	ldrh	r3, [r3, r2]
	uxth	r3, r3
	and	r3, r3, #65280
	ldrb	r1, [fp, #-21]	@ zero_extendqisi2
	mov	r2, r3	@ movhi
	mov	r3, r1	@ movhi
	orr	r3, r2, r3
	uxth	r3, r3
	uxth	r1, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2124
	strh	r1, [r3, r2]	@ movhi
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2715]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L474
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2124
	ldrh	r3, [r3, r2]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	beq	.L475
	bl	_Z15S9xUpdateHTimerv
	b	.L352
.L359:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2124
	ldrh	r3, [r3, r2]
	str	r3, [fp, #-20]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2124
	ldrh	r3, [r3, r2]
	uxth	r3, r3
	and	r3, r3, #255
	ldrb	r2, [fp, #-21]	@ zero_extendqisi2
	and	r2, r2, #1
	mov	r2, r2, asl #8
	uxth	r1, r2
	mov	r2, r3	@ movhi
	mov	r3, r1	@ movhi
	orr	r3, r2, r3
	uxth	r3, r3
	uxth	r1, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2124
	strh	r1, [r3, r2]	@ movhi
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2715]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L476
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2124
	ldrh	r3, [r3, r2]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	beq	.L477
	bl	_Z15S9xUpdateHTimerv
	b	.L352
.L360:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2122
	ldrh	r3, [r3, r2]
	str	r3, [fp, #-20]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2122
	ldrh	r3, [r3, r2]
	uxth	r3, r3
	and	r3, r3, #65280
	ldrb	r1, [fp, #-21]	@ zero_extendqisi2
	mov	r2, r3	@ movhi
	mov	r3, r1	@ movhi
	orr	r3, r2, r3
	uxth	r3, r3
	uxth	r1, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2122
	strh	r1, [r3, r2]	@ movhi
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2714]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L478
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2122
	ldrh	r3, [r3, r2]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	beq	.L479
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2715]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L432
	bl	_Z15S9xUpdateHTimerv
	b	.L352
.L432:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2122
	ldrh	r3, [r3, r2]
	mov	r2, r3
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	ldr	r3, [r3, #52]
	cmp	r2, r3
	bne	.L480
	mov	r0, #2
	bl	S9xSetIRQ
	b	.L352
.L456:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2122
	ldrh	r3, [r3, r2]
	str	r3, [fp, #-20]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2122
	ldrh	r3, [r3, r2]
	uxth	r3, r3
	and	r3, r3, #255
	ldrb	r2, [fp, #-21]	@ zero_extendqisi2
	and	r2, r2, #1
	mov	r2, r2, asl #8
	uxth	r1, r2
	mov	r2, r3	@ movhi
	mov	r3, r1	@ movhi
	orr	r3, r2, r3
	uxth	r3, r3
	uxth	r1, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2122
	strh	r1, [r3, r2]	@ movhi
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2714]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L481
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2122
	ldrh	r3, [r3, r2]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	beq	.L482
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2715]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L434
	bl	_Z15S9xUpdateHTimerv
	b	.L352
.L434:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2122
	ldrh	r3, [r3, r2]
	mov	r2, r3
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	ldr	r3, [r3, #52]
	cmp	r2, r3
	bne	.L483
	mov	r0, #2
	bl	S9xSetIRQ
	b	.L352
.L362:
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	and	r3, r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L435
	mov	r0, #0
	bl	S9xDoDMA
.L435:
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	and	r3, r3, #2
	cmp	r3, #0
	beq	.L436
	mov	r0, #1
	bl	S9xDoDMA
.L436:
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	and	r3, r3, #4
	cmp	r3, #0
	beq	.L437
	mov	r0, #2
	bl	S9xDoDMA
.L437:
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	and	r3, r3, #8
	cmp	r3, #0
	beq	.L438
	mov	r0, #3
	bl	S9xDoDMA
.L438:
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	and	r3, r3, #16
	cmp	r3, #0
	beq	.L439
	mov	r0, #4
	bl	S9xDoDMA
.L439:
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	and	r3, r3, #32
	cmp	r3, #0
	beq	.L440
	mov	r0, #5
	bl	S9xDoDMA
.L440:
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	and	r3, r3, #64
	cmp	r3, #0
	beq	.L441
	mov	r0, #6
	bl	S9xDoDMA
.L441:
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	sxtb	r3, r3
	cmp	r3, #0
	bge	.L484
	mov	r0, #7
	bl	S9xDoDMA
	b	.L352
.L363:
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldrb	r3, [r3, #122]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L443
	mov	r3, #0
	strb	r3, [fp, #-21]
.L443:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #16896
	add	r3, r3, #12
	ldrb	r2, [fp, #-21]
	strb	r2, [r3, #0]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	ldrb	r2, [fp, #-21]
	strb	r2, [r3, #1]
	b	.L352
.L364:
	ldrb	r2, [fp, #-21]	@ zero_extendqisi2
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #16896
	add	r3, r3, #13
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	eor	r3, r2, r3
	and	r3, r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L485
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	and	r3, r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L444
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	mov	r2, #6
	str	r2, [r3, #64]
	b	.L445
.L444:
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	mov	r2, #8
	str	r2, [r3, #64]
.L445:
	movw	r0, #:lower16:Memory
	movt	r0, #:upper16:Memory
	bl	_ZN7CMemory11FixROMSpeedEv
	b	.L352
.L366:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #16896
	add	r3, r3, #16
	mov	r2, #0
	strb	r2, [r3, #0]
	b	.L455
.L367:
	mov	r0, #3
	bl	_ZL16CLEAR_IRQ_SOURCEj
	b	.L352
.L370:
	ldrh	r3, [fp, #-24]
	mov	r3, r3, asr #4
	and	r3, r3, #7
	str	r3, [fp, #-20]
	ldr	r1, [fp, #-20]
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	sxtb	r3, r3
	cmp	r3, #0
	bge	.L447
	mov	r2, #1
	b	.L448
.L447:
	mov	r2, #0
.L448:
	movw	r3, #:lower16:DMA
	movt	r3, #:upper16:DMA
	mov	r0, #22
	mul	r1, r0, r1
	add	r3, r1, r3
	strb	r2, [r3, #0]
	ldr	r0, [fp, #-20]
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	and	r3, r3, #64
	cmp	r3, #0
	beq	.L449
	mov	r2, #1
	b	.L450
.L449:
	mov	r2, #0
.L450:
	movw	r3, #:lower16:DMA
	movt	r3, #:upper16:DMA
	mov	r1, #8
	mov	ip, #22
	mul	r0, ip, r0
	add	r3, r0, r3
	add	r3, r3, r1
	strb	r2, [r3, #6]
	ldr	r1, [fp, #-20]
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	and	r3, r3, #16
	cmp	r3, #0
	beq	.L451
	mov	r2, #1
	b	.L452
.L451:
	mov	r2, #0
.L452:
	movw	r3, #:lower16:DMA
	movt	r3, #:upper16:DMA
	mov	r0, #22
	mul	r1, r0, r1
	add	r3, r1, r3
	strb	r2, [r3, #2]
	ldr	r1, [fp, #-20]
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	and	r3, r3, #8
	cmp	r3, #0
	beq	.L453
	mov	r2, #1
	b	.L454
.L453:
	mov	r2, #0
.L454:
	movw	r3, #:lower16:DMA
	movt	r3, #:upper16:DMA
	mov	r0, #22
	mul	r1, r0, r1
	add	r3, r1, r3
	strb	r2, [r3, #1]
	ldr	r1, [fp, #-20]
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	and	r3, r3, #7
	movw	r2, #:lower16:DMA
	movt	r2, #:upper16:DMA
	mov	r0, #22
	mul	r1, r0, r1
	add	r2, r1, r2
	strb	r3, [r2, #3]
	b	.L352
.L371:
	ldrh	r3, [fp, #-24]
	mov	r3, r3, asr #4
	and	r1, r3, #7
	movw	r3, #:lower16:DMA
	movt	r3, #:upper16:DMA
	mov	r2, #8
	mov	r0, #22
	mul	r1, r0, r1
	add	r3, r1, r3
	add	r3, r3, r2
	ldrb	r2, [fp, #-21]
	strb	r2, [r3, #2]
	b	.L352
.L372:
	ldrh	r3, [fp, #-24]
	mov	r3, r3, asr #4
	and	r3, r3, #7
	str	r3, [fp, #-20]
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-20]
	movw	r3, #:lower16:DMA
	movt	r3, #:upper16:DMA
	mov	r2, #6
	mov	ip, #22
	mul	r1, ip, r1
	add	r3, r1, r3
	add	r3, r3, r2
	ldrh	r3, [r3, #0]
	and	r3, r3, #65280
	movw	r2, #:lower16:DMA
	movt	r2, #:upper16:DMA
	mov	r1, #6
	mov	ip, #22
	mul	r0, ip, r0
	add	r2, r0, r2
	add	r2, r2, r1
	strh	r3, [r2, #0]	@ movhi
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-20]
	movw	r3, #:lower16:DMA
	movt	r3, #:upper16:DMA
	mov	r2, #6
	mov	ip, #22
	mul	r1, ip, r1
	add	r3, r1, r3
	add	r3, r3, r2
	ldrh	r2, [r3, #0]
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	orr	r3, r2, r3
	uxth	r2, r3
	movw	r3, #:lower16:DMA
	movt	r3, #:upper16:DMA
	mov	r1, #6
	mov	ip, #22
	mul	r0, ip, r0
	add	r3, r0, r3
	add	r3, r3, r1
	strh	r2, [r3, #0]	@ movhi
	b	.L352
.L373:
	ldrh	r3, [fp, #-24]
	mov	r3, r3, asr #4
	and	r3, r3, #7
	str	r3, [fp, #-20]
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-20]
	movw	r3, #:lower16:DMA
	movt	r3, #:upper16:DMA
	mov	r2, #6
	mov	ip, #22
	mul	r1, ip, r1
	add	r3, r1, r3
	add	r3, r3, r2
	ldrh	r3, [r3, #0]
	and	r3, r3, #255
	movw	r2, #:lower16:DMA
	movt	r2, #:upper16:DMA
	mov	r1, #6
	mov	ip, #22
	mul	r0, ip, r0
	add	r2, r0, r2
	add	r2, r2, r1
	strh	r3, [r2, #0]	@ movhi
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-20]
	movw	r3, #:lower16:DMA
	movt	r3, #:upper16:DMA
	mov	r2, #6
	mov	ip, #22
	mul	r1, ip, r1
	add	r3, r1, r3
	add	r3, r3, r2
	ldrh	r3, [r3, #0]
	mov	r2, r3
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	mov	r3, r3, asl #8
	uxth	r3, r3
	orr	r3, r2, r3
	uxth	r3, r3
	uxth	r2, r3
	movw	r3, #:lower16:DMA
	movt	r3, #:upper16:DMA
	mov	r1, #6
	mov	ip, #22
	mul	r0, ip, r0
	add	r3, r0, r3
	add	r3, r3, r1
	strh	r2, [r3, #0]	@ movhi
	b	.L352
.L374:
	ldrh	r3, [fp, #-24]
	mov	r3, r3, asr #4
	and	r2, r3, #7
	movw	r3, #:lower16:DMA
	movt	r3, #:upper16:DMA
	mov	r1, #22
	mul	r2, r1, r2
	add	r3, r2, r3
	ldrb	r2, [fp, #-21]
	strb	r2, [r3, #4]
	b	.L352
.L375:
	ldrh	r3, [fp, #-24]
	mov	r3, r3, asr #4
	and	r3, r3, #7
	str	r3, [fp, #-20]
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-20]
	movw	r3, #:lower16:DMA
	movt	r3, #:upper16:DMA
	mov	r2, #12
	mov	ip, #22
	mul	r1, ip, r1
	add	r3, r1, r3
	add	r3, r3, r2
	ldrh	r3, [r3, #0]
	and	r3, r3, #65280
	movw	r2, #:lower16:DMA
	movt	r2, #:upper16:DMA
	mov	r1, #12
	mov	ip, #22
	mul	r0, ip, r0
	add	r2, r0, r2
	add	r2, r2, r1
	strh	r3, [r2, #0]	@ movhi
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-20]
	movw	r3, #:lower16:DMA
	movt	r3, #:upper16:DMA
	mov	r2, #12
	mov	ip, #22
	mul	r1, ip, r1
	add	r3, r1, r3
	add	r3, r3, r2
	ldrh	r2, [r3, #0]
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	orr	r3, r2, r3
	uxth	r2, r3
	movw	r3, #:lower16:DMA
	movt	r3, #:upper16:DMA
	mov	r1, #12
	mov	ip, #22
	mul	r0, ip, r0
	add	r3, r0, r3
	add	r3, r3, r1
	strh	r2, [r3, #0]	@ movhi
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-20]
	movw	r3, #:lower16:DMA
	movt	r3, #:upper16:DMA
	mov	r2, #16
	mov	ip, #22
	mul	r1, ip, r1
	add	r3, r1, r3
	add	r3, r3, r2
	ldrh	r3, [r3, #0]
	and	r3, r3, #65280
	movw	r2, #:lower16:DMA
	movt	r2, #:upper16:DMA
	mov	r1, #16
	mov	ip, #22
	mul	r0, ip, r0
	add	r2, r0, r2
	add	r2, r2, r1
	strh	r3, [r2, #0]	@ movhi
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-20]
	movw	r3, #:lower16:DMA
	movt	r3, #:upper16:DMA
	mov	r2, #16
	mov	ip, #22
	mul	r1, ip, r1
	add	r3, r1, r3
	add	r3, r3, r2
	ldrh	r2, [r3, #0]
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	orr	r3, r2, r3
	uxth	r2, r3
	movw	r3, #:lower16:DMA
	movt	r3, #:upper16:DMA
	mov	r1, #16
	mov	ip, #22
	mul	r0, ip, r0
	add	r3, r0, r3
	add	r3, r3, r1
	strh	r2, [r3, #0]	@ movhi
	b	.L352
.L376:
	ldrh	r3, [fp, #-24]
	mov	r3, r3, asr #4
	and	r3, r3, #7
	str	r3, [fp, #-20]
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-20]
	movw	r3, #:lower16:DMA
	movt	r3, #:upper16:DMA
	mov	r2, #12
	mov	ip, #22
	mul	r1, ip, r1
	add	r3, r1, r3
	add	r3, r3, r2
	ldrh	r3, [r3, #0]
	and	r3, r3, #255
	movw	r2, #:lower16:DMA
	movt	r2, #:upper16:DMA
	mov	r1, #12
	mov	ip, #22
	mul	r0, ip, r0
	add	r2, r0, r2
	add	r2, r2, r1
	strh	r3, [r2, #0]	@ movhi
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-20]
	movw	r3, #:lower16:DMA
	movt	r3, #:upper16:DMA
	mov	r2, #12
	mov	ip, #22
	mul	r1, ip, r1
	add	r3, r1, r3
	add	r3, r3, r2
	ldrh	r3, [r3, #0]
	mov	r2, r3
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	mov	r3, r3, asl #8
	uxth	r3, r3
	orr	r3, r2, r3
	uxth	r3, r3
	uxth	r2, r3
	movw	r3, #:lower16:DMA
	movt	r3, #:upper16:DMA
	mov	r1, #12
	mov	ip, #22
	mul	r0, ip, r0
	add	r3, r0, r3
	add	r3, r3, r1
	strh	r2, [r3, #0]	@ movhi
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-20]
	movw	r3, #:lower16:DMA
	movt	r3, #:upper16:DMA
	mov	r2, #16
	mov	ip, #22
	mul	r1, ip, r1
	add	r3, r1, r3
	add	r3, r3, r2
	ldrh	r3, [r3, #0]
	and	r3, r3, #255
	movw	r2, #:lower16:DMA
	movt	r2, #:upper16:DMA
	mov	r1, #16
	mov	ip, #22
	mul	r0, ip, r0
	add	r2, r0, r2
	add	r2, r2, r1
	strh	r3, [r2, #0]	@ movhi
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-20]
	movw	r3, #:lower16:DMA
	movt	r3, #:upper16:DMA
	mov	r2, #16
	mov	ip, #22
	mul	r1, ip, r1
	add	r3, r1, r3
	add	r3, r3, r2
	ldrh	r3, [r3, #0]
	mov	r2, r3
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	mov	r3, r3, asl #8
	uxth	r3, r3
	orr	r3, r2, r3
	uxth	r3, r3
	uxth	r2, r3
	movw	r3, #:lower16:DMA
	movt	r3, #:upper16:DMA
	mov	r1, #16
	mov	ip, #22
	mul	r0, ip, r0
	add	r3, r0, r3
	add	r3, r3, r1
	strh	r2, [r3, #0]	@ movhi
	b	.L352
.L377:
	ldrh	r3, [fp, #-24]
	mov	r3, r3, asr #4
	and	r3, r3, #7
	str	r3, [fp, #-20]
	ldr	r1, [fp, #-20]
	movw	r3, #:lower16:DMA
	movt	r3, #:upper16:DMA
	mov	r2, #16
	mov	r0, #22
	mul	r1, r0, r1
	add	r3, r1, r3
	add	r3, r3, r2
	ldrb	r2, [fp, #-21]
	strb	r2, [r3, #2]
	b	.L352
.L378:
	ldrh	r3, [fp, #-24]
	mov	r3, r3, asr #4
	and	r3, r3, #7
	str	r3, [fp, #-20]
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-20]
	movw	r3, #:lower16:DMA
	movt	r3, #:upper16:DMA
	mov	r2, #8
	mov	ip, #22
	mul	r1, ip, r1
	add	r3, r1, r3
	add	r3, r3, r2
	ldrh	r3, [r3, #0]
	and	r3, r3, #65280
	movw	r2, #:lower16:DMA
	movt	r2, #:upper16:DMA
	mov	r1, #8
	mov	ip, #22
	mul	r0, ip, r0
	add	r2, r0, r2
	add	r2, r2, r1
	strh	r3, [r2, #0]	@ movhi
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-20]
	movw	r3, #:lower16:DMA
	movt	r3, #:upper16:DMA
	mov	r2, #8
	mov	ip, #22
	mul	r1, ip, r1
	add	r3, r1, r3
	add	r3, r3, r2
	ldrh	r2, [r3, #0]
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	orr	r3, r2, r3
	uxth	r2, r3
	movw	r3, #:lower16:DMA
	movt	r3, #:upper16:DMA
	mov	r1, #8
	mov	ip, #22
	mul	r0, ip, r0
	add	r3, r0, r3
	add	r3, r3, r1
	strh	r2, [r3, #0]	@ movhi
	b	.L352
.L379:
	ldrh	r3, [fp, #-24]
	mov	r3, r3, asr #4
	and	r3, r3, #7
	str	r3, [fp, #-20]
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-20]
	movw	r3, #:lower16:DMA
	movt	r3, #:upper16:DMA
	mov	r2, #8
	mov	ip, #22
	mul	r1, ip, r1
	add	r3, r1, r3
	add	r3, r3, r2
	ldrh	r3, [r3, #0]
	and	r3, r3, #255
	movw	r2, #:lower16:DMA
	movt	r2, #:upper16:DMA
	mov	r1, #8
	mov	ip, #22
	mul	r0, ip, r0
	add	r2, r0, r2
	add	r2, r2, r1
	strh	r3, [r2, #0]	@ movhi
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-20]
	movw	r3, #:lower16:DMA
	movt	r3, #:upper16:DMA
	mov	r2, #8
	mov	ip, #22
	mul	r1, ip, r1
	add	r3, r1, r3
	add	r3, r3, r2
	ldrh	r3, [r3, #0]
	mov	r2, r3
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	mov	r3, r3, asl #8
	uxth	r3, r3
	orr	r3, r2, r3
	uxth	r3, r3
	uxth	r2, r3
	movw	r3, #:lower16:DMA
	movt	r3, #:upper16:DMA
	mov	r1, #8
	mov	ip, #22
	mul	r0, ip, r0
	add	r3, r0, r3
	add	r3, r3, r1
	strh	r2, [r3, #0]	@ movhi
	b	.L352
.L380:
	ldrh	r3, [fp, #-24]
	mov	r3, r3, asr #4
	and	r3, r3, #7
	str	r3, [fp, #-20]
	ldr	r0, [fp, #-20]
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	and	r3, r3, #127
	movw	r2, #:lower16:DMA
	movt	r2, #:upper16:DMA
	mov	r1, #16
	mov	ip, #22
	mul	r0, ip, r0
	add	r2, r0, r2
	add	r2, r2, r1
	strb	r3, [r2, #4]
	ldr	r0, [fp, #-20]
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	sxtb	r3, r3
	mvn	r3, r3
	mov	r2, r3, lsr #31
	movw	r3, #:lower16:DMA
	movt	r3, #:upper16:DMA
	mov	r1, #16
	mov	ip, #22
	mul	r0, ip, r0
	add	r3, r0, r3
	add	r3, r3, r1
	strb	r2, [r3, #3]
	b	.L352
.L457:
	ldrh	r3, [fp, #-24]
	sub	r3, r3, #18432
	sub	r3, r3, #4
	mov	r2, r3
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	and	r3, r3, #7
	mov	r0, r2
	mov	r1, r3
	bl	_Z19S9xSetSDD1MemoryMapjj
	b	.L352
.L458:
	mov	r0, r0	@ nop
	b	.L352
.L459:
	mov	r0, r0	@ nop
	b	.L352
.L460:
	mov	r0, r0	@ nop
	b	.L352
.L461:
	mov	r0, r0	@ nop
	b	.L352
.L463:
	mov	r0, r0	@ nop
	b	.L352
.L464:
	mov	r0, r0	@ nop
	b	.L352
.L468:
	mov	r0, r0	@ nop
	b	.L352
.L469:
	mov	r0, r0	@ nop
	b	.L352
.L470:
	mov	r0, r0	@ nop
	b	.L352
.L471:
	mov	r0, r0	@ nop
	b	.L352
.L472:
	mov	r0, r0	@ nop
	b	.L352
.L473:
	mov	r0, r0	@ nop
	b	.L352
.L474:
	mov	r0, r0	@ nop
	b	.L352
.L475:
	mov	r0, r0	@ nop
	b	.L352
.L476:
	mov	r0, r0	@ nop
	b	.L352
.L477:
	mov	r0, r0	@ nop
	b	.L352
.L478:
	mov	r0, r0	@ nop
	b	.L352
.L479:
	mov	r0, r0	@ nop
	b	.L352
.L480:
	mov	r0, r0	@ nop
	b	.L352
.L481:
	mov	r0, r0	@ nop
	b	.L352
.L482:
	mov	r0, r0	@ nop
	b	.L352
.L483:
	mov	r0, r0	@ nop
	b	.L352
.L484:
	mov	r0, r0	@ nop
	b	.L352
.L485:
	mov	r0, r0	@ nop
.L352:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #20]
	ldrh	r3, [fp, #-24]
	add	r3, r2, r3
	ldrb	r2, [fp, #-21]
	strb	r2, [r3, #0]
	b	.L455
.L462:
	mov	r0, r0	@ nop
.L455:
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.fnend
	.size	S9xSetCPU, .-S9xSetCPU
	.align	2
	.global	S9xGetCPU
	.type	S9xGetCPU, %function
S9xGetCPU:
	.fnstart
.LFB33:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	.pad #24
	sub	sp, sp, #24
	mov	r3, r0
	strh	r3, [fp, #-22]	@ movhi
	ldrh	r2, [fp, #-22]
	movw	r3, #16895
	cmp	r2, r3
	bhi	.L487
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	ldr	r3, [r3, #28]
	add	r2, r3, #6
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	str	r2, [r3, #28]
	ldrh	r3, [fp, #-22]
	sub	r3, r3, #16384
	cmp	r3, #23
	ldrls	pc, [pc, r3, asl #2]
	b	.L488
.L492:
	.word	.L489
	.word	.L489
	.word	.L488
	.word	.L488
	.word	.L488
	.word	.L488
	.word	.L488
	.word	.L488
	.word	.L488
	.word	.L488
	.word	.L488
	.word	.L488
	.word	.L488
	.word	.L488
	.word	.L488
	.word	.L488
	.word	.L488
	.word	.L488
	.word	.L488
	.word	.L488
	.word	.L488
	.word	.L488
	.word	.L490
	.word	.L491
.L489:
	mov	r3, #64
	b	.L493
.L490:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #16384
	add	r3, r3, #22
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	and	r3, r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L494
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldrb	r3, [r3, #25]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L495
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	ldr	r3, [r3, #3660]
	cmp	r3, #2
	beq	.L496
.L495:
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldrb	r3, [r3, #25]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L497
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	ldr	r3, [r3, #3660]
	cmp	r3, #3
	bne	.L497
.L496:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2772]	@ zero_extendqisi2
	add	r3, r3, #1
	uxtb	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2772]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2772]	@ zero_extendqisi2
	cmp	r3, #2
	movls	r3, #0
	movhi	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L497
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2772]
.L497:
	mov	r3, #0
	b	.L493
.L494:
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldrb	r3, [r3, #25]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L498
	mov	r3, #1
	b	.L499
.L498:
	mov	r3, #0
.L499:
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r2, r2, #916
	ldr	r2, [r3, r2, asl #2]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2146]	@ zero_extendqisi2
	eor	r3, r3, #15
	uxtb	r3, r3
	mov	r3, r2, lsr r3
	strb	r3, [fp, #-17]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2146]	@ zero_extendqisi2
	add	r3, r3, #1
	uxtb	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2146]
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	and	r3, r3, #1
	b	.L493
.L491:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #16384
	add	r3, r3, #22
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	and	r3, r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L500
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	ldr	r3, [r3, #3660]
	cmp	r3, #2
	beq	.L503
	cmp	r3, #3
	beq	.L504
	cmp	r3, #0
	bne	.L501
.L502:
	mov	r3, #2
	b	.L493
.L503:
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldrb	r3, [r3, #25]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L505
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2772]	@ zero_extendqisi2
	add	r3, r3, #1
	uxtb	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2772]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2772]	@ zero_extendqisi2
	cmp	r3, #2
	bls	.L505
	mov	r3, #1
	b	.L506
.L505:
	mov	r3, #0
.L506:
	cmp	r3, #0
	beq	.L546
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2772]
	b	.L501
.L504:
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldrb	r3, [r3, #25]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L508
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2772]	@ zero_extendqisi2
	add	r3, r3, #1
	uxtb	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2772]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2772]	@ zero_extendqisi2
	cmp	r3, #2
	bls	.L508
	mov	r3, #1
	b	.L509
.L508:
	mov	r3, #0
.L509:
	cmp	r3, #0
	beq	.L501
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2772]
	b	.L501
.L546:
	mov	r0, r0	@ nop
.L501:
	mov	r3, #0
	b	.L493
.L500:
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldrb	r3, [r3, #25]	@ zero_extendqisi2
	cmp	r3, #0
	movne	r3, #0
	moveq	r3, #1
	str	r3, [fp, #-12]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	ldr	r3, [r3, #3660]
	cmp	r3, #0
	bne	.L510
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #16896
	add	r3, r3, #1
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	sxtb	r3, r3
	cmp	r3, #0
	bge	.L511
	ldr	r2, [fp, #-12]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r2, r2, #916
	ldr	r2, [r3, r2, asl #2]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2147]	@ zero_extendqisi2
	eor	r3, r3, #15
	uxtb	r3, r3
	mov	r3, r2, lsr r3
	uxtb	r3, r3
	and	r3, r3, #1
	movw	r2, #:lower16:IPPU
	movt	r2, #:upper16:IPPU
	ldr	r1, [r2, #3672]
	movw	r2, #:lower16:PPU
	movt	r2, #:upper16:PPU
	ldrb	r2, [r2, #2147]	@ zero_extendqisi2
	eor	r2, r2, #15
	uxtb	r2, r2
	mov	r2, r1, lsr r2
	uxtb	r2, r2
	and	r2, r2, #1
	mov	r2, r2, asl #1
	uxtb	r2, r2
	orr	r3, r3, r2
	strb	r3, [fp, #-17]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2147]	@ zero_extendqisi2
	add	r3, r3, #1
	uxtb	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2147]
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	b	.L493
.L511:
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	ldr	r2, [r3, #3676]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2771]	@ zero_extendqisi2
	eor	r3, r3, #15
	uxtb	r3, r3
	mov	r3, r2, lsr r3
	uxtb	r3, r3
	and	r3, r3, #1
	movw	r2, #:lower16:IPPU
	movt	r2, #:upper16:IPPU
	ldr	r1, [r2, #3680]
	movw	r2, #:lower16:PPU
	movt	r2, #:upper16:PPU
	ldrb	r2, [r2, #2771]	@ zero_extendqisi2
	eor	r2, r2, #15
	uxtb	r2, r2
	mov	r2, r1, lsr r2
	uxtb	r2, r2
	and	r2, r2, #1
	mov	r2, r2, asl #1
	uxtb	r2, r2
	orr	r3, r3, r2
	strb	r3, [fp, #-17]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r3, [r3, #2771]	@ zero_extendqisi2
	add	r3, r3, #1
	uxtb	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2771]
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	b	.L493
.L510:
	ldr	r2, [fp, #-12]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r2, r2, #916
	ldr	r1, [r3, r2, asl #2]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r2, [r3, #2147]	@ zero_extendqisi2
	eor	r3, r2, #15
	uxtb	r3, r3
	mov	r3, r1, lsr r3
	uxtb	r3, r3
	and	r3, r3, #1
	add	r2, r2, #1
	uxtb	r1, r2
	movw	r2, #:lower16:PPU
	movt	r2, #:upper16:PPU
	strb	r1, [r2, #2147]
	b	.L493
.L488:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #20]
	ldrh	r3, [fp, #-22]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	b	.L493
.L487:
	ldrh	r3, [fp, #-22]
	sub	r3, r3, #16896
	movw	r2, #378
	cmp	r3, r2
	ldrls	pc, [pc, r3, asl #2]
	b	.L512
.L539:
	.word	.L513
	.word	.L514
	.word	.L514
	.word	.L514
	.word	.L514
	.word	.L514
	.word	.L514
	.word	.L515
	.word	.L516
	.word	.L517
	.word	.L518
	.word	.L519
	.word	.L520
	.word	.L521
	.word	.L522
	.word	.L522
	.word	.L523
	.word	.L524
	.word	.L525
	.word	.L526
	.word	.L526
	.word	.L526
	.word	.L526
	.word	.L526
	.word	.L527
	.word	.L527
	.word	.L527
	.word	.L527
	.word	.L527
	.word	.L527
	.word	.L527
	.word	.L527
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L528
	.word	.L529
	.word	.L530
	.word	.L531
	.word	.L532
	.word	.L533
	.word	.L534
	.word	.L535
	.word	.L536
	.word	.L537
	.word	.L538
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L528
	.word	.L529
	.word	.L530
	.word	.L531
	.word	.L532
	.word	.L533
	.word	.L534
	.word	.L535
	.word	.L536
	.word	.L537
	.word	.L538
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L528
	.word	.L529
	.word	.L530
	.word	.L531
	.word	.L532
	.word	.L533
	.word	.L534
	.word	.L535
	.word	.L536
	.word	.L537
	.word	.L538
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L528
	.word	.L529
	.word	.L530
	.word	.L531
	.word	.L532
	.word	.L533
	.word	.L534
	.word	.L535
	.word	.L536
	.word	.L537
	.word	.L538
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L528
	.word	.L529
	.word	.L530
	.word	.L531
	.word	.L532
	.word	.L533
	.word	.L534
	.word	.L535
	.word	.L536
	.word	.L537
	.word	.L538
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L528
	.word	.L529
	.word	.L530
	.word	.L531
	.word	.L532
	.word	.L533
	.word	.L534
	.word	.L535
	.word	.L536
	.word	.L537
	.word	.L538
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L528
	.word	.L529
	.word	.L530
	.word	.L531
	.word	.L532
	.word	.L533
	.word	.L534
	.word	.L535
	.word	.L536
	.word	.L537
	.word	.L538
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L512
	.word	.L528
	.word	.L529
	.word	.L530
	.word	.L531
	.word	.L532
	.word	.L533
	.word	.L534
	.word	.L535
	.word	.L536
	.word	.L537
	.word	.L538
.L513:
	movw	r3, #:lower16:SNESGameFixes
	movt	r3, #:upper16:SNESGameFixes
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L514
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	ldr	r2, [r3, #36]
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	str	r2, [r3, #40]
	bl	_ZL13REGISTER_4212v
	mov	r3, r0
	b	.L493
.L514:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #20]
	ldrh	r3, [fp, #-22]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	b	.L493
.L515:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2124
	ldrh	r3, [r3, r2]
	uxtb	r3, r3
	b	.L493
.L516:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2124
	ldrh	r3, [r3, r2]
	mov	r3, r3, asr #8
	uxtb	r3, r3
	b	.L493
.L517:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2122
	ldrh	r3, [r3, r2]
	uxtb	r3, r3
	b	.L493
.L518:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2122
	ldrh	r3, [r3, r2]
	mov	r3, r3, asr #8
	uxtb	r3, r3
	b	.L493
.L519:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #16896
	add	r3, r3, #11
	movw	r2, #:lower16:Memory
	movt	r2, #:upper16:Memory
	ldr	r2, [r2, #20]
	add	r2, r2, #16896
	add	r2, r2, #11
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	cmp	r2, #0
	movne	r2, #0
	moveq	r2, #1
	strb	r2, [r3, #0]
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #16896
	add	r3, r3, #11
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	b	.L493
.L520:
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	b	.L493
.L521:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #20]
	ldrh	r3, [fp, #-22]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	b	.L493
.L522:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #20]
	ldrh	r3, [fp, #-22]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	b	.L493
.L523:
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	ldr	r2, [r3, #36]
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	str	r2, [r3, #40]
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #16896
	add	r3, r3, #16
	ldrb	r3, [r3, #0]
	strb	r3, [fp, #-17]
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #16896
	add	r3, r3, #16
	mov	r2, #0
	strb	r2, [r3, #0]
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	b	.L493
.L524:
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	ldrb	r3, [r3, #6]	@ zero_extendqisi2
	and	r3, r3, #3
	cmp	r3, #0
	beq	.L540
	mov	r3, #128
	b	.L541
.L540:
	mov	r3, #0
.L541:
	strb	r3, [fp, #-17]
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	ldr	r2, [r3, #28]
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldr	r3, [r3, #8]
	cmp	r2, r3
	blt	.L542
	mov	r3, #64
	b	.L543
.L542:
	mov	r3, #0
.L543:
	ldrb	r1, [fp, #-17]	@ zero_extendqisi2
	mov	r2, r3
	mov	r3, r1
	orr	r3, r2, r3
	uxtb	r3, r3
	strb	r3, [fp, #-17]
	mov	r0, #3
	bl	_ZL16CLEAR_IRQ_SOURCEj
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	b	.L493
.L525:
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	ldr	r2, [r3, #36]
	movw	r3, #:lower16:CPU
	movt	r3, #:upper16:CPU
	str	r2, [r3, #40]
	bl	_ZL13REGISTER_4212v
	mov	r3, r0
	b	.L493
.L526:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #20]
	ldrh	r3, [fp, #-22]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	b	.L493
.L527:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #20]
	ldrh	r3, [fp, #-22]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	b	.L493
.L528:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #20]
	ldrh	r3, [fp, #-22]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	b	.L493
.L529:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #20]
	ldrh	r3, [fp, #-22]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	b	.L493
.L530:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #20]
	ldrh	r3, [fp, #-22]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	b	.L493
.L531:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #20]
	ldrh	r3, [fp, #-22]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	b	.L493
.L532:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #20]
	ldrh	r3, [fp, #-22]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	b	.L493
.L533:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #20]
	ldrh	r3, [fp, #-22]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	b	.L493
.L534:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #20]
	ldrh	r3, [fp, #-22]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	b	.L493
.L535:
	ldrh	r3, [fp, #-22]
	mov	r3, r3, asr #4
	and	r1, r3, #7
	movw	r3, #:lower16:DMA
	movt	r3, #:upper16:DMA
	mov	r2, #16
	mov	r0, #22
	mul	r1, r0, r1
	add	r3, r1, r3
	add	r3, r3, r2
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	b	.L493
.L536:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #20]
	ldrh	r3, [fp, #-22]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	b	.L493
.L537:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #20]
	ldrh	r3, [fp, #-22]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	b	.L493
.L538:
	ldrh	r3, [fp, #-22]
	and	r3, r3, #112
	mov	r3, r3, asr #4
	str	r3, [fp, #-8]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-8]
	mov	r3, r2, asr r3
	and	r3, r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L544
	ldr	r1, [fp, #-8]
	movw	r3, #:lower16:DMA
	movt	r3, #:upper16:DMA
	mov	r2, #16
	mov	r0, #22
	mul	r1, r0, r1
	add	r3, r1, r3
	add	r3, r3, r2
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	b	.L493
.L544:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #20]
	ldrh	r3, [fp, #-22]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	b	.L493
.L512:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #20]
	ldrh	r3, [fp, #-22]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
.L493:
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.fnend
	.size	S9xGetCPU, .-S9xGetCPU
	.align	2
	.global	S9xResetPPU
	.type	S9xResetPPU, %function
S9xResetPPU:
	.fnstart
.LFB34:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	.pad #16
	sub	sp, sp, #16
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #0]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #1]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #4]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #1
	strb	r2, [r3, #5]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strh	r2, [r3, #6]	@ movhi
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strh	r2, [r3, #10]	@ movhi
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strh	r2, [r3, #12]	@ movhi
	mov	r3, #0
	strb	r3, [fp, #-9]
	b	.L548
.L549:
	ldrb	r1, [fp, #-9]	@ zero_extendqisi2
	movw	r2, #:lower16:PPU
	movt	r2, #:upper16:PPU
	mov	r0, #8
	mov	r3, r1
	mov	r3, r3, asl #1
	add	r3, r3, r1
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r0
	mov	r2, #0
	strh	r2, [r3, #6]	@ movhi
	ldrb	r1, [fp, #-9]	@ zero_extendqisi2
	movw	r2, #:lower16:PPU
	movt	r2, #:upper16:PPU
	mov	r0, #8
	mov	r3, r1
	mov	r3, r3, asl #1
	add	r3, r3, r1
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r0
	mov	r2, #0
	strh	r2, [r3, #8]	@ movhi
	ldrb	r1, [fp, #-9]	@ zero_extendqisi2
	movw	r2, #:lower16:PPU
	movt	r2, #:upper16:PPU
	mov	r0, #8
	mov	r3, r1
	mov	r3, r3, asl #1
	add	r3, r3, r1
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r0
	mov	r2, #0
	strh	r2, [r3, #10]	@ movhi
	ldrb	r1, [fp, #-9]	@ zero_extendqisi2
	movw	r2, #:lower16:PPU
	movt	r2, #:upper16:PPU
	mov	r0, #8
	mov	r3, r1
	mov	r3, r3, asl #1
	add	r3, r3, r1
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r0
	mov	r2, #0
	strb	r2, [r3, #12]
	ldrb	r1, [fp, #-9]	@ zero_extendqisi2
	movw	r2, #:lower16:PPU
	movt	r2, #:upper16:PPU
	mov	r0, #16
	mov	r3, r1
	mov	r3, r3, asl #1
	add	r3, r3, r1
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r0
	mov	r2, #0
	strh	r2, [r3, #6]	@ movhi
	ldrb	r1, [fp, #-9]	@ zero_extendqisi2
	movw	r2, #:lower16:PPU
	movt	r2, #:upper16:PPU
	mov	r0, #16
	mov	r3, r1
	mov	r3, r3, asl #1
	add	r3, r3, r1
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r0
	mov	r2, #0
	strh	r2, [r3, #8]	@ movhi
	ldrb	r1, [fp, #-9]	@ zero_extendqisi2
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2728
	add	r3, r1, r3
	add	r3, r3, r2
	mov	r2, #0
	strb	r2, [r3, #2]
	ldrb	r1, [fp, #-9]	@ zero_extendqisi2
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #2736
	add	r3, r1, r3
	add	r3, r3, r2
	mov	r2, #0
	strb	r2, [r3, #0]
	ldrb	r1, [fp, #-9]	@ zero_extendqisi2
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #2736
	add	r3, r1, r3
	add	r3, r3, r2
	mov	r2, #0
	strb	r2, [r3, #6]
	ldrb	r1, [fp, #-9]	@ zero_extendqisi2
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2744
	add	r3, r1, r3
	add	r3, r3, r2
	mov	r2, #0
	strb	r2, [r3, #4]
	ldrb	r1, [fp, #-9]	@ zero_extendqisi2
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #2752
	add	r3, r1, r3
	add	r3, r3, r2
	mov	r2, #1
	strb	r2, [r3, #2]
	ldrb	r1, [fp, #-9]	@ zero_extendqisi2
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2760
	add	r3, r1, r3
	add	r3, r3, r2
	mov	r2, #1
	strb	r2, [r3, #0]
	ldrb	r3, [fp, #-9]
	add	r3, r3, #1
	strb	r3, [fp, #-9]
.L548:
	ldrb	r3, [fp, #-9]	@ zero_extendqisi2
	cmp	r3, #4
	moveq	r3, #0
	movne	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L549
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2734]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2735]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2741]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r2, [r3, #2741]	@ zero_extendqisi2
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2740]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2747]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r2, [r3, #2747]	@ zero_extendqisi2
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2746]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2753]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r2, [r3, #2753]	@ zero_extendqisi2
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2752]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #1
	strb	r2, [r3, #2759]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r2, [r3, #2759]	@ zero_extendqisi2
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2758]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #1
	strb	r2, [r3, #2765]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r2, [r3, #2765]	@ zero_extendqisi2
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2764]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #62]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L550
.L551:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-16]
	and	r3, r3, #7
	mov	r3, r3, asl #2
	mov	r1, r3
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r2, r2, #16
	str	r1, [r3, r2, asl #2]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r3, r3, asr #3
	and	r3, r3, #7
	mov	r3, r3, asl #2
	mov	r1, r3
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r2, r2, #272
	str	r1, [r3, r2, asl #2]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r3, r3, asr #6
	and	r3, r3, #2
	mov	r3, r3, asl #3
	mov	r1, r3
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r2, r2, #528
	str	r1, [r3, r2, asl #2]
	ldr	r1, [fp, #-16]
	ldr	r2, [fp, #-16]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r2, r2, #16
	ldr	r3, [r3, r2, asl #2]
	uxth	r2, r3
	ldr	r0, [fp, #-16]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r0, r0, #272
	ldr	r3, [r3, r0, asl #2]
	uxth	r3, r3
	mov	r3, r3, asl #5
	uxth	r3, r3
	orr	r3, r2, r3
	uxth	r2, r3
	ldr	r0, [fp, #-16]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r0, r0, #528
	ldr	r3, [r3, r0, asl #2]
	uxth	r3, r3
	mov	r3, r3, asl #10
	uxth	r3, r3
	orr	r3, r2, r3
	uxth	r2, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	add	r1, r1, #32
	mov	r1, r1, asl #1
	add	r3, r1, r3
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L550:
	ldr	r3, [fp, #-16]
	cmp	r3, #255
	movgt	r3, #0
	movle	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L551
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #576]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #127
	strb	r2, [r3, #577]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L552
.L553:
	ldr	r1, [fp, #-8]
	movw	r2, #:lower16:PPU
	movt	r2, #:upper16:PPU
	mov	r0, #576
	mov	r3, r1
	mov	r3, r3, asl #1
	add	r3, r3, r1
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r0
	mov	r2, #0
	strh	r2, [r3, #2]	@ movhi
	ldr	r1, [fp, #-8]
	movw	r2, #:lower16:PPU
	movt	r2, #:upper16:PPU
	mov	r0, #576
	mov	r3, r1
	mov	r3, r3, asl #1
	add	r3, r3, r1
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r0
	mov	r2, #0
	strh	r2, [r3, #4]	@ movhi
	ldr	r1, [fp, #-8]
	movw	r2, #:lower16:PPU
	movt	r2, #:upper16:PPU
	mov	r0, #576
	mov	r3, r1
	mov	r3, r3, asl #1
	add	r3, r3, r1
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r0
	mov	r2, #0
	strb	r2, [r3, #8]
	ldr	r1, [fp, #-8]
	movw	r2, #:lower16:PPU
	movt	r2, #:upper16:PPU
	mov	r0, #576
	mov	r3, r1
	mov	r3, r3, asl #1
	add	r3, r3, r1
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r0
	mov	r2, #0
	strb	r2, [r3, #9]
	ldr	r1, [fp, #-8]
	movw	r2, #:lower16:PPU
	movt	r2, #:upper16:PPU
	mov	r0, #584
	mov	r3, r1
	mov	r3, r3, asl #1
	add	r3, r3, r1
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r0
	mov	r2, #0
	strb	r2, [r3, #2]
	ldr	r1, [fp, #-8]
	movw	r2, #:lower16:PPU
	movt	r2, #:upper16:PPU
	mov	r0, #584
	mov	r3, r1
	mov	r3, r3, asl #1
	add	r3, r3, r1
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r0
	mov	r2, #0
	strb	r2, [r3, #3]
	ldr	r1, [fp, #-8]
	movw	r2, #:lower16:PPU
	movt	r2, #:upper16:PPU
	mov	r0, #576
	mov	r3, r1
	mov	r3, r3, asl #1
	add	r3, r3, r1
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r0
	mov	r2, #0
	strh	r2, [r3, #6]	@ movhi
	ldr	r1, [fp, #-8]
	movw	r2, #:lower16:PPU
	movt	r2, #:upper16:PPU
	mov	r0, #584
	mov	r3, r1
	mov	r3, r3, asl #1
	add	r3, r3, r1
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r0
	mov	r2, #0
	strb	r2, [r3, #4]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L552:
	ldr	r3, [fp, #-8]
	cmp	r3, #127
	movgt	r3, #0
	movle	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L553
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2114]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2118]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2120
	mov	r1, #0
	strh	r1, [r3, r2]	@ movhi
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2116
	mov	r1, #0
	strh	r1, [r3, r2]	@ movhi
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2122
	mov	r1, #0
	strh	r1, [r3, r2]	@ movhi
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2124
	mov	r1, #0
	strh	r1, [r3, r2]	@ movhi
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2126
	mov	r1, #0
	strh	r1, [r3, r2]	@ movhi
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #2128
	mov	r1, #0
	strh	r1, [r3, r2]	@ movhi
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2130]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2131]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2132]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2140
	mov	r1, #0
	strh	r1, [r3, r2]	@ movhi
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2140
	ldrh	r1, [r3, r2]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2138
	strh	r1, [r3, r2]	@ movhi
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2138
	ldrh	r1, [r3, r2]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2136
	strh	r1, [r3, r2]	@ movhi
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2136
	ldrh	r1, [r3, r2]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2134
	strh	r1, [r3, r2]	@ movhi
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #2144
	mov	r1, #0
	strh	r1, [r3, r2]	@ movhi
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #2144
	ldrh	r1, [r3, r2]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2142
	strh	r1, [r3, r2]	@ movhi
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2146]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2147]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2771]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2148]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2151]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r2, [r3, #2151]	@ zero_extendqisi2
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2150]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r2, [r3, #2150]	@ zero_extendqisi2
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2149]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2152
	mov	r1, #0
	strh	r1, [r3, r2]	@ movhi
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2154
	mov	r1, #224
	strh	r1, [r3, r2]	@ movhi
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	str	r2, [r3, #2156]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2160]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #1
	strb	r2, [r3, #2161]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2162]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2163]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2164]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #2768
	mov	r1, #0
	strh	r1, [r3, r2]	@ movhi
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2166
	mov	r1, #0
	strh	r1, [r3, r2]	@ movhi
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2168]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2169]
	ldr	r0, .L564
	mov	r1, #0
	mov	r2, #544
	bl	memset
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2714]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2715]
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldr	r3, [r3, #4]
	uxth	r3, r3
	add	r3, r3, #1
	uxth	r3, r3
	mov	r1, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2716
	strh	r1, [r3, r2]	@ movhi
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2718]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2720]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r2, [r3, #2720]	@ zero_extendqisi2
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2719]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2722]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r2, [r3, #2722]	@ zero_extendqisi2
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2721]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2723]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2724]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2725]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #1
	strb	r2, [r3, #2726]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2727]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #1
	strb	r2, [r3, #2728]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2729]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #1
	strb	r2, [r3, #2766]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2767]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2770]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2773]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	ldrb	r2, [r3, #2773]	@ zero_extendqisi2
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	strb	r2, [r3, #2772]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	mov	r2, #1
	strb	r2, [r3, #0]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	mov	r2, #0
	strb	r2, [r3, #1]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	mov	r2, #0
	strb	r2, [r3, #2]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	mov	r2, #0
	strb	r2, [r3, #3]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	mov	r2, #0
	strb	r2, [r3, #4]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	mov	r2, #1
	strb	r2, [r3, #5]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	mov	r2, #1
	strb	r2, [r3, #6]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	mov	r2, #1
	strb	r2, [r3, #7]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	mov	r2, #0
	str	r2, [r3, #8]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	mov	r2, #0
	str	r2, [r3, #12]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	mov	r2, #0
	str	r2, [r3, #16]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	mov	r2, #0
	str	r2, [r3, #20]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	mov	r2, #0
	str	r2, [r3, #24]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	ldr	r3, [r3, #40]
	mov	r0, r3
	mov	r1, #0
	mov	r2, #4096
	bl	memset
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	ldr	r3, [r3, #44]
	mov	r0, r3
	mov	r1, #0
	mov	r2, #2048
	bl	memset
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	ldr	r3, [r3, #48]
	mov	r0, r3
	mov	r1, #0
	mov	r2, #1024
	bl	memset
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	mov	r2, #0
	strb	r2, [r3, #52]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	mov	r2, #0
	strb	r2, [r3, #53]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	mov	r2, #0
	strb	r2, [r3, #54]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	mov	r2, #256
	str	r2, [r3, #60]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	mov	r2, #224
	str	r2, [r3, #56]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	mov	r2, #0
	str	r2, [r3, #3136]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L554
.L555:
	ldr	r1, [fp, #-16]
	ldr	r3, [fp, #-16]
	uxth	r2, r3
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r0, r1, #1568
	mov	r1, #4
	mov	r0, r0, asl #1
	add	r3, r0, r3
	add	r3, r3, r1
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L554:
	ldr	r3, [fp, #-16]
	cmp	r3, #255
	movgt	r3, #0
	movle	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L555
	bl	S9xFixColourBrightness
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	mov	r2, #0
	str	r2, [r3, #3656]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	ldr	r2, [r3, #3656]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	str	r2, [r3, #3652]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	mov	r2, #0
	str	r2, [r3, #3672]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	ldr	r2, [r3, #3672]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	str	r2, [r3, #3668]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	ldr	r2, [r3, #3668]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	str	r2, [r3, #3664]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	mov	r2, #0
	str	r2, [r3, #3680]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	ldr	r2, [r3, #3680]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	str	r2, [r3, #3676]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	mov	r2, #0
	str	r2, [r3, #3684]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	mov	r2, #0
	str	r2, [r3, #3692]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	ldr	r2, [r3, #3692]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	str	r2, [r3, #3688]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	mov	r2, #128
	str	r2, [r3, #3700]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	ldr	r2, [r3, #3700]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	str	r2, [r3, #3696]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	mov	r2, #112
	str	r2, [r3, #3708]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	ldr	r2, [r3, #3708]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	str	r2, [r3, #3704]
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldr	r3, [r3, #72]
	cmp	r3, #0
	bne	.L556
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	mov	r2, #6
	str	r2, [r3, #3660]
	b	.L557
.L556:
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldr	r3, [r3, #72]
	sub	r3, r3, #1
	mov	r2, r3
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	str	r2, [r3, #3660]
.L557:
	bl	S9xNextController
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L558
.L559:
	ldr	r3, [fp, #-16]
	mov	r2, #312
	mul	r3, r2, r3
	add	r2, r3, #3712
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r3, r2, r3
	mov	r0, r3
	mov	r1, #0
	mov	r2, #312
	bl	memset
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L558:
	ldr	r3, [fp, #-16]
	cmp	r3, #1
	movgt	r3, #0
	movle	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L559
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldrb	r3, [r3, #79]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L560
	mov	r0, #0
	bl	S9xProcessMouse
	mov	r0, #1
	bl	S9xProcessMouse
.L560:
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L561
.L562:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r2, [r3, #20]
	ldr	r3, [fp, #-16]
	add	r2, r2, r3
	ldr	r3, [fp, #-16]
	mov	r3, r3, asr #8
	mov	r0, r2
	mov	r1, r3
	mov	r2, #256
	bl	memset
	ldr	r3, [fp, #-16]
	add	r3, r3, #256
	str	r3, [fp, #-16]
.L561:
	ldr	r2, [fp, #-16]
	movw	r3, #32767
	cmp	r2, r3
	movgt	r3, #0
	movle	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L562
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #8448
	mov	r0, r3
	mov	r1, #0
	mov	r2, #256
	bl	memset
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #16896
	mov	r0, r3
	mov	r1, #0
	mov	r2, #256
	bl	memset
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #16384
	mov	r0, r3
	mov	r1, #0
	mov	r2, #256
	bl	memset
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #4096
	mov	r0, r3
	mov	r1, #0
	mov	r2, #4096
	bl	memset
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L565:
	.align	2
.L564:
	.word	PPU+2170
	.fnend
	.size	S9xResetPPU, .-S9xResetPPU
	.align	2
	.global	S9xProcessMouse
	.type	S9xProcessMouse, %function
S9xProcessMouse:
	.fnstart
.LFB35:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	.pad #32
	sub	sp, sp, #32
	str	r0, [fp, #-32]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	ldr	r3, [r3, #3660]
	cmp	r3, #3
	beq	.L567
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	ldr	r3, [r3, #3660]
	cmp	r3, #2
	bne	.L568
.L567:
	sub	r1, fp, #16
	sub	r2, fp, #20
	sub	r3, fp, #24
	ldr	r0, [fp, #-32]
	bl	S9xReadMousePosition
	mov	r3, r0
	cmp	r3, #0
	beq	.L568
	mov	r3, #1
	b	.L569
.L568:
	mov	r3, #0
.L569:
	cmp	r3, #0
	beq	.L582
	ldr	r2, [fp, #-32]
	ldr	r0, [fp, #-32]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r1, #2768
	add	r3, r0, r3
	add	r3, r3, r1
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	mov	r3, r3, asl #4
	mov	r1, r3
	ldr	r3, [fp, #-24]
	and	r3, r3, #1
	mov	r3, r3, asl #6
	orr	r1, r1, r3
	ldr	r3, [fp, #-24]
	and	r3, r3, #2
	mov	r3, r3, asl #6
	orr	r3, r1, r3
	orr	r1, r3, #1
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r2, r2, #920
	add	r2, r2, #2
	str	r1, [r3, r2, asl #2]
	ldr	r2, [fp, #-16]
	ldr	r1, [fp, #-32]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r1, r1, #924
	ldr	r3, [r3, r1, asl #2]
	rsb	r3, r3, r2
	str	r3, [fp, #-12]
	ldr	r1, [fp, #-20]
	ldr	r2, [fp, #-32]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r2, r2, #924
	add	r2, r2, #2
	ldr	r3, [r3, r2, asl #2]
	rsb	r3, r3, r1
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	cmp	r3, #63
	ble	.L571
	mov	r3, #63
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-32]
	ldr	r1, [fp, #-32]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r1, r1, #924
	ldr	r3, [r3, r1, asl #2]
	add	r1, r3, #63
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r2, r2, #924
	str	r1, [r3, r2, asl #2]
	b	.L572
.L571:
	ldr	r3, [fp, #-12]
	cmn	r3, #63
	bge	.L573
	mvn	r3, #62
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-32]
	ldr	r1, [fp, #-32]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r1, r1, #924
	ldr	r3, [r3, r1, asl #2]
	sub	r1, r3, #63
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r2, r2, #924
	str	r1, [r3, r2, asl #2]
	b	.L572
.L573:
	ldr	r2, [fp, #-32]
	ldr	r1, [fp, #-16]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r2, r2, #924
	str	r1, [r3, r2, asl #2]
.L572:
	ldr	r3, [fp, #-8]
	cmp	r3, #63
	ble	.L574
	mov	r3, #63
	str	r3, [fp, #-8]
	ldr	r0, [fp, #-32]
	ldr	r2, [fp, #-32]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r2, r2, #924
	add	r2, r2, #2
	ldr	r3, [r3, r2, asl #2]
	add	r1, r3, #63
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r2, r0, #924
	add	r2, r2, #2
	str	r1, [r3, r2, asl #2]
	b	.L575
.L574:
	ldr	r3, [fp, #-8]
	cmn	r3, #63
	bge	.L576
	mvn	r3, #62
	str	r3, [fp, #-8]
	ldr	r0, [fp, #-32]
	ldr	r2, [fp, #-32]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r2, r2, #924
	add	r2, r2, #2
	ldr	r3, [r3, r2, asl #2]
	sub	r1, r3, #63
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r2, r0, #924
	add	r2, r2, #2
	str	r1, [r3, r2, asl #2]
	b	.L575
.L576:
	ldr	r2, [fp, #-32]
	ldr	r1, [fp, #-20]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r2, r2, #924
	add	r2, r2, #2
	str	r1, [r3, r2, asl #2]
.L575:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bge	.L577
	ldr	r3, [fp, #-12]
	rsb	r3, r3, #0
	str	r3, [fp, #-12]
	ldr	r0, [fp, #-32]
	ldr	r2, [fp, #-32]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r2, r2, #920
	add	r2, r2, #2
	ldr	r2, [r3, r2, asl #2]
	ldr	r3, [fp, #-12]
	orr	r3, r3, #128
	mov	r3, r3, asl #16
	orr	r1, r2, r3
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r2, r0, #920
	add	r2, r2, #2
	str	r1, [r3, r2, asl #2]
	b	.L578
.L577:
	ldr	r0, [fp, #-32]
	ldr	r2, [fp, #-32]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r2, r2, #920
	add	r2, r2, #2
	ldr	r2, [r3, r2, asl #2]
	ldr	r3, [fp, #-12]
	mov	r3, r3, asl #16
	orr	r1, r2, r3
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r2, r0, #920
	add	r2, r2, #2
	str	r1, [r3, r2, asl #2]
.L578:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bge	.L579
	ldr	r3, [fp, #-8]
	rsb	r3, r3, #0
	str	r3, [fp, #-8]
	ldr	r0, [fp, #-32]
	ldr	r2, [fp, #-32]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r2, r2, #920
	add	r2, r2, #2
	ldr	r2, [r3, r2, asl #2]
	ldr	r3, [fp, #-8]
	orr	r3, r3, #128
	mov	r3, r3, asl #24
	orr	r1, r2, r3
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r2, r0, #920
	add	r2, r2, #2
	str	r1, [r3, r2, asl #2]
	b	.L580
.L579:
	ldr	r0, [fp, #-32]
	ldr	r2, [fp, #-32]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r2, r2, #920
	add	r2, r2, #2
	ldr	r2, [r3, r2, asl #2]
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #24
	orr	r1, r2, r3
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r2, r0, #920
	add	r2, r2, #2
	str	r1, [r3, r2, asl #2]
.L580:
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	ldr	r3, [r3, #3660]
	cmp	r3, #2
	bne	.L581
	ldr	r2, [fp, #-32]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r2, r2, #920
	add	r2, r2, #2
	ldr	r2, [r3, r2, asl #2]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	str	r2, [r3, #3664]
	b	.L582
.L581:
	ldr	r2, [fp, #-32]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r2, r2, #920
	add	r2, r2, #2
	ldr	r2, [r3, r2, asl #2]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	str	r2, [r3, #3668]
.L582:
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.fnend
	.size	S9xProcessMouse, .-S9xProcessMouse
	.align	2
	.global	_Z17ProcessSuperScopev
	.type	_Z17ProcessSuperScopev, %function
_Z17ProcessSuperScopev:
	.fnstart
.LFB36:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	.pad #16
	sub	sp, sp, #16
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	ldr	r3, [r3, #3660]
	cmp	r3, #4
	bne	.L584
	sub	r1, fp, #12
	sub	r2, fp, #16
	sub	r3, fp, #20
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	S9xReadSuperScopePosition
	mov	r3, r0
	cmp	r3, #0
	beq	.L584
	mov	r3, #1
	b	.L585
.L584:
	mov	r3, #0
.L585:
	cmp	r3, #0
	beq	.L591
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #15
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldr	r2, [fp, #-20]
	and	r2, r2, #2
	mov	r2, r2, asl #13
	orr	r2, r3, r2
	ldr	r3, [fp, #-20]
	and	r3, r3, #4
	mov	r3, r3, asl #11
	orr	r2, r2, r3
	ldr	r3, [fp, #-20]
	and	r3, r3, #8
	mov	r3, r3, asl #9
	orr	r3, r2, r3
	orr	r3, r3, #255
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	cmp	r3, #255
	ble	.L587
	mov	r3, #255
	str	r3, [fp, #-12]
.L587:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bge	.L588
	mov	r3, #0
	str	r3, [fp, #-12]
.L588:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2154
	ldrh	r3, [r3, r2]
	sub	r2, r3, #1
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bge	.L589
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2154
	ldrh	r3, [r3, r2]
	sub	r3, r3, #1
	str	r3, [fp, #-16]
.L589:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bge	.L590
	mov	r3, #0
	str	r3, [fp, #-16]
.L590:
	ldr	r3, [fp, #-16]
	uxth	r3, r3
	add	r3, r3, #1
	uxth	r1, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	movw	r2, #2126
	strh	r1, [r3, r2]	@ movhi
	ldr	r3, [fp, #-12]
	uxth	r1, r3
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #2128
	strh	r1, [r3, r2]	@ movhi
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #1
	strb	r2, [r3, #2132]
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #8448
	add	r3, r3, #63
	movw	r2, #:lower16:Memory
	movt	r2, #:upper16:Memory
	ldr	r2, [r2, #20]
	add	r2, r2, #8448
	add	r2, r2, #63
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	orr	r2, r2, #64
	uxtb	r2, r2
	strb	r2, [r3, #0]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	ldr	r2, [fp, #-8]
	str	r2, [r3, #3668]
.L591:
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.fnend
	.size	_Z17ProcessSuperScopev, .-_Z17ProcessSuperScopev
	.align	2
	.global	S9xNextController
	.type	S9xNextController, %function
S9xNextController:
	.fnstart
.LFB37:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	.save {fp}
	.setfp fp, sp, #0
	add	fp, sp, #0
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	ldr	r3, [r3, #3660]
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L593
.L599:
	.word	.L594
	.word	.L595
	.word	.L596
	.word	.L597
	.word	.L598
.L594:
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	mov	r2, #1
	str	r2, [r3, #3660]
	b	.L601
.L595:
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldrb	r3, [r3, #79]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L596
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	mov	r2, #2
	str	r2, [r3, #3660]
	b	.L601
.L596:
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldrb	r3, [r3, #79]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L597
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	mov	r2, #3
	str	r2, [r3, #3660]
	b	.L601
.L597:
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldrb	r3, [r3, #78]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L598
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	mov	r2, #4
	str	r2, [r3, #3660]
	b	.L601
.L598:
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldrb	r3, [r3, #77]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L593
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	mov	r2, #0
	str	r2, [r3, #3660]
	b	.L601
.L593:
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	mov	r2, #1
	str	r2, [r3, #3660]
.L601:
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.fnend
	.size	S9xNextController, .-S9xNextController
	.align	2
	.global	S9xUpdateJoypads
	.type	S9xUpdateJoypads, %function
S9xUpdateJoypads:
	.fnstart
.LFB38:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	.save {r4, fp, lr}
	.setfp fp, sp, #8
	add	fp, sp, #8
	.pad #12
	sub	sp, sp, #12
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L603
.L606:
	ldr	r4, [fp, #-20]
	ldr	r0, [fp, #-20]
	bl	S9xReadJoypad
	mov	r1, r0
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r2, r4, #916
	str	r1, [r3, r2, asl #2]
	ldr	r2, [fp, #-20]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r2, r2, #916
	ldr	r3, [r3, r2, asl #2]
	and	r3, r3, #512
	cmp	r3, #0
	beq	.L604
	ldr	r2, [fp, #-20]
	ldr	r1, [fp, #-20]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r1, r1, #916
	ldr	r3, [r3, r1, asl #2]
	bic	r1, r3, #256
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r2, r2, #916
	str	r1, [r3, r2, asl #2]
.L604:
	ldr	r2, [fp, #-20]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r2, r2, #916
	ldr	r3, [r3, r2, asl #2]
	and	r3, r3, #2048
	cmp	r3, #0
	beq	.L605
	ldr	r2, [fp, #-20]
	ldr	r1, [fp, #-20]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r1, r1, #916
	ldr	r3, [r3, r1, asl #2]
	bic	r1, r3, #1024
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r2, r2, #916
	str	r1, [r3, r2, asl #2]
.L605:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L603:
	ldr	r3, [fp, #-20]
	cmp	r3, #4
	movgt	r3, #0
	movle	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L606
	movw	r3, #:lower16:SNESGameFixes
	movt	r3, #:upper16:SNESGameFixes
	ldrb	r3, [r3, #6]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L607
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	ldr	r3, [r3, #3660]
	cmp	r3, #1
	beq	.L608
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	ldr	r3, [r3, #3660]
	cmp	r3, #0
	bne	.L607
.L608:
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L609
.L611:
	ldr	r2, [fp, #-20]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r2, r2, #916
	ldr	r3, [r3, r2, asl #2]
	cmp	r3, #0
	beq	.L610
	ldr	r1, [fp, #-20]
	ldr	r2, [fp, #-20]
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r2, r2, #916
	ldr	r3, [r3, r2, asl #2]
	mvn	r2, r3, asl #16
	mvn	r2, r2, lsr #16
	movw	r3, #:lower16:IPPU
	movt	r3, #:upper16:IPPU
	add	r1, r1, #916
	str	r2, [r3, r1, asl #2]
.L610:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L609:
	ldr	r3, [fp, #-20]
	cmp	r3, #4
	movgt	r3, #0
	movle	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L611
.L607:
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldrb	r3, [r3, #79]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L612
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L613
.L614:
	ldr	r0, [fp, #-20]
	bl	S9xProcessMouse
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L613:
	ldr	r3, [fp, #-20]
	cmp	r3, #1
	movgt	r3, #0
	movle	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L614
.L612:
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldrb	r3, [r3, #78]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L615
	bl	_Z17ProcessSuperScopev
.L615:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #16896
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	and	r3, r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L622
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #16
	strb	r2, [r3, #2146]
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #16896
	add	r3, r3, #1
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	sxtb	r3, r3
	cmp	r3, #0
	bge	.L617
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #16
	strb	r2, [r3, #2147]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2771]
	b	.L618
.L617:
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #0
	strb	r2, [r3, #2147]
	movw	r3, #:lower16:PPU
	movt	r3, #:upper16:PPU
	mov	r2, #16
	strb	r2, [r3, #2771]
.L618:
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldrb	r3, [r3, #25]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L619
	mov	r3, #1
	b	.L620
.L619:
	mov	r3, #0
.L620:
	str	r3, [fp, #-16]
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #16896
	add	r3, r3, #24
	ldr	r1, [fp, #-16]
	movw	r2, #:lower16:IPPU
	movt	r2, #:upper16:IPPU
	add	r1, r1, #916
	ldr	r2, [r2, r1, asl #2]
	uxtb	r2, r2
	strb	r2, [r3, #0]
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #16896
	add	r3, r3, #25
	ldr	r1, [fp, #-16]
	movw	r2, #:lower16:IPPU
	movt	r2, #:upper16:IPPU
	add	r1, r1, #916
	ldr	r2, [r2, r1, asl #2]
	mov	r2, r2, lsr #8
	uxtb	r2, r2
	strb	r2, [r3, #0]
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #16896
	add	r3, r3, #26
	ldr	r2, [fp, #-16]
	eor	r1, r2, #1
	movw	r2, #:lower16:IPPU
	movt	r2, #:upper16:IPPU
	add	r1, r1, #916
	ldr	r2, [r2, r1, asl #2]
	uxtb	r2, r2
	strb	r2, [r3, #0]
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #16896
	add	r3, r3, #27
	ldr	r2, [fp, #-16]
	eor	r1, r2, #1
	movw	r2, #:lower16:IPPU
	movt	r2, #:upper16:IPPU
	add	r1, r1, #916
	ldr	r2, [r2, r1, asl #2]
	mov	r2, r2, lsr #8
	uxtb	r2, r2
	strb	r2, [r3, #0]
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #16896
	add	r3, r3, #1
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	sxtb	r3, r3
	cmp	r3, #0
	bge	.L621
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #16896
	add	r3, r3, #28
	ldr	r1, [fp, #-16]
	movw	r2, #:lower16:IPPU
	movt	r2, #:upper16:IPPU
	add	r1, r1, #916
	ldr	r2, [r2, r1, asl #2]
	uxtb	r2, r2
	strb	r2, [r3, #0]
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #16896
	add	r3, r3, #29
	ldr	r1, [fp, #-16]
	movw	r2, #:lower16:IPPU
	movt	r2, #:upper16:IPPU
	add	r1, r1, #916
	ldr	r2, [r2, r1, asl #2]
	mov	r2, r2, lsr #8
	uxtb	r2, r2
	strb	r2, [r3, #0]
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #16896
	add	r3, r3, #30
	movw	r2, #:lower16:IPPU
	movt	r2, #:upper16:IPPU
	ldr	r2, [r2, #3672]
	uxtb	r2, r2
	strb	r2, [r3, #0]
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #16896
	add	r3, r3, #31
	movw	r2, #:lower16:IPPU
	movt	r2, #:upper16:IPPU
	ldr	r2, [r2, #3672]
	mov	r2, r2, lsr #8
	uxtb	r2, r2
	strb	r2, [r3, #0]
	b	.L622
.L621:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #16896
	add	r3, r3, #28
	movw	r2, #:lower16:IPPU
	movt	r2, #:upper16:IPPU
	ldr	r2, [r2, #3676]
	uxtb	r2, r2
	strb	r2, [r3, #0]
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #16896
	add	r3, r3, #29
	movw	r2, #:lower16:IPPU
	movt	r2, #:upper16:IPPU
	ldr	r2, [r2, #3676]
	mov	r2, r2, lsr #8
	uxtb	r2, r2
	strb	r2, [r3, #0]
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #16896
	add	r3, r3, #30
	movw	r2, #:lower16:IPPU
	movt	r2, #:upper16:IPPU
	ldr	r2, [r2, #3680]
	uxtb	r2, r2
	strb	r2, [r3, #0]
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #16896
	add	r3, r3, #31
	movw	r2, #:lower16:IPPU
	movt	r2, #:upper16:IPPU
	ldr	r2, [r2, #3680]
	mov	r2, r2, lsr #8
	uxtb	r2, r2
	strb	r2, [r3, #0]
.L622:
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, pc}
	.fnend
	.size	S9xUpdateJoypads, .-S9xUpdateJoypads
	.align	2
	.global	S9xSuperFXExec
	.type	S9xSuperFXExec, %function
S9xSuperFXExec:
	.fnstart
.LFB39:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	.pad #8
	sub	sp, sp, #8
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldrb	r3, [r3, #80]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L629
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #12288
	add	r3, r3, #48
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	and	r3, r3, #32
	cmp	r3, #0
	beq	.L629
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #12288
	add	r3, r3, #58
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	and	r3, r3, #24
	cmp	r3, #24
	bne	.L629
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldrb	r3, [r3, #290]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L625
	mvn	r0, #0
	bl	_Z9FxEmulatej
	b	.L626
.L625:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #12288
	add	r3, r3, #57
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	and	r3, r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L627
	mov	r3, #700
	b	.L628
.L627:
	movw	r3, #350
.L628:
	mov	r0, r3
	bl	_Z9FxEmulatej
.L626:
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #12288
	add	r3, r3, #48
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3
	movw	r3, #:lower16:Memory
	movt	r3, #:upper16:Memory
	ldr	r3, [r3, #20]
	add	r3, r3, #12288
	add	r3, r3, #49
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r3, r3, asl #8
	orr	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r2, [fp, #-8]
	movw	r3, #:lower16:32800
	movt	r3, #:upper16:32800
	and	r3, r2, r3
	cmp	r3, #32768
	bne	.L629
	mov	r0, #4
	bl	S9xSetIRQ
.L629:
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
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
	.ident	"GCC: (GNU) 4.4.1"
	.section	.note.GNU-stack,"",%progbits
