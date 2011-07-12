TEMPLATE = app
TARGET = AntSnes
QT += core \
    gui \
    opengl
HEADERS += buttonwidget.h \
	dpadwidget.h \
	aboutdialog.h \
    controlsettings.h \
    videosettings.h \
    audiosettings.h \
    keyconfigdialog.h \
    viewcontroller.h \
    emusettings.h \
    AntSettings.h \
    snescontroller.h \
    AntSnesQt.h \
    middlebuttons.h
    
SOURCES += buttonwidget.cpp \
	dpadwidget.cpp \
	aboutdialog.cpp \
    controlsettings.cpp \
    videosettings.cpp \
    audiosettings.cpp \
    keyconfigdialog.cpp \
    viewcontroller.cpp \
    emusettings.cpp \
    snescontroller.cpp \
    main.cpp \
    AntSnesQt.cpp \
    middlebuttons.cpp
    
FORMS += aboutdialog.ui \
    controlsettings.ui \
    videosettings.ui \
    keyconfigdialog.ui \
    audiosettings.ui \
    emusettings.ui \
    AntSnesQt.ui

RESOURCES += atnresources.qrc
    
OTHER_FILES += summelistyle.qss
INCLUDEPATH += ../snes9x_asm_optimized

symbian: {
HEADERS += symb_adaptation.h \
           QRemoteControlKeys.h \
           AntAudio.h

SOURCES += symb_adaptation.cpp \
           QRemoteControlKeys.cpp \
           AntAudio.cpp
LIBS += -lantsnes.lib \
    -lscdv \
    -lws32 \
    -lcone \
    -lbitgdi \
    -lmediaclientaudiostream \
    -leikcore \
    -lavkon \
    -lremconcoreapi \
    -lremconinterfacebase \
    -lecom \
    -lmmfcontrollerframework

TARGET.UID3 = 0xE4270701
TARGET.EPOCHEAPSIZE = 0x200000 \
    0x1000000
TARGET.CAPABILITY = UserEnvironment
ICON = gfx/AntSnes_44.svg
}

unix:!symbian:!maemo5 {
HEADERS += meegoAudio.h
SOURCES += meegoAudio.cpp

OTHER_FILES += qtc_packaging/debian_harmattan/rules \
    qtc_packaging/debian_harmattan/README \
    qtc_packaging/debian_harmattan/copyright \
    qtc_packaging/debian_harmattan/control \
    qtc_packaging/debian_harmattan/compat \
    qtc_packaging/debian_harmattan/changelog

LIBS += ../snes9x_asm_optimized/libantsnesstatic.a

target.path = /opt/AntSnesQt/bin
INSTALLS += target
}

include(deployment.pri)
qtcAddDeployment()

