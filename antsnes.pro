#buildfile for harmattan.
#for symbian use mingw and snes9x_asm_optimized/gms and Qt for antsnesQt/antsnes.pro
TEMPLATE = app
TARGET = antsnes
QT += core gui opengl
VERSION = 0.8.7

DEPENDPATH += AntSnesQt
INCLUDEPATH += AntSnesQt
INCLUDEPATH += snes9x_asm_optimized
INCLUDEPATH += $$PWD

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
    AntSnesQt.h
    
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
    AntSnesQt.cpp

OTHER_FILES += summelistyle.qss \
    qtc_packaging/debian_harmattan/rules \
    qtc_packaging/debian_harmattan/README \
    qtc_packaging/debian_harmattan/copyright \
    qtc_packaging/debian_harmattan/control \
    qtc_packaging/debian_harmattan/compat \
    qtc_packaging/debian_harmattan/changelog

symbian: {
FORMS += ui_symbian/aboutdialog.ui \
    ui_symbian/controlsettings.ui \
    ui_symbian/videosettings.ui \
    ui_symbian/keyconfigdialog.ui \
    ui_symbian/audiosettings.ui \
    ui_symbian/emusettings.ui \
    ui_symbian/AntSnesQt.ui
HEADERS += symb_adaptation.h \
           QRemoteControlKeys.h \
           AntAudio.h

SOURCES += symb_adaptation.cpp \
           QRemoteControlKeys.cpp \
           AntAudio.cpp

RESOURCES += atnresources.qrc

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
FORMS += ui_meego/aboutdialog.ui \
    ui_meego/controlsettings.ui \
    ui_meego/videosettings.ui \
    ui_meego/keyconfigdialog.ui \
    ui_meego/audiosettings.ui \
    ui_meego/emusettings.ui \
    ui_meego/AntSnesQt.ui

RESOURCES += meegoresources.qrc

HEADERS += meegoAudio.h meegoAdaptation.h
SOURCES += meegoAudio.cpp meegoAdaptation.cpp

include (snes9x_asm_optimized/antsnesstatic.pri)

#we can use the static-lib too, if we want to build custom
#LIBS += /snes9x_asm_optimized/antsnesstatic.a
LIBS += -lpulse-simple

target.path = /opt/antsnes/bin
INSTALLS += target

QMAKE_CFLAGS_DEBUG = -mfloat-abi=soft

include(deployment.pri)
qtcAddDeployment()
}
