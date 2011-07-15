PROJECT_NAME = antsnesstatic

USERINCLUDE = ../inc ../../gpsp4cute

CXXSRCS = os9x_asm_cpu.cpp cpuexec.cpp apu.cpp c4emu.cpp \
           c4.cpp clip.cpp cpu.cpp cheats2.cpp data.cpp dma.cpp gfx.cpp srtc.cpp globals.cpp memmap.cpp tile.cpp dsp1.cpp \
           sdd1.cpp sdd1emu.cpp snapshot.cpp fxinst.cpp fxemu.cpp \
           ppu.cpp spc700.cpp soundux.cpp \
            $(NULL)
           #ppu_asm.s soundux_asm.s spc700_asm.s
CSRCS = \
        $(NULL)
ASRCS = \
        os9x_65c816.S spc700a.S spc_decode.S m3d_func.S
        $(NULL)
