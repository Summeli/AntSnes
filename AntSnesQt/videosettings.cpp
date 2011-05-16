#include "videosettings.h"

videosettings::videosettings(int frameskip, bool showFps, int buttonOpacity, int stretch, QWidget *parent)
    : QWidget(parent)
{
    ui.setupUi(this);
    ui.frameSkipBox->setCurrentIndex( frameskip );
    ui.showFPSbox->setChecked( showFps );
    ui.strechSettings->setCurrentIndex( stretch );
    ui.buttonOpacity->setValue( buttonOpacity );

    connect(ui.frameSkipBox, SIGNAL(currentIndexChanged(int)), this, SLOT(setFrameskip(int)));
    connect(ui.showFPSbox, SIGNAL(stateChanged(int)), this, SLOT(showFPSChecked(int)));
    connect(ui.strechSettings, SIGNAL(currentIndexChanged(int)), this, SLOT(stretchIndexChecked(int)));
    connect(ui.buttonOpacity, SIGNAL(sliderMoved(int)), this, SLOT(setOpacity(int)));

    setOpacity(buttonOpacity);
}

videosettings::~videosettings()
{

}

void videosettings::setFrameskip( int framestoskip )
{
    emit (frameskip( framestoskip ));
}

void videosettings::showFPSChecked( int state )
{
   emit (showFPS( (bool) state ));
}

void videosettings::stretchIndexChecked( int state )
{
   emit (stretch(  state ));
}

void videosettings::setOpacity(int slider)
{
    switch ( slider )
    {
        case 0:
            ui.buttonOpacityLabel->setText("0%");
            break;
        case 1:
            ui.buttonOpacityLabel->setText("25%");
            break;
        case 2:
            ui.buttonOpacityLabel->setText("50%");
            break;
        case 3:
            ui.buttonOpacityLabel->setText("75%");
            break;
        default:
            ui.buttonOpacityLabel->setText("100%");
            break;
    }
    
    emit(buttonOpacity(slider));
}
