PROJECT_NAME = antsnesstatic

USERINCLUDE = ../inc ../../gpsp4cute

CXXSRCS = os9x_asm_cpu.cpp cpuexec.cpp apu.cpp c4emu.cpp \
           c4.cpp clip.cpp cpu.cpp cheats2.cpp data.cpp dma.cpp gfx.cpp srtc.cpp globals.cpp memmap.cpp tile.cpp dsp1.cpp \
           sdd1.cpp sdd1emu.cpp snapshot.cpp fxinst.cpp fxemu.cpp \
            $(NULL)
           #ppu.cpp spc700.cpp soundux.cpp \
CSRCS = \
        $(NULL)
ASRCS = \
        os9x_65c816.S spc700a.S spc_decode.S m3d_func.S ppu_meego_asm.S soundux_meego_asm.S spc700_meego_asm.S \
        $(NULL)
