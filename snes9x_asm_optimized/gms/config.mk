PROJECT_NAME = antsnes
#valid target types are EXE, DLL and LIB(static lib)
TARGET_TYPE = LIB
UID2 = 0
UID3 = 0xE5712A80
SECUREID = 0xE5712A80
EPOCSTACKSIZE = 80000
EPOCHEAPSIZE = 5000000 64000000
CAPABILITY = LocalServices+NetworkServices
SYSINCLUDE = $(EPOCROOT2)/include $(EPOCROOT2)/include/libc
USERINCLUDE = ../
CXXSRCS = \
 apu.cpp \
 c4emu.cpp \
 c4.cpp \
 clip.cpp \
 cpu.cpp \
 cpuexec.cpp \
 data.cpp \
 dma.cpp \
 gfx.cpp \
 srtc.cpp \
 globals.cpp \
 memmap.cpp \
 tile.cpp \
 dsp1.cpp \
 sdd1.cpp \
 sdd1emu.cpp \
 snapshot.cpp \
 os9x_asm_cpu.cpp \
 fxinst.cpp \
 fxemu.cpp \
 symb_debug.cpp \
 cheats.cpp \
 cheats2.cpp \
# sa1.cpp \
 $(NULL)
CSRCS = \
 gzio.c \
 unzip.c \
 $(NULL)
ASRCS = \
 os9x_65c816.S \
 spc700a.S \
 spc_decode.S \
 m3d_func.S  \
 misc.S \
 ppu_asm.S \
 soundux_asm.S \
 spc700_asm.S \
 $(NULL)
RSS_TARGETS = $(DIST_PATH)/$(PROJECT_NAME).rsc $(DIST_PATH)/$(PROJECT_NAME)_reg.rsc
LANG_MACRO = SC
SYSLIBRARY = euser.lib avkon.lib eikcore.lib eiksrv.lib apparc.lib estlib.lib efsrv.lib cone.lib
STATICLIBRARY = mystaticlib.lib
CERT = /c/cert/mypro.cert
KEY = /c/cert/mypro.key
PASS =
