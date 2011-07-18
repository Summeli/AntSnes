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
	.file	"soundux.cpp"
	.text
	.align	2
	.type	_ZL15sounduxmemset32Pvmm, %function
_ZL15sounduxmemset32Pvmm:
	.fnstart
.LFB0:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	.save {fp}
	.setfp fp, sp, #0
	add	fp, sp, #0
	.pad #28
	sub	sp, sp, #28
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-8]
	b	.L2
.L3:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-20]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-8]
	add	r3, r3, #4
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-24]
	sub	r3, r3, #1
	str	r3, [fp, #-24]
.L2:
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.fnend
	.size	_ZL15sounduxmemset32Pvmm, .-_ZL15sounduxmemset32Pvmm
	.align	2
	.type	_ZL15S9xSetSoundMuteh, %function
_ZL15S9xSetSoundMuteh:
	.fnstart
.LFB9:
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
	movw	r3, #:lower16:so
	movt	r3, #:upper16:so
	ldrb	r2, [fp, #-5]
	strb	r2, [r3, #5]
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.fnend
	.size	_ZL15S9xSetSoundMuteh, .-_ZL15S9xSetSoundMuteh
	.align	2
	.type	_ZL13S9xSetEnvRateP7Channelmiij, %function
_ZL13S9xSetEnvRateP7Channelmiij:
	.fnstart
.LFB10:
	@ args = 4, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	.save {fp}
	.setfp fp, sp, #0
	add	fp, sp, #0
	.pad #20
	sub	sp, sp, #20
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	str	r2, [fp, #-16]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	uxth	r2, r3
	ldr	r3, [fp, #-8]
	strh	r2, [r3, #36]	@ movhi
	ldr	r3, [fp, #-12]
	cmn	r3, #1
	bne	.L8
	ldr	r3, [fp, #-8]
	mov	r2, #0
	str	r2, [r3, #48]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L9
.L8:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	str	r2, [r3, #48]
.L9:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	beq	.L10
	movw	r3, #:lower16:so
	movt	r3, #:upper16:so
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L11
.L10:
	ldr	r3, [fp, #-8]
	mov	r2, #0
	str	r2, [r3, #44]
	b	.L20
.L11:
	ldr	r3, [fp, #4]
	mov	r3, r3, lsr #28
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L20
.L19:
	.word	.L13
	.word	.L14
	.word	.L15
	.word	.L16
	.word	.L17
	.word	.L18
.L13:
	ldr	r3, [fp, #-8]
	ldrb	r3, [r3, #156]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r3, [fp, #-8]
	ldr	r0, [r3, #0]
	movw	r2, #:lower16:AttackERate
	movt	r2, #:upper16:AttackERate
	mov	r3, r1
	mov	r3, r3, asl #2
	add	r3, r3, r1
	mov	r3, r3, asl #1
	add	r3, r3, r0
	ldr	r2, [r2, r3, asl #2]
	ldr	r3, [fp, #-8]
	str	r2, [r3, #44]
	b	.L20
.L14:
	ldr	r3, [fp, #-8]
	ldrb	r3, [r3, #157]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r3, [fp, #-8]
	ldr	r0, [r3, #0]
	movw	r2, #:lower16:DecayERate
	movt	r2, #:upper16:DecayERate
	mov	r3, r1
	mov	r3, r3, asl #2
	add	r3, r3, r1
	mov	r3, r3, asl #1
	add	r3, r3, r0
	ldr	r2, [r2, r3, asl #2]
	ldr	r3, [fp, #-8]
	str	r2, [r3, #44]
	b	.L20
.L15:
	ldr	r3, [fp, #-8]
	ldrb	r3, [r3, #158]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r3, [fp, #-8]
	ldr	r0, [r3, #0]
	movw	r2, #:lower16:SustainERate
	movt	r2, #:upper16:SustainERate
	mov	r3, r1
	mov	r3, r3, asl #2
	add	r3, r3, r1
	mov	r3, r3, asl #1
	add	r3, r3, r0
	ldr	r2, [r2, r3, asl #2]
	ldr	r3, [fp, #-8]
	str	r2, [r3, #44]
	b	.L20
.L16:
	ldr	r3, [fp, #4]
	and	r1, r3, #31
	ldr	r3, [fp, #-8]
	ldr	r0, [r3, #0]
	movw	r2, #:lower16:IncreaseERate
	movt	r2, #:upper16:IncreaseERate
	mov	r3, r1
	mov	r3, r3, asl #2
	add	r3, r3, r1
	mov	r3, r3, asl #1
	add	r3, r3, r0
	ldr	r2, [r2, r3, asl #2]
	ldr	r3, [fp, #-8]
	str	r2, [r3, #44]
	b	.L20
.L17:
	ldr	r3, [fp, #4]
	and	r1, r3, #31
	ldr	r3, [fp, #-8]
	ldr	r0, [r3, #0]
	movw	r2, #:lower16:DecreaseERateExp
	movt	r2, #:upper16:DecreaseERateExp
	mov	r3, r1
	mov	r3, r3, asl #2
	add	r3, r3, r1
	mov	r3, r3, asl #1
	add	r3, r3, r0
	ldr	r2, [r2, r3, asl #2]
	ldr	r3, [fp, #-8]
	str	r2, [r3, #44]
	b	.L20
.L18:
	ldr	r3, [fp, #-8]
	ldr	r2, [r3, #0]
	movw	r3, #:lower16:KeyOffERate
	movt	r3, #:upper16:KeyOffERate
	ldr	r2, [r3, r2, asl #2]
	ldr	r3, [fp, #-8]
	str	r2, [r3, #44]
.L20:
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.fnend
	.size	_ZL13S9xSetEnvRateP7Channelmiij, .-_ZL13S9xSetEnvRateP7Channelmiij
	.align	2
	.type	_ZL16S9xSetEchoEnableh, %function
_ZL16S9xSetEchoEnableh:
	.fnstart
.LFB11:
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
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	str	r2, [r3, #28]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L22
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldrb	r3, [r3, #105]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L23
.L22:
	mov	r3, #0
	strb	r3, [fp, #-13]
.L23:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L24
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldr	r3, [r3, #8]
	cmp	r3, #0
	bne	.L24
	movw	r0, #:lower16:Echo
	movt	r0, #:upper16:Echo
	mov	r1, #0
	movw	r2, #:lower16:96000
	movt	r2, #:upper16:96000
	bl	memset
	movw	r0, #:lower16:Loop
	movt	r0, #:upper16:Loop
	mov	r1, #0
	mov	r2, #64
	bl	memset
.L24:
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	str	r2, [r3, #8]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L25
.L28:
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	ldr	r3, [fp, #-8]
	mov	r3, r2, asr r3
	and	r3, r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L26
	ldr	r1, [fp, #-8]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #176
	mov	r0, #212
	mul	r1, r0, r1
	add	r3, r1, r3
	add	r2, r3, r2
	movw	r3, #:lower16:EchoBuffer
	movt	r3, #:upper16:EchoBuffer
	str	r3, [r2, #0]
	b	.L27
.L26:
	ldr	r1, [fp, #-8]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #176
	mov	r0, #212
	mul	r1, r0, r1
	add	r3, r1, r3
	add	r3, r3, r2
	mov	r2, #0
	str	r2, [r3, #0]
.L27:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L25:
	ldr	r3, [fp, #-8]
	cmp	r3, #7
	movgt	r3, #0
	movle	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L28
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.fnend
	.size	_ZL16S9xSetEchoEnableh, .-_ZL16S9xSetEchoEnableh
	.align	2
	.type	_ZL18S9xSetEchoFeedbacki, %function
_ZL18S9xSetEchoFeedbacki:
	.fnstart
.LFB12:
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
	ldr	r3, [fp, #-8]
	cmn	r3, #128
	bge	.L31
	mvn	r3, #127
	str	r3, [fp, #-8]
	b	.L32
.L31:
	ldr	r3, [fp, #-8]
	cmp	r3, #127
	ble	.L32
	mov	r3, #127
	str	r3, [fp, #-8]
.L32:
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldr	r2, [fp, #-8]
	str	r2, [r3, #12]
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.fnend
	.size	_ZL18S9xSetEchoFeedbacki, .-_ZL18S9xSetEchoFeedbacki
	.align	2
	.type	_ZL23S9xSetFilterCoefficientii, %function
_ZL23S9xSetFilterCoefficientii:
	.fnstart
.LFB13:
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
	str	r1, [fp, #-12]
	ldr	r3, [fp, #-8]
	and	r2, r3, #7
	movw	r3, #:lower16:FilterTaps
	movt	r3, #:upper16:FilterTaps
	ldr	r1, [fp, #-12]
	str	r1, [r3, r2, asl #2]
	movw	r3, #:lower16:FilterTaps
	movt	r3, #:upper16:FilterTaps
	ldr	r3, [r3, #0]
	cmp	r3, #127
	beq	.L35
	movw	r3, #:lower16:FilterTaps
	movt	r3, #:upper16:FilterTaps
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L36
.L35:
	movw	r3, #:lower16:FilterTaps
	movt	r3, #:upper16:FilterTaps
	ldr	r3, [r3, #4]
	cmp	r3, #0
	bne	.L36
	movw	r3, #:lower16:FilterTaps
	movt	r3, #:upper16:FilterTaps
	ldr	r3, [r3, #8]
	cmp	r3, #0
	bne	.L36
	movw	r3, #:lower16:FilterTaps
	movt	r3, #:upper16:FilterTaps
	ldr	r3, [r3, #12]
	cmp	r3, #0
	bne	.L36
	movw	r3, #:lower16:FilterTaps
	movt	r3, #:upper16:FilterTaps
	ldr	r3, [r3, #16]
	cmp	r3, #0
	bne	.L36
	movw	r3, #:lower16:FilterTaps
	movt	r3, #:upper16:FilterTaps
	ldr	r3, [r3, #20]
	cmp	r3, #0
	bne	.L36
	movw	r3, #:lower16:FilterTaps
	movt	r3, #:upper16:FilterTaps
	ldr	r3, [r3, #24]
	cmp	r3, #0
	bne	.L36
	movw	r3, #:lower16:FilterTaps
	movt	r3, #:upper16:FilterTaps
	ldr	r3, [r3, #28]
	cmp	r3, #0
	bne	.L36
	mov	r3, #1
	b	.L37
.L36:
	mov	r3, #0
.L37:
	mov	r2, r3
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	strb	r2, [r3, #1744]
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.fnend
	.size	_ZL23S9xSetFilterCoefficientii, .-_ZL23S9xSetFilterCoefficientii
	.align	2
	.type	_ZL19S9xGetSampleAddressi, %function
_ZL19S9xGetSampleAddressi:
	.fnstart
.LFB14:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	.save {fp}
	.setfp fp, sp, #0
	add	fp, sp, #0
	.pad #20
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	movw	r3, #:lower16:APU
	movt	r3, #:upper16:APU
	ldrb	r3, [r3, #104]	@ zero_extendqisi2
	mov	r2, r3, asl #8
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #2
	add	r3, r2, r3
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	str	r3, [fp, #-8]
	movw	r3, #:lower16:IAPU
	movt	r3, #:upper16:IAPU
	ldr	r3, [r3, #68]
	mov	r2, r3
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.fnend
	.size	_ZL19S9xGetSampleAddressi, .-_ZL19S9xGetSampleAddressi
	.align	2
	.type	_ZL20S9xSetSoundFrequencyii, %function
_ZL20S9xSetSoundFrequencyii:
	.fnstart
.LFB15:
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
	str	r1, [fp, #-12]
	movw	r3, #:lower16:so
	movt	r3, #:upper16:so
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L44
	ldr	r1, [fp, #-8]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #52
	mov	r0, #212
	mul	r1, r0, r1
	add	r3, r1, r3
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	cmp	r3, #1
	bne	.L43
	movw	r3, #:lower16:APU
	movt	r3, #:upper16:APU
	ldrb	r3, [r3, #119]	@ zero_extendqisi2
	and	r2, r3, #31
	movw	r3, #:lower16:NoiseFreq
	movt	r3, #:upper16:NoiseFreq
	ldr	r3, [r3, r2, asl #2]
	str	r3, [fp, #-12]
.L43:
	ldr	r0, [fp, #-8]
	movw	r3, #:lower16:so
	movt	r3, #:upper16:so
	ldr	r3, [r3, #12]
	ldr	r2, [fp, #-12]
	mul	r3, r2, r3
	mov	r2, r3, lsr #11
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r1, #64
	mov	ip, #212
	mul	r0, ip, r0
	add	r3, r0, r3
	add	r3, r3, r1
	str	r2, [r3, #0]
.L44:
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.fnend
	.size	_ZL20S9xSetSoundFrequencyii, .-_ZL20S9xSetSoundFrequencyii
	.local	_ZL4wave
	.comm	_ZL4wave,7056,4
	.align	2
	.type	_ZL20S9xAPUSetEndOfSampleiP7Channel, %function
_ZL20S9xAPUSetEndOfSampleiP7Channel:
	.fnstart
.LFB36:
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
	str	r1, [fp, #-12]
	ldr	r3, [fp, #-12]
	mov	r2, #0
	str	r2, [r3, #0]
	ldr	r3, [fp, #-12]
	mov	r2, #0
	str	r2, [r3, #132]
	movw	r3, #:lower16:APU
	movt	r3, #:upper16:APU
	ldrb	r3, [r3, #135]	@ zero_extendqisi2
	mov	r2, r3
	mov	r1, #1
	ldr	r3, [fp, #-8]
	mov	r3, r1, asl r3
	uxtb	r3, r3
	orr	r3, r2, r3
	uxtb	r3, r3
	uxtb	r2, r3
	movw	r3, #:lower16:APU
	movt	r3, #:upper16:APU
	strb	r2, [r3, #135]
	movw	r3, #:lower16:APU
	movt	r3, #:upper16:APU
	ldrb	r3, [r3, #87]	@ zero_extendqisi2
	mov	r2, r3
	mov	r1, #1
	ldr	r3, [fp, #-8]
	mov	r3, r1, asl r3
	uxtb	r3, r3
	mvn	r3, r3
	uxtb	r3, r3
	and	r3, r2, r3
	uxtb	r3, r3
	uxtb	r2, r3
	movw	r3, #:lower16:APU
	movt	r3, #:upper16:APU
	strb	r2, [r3, #87]
	movw	r3, #:lower16:APU
	movt	r3, #:upper16:APU
	ldrb	r3, [r3, #103]	@ zero_extendqisi2
	mov	r2, r3
	mov	r1, #1
	ldr	r3, [fp, #-8]
	mov	r3, r1, asl r3
	uxtb	r3, r3
	mvn	r3, r3
	uxtb	r3, r3
	and	r3, r2, r3
	uxtb	r3, r3
	uxtb	r2, r3
	movw	r3, #:lower16:APU
	movt	r3, #:upper16:APU
	strb	r2, [r3, #103]
	movw	r3, #:lower16:APU
	movt	r3, #:upper16:APU
	ldrb	r3, [r3, #6]	@ zero_extendqisi2
	mov	r2, r3
	mov	r1, #1
	ldr	r3, [fp, #-8]
	mov	r3, r1, asl r3
	uxtb	r3, r3
	mvn	r3, r3
	uxtb	r3, r3
	and	r3, r2, r3
	uxtb	r3, r3
	uxtb	r2, r3
	movw	r3, #:lower16:APU
	movt	r3, #:upper16:APU
	strb	r2, [r3, #6]
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.fnend
	.size	_ZL20S9xAPUSetEndOfSampleiP7Channel, .-_ZL20S9xAPUSetEndOfSampleiP7Channel
	.align	2
	.type	_ZL13S9xAPUSetEndXi, %function
_ZL13S9xAPUSetEndXi:
	.fnstart
.LFB37:
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
	movw	r3, #:lower16:APU
	movt	r3, #:upper16:APU
	ldrb	r3, [r3, #135]	@ zero_extendqisi2
	mov	r2, r3
	mov	r1, #1
	ldr	r3, [fp, #-8]
	mov	r3, r1, asl r3
	uxtb	r3, r3
	orr	r3, r2, r3
	uxtb	r3, r3
	uxtb	r2, r3
	movw	r3, #:lower16:APU
	movt	r3, #:upper16:APU
	strb	r2, [r3, #135]
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.fnend
	.size	_ZL13S9xAPUSetEndXi, .-_ZL13S9xAPUSetEndXi
	.align	2
	.global	_Z15S9xSetEchoDelayi
	.type	_Z15S9xSetEchoDelayi, %function
_Z15S9xSetEchoDelayi:
	.fnstart
.LFB38:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	.pad #8
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r2, r3, asl #9
	movw	r3, #:lower16:so
	movt	r3, #:upper16:so
	ldr	r3, [r3, #0]
	mul	r3, r3, r2
	mov	r2, r3, asr #15
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	str	r2, [r3, #20]
	movw	r3, #:lower16:so
	movt	r3, #:upper16:so
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L50
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldr	r3, [r3, #20]
	mov	r2, r3, asl #1
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	str	r2, [r3, #20]
.L50:
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldr	r3, [r3, #20]
	cmp	r3, #0
	beq	.L51
	b	.L52
.L53:
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldr	r2, [r3, #16]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldr	r3, [r3, #20]
	rsb	r2, r3, r2
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	str	r2, [r3, #16]
.L52:
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldr	r2, [r3, #16]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldr	r3, [r3, #20]
	cmp	r2, r3
	movlt	r3, #0
	movge	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L53
	b	.L54
.L51:
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #0
	str	r2, [r3, #16]
.L54:
	movw	r3, #:lower16:APU
	movt	r3, #:upper16:APU
	ldrb	r3, [r3, #88]	@ zero_extendqisi2
	mov	r0, r3
	bl	_ZL16S9xSetEchoEnableh
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.fnend
	.size	_Z15S9xSetEchoDelayi, .-_Z15S9xSetEchoDelayi
	.align	2
	.global	_Z17S9xSetSoundKeyOffi
	.type	_Z17S9xSetSoundKeyOffi, %function
_Z17S9xSetSoundKeyOffi:
	.fnstart
.LFB39:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	.pad #24
	sub	sp, sp, #24
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r2, #212
	mul	r3, r2, r3
	add	r2, r3, #48
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L58
	ldr	r3, [fp, #-8]
	mov	r2, #4
	str	r2, [r3, #0]
	ldr	r3, [fp, #-8]
	mov	r2, #4
	str	r2, [r3, #132]
	mov	r3, #1342177280
	str	r3, [sp, #0]
	ldr	r0, [fp, #-8]
	mov	r1, #8
	mvn	r2, #0
	mov	r3, #0
	bl	_ZL13S9xSetEnvRateP7Channelmiij
.L58:
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.fnend
	.size	_Z17S9xSetSoundKeyOffi, .-_Z17S9xSetSoundKeyOffi
	.align	2
	.global	_Z28S9xFixSoundAfterSnapshotLoadv
	.type	_Z28S9xFixSoundAfterSnapshotLoadv, %function
_Z28S9xFixSoundAfterSnapshotLoadv:
	.fnstart
.LFB40:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	.pad #8
	sub	sp, sp, #8
	movw	r3, #:lower16:APU
	movt	r3, #:upper16:APU
	ldrb	r3, [r3, #119]	@ zero_extendqisi2
	and	r3, r3, #32
	cmp	r3, #0
	movne	r2, #0
	moveq	r2, #1
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	str	r2, [r3, #24]
	movw	r3, #:lower16:APU
	movt	r3, #:upper16:APU
	ldrb	r3, [r3, #88]	@ zero_extendqisi2
	mov	r2, r3
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	str	r2, [r3, #28]
	movw	r3, #:lower16:APU
	movt	r3, #:upper16:APU
	ldrb	r3, [r3, #136]	@ zero_extendqisi2
	and	r3, r3, #15
	mov	r0, r3
	bl	_Z15S9xSetEchoDelayi
	movw	r3, #:lower16:APU
	movt	r3, #:upper16:APU
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	sxtb	r3, r3
	mov	r0, r3
	bl	_ZL18S9xSetEchoFeedbacki
	movw	r3, #:lower16:APU
	movt	r3, #:upper16:APU
	ldrb	r3, [r3, #26]	@ zero_extendqisi2
	sxtb	r3, r3
	mov	r0, #0
	mov	r1, r3
	bl	_ZL23S9xSetFilterCoefficientii
	movw	r3, #:lower16:APU
	movt	r3, #:upper16:APU
	ldrb	r3, [r3, #42]	@ zero_extendqisi2
	sxtb	r3, r3
	mov	r0, #1
	mov	r1, r3
	bl	_ZL23S9xSetFilterCoefficientii
	movw	r3, #:lower16:APU
	movt	r3, #:upper16:APU
	ldrb	r3, [r3, #58]	@ zero_extendqisi2
	sxtb	r3, r3
	mov	r0, #2
	mov	r1, r3
	bl	_ZL23S9xSetFilterCoefficientii
	movw	r3, #:lower16:APU
	movt	r3, #:upper16:APU
	ldrb	r3, [r3, #74]	@ zero_extendqisi2
	sxtb	r3, r3
	mov	r0, #3
	mov	r1, r3
	bl	_ZL23S9xSetFilterCoefficientii
	movw	r3, #:lower16:APU
	movt	r3, #:upper16:APU
	ldrb	r3, [r3, #90]	@ zero_extendqisi2
	sxtb	r3, r3
	mov	r0, #4
	mov	r1, r3
	bl	_ZL23S9xSetFilterCoefficientii
	movw	r3, #:lower16:APU
	movt	r3, #:upper16:APU
	ldrb	r3, [r3, #106]	@ zero_extendqisi2
	sxtb	r3, r3
	mov	r0, #5
	mov	r1, r3
	bl	_ZL23S9xSetFilterCoefficientii
	movw	r3, #:lower16:APU
	movt	r3, #:upper16:APU
	ldrb	r3, [r3, #122]	@ zero_extendqisi2
	sxtb	r3, r3
	mov	r0, #6
	mov	r1, r3
	bl	_ZL23S9xSetFilterCoefficientii
	movw	r3, #:lower16:APU
	movt	r3, #:upper16:APU
	ldrb	r3, [r3, #138]	@ zero_extendqisi2
	sxtb	r3, r3
	mov	r0, #7
	mov	r1, r3
	bl	_ZL23S9xSetFilterCoefficientii
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L60
.L61:
	ldr	r1, [fp, #-8]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #160
	mov	r0, #212
	mul	r1, r0, r1
	add	r3, r1, r3
	add	r3, r3, r2
	mov	r2, #1
	strb	r2, [r3, #7]
	ldr	r1, [fp, #-8]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #60
	mov	r0, #212
	mul	r1, r0, r1
	add	r3, r1, r3
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	ldr	r0, [fp, #-8]
	mov	r1, r3
	bl	_ZL20S9xSetSoundFrequencyii
	ldr	r0, [fp, #-8]
	ldr	r1, [fp, #-8]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #76
	mov	ip, #212
	mul	r1, ip, r1
	add	r3, r1, r3
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	mov	r2, r3, asl #24
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r1, #184
	mov	ip, #212
	mul	r0, ip, r0
	add	r3, r0, r3
	add	r3, r3, r1
	str	r2, [r3, #0]
	ldr	r1, [fp, #-8]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #184
	mov	r0, #212
	mul	r1, r0, r1
	add	r3, r1, r3
	add	r3, r3, r2
	mov	r2, #0
	strh	r2, [r3, #4]	@ movhi
	ldr	r1, [fp, #-8]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #192
	mov	r0, #212
	mul	r1, r0, r1
	add	r3, r1, r3
	add	r3, r3, r2
	mov	r2, #0
	str	r2, [r3, #0]
	ldr	r0, [fp, #-8]
	ldr	r1, [fp, #-8]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #152
	mov	ip, #212
	mul	r1, ip, r1
	add	r3, r1, r3
	add	r3, r3, r2
	ldrh	r3, [r3, #2]
	sxth	r2, r3
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r1, #196
	mov	ip, #212
	mul	r0, ip, r0
	add	r3, r0, r3
	add	r3, r3, r1
	str	r2, [r3, #0]
	ldr	r0, [fp, #-8]
	ldr	r1, [fp, #-8]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #154
	mov	ip, #212
	mul	r1, ip, r1
	add	r3, r1, r3
	add	r3, r3, r2
	ldrh	r3, [r3, #2]
	sxth	r2, r3
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r1, #200
	mov	ip, #212
	mul	r0, ip, r0
	add	r3, r0, r3
	add	r3, r3, r1
	str	r2, [r3, #0]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L60:
	ldr	r3, [fp, #-8]
	cmp	r3, #7
	movgt	r3, #0
	movle	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L61
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldrh	r3, [r3, #0]
	sxth	r2, r3
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	str	r2, [r3, #1748]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldrh	r3, [r3, #2]
	sxth	r2, r3
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	str	r2, [r3, #1752]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldrh	r3, [r3, #4]
	sxth	r2, r3
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	str	r2, [r3, #1756]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldrh	r3, [r3, #6]
	sxth	r2, r3
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	str	r2, [r3, #1760]
	movw	r3, #:lower16:IAPU
	movt	r3, #:upper16:IAPU
	mov	r2, #0
	str	r2, [r3, #36]
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.fnend
	.size	_Z28S9xFixSoundAfterSnapshotLoadv, .-_Z28S9xFixSoundAfterSnapshotLoadv
	.align	2
	.global	_Z20S9xSetEnvelopeHeightii
	.type	_Z20S9xSetEnvelopeHeightii, %function
_Z20S9xSetEnvelopeHeightii:
	.fnstart
.LFB41:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	.pad #16
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-16]
	mov	r2, #212
	mul	r3, r2, r3
	add	r2, r3, #48
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-20]
	str	r2, [r3, #28]
	ldr	r3, [fp, #-20]
	mov	r2, r3, asl #24
	ldr	r3, [fp, #-8]
	str	r2, [r3, #136]
	ldr	r3, [fp, #-8]
	ldrh	r3, [r3, #8]
	sxth	r3, r3
	ldr	r2, [fp, #-20]
	mul	r3, r2, r3
	add	r2, r3, #127
	cmp	r3, #0
	movlt	r3, r2
	mov	r3, r3, asr #7
	uxth	r2, r3
	ldr	r3, [fp, #-8]
	strh	r2, [r3, #32]	@ movhi
	ldr	r3, [fp, #-8]
	ldrh	r3, [r3, #10]
	sxth	r3, r3
	ldr	r2, [fp, #-20]
	mul	r3, r2, r3
	add	r2, r3, #127
	cmp	r3, #0
	movlt	r3, r2
	mov	r3, r3, asr #7
	uxth	r2, r3
	ldr	r3, [fp, #-8]
	strh	r2, [r3, #34]	@ movhi
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #28]
	cmp	r3, #0
	bne	.L65
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L65
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #0]
	cmp	r3, #5
	beq	.L65
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-8]
	bl	_ZL20S9xAPUSetEndOfSampleiP7Channel
.L65:
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.fnend
	.size	_Z20S9xSetEnvelopeHeightii, .-_Z20S9xSetEnvelopeHeightii
	.align	2
	.global	_Z17S9xSetSoundSampleit
	.type	_Z17S9xSetSoundSampleit, %function
_Z17S9xSetSoundSampleit:
	.fnstart
.LFB42:
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
	mov	r3, r1
	strh	r3, [fp, #-10]	@ movhi
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.fnend
	.size	_Z17S9xSetSoundSampleit, .-_Z17S9xSetSoundSampleit
	.align	2
	.type	_ZL11DecodeBlockP7Channel, %function
_ZL11DecodeBlockP7Channel:
	.fnstart
.LFB43:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	.pad #40
	sub	sp, sp, #40
	str	r0, [fp, #-40]
	ldr	r3, [fp, #-40]
	ldr	r2, [r3, #120]
	movw	r3, #65526
	cmp	r2, r3
	bls	.L69
	ldr	r3, [fp, #-40]
	mov	r2, #1
	strb	r2, [r3, #118]
	ldr	r3, [fp, #-40]
	mov	r2, #0
	strb	r2, [r3, #24]
	ldr	r3, [fp, #-40]
	add	r2, r3, #74
	ldr	r3, [fp, #-40]
	str	r2, [r3, #112]
	ldr	r3, [fp, #-40]
	add	r3, r3, #74
	mov	r0, r3
	mov	r1, #0
	mov	r2, #8
	bl	_ZL15sounduxmemset32Pvmm
	b	.L86
.L69:
	movw	r3, #:lower16:IAPU
	movt	r3, #:upper16:IAPU
	ldr	r3, [r3, #68]
	mov	r2, r3
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #120]
	add	r3, r2, r3
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	strb	r3, [fp, #-29]
	ldrb	r3, [fp, #-29]	@ zero_extendqisi2
	and	r3, r3, #1
	ldr	r2, [fp, #-40]
	strb	r3, [r2, #118]
	ldr	r3, [fp, #-40]
	ldrb	r3, [r3, #118]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L71
	ldrb	r3, [fp, #-29]	@ zero_extendqisi2
	and	r3, r3, #2
	cmp	r3, #0
	moveq	r2, #0
	movne	r2, #1
	ldr	r3, [fp, #-40]
	strb	r2, [r3, #24]
.L71:
	ldr	r3, [fp, #-40]
	add	r2, r3, #74
	ldr	r3, [fp, #-40]
	str	r2, [r3, #112]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #112]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #148]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #152]
	str	r3, [fp, #-8]
	ldrb	r3, [fp, #-29]	@ zero_extendqisi2
	mov	r3, r3, asr #4
	strb	r3, [fp, #-19]
	ldrb	r3, [fp, #-29]	@ zero_extendqisi2
	mov	r3, r3, asr #2
	and	r3, r3, #3
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L72
.L77:
	.word	.L73
	.word	.L74
	.word	.L75
	.word	.L76
.L73:
	mov	r3, #8
	str	r3, [fp, #-16]
	b	.L78
.L79:
	ldr	r3, [fp, #-36]
	ldrb	r3, [r3, #0]
	strb	r3, [fp, #-18]
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
	ldrsb	r3, [fp, #-18]
	mov	r3, r3, asl #4
	strb	r3, [fp, #-17]
	ldrsb	r3, [fp, #-17]
	mov	r3, r3, asr #4
	strb	r3, [fp, #-17]
	ldrsb	r3, [fp, #-18]
	mov	r3, r3, asr #4
	strb	r3, [fp, #-18]
	ldrsb	r2, [fp, #-18]
	ldrb	r3, [fp, #-19]	@ zero_extendqisi2
	mov	r3, r2, asl r3
	uxth	r2, r3
	ldr	r3, [fp, #-28]
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-28]
	add	r3, r3, #2
	str	r3, [fp, #-28]
	ldrsb	r2, [fp, #-17]
	ldrb	r3, [fp, #-19]	@ zero_extendqisi2
	mov	r3, r2, asl r3
	uxth	r2, r3
	ldr	r3, [fp, #-28]
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-28]
	add	r3, r3, #2
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-16]
	sub	r3, r3, #1
	str	r3, [fp, #-16]
.L78:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L79
	ldr	r3, [fp, #-28]
	sub	r3, r3, #4
	ldrh	r3, [r3, #0]
	sxth	r3, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-28]
	sub	r3, r3, #2
	ldrh	r3, [r3, #0]
	sxth	r3, r3
	str	r3, [fp, #-12]
	b	.L72
.L74:
	mov	r3, #8
	str	r3, [fp, #-16]
	b	.L80
.L81:
	ldr	r3, [fp, #-36]
	ldrb	r3, [r3, #0]
	strb	r3, [fp, #-18]
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
	ldrsb	r3, [fp, #-18]
	mov	r3, r3, asl #4
	strb	r3, [fp, #-17]
	ldrsb	r3, [fp, #-17]
	mov	r3, r3, asr #4
	strb	r3, [fp, #-17]
	ldrsb	r3, [fp, #-18]
	mov	r3, r3, asr #4
	strb	r3, [fp, #-18]
	ldr	r3, [fp, #-12]
	uxth	r3, r3
	sxth	r3, r3
	str	r3, [fp, #-12]
	ldrsb	r2, [fp, #-18]
	ldrb	r3, [fp, #-19]	@ zero_extendqisi2
	mov	r2, r2, asl r3
	ldr	r3, [fp, #-12]
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	mov	r3, r3, asr #4
	rsb	r3, r3, r2
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	uxth	r2, r3
	ldr	r3, [fp, #-28]
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-28]
	add	r3, r3, #2
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-8]
	uxth	r3, r3
	sxth	r3, r3
	str	r3, [fp, #-8]
	ldrsb	r2, [fp, #-17]
	ldrb	r3, [fp, #-19]	@ zero_extendqisi2
	mov	r2, r2, asl r3
	ldr	r3, [fp, #-8]
	add	r2, r2, r3
	ldr	r3, [fp, #-8]
	mov	r3, r3, asr #4
	rsb	r3, r3, r2
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	uxth	r2, r3
	ldr	r3, [fp, #-28]
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-28]
	add	r3, r3, #2
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-16]
	sub	r3, r3, #1
	str	r3, [fp, #-16]
.L80:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L81
	b	.L72
.L75:
	mov	r3, #8
	str	r3, [fp, #-16]
	b	.L82
.L83:
	ldr	r3, [fp, #-36]
	ldrb	r3, [r3, #0]
	strb	r3, [fp, #-18]
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
	ldrsb	r3, [fp, #-18]
	mov	r3, r3, asl #4
	strb	r3, [fp, #-17]
	ldrsb	r3, [fp, #-17]
	mov	r3, r3, asr #4
	strb	r3, [fp, #-17]
	ldrsb	r3, [fp, #-18]
	mov	r3, r3, asr #4
	strb	r3, [fp, #-18]
	ldrsb	r2, [fp, #-18]
	ldrb	r3, [fp, #-19]	@ zero_extendqisi2
	mov	r2, r2, asl r3
	ldr	r3, [fp, #-8]
	rsb	r2, r3, r2
	ldr	r3, [fp, #-8]
	mov	r3, r3, asr #4
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-12]
	uxth	r3, r3
	sxth	r3, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	bic	r3, r3, #3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	mov	r2, r3, asl #1
	ldr	r3, [fp, #-24]
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	mov	r3, r3, asr #5
	rsb	r2, r3, r2
	ldr	r3, [fp, #-12]
	mov	r3, r3, asr #4
	rsb	r3, r3, r2
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	uxth	r2, r3
	ldr	r3, [fp, #-28]
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-28]
	add	r3, r3, #2
	str	r3, [fp, #-28]
	ldrsb	r2, [fp, #-17]
	ldrb	r3, [fp, #-19]	@ zero_extendqisi2
	mov	r2, r2, asl r3
	ldr	r3, [fp, #-8]
	rsb	r2, r3, r2
	ldr	r3, [fp, #-8]
	mov	r3, r3, asr #4
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-12]
	uxth	r3, r3
	sxth	r3, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	bic	r3, r3, #3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	mov	r2, r3, asl #1
	ldr	r3, [fp, #-24]
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	mov	r3, r3, asr #5
	rsb	r2, r3, r2
	ldr	r3, [fp, #-12]
	mov	r3, r3, asr #4
	rsb	r3, r3, r2
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	uxth	r2, r3
	ldr	r3, [fp, #-28]
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-28]
	add	r3, r3, #2
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-16]
	sub	r3, r3, #1
	str	r3, [fp, #-16]
.L82:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L83
	b	.L72
.L76:
	mov	r3, #8
	str	r3, [fp, #-16]
	b	.L84
.L85:
	ldr	r3, [fp, #-36]
	ldrb	r3, [r3, #0]
	strb	r3, [fp, #-18]
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
	ldrsb	r3, [fp, #-18]
	mov	r3, r3, asl #4
	strb	r3, [fp, #-17]
	ldrsb	r3, [fp, #-17]
	mov	r3, r3, asr #4
	strb	r3, [fp, #-17]
	ldrsb	r3, [fp, #-18]
	mov	r3, r3, asr #4
	strb	r3, [fp, #-18]
	ldrsb	r2, [fp, #-18]
	ldrb	r3, [fp, #-19]	@ zero_extendqisi2
	mov	r3, r2, asl r3
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-8]
	rsb	r2, r3, r2
	ldr	r3, [fp, #-8]
	mov	r3, r3, asr #3
	add	r2, r2, r3
	ldr	r3, [fp, #-8]
	mov	r3, r3, asr #4
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-12]
	uxth	r3, r3
	sxth	r3, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	bic	r3, r3, #3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	mov	r2, r3, asl #1
	ldr	r3, [fp, #-24]
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	mov	r3, r3, asr #3
	rsb	r2, r3, r2
	ldr	r3, [fp, #-12]
	mov	r3, r3, asr #4
	rsb	r2, r3, r2
	ldr	r3, [fp, #-8]
	mov	r3, r3, asr #6
	rsb	r3, r3, r2
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	uxth	r2, r3
	ldr	r3, [fp, #-28]
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-28]
	add	r3, r3, #2
	str	r3, [fp, #-28]
	ldrsb	r2, [fp, #-17]
	ldrb	r3, [fp, #-19]	@ zero_extendqisi2
	mov	r3, r2, asl r3
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-8]
	rsb	r2, r3, r2
	ldr	r3, [fp, #-8]
	mov	r3, r3, asr #3
	add	r2, r2, r3
	ldr	r3, [fp, #-8]
	mov	r3, r3, asr #4
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-12]
	uxth	r3, r3
	sxth	r3, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	bic	r3, r3, #3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	mov	r2, r3, asl #1
	ldr	r3, [fp, #-24]
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	mov	r3, r3, asr #3
	rsb	r2, r3, r2
	ldr	r3, [fp, #-12]
	mov	r3, r3, asr #4
	rsb	r2, r3, r2
	ldr	r3, [fp, #-8]
	mov	r3, r3, asr #6
	rsb	r3, r3, r2
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	uxth	r2, r3
	ldr	r3, [fp, #-28]
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-28]
	add	r3, r3, #2
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-16]
	sub	r3, r3, #1
	str	r3, [fp, #-16]
.L84:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L85
.L72:
	ldr	r3, [fp, #-40]
	ldr	r2, [fp, #-12]
	str	r2, [r3, #148]
	ldr	r3, [fp, #-40]
	ldr	r2, [fp, #-8]
	str	r2, [r3, #152]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #120]
	add	r2, r3, #9
	ldr	r3, [fp, #-40]
	str	r2, [r3, #120]
.L86:
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.fnend
	.size	_ZL11DecodeBlockP7Channel, .-_ZL11DecodeBlockP7Channel
	.align	2
	.type	_ZL9MixStereoi, %function
_ZL9MixStereoi:
	.fnstart
.LFB44:
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	.pad #64
	sub	sp, sp, #64
	str	r0, [fp, #-56]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldr	r3, [r3, #32]
	mov	r2, r3
	movw	r3, #:lower16:APU
	movt	r3, #:upper16:APU
	ldrb	r3, [r3, #72]	@ zero_extendqisi2
	mvn	r3, r3
	and	r3, r2, r3
	str	r3, [fp, #-52]
	mov	r3, #0
	str	r3, [fp, #-48]
	b	.L88
.L152:
	ldr	r3, [fp, #-48]
	mov	r2, #212
	mul	r3, r2, r3
	add	r2, r3, #48
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	add	r3, r2, r3
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #16]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L154
	movw	r3, #:lower16:so
	movt	r3, #:upper16:so
	ldrb	r3, [r3, #6]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-48]
	mov	r3, r2, asr r3
	and	r3, r3, #1
	uxtb	r3, r3
	eor	r3, r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L155
.L90:
	ldr	r3, [fp, #-48]
	mov	r2, #1
	mov	r3, r2, asl r3
	uxtb	r2, r3
	ldr	r3, [fp, #-52]
	uxtb	r3, r3
	and	r3, r2, r3
	uxtb	r3, r3
	strb	r3, [fp, #-25]
	ldr	r3, [fp, #-36]
	ldrb	r3, [r3, #119]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L92
	ldr	r0, [fp, #-36]
	bl	_ZL11DecodeBlockP7Channel
	ldr	r3, [fp, #-36]
	mov	r2, #0
	strb	r2, [r3, #119]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #112]
	ldrh	r2, [r3, #0]
	ldr	r3, [fp, #-36]
	strh	r2, [r3, #72]	@ movhi
	ldr	r3, [fp, #-32]
	mov	r2, r3, lsr #16
	ldr	r3, [fp, #-36]
	str	r2, [r3, #124]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #124]
	cmp	r3, #0
	bne	.L93
	ldr	r3, [fp, #-36]
	mov	r2, #1
	str	r2, [r3, #124]
.L93:
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #124]
	cmp	r3, #16
	bls	.L94
	ldr	r3, [fp, #-36]
	mov	r2, #15
	str	r2, [r3, #124]
.L94:
	ldr	r3, [fp, #-36]
	ldr	r2, [r3, #112]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #124]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r2, [r3, #0]
	ldr	r3, [fp, #-36]
	strh	r2, [r3, #140]	@ movhi
	ldr	r3, [fp, #-36]
	mov	r2, #0
	str	r2, [r3, #144]
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldrb	r3, [r3, #109]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L92
	ldr	r2, [fp, #-32]
	movw	r3, #65535
	cmp	r2, r3
	bhi	.L92
	ldrb	r3, [fp, #-25]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L92
	ldr	r3, [fp, #-36]
	ldrh	r3, [r3, #140]
	sxth	r2, r3
	ldr	r3, [fp, #-36]
	ldrh	r3, [r3, #72]
	sxth	r3, r3
	rsb	r3, r3, r2
	ldr	r2, [fp, #-32]
	mul	r3, r2, r3
	add	r2, r3, #65280
	add	r2, r2, #255
	cmp	r3, #0
	movlt	r3, r2
	mov	r3, r3, asr #16
	mov	r2, r3
	ldr	r3, [fp, #-36]
	str	r2, [r3, #144]
.L92:
	ldr	r3, [fp, #-36]
	ldrh	r3, [r3, #72]
	sxth	r3, r3
	ldr	r2, [fp, #-36]
	ldrh	r2, [r2, #32]
	sxth	r2, r2
	mul	r3, r2, r3
	add	r2, r3, #127
	cmp	r3, #0
	movlt	r3, r2
	mov	r3, r3, asr #7
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-36]
	ldrh	r3, [r3, #72]
	sxth	r3, r3
	ldr	r2, [fp, #-36]
	ldrh	r2, [r2, #34]
	sxth	r2, r2
	mul	r3, r2, r3
	add	r2, r3, #127
	cmp	r3, #0
	movlt	r3, r2
	mov	r3, r3, asr #7
	str	r3, [fp, #-40]
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L95
.L151:
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-20]
	ldrb	r3, [fp, #-25]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L96
	ldr	r3, [fp, #-24]
	mov	r2, r3, lsr #1
	movw	r3, #:lower16:_ZL4wave
	movt	r3, #:upper16:_ZL4wave
	ldr	r3, [r3, r2, asl #2]
	add	r3, r3, #8388608
	mov	r3, r3, lsr #16
	ldr	r2, [fp, #-20]
	mul	r3, r2, r3
	mov	r3, r3, lsr #7
	str	r3, [fp, #-20]
.L96:
	ldr	r3, [fp, #-36]
	ldr	r2, [r3, #40]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #44]
	add	r2, r2, r3
	ldr	r3, [fp, #-36]
	str	r2, [r3, #40]
	ldr	r3, [fp, #-36]
	ldr	r2, [r3, #40]
	movw	r3, #65535
	cmp	r2, r3
	bls	.L97
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #40]
	mov	r3, r3, lsr #16
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #0]
	sub	r3, r3, #1
	cmp	r3, #8
	ldrls	pc, [pc, r3, asl #2]
	b	.L98
.L108:
	.word	.L99
	.word	.L111
	.word	.L115
	.word	.L118
	.word	.L103
	.word	.L104
	.word	.L105
	.word	.L106
	.word	.L128
.L99:
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #40]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldr	r2, [fp, #-36]
	str	r3, [r2, #40]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #28]
	mov	r2, r3
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	mov	r2, r3
	ldr	r3, [fp, #-36]
	str	r2, [r3, #28]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #28]
	mov	r2, r3, asl #24
	ldr	r3, [fp, #-36]
	str	r2, [r3, #136]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #28]
	cmp	r3, #125
	ble	.L156
	ldr	r3, [fp, #-36]
	mov	r2, #127
	str	r2, [r3, #28]
	ldr	r3, [fp, #-36]
	mov	r2, #2130706432
	str	r2, [r3, #136]
	ldr	r3, [fp, #-36]
	mov	r2, #2
	str	r2, [r3, #0]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #68]
	cmp	r3, #8
	beq	.L110
	ldr	r3, [fp, #-36]
	ldr	r1, [r3, #56]
	ldr	r3, [fp, #-36]
	ldr	r2, [r3, #68]
	mov	r3, r2
	mov	r3, r3, asl #7
	rsb	r3, r2, r3
	mov	r3, r3, lsr #3
	mov	r2, #268435456
	str	r2, [sp, #0]
	ldr	r0, [fp, #-36]
	mvn	r2, #0
	bl	_ZL13S9xSetEnvRateP7Channelmiij
	b	.L98
.L110:
	ldr	r3, [fp, #-36]
	mov	r2, #3
	str	r2, [r3, #0]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #60]
	mov	r2, #536870912
	str	r2, [sp, #0]
	ldr	r0, [fp, #-36]
	mov	r1, r3
	mvn	r2, #0
	mov	r3, #0
	bl	_ZL13S9xSetEnvRateP7Channelmiij
	b	.L98
.L112:
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #136]
	mov	r2, r3, asr #8
	mov	r3, r2
	mov	r3, r3, asl #8
	rsb	r2, r2, r3
	ldr	r3, [fp, #-36]
	str	r2, [r3, #136]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #40]
	sub	r2, r3, #65536
	ldr	r3, [fp, #-36]
	str	r2, [r3, #40]
.L111:
	ldr	r3, [fp, #-36]
	ldr	r2, [r3, #40]
	movw	r3, #65535
	cmp	r2, r3
	movls	r3, #0
	movhi	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L112
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #136]
	mov	r2, r3, asr #24
	ldr	r3, [fp, #-36]
	str	r2, [r3, #28]
	ldr	r3, [fp, #-36]
	ldr	r2, [r3, #28]
	ldr	r3, [fp, #-36]
	ldrh	r3, [r3, #36]
	sxth	r3, r3
	cmp	r2, r3
	bgt	.L157
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #28]
	cmp	r3, #0
	bgt	.L114
	ldr	r3, [fp, #-48]
	mov	r0, r3
	ldr	r1, [fp, #-36]
	bl	_ZL20S9xAPUSetEndOfSampleiP7Channel
	b	.L91
.L114:
	ldr	r3, [fp, #-36]
	mov	r2, #3
	str	r2, [r3, #0]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #60]
	mov	r2, #536870912
	str	r2, [sp, #0]
	ldr	r0, [fp, #-36]
	mov	r1, r3
	mvn	r2, #0
	mov	r3, #0
	bl	_ZL13S9xSetEnvRateP7Channelmiij
	b	.L98
.L116:
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #136]
	mov	r2, r3, asr #8
	mov	r3, r2
	mov	r3, r3, asl #8
	rsb	r2, r2, r3
	ldr	r3, [fp, #-36]
	str	r2, [r3, #136]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #40]
	sub	r2, r3, #65536
	ldr	r3, [fp, #-36]
	str	r2, [r3, #40]
.L115:
	ldr	r3, [fp, #-36]
	ldr	r2, [r3, #40]
	movw	r3, #65535
	cmp	r2, r3
	movls	r3, #0
	movhi	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L116
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #136]
	mov	r2, r3, asr #24
	ldr	r3, [fp, #-36]
	str	r2, [r3, #28]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #28]
	cmp	r3, #0
	bgt	.L158
	ldr	r3, [fp, #-48]
	mov	r0, r3
	ldr	r1, [fp, #-36]
	bl	_ZL20S9xAPUSetEndOfSampleiP7Channel
	b	.L91
.L119:
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #136]
	sub	r2, r3, #8323072
	ldr	r3, [fp, #-36]
	str	r2, [r3, #136]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #40]
	sub	r2, r3, #65536
	ldr	r3, [fp, #-36]
	str	r2, [r3, #40]
.L118:
	ldr	r3, [fp, #-36]
	ldr	r2, [r3, #40]
	movw	r3, #65535
	cmp	r2, r3
	movls	r3, #0
	movhi	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L119
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #136]
	mov	r2, r3, asr #24
	ldr	r3, [fp, #-36]
	str	r2, [r3, #28]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #28]
	cmp	r3, #0
	bgt	.L159
	ldr	r3, [fp, #-48]
	mov	r0, r3
	ldr	r1, [fp, #-36]
	bl	_ZL20S9xAPUSetEndOfSampleiP7Channel
	b	.L91
.L104:
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #40]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldr	r2, [fp, #-36]
	str	r3, [r2, #40]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #28]
	mov	r2, r3
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	mov	r2, r3
	ldr	r3, [fp, #-36]
	str	r2, [r3, #28]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #28]
	mov	r2, r3, asl #24
	ldr	r3, [fp, #-36]
	str	r2, [r3, #136]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #28]
	cmp	r3, #125
	ble	.L160
	ldr	r3, [fp, #-36]
	mov	r2, #127
	str	r2, [r3, #28]
	ldr	r3, [fp, #-36]
	mov	r2, #2130706432
	str	r2, [r3, #136]
	ldr	r3, [fp, #-36]
	mov	r2, #5
	str	r2, [r3, #0]
	ldr	r3, [fp, #-36]
	mov	r2, #5
	str	r2, [r3, #132]
	mov	r3, #0
	str	r3, [sp, #0]
	ldr	r0, [fp, #-36]
	mov	r1, #0
	mvn	r2, #0
	mov	r3, #0
	bl	_ZL13S9xSetEnvRateP7Channelmiij
	b	.L98
.L105:
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #28]
	cmp	r3, #94
	ble	.L122
	b	.L123
.L124:
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #136]
	add	r2, r3, #8323072
	ldr	r3, [fp, #-36]
	str	r2, [r3, #136]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #40]
	sub	r2, r3, #65536
	ldr	r3, [fp, #-36]
	str	r2, [r3, #40]
.L123:
	ldr	r3, [fp, #-36]
	ldr	r2, [r3, #40]
	movw	r3, #65535
	cmp	r2, r3
	movls	r3, #0
	movhi	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L124
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #136]
	mov	r2, r3, asr #24
	ldr	r3, [fp, #-36]
	str	r2, [r3, #28]
	b	.L125
.L122:
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #40]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldr	r2, [fp, #-36]
	str	r3, [r2, #40]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #28]
	mov	r2, r3
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	mov	r2, r3
	ldr	r3, [fp, #-36]
	str	r2, [r3, #28]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #28]
	mov	r2, r3, asl #24
	ldr	r3, [fp, #-36]
	str	r2, [r3, #136]
.L125:
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #28]
	cmp	r3, #125
	ble	.L161
	ldr	r3, [fp, #-36]
	mov	r2, #127
	str	r2, [r3, #28]
	ldr	r3, [fp, #-36]
	mov	r2, #2130706432
	str	r2, [r3, #136]
	ldr	r3, [fp, #-36]
	mov	r2, #5
	str	r2, [r3, #0]
	ldr	r3, [fp, #-36]
	mov	r2, #5
	str	r2, [r3, #132]
	mov	r3, #0
	str	r3, [sp, #0]
	ldr	r0, [fp, #-36]
	mov	r1, #0
	mvn	r2, #0
	mov	r3, #0
	bl	_ZL13S9xSetEnvRateP7Channelmiij
	b	.L98
.L106:
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #40]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldr	r2, [fp, #-36]
	str	r3, [r2, #40]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #28]
	mov	r2, r3
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #1
	rsb	r3, r3, r2
	mov	r2, r3
	ldr	r3, [fp, #-36]
	str	r2, [r3, #28]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #28]
	mov	r2, r3, asl #24
	ldr	r3, [fp, #-36]
	str	r2, [r3, #136]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #28]
	cmp	r3, #0
	bgt	.L162
	ldr	r3, [fp, #-48]
	mov	r0, r3
	ldr	r1, [fp, #-36]
	bl	_ZL20S9xAPUSetEndOfSampleiP7Channel
	b	.L91
.L129:
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #136]
	mov	r2, r3, asr #8
	mov	r3, r2
	mov	r3, r3, asl #8
	rsb	r2, r2, r3
	ldr	r3, [fp, #-36]
	str	r2, [r3, #136]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #40]
	sub	r2, r3, #65536
	ldr	r3, [fp, #-36]
	str	r2, [r3, #40]
.L128:
	ldr	r3, [fp, #-36]
	ldr	r2, [r3, #40]
	movw	r3, #65535
	cmp	r2, r3
	movls	r3, #0
	movhi	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L129
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #136]
	mov	r2, r3, asr #24
	ldr	r3, [fp, #-36]
	str	r2, [r3, #28]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #28]
	cmp	r3, #0
	bgt	.L163
	ldr	r3, [fp, #-48]
	mov	r0, r3
	ldr	r1, [fp, #-36]
	bl	_ZL20S9xAPUSetEndOfSampleiP7Channel
	b	.L91
.L103:
	mov	r3, #0
	str	r3, [sp, #0]
	ldr	r0, [fp, #-36]
	mov	r1, #0
	mvn	r2, #0
	mov	r3, #0
	bl	_ZL13S9xSetEnvRateP7Channelmiij
	b	.L98
.L156:
	mov	r0, r0	@ nop
	b	.L98
.L157:
	mov	r0, r0	@ nop
	b	.L98
.L158:
	mov	r0, r0	@ nop
	b	.L98
.L159:
	mov	r0, r0	@ nop
	b	.L98
.L160:
	mov	r0, r0	@ nop
	b	.L98
.L161:
	mov	r0, r0	@ nop
	b	.L98
.L162:
	mov	r0, r0	@ nop
	b	.L98
.L163:
	mov	r0, r0	@ nop
.L98:
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #28]
	ldr	r2, [fp, #-36]
	ldrh	r2, [r2, #8]
	sxth	r2, r2
	mul	r3, r2, r3
	add	r2, r3, #127
	cmp	r3, #0
	movlt	r3, r2
	mov	r3, r3, asr #7
	uxth	r2, r3
	ldr	r3, [fp, #-36]
	strh	r2, [r3, #32]	@ movhi
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #28]
	ldr	r2, [fp, #-36]
	ldrh	r2, [r2, #10]
	sxth	r2, r2
	mul	r3, r2, r3
	add	r2, r3, #127
	cmp	r3, #0
	movlt	r3, r2
	mov	r3, r3, asr #7
	uxth	r2, r3
	ldr	r3, [fp, #-36]
	strh	r2, [r3, #34]	@ movhi
	ldr	r3, [fp, #-36]
	ldrh	r3, [r3, #72]
	sxth	r3, r3
	ldr	r2, [fp, #-36]
	ldrh	r2, [r2, #32]
	sxth	r2, r2
	mul	r3, r2, r3
	add	r2, r3, #127
	cmp	r3, #0
	movlt	r3, r2
	mov	r3, r3, asr #7
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-36]
	ldrh	r3, [r3, #72]
	sxth	r3, r3
	ldr	r2, [fp, #-36]
	ldrh	r2, [r2, #34]
	sxth	r2, r2
	mul	r3, r2, r3
	add	r2, r3, #127
	cmp	r3, #0
	movlt	r3, r2
	mov	r3, r3, asr #7
	str	r3, [fp, #-40]
.L97:
	ldr	r3, [fp, #-36]
	ldr	r2, [r3, #20]
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	ldr	r3, [fp, #-36]
	str	r2, [r3, #20]
	ldr	r3, [fp, #-36]
	ldr	r2, [r3, #20]
	movw	r3, #65535
	cmp	r2, r3
	bls	.L131
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #20]
	mov	r3, r3, lsr #16
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-36]
	ldr	r2, [r3, #124]
	ldr	r3, [fp, #-44]
	add	r2, r2, r3
	ldr	r3, [fp, #-36]
	str	r2, [r3, #124]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #20]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldr	r2, [fp, #-36]
	str	r3, [r2, #20]
	ldr	r3, [fp, #-36]
	ldrh	r2, [r3, #140]
	ldr	r3, [fp, #-36]
	strh	r2, [r3, #72]	@ movhi
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #124]
	cmp	r3, #15
	bls	.L132
	ldr	r3, [fp, #-36]
	ldr	r2, [r3, #124]
	movw	r3, #:lower16:16777214
	movt	r3, #:upper16:16777214
	cmp	r2, r3
	bls	.L133
	ldr	r3, [fp, #-48]
	mov	r0, r3
	ldr	r1, [fp, #-36]
	bl	_ZL20S9xAPUSetEndOfSampleiP7Channel
	b	.L91
.L133:
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #124]
	sub	r2, r3, #16
	ldr	r3, [fp, #-36]
	str	r2, [r3, #124]
	ldr	r3, [fp, #-36]
	ldrb	r3, [r3, #118]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L134
	ldr	r3, [fp, #-36]
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L135
	ldr	r3, [fp, #-36]
	mvn	r2, #-16777216
	str	r2, [r3, #124]
	ldr	r3, [fp, #-36]
	ldrh	r2, [r3, #72]
	ldr	r3, [fp, #-36]
	strh	r2, [r3, #140]	@ movhi
	b	.L136
.L135:
	ldr	r3, [fp, #-48]
	mov	r0, r3
	bl	_ZL13S9xAPUSetEndXi
	ldr	r3, [fp, #-36]
	mov	r2, #0
	strb	r2, [r3, #118]
	ldr	r3, [fp, #-36]
	ldrh	r3, [r3, #116]
	mov	r0, r3
	bl	_ZL19S9xGetSampleAddressi
	mov	r3, r0
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	add	r3, r3, #2
	ldrh	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, [fp, #-36]
	str	r2, [r3, #120]
.L134:
	ldr	r0, [fp, #-36]
	bl	_ZL11DecodeBlockP7Channel
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #124]
	cmp	r3, #15
	movls	r3, #0
	movhi	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L133
.L136:
	ldr	r3, [fp, #-36]
	ldr	r2, [r3, #124]
	movw	r3, #:lower16:16777214
	movt	r3, #:upper16:16777214
	cmp	r2, r3
	bhi	.L164
	ldr	r3, [fp, #-36]
	ldr	r2, [r3, #112]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #124]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r2, [r3, #0]
	ldr	r3, [fp, #-36]
	strh	r2, [r3, #140]	@ movhi
	b	.L138
.L132:
	ldr	r3, [fp, #-36]
	ldr	r2, [r3, #112]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #124]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r2, [r3, #0]
	ldr	r3, [fp, #-36]
	strh	r2, [r3, #140]	@ movhi
	b	.L138
.L164:
	mov	r0, r0	@ nop
.L138:
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	bne	.L143
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldrb	r3, [r3, #109]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L140
	ldr	r2, [fp, #-20]
	movw	r3, #65535
	cmp	r2, r3
	bhi	.L140
	ldrb	r3, [fp, #-25]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L140
	ldr	r3, [fp, #-36]
	ldrh	r3, [r3, #140]
	sxth	r2, r3
	ldr	r3, [fp, #-36]
	ldrh	r3, [r3, #72]
	sxth	r3, r3
	rsb	r3, r3, r2
	ldr	r2, [fp, #-20]
	mul	r3, r2, r3
	add	r2, r3, #65280
	add	r2, r2, #255
	cmp	r3, #0
	movlt	r3, r2
	mov	r3, r3, asr #16
	mov	r2, r3
	ldr	r3, [fp, #-36]
	str	r2, [r3, #144]
	ldr	r3, [fp, #-36]
	ldrh	r3, [r3, #72]
	uxth	r1, r3
	ldr	r3, [fp, #-36]
	ldrh	r3, [r3, #140]
	sxth	r2, r3
	ldr	r3, [fp, #-36]
	ldrh	r3, [r3, #72]
	sxth	r3, r3
	rsb	r3, r3, r2
	ldr	r2, [fp, #-36]
	ldr	r2, [r2, #20]
	mul	r3, r2, r3
	add	r2, r3, #65280
	add	r2, r2, #255
	cmp	r3, #0
	movlt	r3, r2
	mov	r3, r3, asr #16
	uxth	r3, r3
	add	r3, r1, r3
	uxth	r3, r3
	mov	r2, r3
	ldr	r3, [fp, #-36]
	strh	r2, [r3, #72]	@ movhi
	mov	r0, r0	@ nop
	b	.L142
.L140:
	ldr	r3, [fp, #-36]
	mov	r2, #0
	str	r2, [r3, #144]
	b	.L142
.L145:
	movw	r3, #:lower16:so
	movt	r3, #:upper16:so
	ldr	r3, [r3, #8]
	mov	r2, r3, asl #1
	movw	r3, #:lower16:so
	movt	r3, #:upper16:so
	str	r2, [r3, #8]
	movw	r3, #:lower16:so
	movt	r3, #:upper16:so
	ldr	r3, [r3, #8]
	mov	r3, r3, lsr #31
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L144
	movw	r3, #:lower16:so
	movt	r3, #:upper16:so
	ldr	r2, [r3, #8]
	movw	r3, #:lower16:262145
	movt	r3, #:upper16:262145
	eor	r2, r2, r3
	movw	r3, #:lower16:so
	movt	r3, #:upper16:so
	str	r2, [r3, #8]
.L144:
	ldr	r3, [fp, #-44]
	sub	r3, r3, #1
	str	r3, [fp, #-44]
.L143:
	ldr	r3, [fp, #-44]
	cmp	r3, #0
	movle	r3, #0
	movgt	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L145
	movw	r3, #:lower16:so
	movt	r3, #:upper16:so
	ldr	r3, [r3, #8]
	mov	r3, r3, asl #17
	mov	r3, r3, asr #17
	uxth	r2, r3
	ldr	r3, [fp, #-36]
	strh	r2, [r3, #72]	@ movhi
	ldr	r3, [fp, #-36]
	mov	r2, #0
	str	r2, [r3, #144]
.L142:
	ldr	r3, [fp, #-36]
	ldrh	r3, [r3, #72]
	sxth	r3, r3
	ldr	r2, [fp, #-36]
	ldrh	r2, [r2, #32]
	sxth	r2, r2
	mul	r3, r2, r3
	add	r2, r3, #127
	cmp	r3, #0
	movlt	r3, r2
	mov	r3, r3, asr #7
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-36]
	ldrh	r3, [r3, #72]
	sxth	r3, r3
	ldr	r2, [fp, #-36]
	ldrh	r2, [r2, #34]
	sxth	r2, r2
	mul	r3, r2, r3
	add	r2, r3, #127
	cmp	r3, #0
	movlt	r3, r2
	mov	r3, r3, asr #7
	str	r3, [fp, #-40]
	b	.L146
.L131:
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #144]
	cmp	r3, #0
	beq	.L146
	ldr	r3, [fp, #-36]
	ldrh	r3, [r3, #72]
	sxth	r2, r3
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #144]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmn	r3, #32768
	bge	.L147
	movw	r3, #:lower16:-32768
	movt	r3, #:upper16:-32768
	str	r3, [fp, #-8]
	b	.L148
.L147:
	ldr	r2, [fp, #-8]
	movw	r3, #32767
	cmp	r2, r3
	ble	.L148
	movw	r3, #32767
	str	r3, [fp, #-8]
.L148:
	ldr	r3, [fp, #-8]
	uxth	r2, r3
	ldr	r3, [fp, #-36]
	strh	r2, [r3, #72]	@ movhi
	ldr	r3, [fp, #-36]
	ldrh	r3, [r3, #72]
	sxth	r3, r3
	ldr	r2, [fp, #-36]
	ldrh	r2, [r2, #32]
	sxth	r2, r2
	mul	r3, r2, r3
	add	r2, r3, #127
	cmp	r3, #0
	movlt	r3, r2
	mov	r3, r3, asr #7
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-36]
	ldrh	r3, [r3, #72]
	sxth	r3, r3
	ldr	r2, [fp, #-36]
	ldrh	r2, [r2, #34]
	sxth	r2, r2
	mul	r3, r2, r3
	add	r2, r3, #127
	cmp	r3, #0
	movlt	r3, r2
	mov	r3, r3, asr #7
	str	r3, [fp, #-40]
.L146:
	ldr	r3, [fp, #-48]
	add	r3, r3, #1
	ldr	r2, [fp, #-52]
	mov	r3, r2, asr r3
	and	r3, r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L149
	ldr	r3, [fp, #-24]
	mov	r2, r3, lsr #1
	ldr	r3, [fp, #-36]
	ldrh	r3, [r3, #72]
	sxth	r3, r3
	ldr	r1, [fp, #-36]
	ldr	r1, [r1, #28]
	mul	r1, r1, r3
	movw	r3, #:lower16:_ZL4wave
	movt	r3, #:upper16:_ZL4wave
	str	r1, [r3, r2, asl #2]
.L149:
	ldr	r2, [fp, #-24]
	ldr	r1, [fp, #-24]
	movw	r3, #:lower16:MixBuffer
	movt	r3, #:upper16:MixBuffer
	ldr	r1, [r3, r1, asl #2]
	ldr	r3, [fp, #-44]
	add	r1, r1, r3
	movw	r3, #:lower16:MixBuffer
	movt	r3, #:upper16:MixBuffer
	str	r1, [r3, r2, asl #2]
	ldr	r3, [fp, #-24]
	add	r2, r3, #1
	ldr	r3, [fp, #-24]
	add	r1, r3, #1
	movw	r3, #:lower16:MixBuffer
	movt	r3, #:upper16:MixBuffer
	ldr	r1, [r3, r1, asl #2]
	ldr	r3, [fp, #-40]
	add	r1, r1, r3
	movw	r3, #:lower16:MixBuffer
	movt	r3, #:upper16:MixBuffer
	str	r1, [r3, r2, asl #2]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #128]
	cmp	r3, #0
	beq	.L150
	ldr	r3, [fp, #-36]
	ldr	r2, [r3, #128]
	ldr	r3, [fp, #-24]
	mov	r3, r3, asl #2
	add	r3, r2, r3
	ldr	r2, [fp, #-36]
	ldr	r1, [r2, #128]
	ldr	r2, [fp, #-24]
	mov	r2, r2, asl #2
	add	r2, r1, r2
	ldr	r1, [r2, #0]
	ldr	r2, [fp, #-44]
	add	r2, r1, r2
	str	r2, [r3, #0]
	ldr	r3, [fp, #-36]
	ldr	r2, [r3, #128]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	mov	r3, r3, asl #2
	add	r3, r2, r3
	ldr	r2, [fp, #-36]
	ldr	r1, [r2, #128]
	ldr	r2, [fp, #-24]
	add	r2, r2, #1
	mov	r2, r2, asl #2
	add	r2, r1, r2
	ldr	r1, [r2, #0]
	ldr	r2, [fp, #-40]
	add	r2, r1, r2
	str	r2, [r3, #0]
.L150:
	ldr	r3, [fp, #-24]
	add	r3, r3, #2
	str	r3, [fp, #-24]
.L95:
	ldr	r2, [fp, #-56]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	movls	r3, #0
	movhi	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L151
	b	.L91
.L154:
	mov	r0, r0	@ nop
	b	.L91
.L155:
	mov	r0, r0	@ nop
.L91:
	ldr	r3, [fp, #-48]
	add	r3, r3, #1
	str	r3, [fp, #-48]
.L88:
	ldr	r3, [fp, #-48]
	cmp	r3, #7
	movhi	r3, #0
	movls	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L152
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.fnend
	.size	_ZL9MixStereoi, .-_ZL9MixStereoi
	.align	2
	.type	_ZL7MixMonoi, %function
_ZL7MixMonoi:
	.fnstart
.LFB45:
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	.pad #64
	sub	sp, sp, #64
	str	r0, [fp, #-56]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldr	r3, [r3, #32]
	mov	r2, r3
	movw	r3, #:lower16:APU
	movt	r3, #:upper16:APU
	ldrb	r3, [r3, #72]	@ zero_extendqisi2
	mvn	r3, r3
	and	r3, r2, r3
	str	r3, [fp, #-48]
	mov	r3, #0
	str	r3, [fp, #-44]
	b	.L166
.L230:
	ldr	r3, [fp, #-44]
	mov	r2, #212
	mul	r3, r2, r3
	add	r2, r3, #48
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	add	r3, r2, r3
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #16]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L232
	movw	r3, #:lower16:so
	movt	r3, #:upper16:so
	ldrb	r3, [r3, #6]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-44]
	mov	r3, r2, asr r3
	and	r3, r3, #1
	uxtb	r3, r3
	eor	r3, r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L233
.L168:
	ldr	r3, [fp, #-44]
	mov	r2, #1
	mov	r3, r2, asl r3
	uxtb	r2, r3
	ldr	r3, [fp, #-48]
	uxtb	r3, r3
	and	r3, r2, r3
	uxtb	r3, r3
	strb	r3, [fp, #-29]
	ldr	r3, [fp, #-40]
	ldrb	r3, [r3, #119]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L170
	ldr	r0, [fp, #-40]
	bl	_ZL11DecodeBlockP7Channel
	ldr	r3, [fp, #-40]
	mov	r2, #0
	strb	r2, [r3, #119]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #112]
	ldrh	r2, [r3, #0]
	ldr	r3, [fp, #-40]
	strh	r2, [r3, #72]	@ movhi
	ldr	r3, [fp, #-36]
	mov	r2, r3, lsr #16
	ldr	r3, [fp, #-40]
	str	r2, [r3, #124]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #124]
	cmp	r3, #0
	bne	.L171
	ldr	r3, [fp, #-40]
	mov	r2, #1
	str	r2, [r3, #124]
.L171:
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #124]
	cmp	r3, #16
	bls	.L172
	ldr	r3, [fp, #-40]
	mov	r2, #15
	str	r2, [r3, #124]
.L172:
	ldr	r3, [fp, #-40]
	ldr	r2, [r3, #112]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #124]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r2, [r3, #0]
	ldr	r3, [fp, #-40]
	strh	r2, [r3, #140]	@ movhi
	ldr	r3, [fp, #-40]
	mov	r2, #0
	str	r2, [r3, #144]
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldrb	r3, [r3, #109]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L170
	ldr	r2, [fp, #-36]
	movw	r3, #65535
	cmp	r2, r3
	bhi	.L170
	ldrb	r3, [fp, #-29]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L170
	ldr	r3, [fp, #-40]
	ldrh	r3, [r3, #140]
	sxth	r2, r3
	ldr	r3, [fp, #-40]
	ldrh	r3, [r3, #72]
	sxth	r3, r3
	rsb	r3, r3, r2
	ldr	r2, [fp, #-36]
	mul	r3, r2, r3
	add	r2, r3, #65280
	add	r2, r2, #255
	cmp	r3, #0
	movlt	r3, r2
	mov	r3, r3, asr #16
	mov	r2, r3
	ldr	r3, [fp, #-40]
	str	r2, [r3, #144]
.L170:
	ldr	r3, [fp, #-40]
	ldrh	r3, [r3, #72]
	sxth	r3, r3
	ldr	r2, [fp, #-40]
	ldrh	r2, [r2, #32]
	sxth	r2, r2
	mul	r3, r2, r3
	add	r2, r3, #127
	cmp	r3, #0
	movlt	r3, r2
	mov	r3, r3, asr #7
	str	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L173
.L229:
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-20]
	ldrb	r3, [fp, #-29]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L174
	ldr	r2, [fp, #-24]
	movw	r3, #:lower16:_ZL4wave
	movt	r3, #:upper16:_ZL4wave
	ldr	r3, [r3, r2, asl #2]
	add	r3, r3, #8388608
	mov	r3, r3, lsr #16
	ldr	r2, [fp, #-20]
	mul	r3, r2, r3
	mov	r3, r3, lsr #7
	str	r3, [fp, #-20]
.L174:
	ldr	r3, [fp, #-40]
	ldr	r2, [r3, #40]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #44]
	add	r2, r2, r3
	ldr	r3, [fp, #-40]
	str	r2, [r3, #40]
	ldr	r3, [fp, #-40]
	ldr	r2, [r3, #40]
	movw	r3, #65535
	cmp	r2, r3
	bls	.L175
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #40]
	mov	r3, r3, lsr #16
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #0]
	sub	r3, r3, #1
	cmp	r3, #8
	ldrls	pc, [pc, r3, asl #2]
	b	.L176
.L186:
	.word	.L177
	.word	.L189
	.word	.L193
	.word	.L196
	.word	.L181
	.word	.L182
	.word	.L183
	.word	.L184
	.word	.L206
.L177:
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #40]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldr	r2, [fp, #-40]
	str	r3, [r2, #40]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #28]
	mov	r2, r3
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	mov	r2, r3
	ldr	r3, [fp, #-40]
	str	r2, [r3, #28]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #28]
	mov	r2, r3, asl #24
	ldr	r3, [fp, #-40]
	str	r2, [r3, #136]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #28]
	cmp	r3, #125
	ble	.L234
	ldr	r3, [fp, #-40]
	mov	r2, #127
	str	r2, [r3, #28]
	ldr	r3, [fp, #-40]
	mov	r2, #2130706432
	str	r2, [r3, #136]
	ldr	r3, [fp, #-40]
	mov	r2, #2
	str	r2, [r3, #0]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #68]
	cmp	r3, #8
	beq	.L188
	ldr	r3, [fp, #-40]
	ldr	r1, [r3, #56]
	ldr	r3, [fp, #-40]
	ldr	r2, [r3, #68]
	mov	r3, r2
	mov	r3, r3, asl #7
	rsb	r3, r2, r3
	mov	r3, r3, lsr #3
	mov	r2, #268435456
	str	r2, [sp, #0]
	ldr	r0, [fp, #-40]
	mvn	r2, #0
	bl	_ZL13S9xSetEnvRateP7Channelmiij
	b	.L176
.L188:
	ldr	r3, [fp, #-40]
	mov	r2, #3
	str	r2, [r3, #0]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #60]
	mov	r2, #536870912
	str	r2, [sp, #0]
	ldr	r0, [fp, #-40]
	mov	r1, r3
	mvn	r2, #0
	mov	r3, #0
	bl	_ZL13S9xSetEnvRateP7Channelmiij
	b	.L176
.L190:
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #136]
	mov	r2, r3, asr #8
	mov	r3, r2
	mov	r3, r3, asl #8
	rsb	r2, r2, r3
	ldr	r3, [fp, #-40]
	str	r2, [r3, #136]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #40]
	sub	r2, r3, #65536
	ldr	r3, [fp, #-40]
	str	r2, [r3, #40]
.L189:
	ldr	r3, [fp, #-40]
	ldr	r2, [r3, #40]
	movw	r3, #65535
	cmp	r2, r3
	movls	r3, #0
	movhi	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L190
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #136]
	mov	r2, r3, asr #24
	ldr	r3, [fp, #-40]
	str	r2, [r3, #28]
	ldr	r3, [fp, #-40]
	ldr	r2, [r3, #28]
	ldr	r3, [fp, #-40]
	ldrh	r3, [r3, #36]
	sxth	r3, r3
	cmp	r2, r3
	bgt	.L235
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #28]
	cmp	r3, #0
	bgt	.L192
	ldr	r3, [fp, #-44]
	mov	r0, r3
	ldr	r1, [fp, #-40]
	bl	_ZL20S9xAPUSetEndOfSampleiP7Channel
	b	.L169
.L192:
	ldr	r3, [fp, #-40]
	mov	r2, #3
	str	r2, [r3, #0]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #60]
	mov	r2, #536870912
	str	r2, [sp, #0]
	ldr	r0, [fp, #-40]
	mov	r1, r3
	mvn	r2, #0
	mov	r3, #0
	bl	_ZL13S9xSetEnvRateP7Channelmiij
	b	.L176
.L194:
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #136]
	mov	r2, r3, asr #8
	mov	r3, r2
	mov	r3, r3, asl #8
	rsb	r2, r2, r3
	ldr	r3, [fp, #-40]
	str	r2, [r3, #136]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #40]
	sub	r2, r3, #65536
	ldr	r3, [fp, #-40]
	str	r2, [r3, #40]
.L193:
	ldr	r3, [fp, #-40]
	ldr	r2, [r3, #40]
	movw	r3, #65535
	cmp	r2, r3
	movls	r3, #0
	movhi	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L194
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #136]
	mov	r2, r3, asr #24
	ldr	r3, [fp, #-40]
	str	r2, [r3, #28]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #28]
	cmp	r3, #0
	bgt	.L236
	ldr	r3, [fp, #-44]
	mov	r0, r3
	ldr	r1, [fp, #-40]
	bl	_ZL20S9xAPUSetEndOfSampleiP7Channel
	b	.L169
.L197:
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #136]
	sub	r2, r3, #8323072
	ldr	r3, [fp, #-40]
	str	r2, [r3, #136]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #40]
	sub	r2, r3, #65536
	ldr	r3, [fp, #-40]
	str	r2, [r3, #40]
.L196:
	ldr	r3, [fp, #-40]
	ldr	r2, [r3, #40]
	movw	r3, #65535
	cmp	r2, r3
	movls	r3, #0
	movhi	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L197
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #136]
	mov	r2, r3, asr #24
	ldr	r3, [fp, #-40]
	str	r2, [r3, #28]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #28]
	cmp	r3, #0
	bgt	.L237
	ldr	r3, [fp, #-44]
	mov	r0, r3
	ldr	r1, [fp, #-40]
	bl	_ZL20S9xAPUSetEndOfSampleiP7Channel
	b	.L169
.L182:
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #40]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldr	r2, [fp, #-40]
	str	r3, [r2, #40]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #28]
	mov	r2, r3
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	mov	r2, r3
	ldr	r3, [fp, #-40]
	str	r2, [r3, #28]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #28]
	mov	r2, r3, asl #24
	ldr	r3, [fp, #-40]
	str	r2, [r3, #136]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #28]
	cmp	r3, #125
	ble	.L238
	ldr	r3, [fp, #-40]
	mov	r2, #127
	str	r2, [r3, #28]
	ldr	r3, [fp, #-40]
	mov	r2, #2130706432
	str	r2, [r3, #136]
	ldr	r3, [fp, #-40]
	mov	r2, #5
	str	r2, [r3, #0]
	ldr	r3, [fp, #-40]
	mov	r2, #5
	str	r2, [r3, #132]
	mov	r3, #0
	str	r3, [sp, #0]
	ldr	r0, [fp, #-40]
	mov	r1, #0
	mvn	r2, #0
	mov	r3, #0
	bl	_ZL13S9xSetEnvRateP7Channelmiij
	b	.L176
.L183:
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #28]
	cmp	r3, #94
	ble	.L200
	b	.L201
.L202:
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #136]
	add	r2, r3, #8323072
	ldr	r3, [fp, #-40]
	str	r2, [r3, #136]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #40]
	sub	r2, r3, #65536
	ldr	r3, [fp, #-40]
	str	r2, [r3, #40]
.L201:
	ldr	r3, [fp, #-40]
	ldr	r2, [r3, #40]
	movw	r3, #65535
	cmp	r2, r3
	movls	r3, #0
	movhi	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L202
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #136]
	mov	r2, r3, asr #24
	ldr	r3, [fp, #-40]
	str	r2, [r3, #28]
	b	.L203
.L200:
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #40]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldr	r2, [fp, #-40]
	str	r3, [r2, #40]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #28]
	mov	r2, r3
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	mov	r2, r3
	ldr	r3, [fp, #-40]
	str	r2, [r3, #28]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #28]
	mov	r2, r3, asl #24
	ldr	r3, [fp, #-40]
	str	r2, [r3, #136]
.L203:
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #28]
	cmp	r3, #125
	ble	.L239
	ldr	r3, [fp, #-40]
	mov	r2, #127
	str	r2, [r3, #28]
	ldr	r3, [fp, #-40]
	mov	r2, #2130706432
	str	r2, [r3, #136]
	ldr	r3, [fp, #-40]
	mov	r2, #5
	str	r2, [r3, #0]
	ldr	r3, [fp, #-40]
	mov	r2, #5
	str	r2, [r3, #132]
	mov	r3, #0
	str	r3, [sp, #0]
	ldr	r0, [fp, #-40]
	mov	r1, #0
	mvn	r2, #0
	mov	r3, #0
	bl	_ZL13S9xSetEnvRateP7Channelmiij
	b	.L176
.L184:
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #40]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldr	r2, [fp, #-40]
	str	r3, [r2, #40]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #28]
	mov	r2, r3
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #1
	rsb	r3, r3, r2
	mov	r2, r3
	ldr	r3, [fp, #-40]
	str	r2, [r3, #28]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #28]
	mov	r2, r3, asl #24
	ldr	r3, [fp, #-40]
	str	r2, [r3, #136]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #28]
	cmp	r3, #0
	bgt	.L240
	ldr	r3, [fp, #-44]
	mov	r0, r3
	ldr	r1, [fp, #-40]
	bl	_ZL20S9xAPUSetEndOfSampleiP7Channel
	b	.L169
.L207:
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #136]
	mov	r2, r3, asr #8
	mov	r3, r2
	mov	r3, r3, asl #8
	rsb	r2, r2, r3
	ldr	r3, [fp, #-40]
	str	r2, [r3, #136]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #40]
	sub	r2, r3, #65536
	ldr	r3, [fp, #-40]
	str	r2, [r3, #40]
.L206:
	ldr	r3, [fp, #-40]
	ldr	r2, [r3, #40]
	movw	r3, #65535
	cmp	r2, r3
	movls	r3, #0
	movhi	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L207
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #136]
	mov	r2, r3, asr #24
	ldr	r3, [fp, #-40]
	str	r2, [r3, #28]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #28]
	cmp	r3, #0
	bgt	.L241
	ldr	r3, [fp, #-44]
	mov	r0, r3
	ldr	r1, [fp, #-40]
	bl	_ZL20S9xAPUSetEndOfSampleiP7Channel
	b	.L169
.L181:
	mov	r3, #0
	str	r3, [sp, #0]
	ldr	r0, [fp, #-40]
	mov	r1, #0
	mvn	r2, #0
	mov	r3, #0
	bl	_ZL13S9xSetEnvRateP7Channelmiij
	b	.L176
.L234:
	mov	r0, r0	@ nop
	b	.L176
.L235:
	mov	r0, r0	@ nop
	b	.L176
.L236:
	mov	r0, r0	@ nop
	b	.L176
.L237:
	mov	r0, r0	@ nop
	b	.L176
.L238:
	mov	r0, r0	@ nop
	b	.L176
.L239:
	mov	r0, r0	@ nop
	b	.L176
.L240:
	mov	r0, r0	@ nop
	b	.L176
.L241:
	mov	r0, r0	@ nop
.L176:
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #28]
	ldr	r2, [fp, #-40]
	ldrh	r2, [r2, #8]
	sxth	r2, r2
	mul	r3, r2, r3
	add	r2, r3, #127
	cmp	r3, #0
	movlt	r3, r2
	mov	r3, r3, asr #7
	uxth	r2, r3
	ldr	r3, [fp, #-40]
	strh	r2, [r3, #32]	@ movhi
	ldr	r3, [fp, #-40]
	ldrh	r3, [r3, #72]
	sxth	r3, r3
	ldr	r2, [fp, #-40]
	ldrh	r2, [r2, #32]
	sxth	r2, r2
	mul	r3, r2, r3
	add	r2, r3, #127
	cmp	r3, #0
	movlt	r3, r2
	mov	r3, r3, asr #7
	str	r3, [fp, #-28]
.L175:
	ldr	r3, [fp, #-40]
	ldr	r2, [r3, #20]
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	ldr	r3, [fp, #-40]
	str	r2, [r3, #20]
	ldr	r3, [fp, #-40]
	ldr	r2, [r3, #20]
	movw	r3, #65535
	cmp	r2, r3
	bls	.L209
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #20]
	mov	r3, r3, lsr #16
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-40]
	ldr	r2, [r3, #124]
	ldr	r3, [fp, #-28]
	add	r2, r2, r3
	ldr	r3, [fp, #-40]
	str	r2, [r3, #124]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #20]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldr	r2, [fp, #-40]
	str	r3, [r2, #20]
	ldr	r3, [fp, #-40]
	ldrh	r2, [r3, #140]
	ldr	r3, [fp, #-40]
	strh	r2, [r3, #72]	@ movhi
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #124]
	cmp	r3, #15
	bls	.L210
	ldr	r3, [fp, #-40]
	ldr	r2, [r3, #124]
	movw	r3, #:lower16:16777214
	movt	r3, #:upper16:16777214
	cmp	r2, r3
	bls	.L211
	ldr	r3, [fp, #-44]
	mov	r0, r3
	ldr	r1, [fp, #-40]
	bl	_ZL20S9xAPUSetEndOfSampleiP7Channel
	b	.L169
.L211:
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #124]
	sub	r2, r3, #16
	ldr	r3, [fp, #-40]
	str	r2, [r3, #124]
	ldr	r3, [fp, #-40]
	ldrb	r3, [r3, #118]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L212
	ldr	r3, [fp, #-40]
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L213
	ldr	r3, [fp, #-40]
	mvn	r2, #-16777216
	str	r2, [r3, #124]
	ldr	r3, [fp, #-40]
	ldrh	r2, [r3, #72]
	ldr	r3, [fp, #-40]
	strh	r2, [r3, #140]	@ movhi
	b	.L214
.L213:
	ldr	r3, [fp, #-40]
	mov	r2, #0
	strb	r2, [r3, #118]
	ldr	r3, [fp, #-40]
	ldrh	r3, [r3, #116]
	mov	r0, r3
	bl	_ZL19S9xGetSampleAddressi
	mov	r3, r0
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	add	r3, r3, #2
	ldrh	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, [fp, #-40]
	str	r2, [r3, #120]
	ldr	r3, [fp, #-44]
	mov	r0, r3
	bl	_ZL13S9xAPUSetEndXi
.L212:
	ldr	r0, [fp, #-40]
	bl	_ZL11DecodeBlockP7Channel
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #124]
	cmp	r3, #15
	movls	r3, #0
	movhi	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L211
.L214:
	ldr	r3, [fp, #-40]
	ldr	r2, [r3, #124]
	movw	r3, #:lower16:16777214
	movt	r3, #:upper16:16777214
	cmp	r2, r3
	bhi	.L242
	ldr	r3, [fp, #-40]
	ldr	r2, [r3, #112]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #124]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r2, [r3, #0]
	ldr	r3, [fp, #-40]
	strh	r2, [r3, #140]	@ movhi
	b	.L216
.L210:
	ldr	r3, [fp, #-40]
	ldr	r2, [r3, #112]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #124]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r2, [r3, #0]
	ldr	r3, [fp, #-40]
	strh	r2, [r3, #140]	@ movhi
	b	.L216
.L242:
	mov	r0, r0	@ nop
.L216:
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	bne	.L221
	movw	r3, #:lower16:Settings
	movt	r3, #:upper16:Settings
	ldrb	r3, [r3, #109]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L218
	ldr	r2, [fp, #-20]
	movw	r3, #65535
	cmp	r2, r3
	bhi	.L218
	ldrb	r3, [fp, #-29]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L218
	ldr	r3, [fp, #-40]
	ldrh	r3, [r3, #140]
	sxth	r2, r3
	ldr	r3, [fp, #-40]
	ldrh	r3, [r3, #72]
	sxth	r3, r3
	rsb	r3, r3, r2
	ldr	r2, [fp, #-20]
	mul	r3, r2, r3
	add	r2, r3, #65280
	add	r2, r2, #255
	cmp	r3, #0
	movlt	r3, r2
	mov	r3, r3, asr #16
	mov	r2, r3
	ldr	r3, [fp, #-40]
	str	r2, [r3, #144]
	ldr	r3, [fp, #-40]
	ldrh	r3, [r3, #72]
	uxth	r1, r3
	ldr	r3, [fp, #-40]
	ldrh	r3, [r3, #140]
	sxth	r2, r3
	ldr	r3, [fp, #-40]
	ldrh	r3, [r3, #72]
	sxth	r3, r3
	rsb	r3, r3, r2
	ldr	r2, [fp, #-40]
	ldr	r2, [r2, #20]
	mul	r3, r2, r3
	add	r2, r3, #65280
	add	r2, r2, #255
	cmp	r3, #0
	movlt	r3, r2
	mov	r3, r3, asr #16
	uxth	r3, r3
	add	r3, r1, r3
	uxth	r3, r3
	mov	r2, r3
	ldr	r3, [fp, #-40]
	strh	r2, [r3, #72]	@ movhi
	mov	r0, r0	@ nop
	b	.L220
.L218:
	ldr	r3, [fp, #-40]
	mov	r2, #0
	str	r2, [r3, #144]
	b	.L220
.L223:
	movw	r3, #:lower16:so
	movt	r3, #:upper16:so
	ldr	r3, [r3, #8]
	mov	r2, r3, asl #1
	movw	r3, #:lower16:so
	movt	r3, #:upper16:so
	str	r2, [r3, #8]
	movw	r3, #:lower16:so
	movt	r3, #:upper16:so
	ldr	r3, [r3, #8]
	mov	r3, r3, lsr #31
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L222
	movw	r3, #:lower16:so
	movt	r3, #:upper16:so
	ldr	r2, [r3, #8]
	movw	r3, #:lower16:262145
	movt	r3, #:upper16:262145
	eor	r2, r2, r3
	movw	r3, #:lower16:so
	movt	r3, #:upper16:so
	str	r2, [r3, #8]
.L222:
	ldr	r3, [fp, #-28]
	sub	r3, r3, #1
	str	r3, [fp, #-28]
.L221:
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	movle	r3, #0
	movgt	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L223
	movw	r3, #:lower16:so
	movt	r3, #:upper16:so
	ldr	r3, [r3, #8]
	mov	r3, r3, asl #17
	mov	r3, r3, asr #17
	uxth	r2, r3
	ldr	r3, [fp, #-40]
	strh	r2, [r3, #72]	@ movhi
	ldr	r3, [fp, #-40]
	mov	r2, #0
	str	r2, [r3, #144]
.L220:
	ldr	r3, [fp, #-40]
	ldrh	r3, [r3, #72]
	sxth	r3, r3
	ldr	r2, [fp, #-40]
	ldrh	r2, [r2, #32]
	sxth	r2, r2
	mul	r3, r2, r3
	add	r2, r3, #127
	cmp	r3, #0
	movlt	r3, r2
	mov	r3, r3, asr #7
	str	r3, [fp, #-28]
	b	.L224
.L209:
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #144]
	cmp	r3, #0
	beq	.L224
	ldr	r3, [fp, #-40]
	ldrh	r3, [r3, #72]
	sxth	r2, r3
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #144]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmn	r3, #32768
	bge	.L225
	movw	r3, #:lower16:-32768
	movt	r3, #:upper16:-32768
	str	r3, [fp, #-8]
	b	.L226
.L225:
	ldr	r2, [fp, #-8]
	movw	r3, #32767
	cmp	r2, r3
	ble	.L226
	movw	r3, #32767
	str	r3, [fp, #-8]
.L226:
	ldr	r3, [fp, #-8]
	uxth	r2, r3
	ldr	r3, [fp, #-40]
	strh	r2, [r3, #72]	@ movhi
	ldr	r3, [fp, #-40]
	ldrh	r3, [r3, #72]
	sxth	r3, r3
	ldr	r2, [fp, #-40]
	ldrh	r2, [r2, #32]
	sxth	r2, r2
	mul	r3, r2, r3
	add	r2, r3, #127
	cmp	r3, #0
	movlt	r3, r2
	mov	r3, r3, asr #7
	str	r3, [fp, #-28]
.L224:
	ldr	r2, [fp, #-24]
	ldr	r1, [fp, #-24]
	movw	r3, #:lower16:MixBuffer
	movt	r3, #:upper16:MixBuffer
	ldr	r1, [r3, r1, asl #2]
	ldr	r3, [fp, #-28]
	add	r1, r1, r3
	movw	r3, #:lower16:MixBuffer
	movt	r3, #:upper16:MixBuffer
	str	r1, [r3, r2, asl #2]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #128]
	cmp	r3, #0
	beq	.L227
	ldr	r3, [fp, #-40]
	ldr	r2, [r3, #128]
	ldr	r3, [fp, #-24]
	mov	r3, r3, asl #2
	add	r3, r2, r3
	ldr	r2, [fp, #-40]
	ldr	r1, [r2, #128]
	ldr	r2, [fp, #-24]
	mov	r2, r2, asl #2
	add	r2, r1, r2
	ldr	r1, [r2, #0]
	ldr	r2, [fp, #-28]
	add	r2, r1, r2
	str	r2, [r3, #0]
.L227:
	ldr	r3, [fp, #-44]
	add	r3, r3, #1
	ldr	r2, [fp, #-48]
	mov	r3, r2, asr r3
	and	r3, r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L228
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-40]
	ldrh	r3, [r3, #72]
	sxth	r3, r3
	ldr	r1, [fp, #-40]
	ldr	r1, [r1, #28]
	mul	r1, r1, r3
	movw	r3, #:lower16:_ZL4wave
	movt	r3, #:upper16:_ZL4wave
	str	r1, [r3, r2, asl #2]
.L228:
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L173:
	ldr	r2, [fp, #-56]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	movls	r3, #0
	movhi	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L229
	b	.L169
.L232:
	mov	r0, r0	@ nop
	b	.L169
.L233:
	mov	r0, r0	@ nop
.L169:
	ldr	r3, [fp, #-44]
	add	r3, r3, #1
	str	r3, [fp, #-44]
.L166:
	ldr	r3, [fp, #-44]
	cmp	r3, #7
	movhi	r3, #0
	movls	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L230
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.fnend
	.size	_ZL7MixMonoi, .-_ZL7MixMonoi
	.align	2
	.global	S9xMixSamples
	.type	S9xMixSamples, %function
S9xMixSamples:
	.fnstart
.LFB46:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	.pad #8
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	ldr	r1, [fp, #-12]
	mov	r2, #0
	bl	S9xMixSamplesO
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.fnend
	.size	S9xMixSamples, .-S9xMixSamples
	.align	2
	.global	S9xMixSamplesO
	.type	S9xMixSamplesO, %function
S9xMixSamplesO:
	.fnstart
.LFB47:
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	.save {r4, fp, lr}
	.setfp fp, sp, #8
	add	fp, sp, #8
	.pad #84
	sub	sp, sp, #84
	str	r0, [fp, #-80]
	str	r1, [fp, #-84]
	str	r2, [fp, #-88]
	ldr	r3, [fp, #-88]
	mov	r3, r3, asl #1
	ldr	r2, [fp, #-80]
	add	r3, r2, r3
	str	r3, [fp, #-80]
	movw	r3, #:lower16:so
	movt	r3, #:upper16:so
	ldrb	r3, [r3, #5]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L246
	ldr	r2, [fp, #-80]
	ldr	r3, [fp, #-84]
	mov	r3, r3, asr #1
	mov	r0, r2
	mov	r1, #0
	mov	r2, r3
	bl	_ZL15sounduxmemset32Pvmm
	b	.L292
.L246:
	movw	r3, #:lower16:MixBuffer
	movt	r3, #:upper16:MixBuffer
	ldr	r2, [fp, #-84]
	mov	r0, r3
	mov	r1, #0
	bl	_ZL15sounduxmemset32Pvmm
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldr	r3, [r3, #8]
	cmp	r3, #0
	beq	.L248
	movw	r3, #:lower16:EchoBuffer
	movt	r3, #:upper16:EchoBuffer
	ldr	r2, [fp, #-84]
	mov	r0, r3
	mov	r1, #0
	bl	_ZL15sounduxmemset32Pvmm
.L248:
	movw	r3, #:lower16:so
	movt	r3, #:upper16:so
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L249
	ldr	r0, [fp, #-84]
	bl	_ZL9MixStereoi
	b	.L250
.L249:
	ldr	r0, [fp, #-84]
	bl	_ZL7MixMonoi
.L250:
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldr	r3, [r3, #8]
	cmp	r3, #0
	beq	.L251
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldr	r3, [r3, #20]
	cmp	r3, #0
	beq	.L251
	movw	r3, #:lower16:so
	movt	r3, #:upper16:so
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L252
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldr	r3, [r3, #1748]
	str	r3, [fp, #-64]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldr	r3, [r3, #1752]
	str	r3, [fp, #-60]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldr	r3, [r3, #1756]
	str	r3, [fp, #-56]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldr	r3, [r3, #1760]
	str	r3, [fp, #-52]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldrb	r3, [r3, #1744]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L253
	mov	r3, #0
	str	r3, [fp, #-76]
	b	.L254
.L260:
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldr	r2, [r3, #16]
	movw	r3, #:lower16:Echo
	movt	r3, #:upper16:Echo
	ldr	r3, [r3, r2, asl #2]
	str	r3, [fp, #-48]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldr	r2, [r3, #16]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldr	r3, [r3, #12]
	ldr	r1, [fp, #-48]
	mul	r3, r1, r3
	add	r1, r3, #127
	cmp	r3, #0
	movlt	r3, r1
	mov	r3, r3, asr #7
	mov	r1, r3
	ldr	r0, [fp, #-76]
	movw	r3, #:lower16:EchoBuffer
	movt	r3, #:upper16:EchoBuffer
	ldr	r3, [r3, r0, asl #2]
	add	r1, r1, r3
	movw	r3, #:lower16:Echo
	movt	r3, #:upper16:Echo
	str	r1, [r3, r2, asl #2]
	add	r2, r2, #1
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	str	r2, [r3, #16]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldr	r2, [r3, #16]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldr	r3, [r3, #12]
	ldr	r1, [fp, #-48]
	mul	r3, r1, r3
	add	r1, r3, #127
	cmp	r3, #0
	movlt	r3, r1
	mov	r3, r3, asr #7
	mov	r1, r3
	ldr	r3, [fp, #-76]
	add	r0, r3, #1
	movw	r3, #:lower16:EchoBuffer
	movt	r3, #:upper16:EchoBuffer
	ldr	r3, [r3, r0, asl #2]
	add	r1, r1, r3
	movw	r3, #:lower16:Echo
	movt	r3, #:upper16:Echo
	str	r1, [r3, r2, asl #2]
	add	r2, r2, #1
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	str	r2, [r3, #16]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldr	r2, [r3, #16]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldr	r3, [r3, #20]
	cmp	r2, r3
	blt	.L255
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #0
	str	r2, [r3, #16]
.L255:
	ldr	r2, [fp, #-76]
	movw	r3, #:lower16:MixBuffer
	movt	r3, #:upper16:MixBuffer
	ldr	r3, [r3, r2, asl #2]
	ldr	r2, [fp, #-64]
	mul	r2, r2, r3
	ldr	r3, [fp, #-48]
	ldr	r1, [fp, #-56]
	mul	r3, r1, r3
	add	r3, r2, r3
	add	r2, r3, #127
	cmp	r3, #0
	movlt	r3, r2
	mov	r3, r3, asr #7
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-76]
	add	r2, r3, #1
	movw	r3, #:lower16:MixBuffer
	movt	r3, #:upper16:MixBuffer
	ldr	r3, [r3, r2, asl #2]
	ldr	r2, [fp, #-60]
	mul	r2, r2, r3
	ldr	r3, [fp, #-48]
	ldr	r1, [fp, #-52]
	mul	r3, r1, r3
	add	r3, r2, r3
	add	r2, r3, #127
	cmp	r3, #0
	movlt	r3, r2
	mov	r3, r3, asr #7
	str	r3, [fp, #-68]
	ldr	r3, [fp, #-72]
	cmn	r3, #32768
	bge	.L256
	movw	r3, #:lower16:-32768
	movt	r3, #:upper16:-32768
	str	r3, [fp, #-72]
	b	.L257
.L256:
	ldr	r2, [fp, #-72]
	movw	r3, #32767
	cmp	r2, r3
	ble	.L257
	movw	r3, #32767
	str	r3, [fp, #-72]
.L257:
	ldr	r3, [fp, #-68]
	cmn	r3, #32768
	bge	.L258
	movw	r3, #:lower16:-32768
	movt	r3, #:upper16:-32768
	str	r3, [fp, #-68]
	b	.L259
.L258:
	ldr	r2, [fp, #-68]
	movw	r3, #32767
	cmp	r2, r3
	ble	.L259
	movw	r3, #32767
	str	r3, [fp, #-68]
.L259:
	ldr	r3, [fp, #-76]
	mov	r2, r3, asl #1
	ldr	r3, [fp, #-80]
	add	r3, r2, r3
	ldr	r2, [fp, #-72]
	uxth	r2, r2
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-76]
	add	r3, r3, #1
	mov	r2, r3, asl #1
	ldr	r3, [fp, #-80]
	add	r3, r2, r3
	ldr	r2, [fp, #-68]
	uxth	r2, r2
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-76]
	add	r3, r3, #2
	str	r3, [fp, #-76]
.L254:
	ldr	r2, [fp, #-76]
	ldr	r3, [fp, #-84]
	cmp	r2, r3
	movge	r3, #0
	movlt	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L260
	b	.L292
.L253:
	mov	r3, #0
	str	r3, [fp, #-76]
	b	.L262
.L268:
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldr	r2, [r3, #16]
	movw	r3, #:lower16:Echo
	movt	r3, #:upper16:Echo
	ldr	r4, [r3, r2, asl #2]
	movw	r3, #:lower16:Z
	movt	r3, #:upper16:Z
	ldr	r3, [r3, #0]
	and	r2, r3, #15
	movw	r3, #:lower16:Loop
	movt	r3, #:upper16:Loop
	str	r4, [r3, r2, asl #2]
	movw	r3, #:lower16:FilterTaps
	movt	r3, #:upper16:FilterTaps
	ldr	r3, [r3, #0]
	mul	r4, r3, r4
	movw	r3, #:lower16:Z
	movt	r3, #:upper16:Z
	ldr	r3, [r3, #0]
	sub	r3, r3, #2
	and	r2, r3, #15
	movw	r3, #:lower16:Loop
	movt	r3, #:upper16:Loop
	ldr	r2, [r3, r2, asl #2]
	movw	r3, #:lower16:FilterTaps
	movt	r3, #:upper16:FilterTaps
	ldr	r3, [r3, #4]
	mul	r3, r3, r2
	add	r4, r4, r3
	movw	r3, #:lower16:Z
	movt	r3, #:upper16:Z
	ldr	r3, [r3, #0]
	sub	r3, r3, #4
	and	r2, r3, #15
	movw	r3, #:lower16:Loop
	movt	r3, #:upper16:Loop
	ldr	r2, [r3, r2, asl #2]
	movw	r3, #:lower16:FilterTaps
	movt	r3, #:upper16:FilterTaps
	ldr	r3, [r3, #8]
	mul	r3, r3, r2
	add	r4, r4, r3
	movw	r3, #:lower16:Z
	movt	r3, #:upper16:Z
	ldr	r3, [r3, #0]
	sub	r3, r3, #6
	and	r2, r3, #15
	movw	r3, #:lower16:Loop
	movt	r3, #:upper16:Loop
	ldr	r2, [r3, r2, asl #2]
	movw	r3, #:lower16:FilterTaps
	movt	r3, #:upper16:FilterTaps
	ldr	r3, [r3, #12]
	mul	r3, r3, r2
	add	r4, r4, r3
	movw	r3, #:lower16:Z
	movt	r3, #:upper16:Z
	ldr	r3, [r3, #0]
	sub	r3, r3, #8
	and	r2, r3, #15
	movw	r3, #:lower16:Loop
	movt	r3, #:upper16:Loop
	ldr	r2, [r3, r2, asl #2]
	movw	r3, #:lower16:FilterTaps
	movt	r3, #:upper16:FilterTaps
	ldr	r3, [r3, #16]
	mul	r3, r3, r2
	add	r4, r4, r3
	movw	r3, #:lower16:Z
	movt	r3, #:upper16:Z
	ldr	r3, [r3, #0]
	sub	r3, r3, #10
	and	r2, r3, #15
	movw	r3, #:lower16:Loop
	movt	r3, #:upper16:Loop
	ldr	r2, [r3, r2, asl #2]
	movw	r3, #:lower16:FilterTaps
	movt	r3, #:upper16:FilterTaps
	ldr	r3, [r3, #20]
	mul	r3, r3, r2
	add	r4, r4, r3
	movw	r3, #:lower16:Z
	movt	r3, #:upper16:Z
	ldr	r3, [r3, #0]
	sub	r3, r3, #12
	and	r2, r3, #15
	movw	r3, #:lower16:Loop
	movt	r3, #:upper16:Loop
	ldr	r2, [r3, r2, asl #2]
	movw	r3, #:lower16:FilterTaps
	movt	r3, #:upper16:FilterTaps
	ldr	r3, [r3, #24]
	mul	r3, r3, r2
	add	r4, r4, r3
	movw	r3, #:lower16:Z
	movt	r3, #:upper16:Z
	ldr	r3, [r3, #0]
	sub	r3, r3, #14
	and	r2, r3, #15
	movw	r3, #:lower16:Loop
	movt	r3, #:upper16:Loop
	ldr	r2, [r3, r2, asl #2]
	movw	r3, #:lower16:FilterTaps
	movt	r3, #:upper16:FilterTaps
	ldr	r3, [r3, #28]
	mul	r3, r3, r2
	add	r4, r4, r3
	mov	r3, r4
	add	r2, r3, #127
	cmp	r3, #0
	movlt	r3, r2
	mov	r3, r3, asr #7
	mov	r4, r3
	movw	r3, #:lower16:Z
	movt	r3, #:upper16:Z
	ldr	r3, [r3, #0]
	add	r2, r3, #1
	movw	r3, #:lower16:Z
	movt	r3, #:upper16:Z
	str	r2, [r3, #0]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldr	r2, [r3, #16]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldr	r3, [r3, #12]
	mul	r3, r4, r3
	add	r1, r3, #127
	cmp	r3, #0
	movlt	r3, r1
	mov	r3, r3, asr #7
	mov	r1, r3
	ldr	r0, [fp, #-76]
	movw	r3, #:lower16:EchoBuffer
	movt	r3, #:upper16:EchoBuffer
	ldr	r3, [r3, r0, asl #2]
	add	r1, r1, r3
	movw	r3, #:lower16:Echo
	movt	r3, #:upper16:Echo
	str	r1, [r3, r2, asl #2]
	add	r2, r2, #1
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	str	r2, [r3, #16]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldr	r2, [r3, #16]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldr	r3, [r3, #12]
	mul	r3, r4, r3
	add	r1, r3, #127
	cmp	r3, #0
	movlt	r3, r1
	mov	r3, r3, asr #7
	mov	r1, r3
	ldr	r3, [fp, #-76]
	add	r0, r3, #1
	movw	r3, #:lower16:EchoBuffer
	movt	r3, #:upper16:EchoBuffer
	ldr	r3, [r3, r0, asl #2]
	add	r1, r1, r3
	movw	r3, #:lower16:Echo
	movt	r3, #:upper16:Echo
	str	r1, [r3, r2, asl #2]
	add	r2, r2, #1
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	str	r2, [r3, #16]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldr	r2, [r3, #16]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldr	r3, [r3, #20]
	cmp	r2, r3
	blt	.L263
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #0
	str	r2, [r3, #16]
.L263:
	ldr	r2, [fp, #-76]
	movw	r3, #:lower16:MixBuffer
	movt	r3, #:upper16:MixBuffer
	ldr	r3, [r3, r2, asl #2]
	ldr	r2, [fp, #-64]
	mul	r2, r2, r3
	ldr	r3, [fp, #-56]
	mul	r3, r3, r4
	add	r3, r2, r3
	add	r2, r3, #127
	cmp	r3, #0
	movlt	r3, r2
	mov	r3, r3, asr #7
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-76]
	add	r2, r3, #1
	movw	r3, #:lower16:MixBuffer
	movt	r3, #:upper16:MixBuffer
	ldr	r3, [r3, r2, asl #2]
	ldr	r2, [fp, #-60]
	mul	r2, r2, r3
	ldr	r3, [fp, #-52]
	mul	r3, r3, r4
	add	r3, r2, r3
	add	r2, r3, #127
	cmp	r3, #0
	movlt	r3, r2
	mov	r3, r3, asr #7
	str	r3, [fp, #-68]
	ldr	r3, [fp, #-72]
	cmn	r3, #32768
	bge	.L264
	movw	r3, #:lower16:-32768
	movt	r3, #:upper16:-32768
	str	r3, [fp, #-72]
	b	.L265
.L264:
	ldr	r2, [fp, #-72]
	movw	r3, #32767
	cmp	r2, r3
	ble	.L265
	movw	r3, #32767
	str	r3, [fp, #-72]
.L265:
	ldr	r3, [fp, #-68]
	cmn	r3, #32768
	bge	.L266
	movw	r3, #:lower16:-32768
	movt	r3, #:upper16:-32768
	str	r3, [fp, #-68]
	b	.L267
.L266:
	ldr	r2, [fp, #-68]
	movw	r3, #32767
	cmp	r2, r3
	ble	.L267
	movw	r3, #32767
	str	r3, [fp, #-68]
.L267:
	ldr	r3, [fp, #-76]
	mov	r2, r3, asl #1
	ldr	r3, [fp, #-80]
	add	r3, r2, r3
	ldr	r2, [fp, #-72]
	uxth	r2, r2
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-76]
	add	r3, r3, #1
	mov	r2, r3, asl #1
	ldr	r3, [fp, #-80]
	add	r3, r2, r3
	ldr	r2, [fp, #-68]
	uxth	r2, r2
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-76]
	add	r3, r3, #2
	str	r3, [fp, #-76]
.L262:
	ldr	r2, [fp, #-76]
	ldr	r3, [fp, #-84]
	cmp	r2, r3
	movge	r3, #0
	movlt	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L268
	b	.L292
.L252:
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldr	r3, [r3, #1748]
	str	r3, [fp, #-40]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldr	r3, [r3, #1756]
	str	r3, [fp, #-36]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldrb	r3, [r3, #1744]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L270
	mov	r3, #0
	str	r3, [fp, #-76]
	b	.L271
.L275:
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldr	r2, [r3, #16]
	movw	r3, #:lower16:Echo
	movt	r3, #:upper16:Echo
	ldr	r3, [r3, r2, asl #2]
	str	r3, [fp, #-32]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldr	r2, [r3, #16]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldr	r3, [r3, #12]
	ldr	r1, [fp, #-32]
	mul	r3, r1, r3
	add	r1, r3, #127
	cmp	r3, #0
	movlt	r3, r1
	mov	r3, r3, asr #7
	mov	r1, r3
	ldr	r0, [fp, #-76]
	movw	r3, #:lower16:EchoBuffer
	movt	r3, #:upper16:EchoBuffer
	ldr	r3, [r3, r0, asl #2]
	add	r1, r1, r3
	movw	r3, #:lower16:Echo
	movt	r3, #:upper16:Echo
	str	r1, [r3, r2, asl #2]
	add	r2, r2, #1
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	str	r2, [r3, #16]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldr	r2, [r3, #16]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldr	r3, [r3, #20]
	cmp	r2, r3
	blt	.L272
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #0
	str	r2, [r3, #16]
.L272:
	ldr	r2, [fp, #-76]
	movw	r3, #:lower16:MixBuffer
	movt	r3, #:upper16:MixBuffer
	ldr	r3, [r3, r2, asl #2]
	ldr	r2, [fp, #-40]
	mul	r2, r2, r3
	ldr	r3, [fp, #-32]
	ldr	r1, [fp, #-36]
	mul	r3, r1, r3
	add	r3, r2, r3
	add	r2, r3, #127
	cmp	r3, #0
	movlt	r3, r2
	mov	r3, r3, asr #7
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	cmn	r3, #32768
	bge	.L273
	movw	r3, #:lower16:-32768
	movt	r3, #:upper16:-32768
	str	r3, [fp, #-44]
	b	.L274
.L273:
	ldr	r2, [fp, #-44]
	movw	r3, #32767
	cmp	r2, r3
	ble	.L274
	movw	r3, #32767
	str	r3, [fp, #-44]
.L274:
	ldr	r3, [fp, #-76]
	mov	r2, r3, asl #1
	ldr	r3, [fp, #-80]
	add	r3, r2, r3
	ldr	r2, [fp, #-44]
	uxth	r2, r2
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-76]
	add	r3, r3, #1
	str	r3, [fp, #-76]
.L271:
	ldr	r2, [fp, #-76]
	ldr	r3, [fp, #-84]
	cmp	r2, r3
	movge	r3, #0
	movlt	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L275
	b	.L292
.L270:
	mov	r3, #0
	str	r3, [fp, #-76]
	b	.L276
.L280:
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldr	r2, [r3, #16]
	movw	r3, #:lower16:Echo
	movt	r3, #:upper16:Echo
	ldr	r4, [r3, r2, asl #2]
	movw	r3, #:lower16:Z
	movt	r3, #:upper16:Z
	ldr	r3, [r3, #0]
	and	r2, r3, #7
	movw	r3, #:lower16:Loop
	movt	r3, #:upper16:Loop
	str	r4, [r3, r2, asl #2]
	movw	r3, #:lower16:FilterTaps
	movt	r3, #:upper16:FilterTaps
	ldr	r3, [r3, #0]
	mul	r4, r3, r4
	movw	r3, #:lower16:Z
	movt	r3, #:upper16:Z
	ldr	r3, [r3, #0]
	sub	r3, r3, #1
	and	r2, r3, #7
	movw	r3, #:lower16:Loop
	movt	r3, #:upper16:Loop
	ldr	r2, [r3, r2, asl #2]
	movw	r3, #:lower16:FilterTaps
	movt	r3, #:upper16:FilterTaps
	ldr	r3, [r3, #4]
	mul	r3, r3, r2
	add	r4, r4, r3
	movw	r3, #:lower16:Z
	movt	r3, #:upper16:Z
	ldr	r3, [r3, #0]
	sub	r3, r3, #2
	and	r2, r3, #7
	movw	r3, #:lower16:Loop
	movt	r3, #:upper16:Loop
	ldr	r2, [r3, r2, asl #2]
	movw	r3, #:lower16:FilterTaps
	movt	r3, #:upper16:FilterTaps
	ldr	r3, [r3, #8]
	mul	r3, r3, r2
	add	r4, r4, r3
	movw	r3, #:lower16:Z
	movt	r3, #:upper16:Z
	ldr	r3, [r3, #0]
	sub	r3, r3, #3
	and	r2, r3, #7
	movw	r3, #:lower16:Loop
	movt	r3, #:upper16:Loop
	ldr	r2, [r3, r2, asl #2]
	movw	r3, #:lower16:FilterTaps
	movt	r3, #:upper16:FilterTaps
	ldr	r3, [r3, #12]
	mul	r3, r3, r2
	add	r4, r4, r3
	movw	r3, #:lower16:Z
	movt	r3, #:upper16:Z
	ldr	r3, [r3, #0]
	sub	r3, r3, #4
	and	r2, r3, #7
	movw	r3, #:lower16:Loop
	movt	r3, #:upper16:Loop
	ldr	r2, [r3, r2, asl #2]
	movw	r3, #:lower16:FilterTaps
	movt	r3, #:upper16:FilterTaps
	ldr	r3, [r3, #16]
	mul	r3, r3, r2
	add	r4, r4, r3
	movw	r3, #:lower16:Z
	movt	r3, #:upper16:Z
	ldr	r3, [r3, #0]
	sub	r3, r3, #5
	and	r2, r3, #7
	movw	r3, #:lower16:Loop
	movt	r3, #:upper16:Loop
	ldr	r2, [r3, r2, asl #2]
	movw	r3, #:lower16:FilterTaps
	movt	r3, #:upper16:FilterTaps
	ldr	r3, [r3, #20]
	mul	r3, r3, r2
	add	r4, r4, r3
	movw	r3, #:lower16:Z
	movt	r3, #:upper16:Z
	ldr	r3, [r3, #0]
	sub	r3, r3, #6
	and	r2, r3, #7
	movw	r3, #:lower16:Loop
	movt	r3, #:upper16:Loop
	ldr	r2, [r3, r2, asl #2]
	movw	r3, #:lower16:FilterTaps
	movt	r3, #:upper16:FilterTaps
	ldr	r3, [r3, #24]
	mul	r3, r3, r2
	add	r4, r4, r3
	movw	r3, #:lower16:Z
	movt	r3, #:upper16:Z
	ldr	r3, [r3, #0]
	sub	r3, r3, #7
	and	r2, r3, #7
	movw	r3, #:lower16:Loop
	movt	r3, #:upper16:Loop
	ldr	r2, [r3, r2, asl #2]
	movw	r3, #:lower16:FilterTaps
	movt	r3, #:upper16:FilterTaps
	ldr	r3, [r3, #28]
	mul	r3, r3, r2
	add	r4, r4, r3
	mov	r3, r4
	add	r2, r3, #127
	cmp	r3, #0
	movlt	r3, r2
	mov	r3, r3, asr #7
	mov	r4, r3
	movw	r3, #:lower16:Z
	movt	r3, #:upper16:Z
	ldr	r3, [r3, #0]
	add	r2, r3, #1
	movw	r3, #:lower16:Z
	movt	r3, #:upper16:Z
	str	r2, [r3, #0]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldr	r2, [r3, #16]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldr	r3, [r3, #12]
	mul	r3, r4, r3
	add	r1, r3, #127
	cmp	r3, #0
	movlt	r3, r1
	mov	r3, r3, asr #7
	mov	r1, r3
	ldr	r0, [fp, #-76]
	movw	r3, #:lower16:EchoBuffer
	movt	r3, #:upper16:EchoBuffer
	ldr	r3, [r3, r0, asl #2]
	add	r1, r1, r3
	movw	r3, #:lower16:Echo
	movt	r3, #:upper16:Echo
	str	r1, [r3, r2, asl #2]
	add	r2, r2, #1
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	str	r2, [r3, #16]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldr	r2, [r3, #16]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldr	r3, [r3, #20]
	cmp	r2, r3
	blt	.L277
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #0
	str	r2, [r3, #16]
.L277:
	ldr	r2, [fp, #-76]
	movw	r3, #:lower16:MixBuffer
	movt	r3, #:upper16:MixBuffer
	ldr	r3, [r3, r2, asl #2]
	ldr	r2, [fp, #-40]
	mul	r2, r2, r3
	ldr	r3, [fp, #-36]
	mul	r3, r3, r4
	add	r3, r2, r3
	add	r2, r3, #127
	cmp	r3, #0
	movlt	r3, r2
	mov	r3, r3, asr #7
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	cmn	r3, #32768
	bge	.L278
	movw	r3, #:lower16:-32768
	movt	r3, #:upper16:-32768
	str	r3, [fp, #-44]
	b	.L279
.L278:
	ldr	r2, [fp, #-44]
	movw	r3, #32767
	cmp	r2, r3
	ble	.L279
	movw	r3, #32767
	str	r3, [fp, #-44]
.L279:
	ldr	r3, [fp, #-76]
	mov	r2, r3, asl #1
	ldr	r3, [fp, #-80]
	add	r3, r2, r3
	ldr	r2, [fp, #-44]
	uxth	r2, r2
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-76]
	add	r3, r3, #1
	str	r3, [fp, #-76]
.L276:
	ldr	r2, [fp, #-76]
	ldr	r3, [fp, #-84]
	cmp	r2, r3
	movge	r3, #0
	movlt	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L280
	b	.L292
.L251:
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldr	r3, [r3, #1748]
	str	r3, [fp, #-24]
	movw	r3, #:lower16:so
	movt	r3, #:upper16:so
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L281
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldr	r3, [r3, #1752]
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-76]
	b	.L282
.L287:
	ldr	r2, [fp, #-76]
	movw	r3, #:lower16:MixBuffer
	movt	r3, #:upper16:MixBuffer
	ldr	r3, [r3, r2, asl #2]
	ldr	r2, [fp, #-24]
	mul	r3, r2, r3
	add	r2, r3, #127
	cmp	r3, #0
	movlt	r3, r2
	mov	r3, r3, asr #7
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-76]
	add	r2, r3, #1
	movw	r3, #:lower16:MixBuffer
	movt	r3, #:upper16:MixBuffer
	ldr	r3, [r3, r2, asl #2]
	ldr	r2, [fp, #-16]
	mul	r3, r2, r3
	add	r2, r3, #127
	cmp	r3, #0
	movlt	r3, r2
	mov	r3, r3, asr #7
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-28]
	cmn	r3, #32768
	bge	.L283
	movw	r3, #:lower16:-32768
	movt	r3, #:upper16:-32768
	str	r3, [fp, #-28]
	b	.L284
.L283:
	ldr	r2, [fp, #-28]
	movw	r3, #32767
	cmp	r2, r3
	ble	.L284
	movw	r3, #32767
	str	r3, [fp, #-28]
.L284:
	ldr	r3, [fp, #-20]
	cmn	r3, #32768
	bge	.L285
	movw	r3, #:lower16:-32768
	movt	r3, #:upper16:-32768
	str	r3, [fp, #-20]
	b	.L286
.L285:
	ldr	r2, [fp, #-20]
	movw	r3, #32767
	cmp	r2, r3
	ble	.L286
	movw	r3, #32767
	str	r3, [fp, #-20]
.L286:
	ldr	r3, [fp, #-76]
	mov	r2, r3, asl #1
	ldr	r3, [fp, #-80]
	add	r3, r2, r3
	ldr	r2, [fp, #-28]
	uxth	r2, r2
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-76]
	add	r3, r3, #1
	mov	r2, r3, asl #1
	ldr	r3, [fp, #-80]
	add	r3, r2, r3
	ldr	r2, [fp, #-20]
	uxth	r2, r2
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-76]
	add	r3, r3, #2
	str	r3, [fp, #-76]
.L282:
	ldr	r2, [fp, #-76]
	ldr	r3, [fp, #-84]
	cmp	r2, r3
	movge	r3, #0
	movlt	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L287
	b	.L292
.L281:
	mov	r3, #0
	str	r3, [fp, #-76]
	b	.L288
.L291:
	ldr	r2, [fp, #-76]
	movw	r3, #:lower16:MixBuffer
	movt	r3, #:upper16:MixBuffer
	ldr	r3, [r3, r2, asl #2]
	ldr	r2, [fp, #-24]
	mul	r3, r2, r3
	add	r2, r3, #127
	cmp	r3, #0
	movlt	r3, r2
	mov	r3, r3, asr #7
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmn	r3, #32768
	bge	.L289
	movw	r3, #:lower16:-32768
	movt	r3, #:upper16:-32768
	str	r3, [fp, #-28]
	b	.L290
.L289:
	ldr	r2, [fp, #-28]
	movw	r3, #32767
	cmp	r2, r3
	ble	.L290
	movw	r3, #32767
	str	r3, [fp, #-28]
.L290:
	ldr	r3, [fp, #-76]
	mov	r2, r3, asl #1
	ldr	r3, [fp, #-80]
	add	r3, r2, r3
	ldr	r2, [fp, #-28]
	uxth	r2, r2
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-76]
	add	r3, r3, #1
	str	r3, [fp, #-76]
.L288:
	ldr	r2, [fp, #-76]
	ldr	r3, [fp, #-84]
	cmp	r2, r3
	movge	r3, #0
	movlt	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L291
.L292:
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, pc}
	.fnend
	.size	S9xMixSamplesO, .-S9xMixSamplesO
	.align	2
	.global	_Z13S9xResetSoundh
	.type	_Z13S9xResetSoundh, %function
_Z13S9xResetSoundh:
	.fnstart
.LFB48:
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
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L294
.L295:
	ldr	r1, [fp, #-8]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #48
	mov	r0, #212
	mul	r1, r0, r1
	add	r3, r1, r3
	add	r3, r3, r2
	mov	r2, #0
	str	r2, [r3, #0]
	ldr	r1, [fp, #-8]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #180
	mov	r0, #212
	mul	r1, r0, r1
	add	r3, r1, r3
	add	r3, r3, r2
	mov	r2, #0
	str	r2, [r3, #0]
	ldr	r1, [fp, #-8]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #52
	mov	r0, #212
	mul	r1, r0, r1
	add	r3, r1, r3
	add	r3, r3, r2
	mov	r2, #0
	str	r2, [r3, #0]
	ldr	r1, [fp, #-8]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #56
	mov	r0, #212
	mul	r1, r0, r1
	add	r3, r1, r3
	add	r3, r3, r2
	mov	r2, #0
	strh	r2, [r3, #0]	@ movhi
	ldr	r1, [fp, #-8]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #56
	mov	r0, #212
	mul	r1, r0, r1
	add	r3, r1, r3
	add	r3, r3, r2
	mov	r2, #0
	strh	r2, [r3, #2]	@ movhi
	ldr	r1, [fp, #-8]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #60
	mov	r0, #212
	mul	r1, r0, r1
	add	r3, r1, r3
	add	r3, r3, r2
	mov	r2, #0
	str	r2, [r3, #0]
	ldr	r1, [fp, #-8]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #68
	mov	r0, #212
	mul	r1, r0, r1
	add	r3, r1, r3
	add	r3, r3, r2
	mov	r2, #0
	str	r2, [r3, #0]
	ldr	r1, [fp, #-8]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #72
	mov	r0, #212
	mul	r1, r0, r1
	add	r3, r1, r3
	add	r3, r3, r2
	mov	r2, #0
	strb	r2, [r3, #0]
	ldr	r1, [fp, #-8]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #80
	mov	r0, #212
	mul	r1, r0, r1
	add	r3, r1, r3
	add	r3, r3, r2
	mov	r2, #0
	strh	r2, [r3, #4]	@ movhi
	ldr	r1, [fp, #-8]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #88
	mov	r0, #212
	mul	r1, r0, r1
	add	r3, r1, r3
	add	r3, r3, r2
	mov	r2, #0
	str	r2, [r3, #0]
	ldr	r1, [fp, #-8]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #92
	mov	r0, #212
	mul	r1, r0, r1
	add	r3, r1, r3
	add	r3, r3, r2
	mov	r2, #0
	str	r2, [r3, #0]
	ldr	r1, [fp, #-8]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #76
	mov	r0, #212
	mul	r1, r0, r1
	add	r3, r1, r3
	add	r3, r3, r2
	mov	r2, #0
	str	r2, [r3, #0]
	ldr	r1, [fp, #-8]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #184
	mov	r0, #212
	mul	r1, r0, r1
	add	r3, r1, r3
	add	r3, r3, r2
	mov	r2, #0
	str	r2, [r3, #0]
	ldr	r1, [fp, #-8]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #80
	mov	r0, #212
	mul	r1, r0, r1
	add	r3, r1, r3
	add	r3, r3, r2
	mov	r2, #0
	strh	r2, [r3, #0]	@ movhi
	ldr	r1, [fp, #-8]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #80
	mov	r0, #212
	mul	r1, r0, r1
	add	r3, r1, r3
	add	r3, r3, r2
	mov	r2, #0
	strh	r2, [r3, #2]	@ movhi
	ldr	r1, [fp, #-8]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #96
	mov	r0, #212
	mul	r1, r0, r1
	add	r3, r1, r3
	add	r3, r3, r2
	mov	r2, #0
	str	r2, [r3, #0]
	ldr	r1, [fp, #-8]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #100
	mov	r0, #212
	mul	r1, r0, r1
	add	r3, r1, r3
	add	r3, r3, r2
	mov	r2, #0
	str	r2, [r3, #0]
	ldr	r1, [fp, #-8]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #104
	mov	r0, #212
	mul	r1, r0, r1
	add	r3, r1, r3
	add	r3, r3, r2
	mov	r2, #0
	str	r2, [r3, #0]
	ldr	r1, [fp, #-8]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #108
	mov	r0, #212
	mul	r1, r0, r1
	add	r3, r1, r3
	add	r3, r3, r2
	mov	r2, #0
	str	r2, [r3, #0]
	ldr	r1, [fp, #-8]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #112
	mov	r0, #212
	mul	r1, r0, r1
	add	r3, r1, r3
	add	r3, r3, r2
	mov	r2, #0
	str	r2, [r3, #0]
	ldr	r1, [fp, #-8]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #116
	mov	r0, #212
	mul	r1, r0, r1
	add	r3, r1, r3
	add	r3, r3, r2
	mov	r2, #0
	str	r2, [r3, #0]
	ldr	r1, [fp, #-8]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #200
	mov	r0, #212
	mul	r1, r0, r1
	add	r3, r1, r3
	add	r3, r3, r2
	mov	r2, #0
	strb	r2, [r3, #4]
	ldr	r1, [fp, #-8]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #200
	mov	r0, #212
	mul	r1, r0, r1
	add	r3, r1, r3
	add	r3, r3, r2
	mov	r2, #0
	strb	r2, [r3, #5]
	ldr	r1, [fp, #-8]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #200
	mov	r0, #212
	mul	r1, r0, r1
	add	r3, r1, r3
	add	r3, r3, r2
	mov	r2, #0
	strb	r2, [r3, #6]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #0
	str	r2, [r3, #16]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #0
	str	r2, [r3, #12]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #1
	str	r2, [r3, #20]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L294:
	ldr	r3, [fp, #-8]
	cmp	r3, #7
	movgt	r3, #0
	movle	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L295
	movw	r3, #:lower16:FilterTaps
	movt	r3, #:upper16:FilterTaps
	mov	r2, #127
	str	r2, [r3, #0]
	movw	r3, #:lower16:FilterTaps
	movt	r3, #:upper16:FilterTaps
	mov	r2, #0
	str	r2, [r3, #4]
	movw	r3, #:lower16:FilterTaps
	movt	r3, #:upper16:FilterTaps
	mov	r2, #0
	str	r2, [r3, #8]
	movw	r3, #:lower16:FilterTaps
	movt	r3, #:upper16:FilterTaps
	mov	r2, #0
	str	r2, [r3, #12]
	movw	r3, #:lower16:FilterTaps
	movt	r3, #:upper16:FilterTaps
	mov	r2, #0
	str	r2, [r3, #16]
	movw	r3, #:lower16:FilterTaps
	movt	r3, #:upper16:FilterTaps
	mov	r2, #0
	str	r2, [r3, #20]
	movw	r3, #:lower16:FilterTaps
	movt	r3, #:upper16:FilterTaps
	mov	r2, #0
	str	r2, [r3, #24]
	movw	r3, #:lower16:FilterTaps
	movt	r3, #:upper16:FilterTaps
	mov	r2, #0
	str	r2, [r3, #28]
	movw	r3, #:lower16:so
	movt	r3, #:upper16:so
	mov	r2, #1
	strb	r2, [r3, #5]
	movw	r3, #:lower16:so
	movt	r3, #:upper16:so
	mov	r2, #1
	str	r2, [r3, #8]
	movw	r3, #:lower16:so
	movt	r3, #:upper16:so
	mvn	r2, #0
	strb	r2, [r3, #6]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L296
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #0
	strh	r2, [r3, #0]	@ movhi
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #0
	strh	r2, [r3, #2]	@ movhi
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #0
	strh	r2, [r3, #4]	@ movhi
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #0
	strh	r2, [r3, #6]	@ movhi
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #0
	str	r2, [r3, #8]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #0
	str	r2, [r3, #24]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #0
	str	r2, [r3, #28]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #0
	str	r2, [r3, #32]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #0
	str	r2, [r3, #36]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #0
	str	r2, [r3, #40]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #0
	str	r2, [r3, #44]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #0
	str	r2, [r3, #1748]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #0
	str	r2, [r3, #1752]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #0
	str	r2, [r3, #1756]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #0
	str	r2, [r3, #1760]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #0
	str	r2, [r3, #1764]
.L296:
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #127
	strh	r2, [r3, #0]	@ movhi
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #127
	strh	r2, [r3, #2]	@ movhi
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #127
	str	r2, [r3, #1752]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	ldr	r2, [r3, #1752]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	str	r2, [r3, #1748]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #1
	strb	r2, [r3, #1744]
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.fnend
	.size	_Z13S9xResetSoundh, .-_Z13S9xResetSoundh
	.global	__aeabi_uidiv
	.global	__aeabi_ldivmod
	.align	2
	.global	_Z18S9xSetPlaybackRatej
	.type	_Z18S9xSetPlaybackRatej, %function
_Z18S9xSetPlaybackRatej:
	.fnstart
.LFB49:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, fp, lr}
	.save {r4, r5, r6, r7, fp, lr}
	.setfp fp, sp, #20
	add	fp, sp, #20
	.pad #24
	sub	sp, sp, #24
	str	r0, [fp, #-40]
	ldr	r2, [fp, #-40]
	movw	r3, #:lower16:so
	movt	r3, #:upper16:so
	str	r2, [r3, #0]
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	beq	.L299
	mov	r0, #134217728
	ldr	r1, [fp, #-40]
	bl	__aeabi_uidiv
	mov	r3, r0
	mov	r2, r3
	movw	r3, #:lower16:so
	movt	r3, #:upper16:so
	str	r2, [r3, #12]
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L300
.L303:
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L301
.L302:
	ldr	r6, [fp, #-32]
	ldr	r7, [fp, #-28]
	ldr	r2, [fp, #-28]
	movw	r3, #:lower16:_ZZ18S9xSetPlaybackRatejE5steps
	movt	r3, #:upper16:_ZZ18S9xSetPlaybackRatejE5steps
	ldr	r3, [r3, r2, asl #2]
	mov	r2, r3
	mov	r3, r2, asr #31
	mov	r1, #65536000
	mul	r1, r1, r3
	mov	r0, #0
	mul	r0, r0, r2
	add	r1, r1, r0
	mov	r0, #65536000
	umull	r2, r3, r2, r0
	add	r1, r1, r3
	mov	r3, r1
	ldr	r0, [fp, #-32]
	movw	r1, #:lower16:AttackRate
	movt	r1, #:upper16:AttackRate
	ldr	r1, [r1, r0, asl #2]
	ldr	r0, [fp, #-40]
	mul	r1, r0, r1
	mov	r4, r1
	mov	r5, #0
	mov	r0, r2
	mov	r1, r3
	mov	r2, r4
	mov	r3, r5
	bl	__aeabi_ldivmod
	fmdrr	d16, r0, r1	@ int
	fmrrd	r2, r3, d16	@ int
	mov	r1, r2
	movw	r2, #:lower16:AttackERate
	movt	r2, #:upper16:AttackERate
	mov	r3, r6
	mov	r3, r3, asl #2
	add	r3, r3, r6
	mov	r3, r3, asl #1
	add	r3, r3, r7
	str	r1, [r2, r3, asl #2]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L301:
	ldr	r3, [fp, #-28]
	cmp	r3, #9
	movgt	r3, #0
	movle	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L302
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
.L300:
	ldr	r3, [fp, #-32]
	cmp	r3, #15
	movgt	r3, #0
	movle	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L303
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L304
.L307:
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L305
.L306:
	ldr	r6, [fp, #-32]
	ldr	r7, [fp, #-28]
	ldr	r2, [fp, #-28]
	movw	r3, #:lower16:_ZZ18S9xSetPlaybackRatejE5steps
	movt	r3, #:upper16:_ZZ18S9xSetPlaybackRatejE5steps
	ldr	r3, [r3, r2, asl #2]
	mov	r2, r3
	mov	r3, r2, asr #31
	mov	r1, #65536000
	mul	r1, r1, r3
	mov	r0, #0
	mul	r0, r0, r2
	add	r1, r1, r0
	mov	r0, #65536000
	umull	r2, r3, r2, r0
	add	r1, r1, r3
	mov	r3, r1
	ldr	r0, [fp, #-32]
	movw	r1, #:lower16:DecayRate
	movt	r1, #:upper16:DecayRate
	ldr	r1, [r1, r0, asl #2]
	ldr	r0, [fp, #-40]
	mul	r1, r0, r1
	mov	r4, r1
	mov	r5, #0
	mov	r0, r2
	mov	r1, r3
	mov	r2, r4
	mov	r3, r5
	bl	__aeabi_ldivmod
	fmdrr	d16, r0, r1	@ int
	fmrrd	r2, r3, d16	@ int
	mov	r1, r2
	movw	r2, #:lower16:DecayERate
	movt	r2, #:upper16:DecayERate
	mov	r3, r6
	mov	r3, r3, asl #2
	add	r3, r3, r6
	mov	r3, r3, asl #1
	add	r3, r3, r7
	str	r1, [r2, r3, asl #2]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L305:
	ldr	r3, [fp, #-28]
	cmp	r3, #9
	movgt	r3, #0
	movle	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L306
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
.L304:
	ldr	r3, [fp, #-32]
	cmp	r3, #7
	movgt	r3, #0
	movle	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L307
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L308
.L311:
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L309
.L310:
	ldr	r6, [fp, #-32]
	ldr	r7, [fp, #-28]
	ldr	r2, [fp, #-28]
	movw	r3, #:lower16:_ZZ18S9xSetPlaybackRatejE5steps
	movt	r3, #:upper16:_ZZ18S9xSetPlaybackRatejE5steps
	ldr	r3, [r3, r2, asl #2]
	mov	r2, r3
	mov	r3, r2, asr #31
	mov	r1, #65536000
	mul	r1, r1, r3
	mov	r0, #0
	mul	r0, r0, r2
	add	r1, r1, r0
	mov	r0, #65536000
	umull	r2, r3, r2, r0
	add	r1, r1, r3
	mov	r3, r1
	ldr	r0, [fp, #-32]
	movw	r1, #:lower16:SustainRate
	movt	r1, #:upper16:SustainRate
	ldr	r1, [r1, r0, asl #2]
	ldr	r0, [fp, #-40]
	mul	r1, r0, r1
	mov	r4, r1
	mov	r5, #0
	mov	r0, r2
	mov	r1, r3
	mov	r2, r4
	mov	r3, r5
	bl	__aeabi_ldivmod
	fmdrr	d16, r0, r1	@ int
	fmrrd	r2, r3, d16	@ int
	mov	r1, r2
	movw	r2, #:lower16:SustainERate
	movt	r2, #:upper16:SustainERate
	mov	r3, r6
	mov	r3, r3, asl #2
	add	r3, r3, r6
	mov	r3, r3, asl #1
	add	r3, r3, r7
	str	r1, [r2, r3, asl #2]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L309:
	ldr	r3, [fp, #-28]
	cmp	r3, #9
	movgt	r3, #0
	movle	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L310
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
.L308:
	ldr	r3, [fp, #-32]
	cmp	r3, #31
	movgt	r3, #0
	movle	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L311
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L312
.L315:
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L313
.L314:
	ldr	r6, [fp, #-32]
	ldr	r7, [fp, #-28]
	ldr	r2, [fp, #-28]
	movw	r3, #:lower16:_ZZ18S9xSetPlaybackRatejE5steps
	movt	r3, #:upper16:_ZZ18S9xSetPlaybackRatejE5steps
	ldr	r3, [r3, r2, asl #2]
	mov	r2, r3
	mov	r3, r2, asr #31
	mov	r1, #65536000
	mul	r1, r1, r3
	mov	r0, #0
	mul	r0, r0, r2
	add	r1, r1, r0
	mov	r0, #65536000
	umull	r2, r3, r2, r0
	add	r1, r1, r3
	mov	r3, r1
	ldr	r0, [fp, #-32]
	movw	r1, #:lower16:IncreaseRate
	movt	r1, #:upper16:IncreaseRate
	ldr	r1, [r1, r0, asl #2]
	ldr	r0, [fp, #-40]
	mul	r1, r0, r1
	mov	r4, r1
	mov	r5, #0
	mov	r0, r2
	mov	r1, r3
	mov	r2, r4
	mov	r3, r5
	bl	__aeabi_ldivmod
	fmdrr	d16, r0, r1	@ int
	fmrrd	r2, r3, d16	@ int
	mov	r1, r2
	movw	r2, #:lower16:IncreaseERate
	movt	r2, #:upper16:IncreaseERate
	mov	r3, r6
	mov	r3, r3, asl #2
	add	r3, r3, r6
	mov	r3, r3, asl #1
	add	r3, r3, r7
	str	r1, [r2, r3, asl #2]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L313:
	ldr	r3, [fp, #-28]
	cmp	r3, #9
	movgt	r3, #0
	movle	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L314
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
.L312:
	ldr	r3, [fp, #-32]
	cmp	r3, #31
	movgt	r3, #0
	movle	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L315
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L316
.L319:
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L317
.L318:
	ldr	r6, [fp, #-32]
	ldr	r7, [fp, #-28]
	ldr	r2, [fp, #-28]
	movw	r3, #:lower16:_ZZ18S9xSetPlaybackRatejE5steps
	movt	r3, #:upper16:_ZZ18S9xSetPlaybackRatejE5steps
	ldr	r3, [r3, r2, asl #2]
	mov	r2, r3
	mov	r3, r2, asr #31
	mov	r1, #65536000
	mul	r1, r1, r3
	mov	r0, #0
	mul	r0, r0, r2
	add	r1, r1, r0
	mov	r0, #65536000
	umull	r2, r3, r2, r0
	add	r1, r1, r3
	mov	r3, r1
	ldr	r0, [fp, #-32]
	movw	r1, #:lower16:DecreaseRateExp
	movt	r1, #:upper16:DecreaseRateExp
	ldr	r1, [r1, r0, asl #2]
	mov	r1, r1, lsr #1
	ldr	r0, [fp, #-40]
	mul	r1, r0, r1
	mov	r4, r1
	mov	r5, #0
	mov	r0, r2
	mov	r1, r3
	mov	r2, r4
	mov	r3, r5
	bl	__aeabi_ldivmod
	fmdrr	d16, r0, r1	@ int
	fmrrd	r2, r3, d16	@ int
	mov	r1, r2
	movw	r2, #:lower16:DecreaseERateExp
	movt	r2, #:upper16:DecreaseERateExp
	mov	r3, r6
	mov	r3, r3, asl #2
	add	r3, r3, r6
	mov	r3, r3, asl #1
	add	r3, r3, r7
	str	r1, [r2, r3, asl #2]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L317:
	ldr	r3, [fp, #-28]
	cmp	r3, #9
	movgt	r3, #0
	movle	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L318
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
.L316:
	ldr	r3, [fp, #-32]
	cmp	r3, #31
	movgt	r3, #0
	movle	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L319
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L320
.L321:
	ldr	r6, [fp, #-28]
	ldr	r2, [fp, #-28]
	movw	r3, #:lower16:_ZZ18S9xSetPlaybackRatejE5steps
	movt	r3, #:upper16:_ZZ18S9xSetPlaybackRatejE5steps
	ldr	r3, [r3, r2, asl #2]
	mov	r2, r3
	mov	r3, r2, asr #31
	mov	r1, #65536000
	mul	r1, r1, r3
	mov	r0, #0
	mul	r0, r0, r2
	add	r1, r1, r0
	mov	r0, #65536000
	umull	r2, r3, r2, r0
	add	r1, r1, r3
	mov	r3, r1
	ldr	r1, [fp, #-40]
	mov	r1, r1, asl #3
	mov	r4, r1
	mov	r5, #0
	mov	r0, r2
	mov	r1, r3
	mov	r2, r4
	mov	r3, r5
	bl	__aeabi_ldivmod
	fmdrr	d16, r0, r1	@ int
	fmrrd	r2, r3, d16	@ int
	movw	r3, #:lower16:KeyOffERate
	movt	r3, #:upper16:KeyOffERate
	str	r2, [r3, r6, asl #2]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L320:
	ldr	r3, [fp, #-28]
	cmp	r3, #9
	movgt	r3, #0
	movle	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L321
.L299:
	movw	r3, #:lower16:APU
	movt	r3, #:upper16:APU
	ldrb	r3, [r3, #136]	@ zero_extendqisi2
	and	r3, r3, #15
	mov	r0, r3
	bl	_Z15S9xSetEchoDelayi
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L322
.L323:
	ldr	r1, [fp, #-24]
	movw	r3, #:lower16:SoundData
	movt	r3, #:upper16:SoundData
	mov	r2, #60
	mov	r0, #212
	mul	r1, r0, r1
	add	r3, r1, r3
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	_ZL20S9xSetSoundFrequencyii
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L322:
	ldr	r3, [fp, #-24]
	cmp	r3, #7
	movgt	r3, #0
	movle	r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L323
	sub	sp, fp, #20
	ldmfd	sp!, {r4, r5, r6, r7, fp, pc}
	.fnend
	.size	_Z18S9xSetPlaybackRatej, .-_Z18S9xSetPlaybackRatej
	.align	2
	.global	S9xInitSound
	.type	S9xInitSound, %function
S9xInitSound:
	.fnstart
.LFB50:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	movw	r3, #:lower16:so
	movt	r3, #:upper16:so
	mov	r2, #0
	str	r2, [r3, #0]
	movw	r3, #:lower16:so
	movt	r3, #:upper16:so
	mov	r2, #0
	strb	r2, [r3, #4]
	movw	r3, #:lower16:so
	movt	r3, #:upper16:so
	mvn	r2, #0
	strb	r2, [r3, #6]
	mov	r0, #1
	bl	_Z13S9xResetSoundh
	mov	r0, #1
	bl	_ZL15S9xSetSoundMuteh
	mov	r3, #1
	mov	r0, r3
	ldmfd	sp!, {fp, pc}
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
	.ident	"GCC: (GNU) 4.4.1"
	.section	.note.GNU-stack,"",%progbits
