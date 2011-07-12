TARGET   = antsnesstatic
TEMPLATE = lib
CONFIG	 = staticlib warn_on $$(QMAKESPEC)

SOURCES += spc700.cpp soundux.cpp ppu.cpp os9x_asm_cpu.cpp cpuexec.cpp os9x_65c816.s spc700a.s spc_decode.s apu.cpp c4emu.cpp \
           c4.cpp	clip.cpp cpu.cpp cheats2.cpp data.cpp dma.cpp gfx.cpp srtc.cpp globals.cpp memmap.cpp tile.cpp dsp1.cpp \
           sdd1.cpp sdd1emu.cpp snapshot.cpp m3d_func.s fxinst.cpp fxemu.cpp

unix:!symbian:!maemo5 {
    target.path = /opt/AntSnesStatic/lib
    INSTALLS += target
}
