TEMPLATE = app
TARGET = AntSnesQt

QT += core \
    gui 
HEADERS += buttonwidget.h \
	dpadwidget.h \
	QRemoteControlKeys.h \
	aboutdialog.h \
    controlsettings.h \
    videosettings.h \
    AntAudio.h \
    audiosettings.h \
    keyconfigdialog.h \
    viewcontroller.h \
    emusettings.h \
    symb_adaptation.h \
    QBlitterWidget.h \
    AntSettings.h \
    snescontroller.h \
    AntSnesQt.h \
    smalloptionswidget.h \
    largepad.h
    
SOURCES += buttonwidget.cpp \
	dpadwidget.cpp \
	QRemoteControlKeys.cpp \
	aboutdialog.cpp \
    controlsettings.cpp \
    videosettings.cpp \
    AntAudio.cpp \
    audiosettings.cpp \
    keyconfigdialog.cpp \
    viewcontroller.cpp \
    emusettings.cpp \
    debug.cpp \
    symb_adaptation.cpp \
    QBlitterWidget.cpp \
    snescontroller.cpp \
    main.cpp \
    AntSnesQt.cpp \
    AntBlit.cpp \
    smalloptionswidget.cpp \
    largepad.cpp
    
FORMS += buttonwidget.ui \
	dpadwidget.ui \
	aboutdialog.ui \
    controlsettings.ui \
    videosettings.ui \
    keyconfigdialog.ui \
    audiosettings.ui \
    emusettings.ui \
    AntSnesQt.ui \
    smalloptionswidget.ui \
    largepad.ui

RESOURCES += atnresources.qrc

symbian:LIBS += -lantsnes.lib \
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
	-lhal \
    -lmmfcontrollerframework #TODO: remove when audio can be removed..
    
 symbian:TARGET.UID3 \
    = \
    0xE4270701
symbian:TARGET.EPOCHEAPSIZE = 0x200000 \
    0x1000000

#symbian: TARGET.CAPABILITY = UserEnvironment
symbian:TARGET.CAPABILITY += SwEvent
symbian:ICON = gfx/AntSnes_44.svg
symbian:INCLUDEPATH += ../snes9x_asm_optimized

OTHER_FILES += summelistyle.qss
