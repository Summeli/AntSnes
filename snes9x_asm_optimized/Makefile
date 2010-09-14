# main targets
all: snes9xemu.exe
clean: tidy

# check for EPOCROOT2
$(EPOCROOT2)epoc32 :
	@echo Please set EPOCROOT2 environmental variable to full path to your SDK
	@echo with ending slash (something like C:\Uiq_21\)
	@cd : 2> NUL # do something stupid to make it silently fail

LIBDIR = $(EPOCROOT2)EPOC32\RELEASE\ARMI\UREL

# gcc settings
CINC  = -I "$(EPOCROOT2)EPOC32\INCLUDE" -I "$(EPOCROOT2)EPOC32\INCLUDE\LIBC"
CDEFS = -D__SYMBIAN32__ -D__GCC32__ -D__EPOC32__ -D__MARM__ -D__MARM_ARMI__ -D__EXE__ -DNDEBUG -D_UNICODE -DARM # -D__DEBUG_PRINT
CFLAGS = -nostdinc -Wall -Wno-ctor-dtor-privacy -Wno-unknown-pragmas -march=armv4t -mthumb-interwork -pipe -O3 -fomit-frame-pointer
COPT = $(CFLAGS) $(CDEFS) $(CINC)
GCC = gcc
AS = as -marmv4t -mthumb-interwork

#
# SNES stuff (c-based)
#
OBJS = apu.o c4.o c4emu.o clip.o cpu.o cpuexec.o data.o dma.o gfx.o seta010.o seta011.o seta018.o seta.o
OBJS += soundux.o spc700.o srtc.o globals.o memmap.o ppu.o
OBJS += tile.o dsp1.o sdd1.o snapshot.o
# sa1.o sa1cpu.o cpuops.o snes9x.o cheats2.o cheats.o snaporig.o screenshot.o

#
# ASM CPU Core, ripped from Yoyo's OpenSnes9X
#
OBJS += os9x_asm_cpu.o os9x_65c816.o 
#
# and some asm from LJP...
#
OBJS += spc_decode.o m3d_func.o
#
# asm ppu
#
OBJS += generatePPUasm\ppuasmfunc16.o
#
# notaz's spc700
#
OBJS += spc700\spc700a.o
#
# superFX
#
OBJS += fxinst.o fxemu.o
#
# zlib and unzip
#
OBJS += zlib\gzio.o unzip.o
#
# and the glue code that sticks it all together + Symbian stuff
#
OBJS += symb_debug.o symb_main.o symb_vid.o symb_Server.o symb_blit.o

# Symbian libs
PRELIBS = $(LIBDIR)\EGCC.LIB $(LIBDIR)\ESTLIB.LIB $(LIBDIR)\EUSER.LIB $(LIBDIR)\WS32.LIB $(LIBDIR)\HAL.LIB $(LIBDIR)\EFSRV.LIB $(LIBDIR)\EZLIB.LIB

.c.o:
	@echo $<
	@$(GCC) $(COPT) -c $< -o $@

.cpp.o:
	@echo $<
	@$(GCC) $(COPT) -c $< -o $@

# make seems to lowercase the extensions, so files with '.S' end up being passed to the compiler as '.s', which means thousands of errors.
# this is a small workaround. 
os9x_65c816.o: os9x_65c816.S
	@echo $<
	@$(AS) $< -o $@

m3d_func.o: m3d_func.S
	@echo $<
	@$(AS) $< -o $@

spc_decode.o: spc_decode.S
	@echo $<
	@$(AS) $< -o $@

symb_blit.o: symb_blit.S
	@echo $<
	@$(AS) $< -o $@

spc700\spc700a.o: spc700\spc700a.S
	@echo $<
	@$(AS) $< -o $@


snes9xemu.exe: $(OBJS)
	@echo * linking and finishing
	@ld -s -e _E32Startup -u _E32Startup --image-base 0 --base-file tmp.bas -o tmp.exe \
		"$(LIBDIR)\EEXE.LIB" $(OBJS) $(PRELIBS)
	@del tmp.exe
	@dlltool -m arm_interwork --base-file tmp.bas --output-exp tmp.exp
	@del tmp.bas
	@ld -s -e _E32Startup -u _E32Startup --image-base 0 tmp.exp -Map tmp.map -o tmp.exe \
		"$(LIBDIR)\EEXE.LIB" $(OBJS) $(PRELIBS)
ifeq "$(noecompxl)" "1"
	@petran  tmp.exe "$@" \
		 -nocall -uid1 0x1000007a -uid2 0x00000000 -uid3 0x00000000 \
		 -heap 0x00000001 0x00800000
else
	@petran_.exe  tmp.exe "$@" \
		 -nocall -uid1 0x1000007a -uid2 0x00000000 -uid3 0x00000000 \
		 -heap 0x00000001 0x00800000 -stack 0x80000000
	@del tmp.bin.gz
endif
ifeq "$(up)" "1"
	@qupload.cmd
endif
#	@del tmp.exe
	@del tmp.exp
#	@del tmp.map

tidy:
	@del *.o
	@del tmp.exe
	@del tmp.map
