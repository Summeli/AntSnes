#include "videosettings.h"

videosettings::videosettings(int frameskip, bool showFps, QWidget *parent)
    : QWidget(parent)
{
    ui.setupUi(this);
    ui.frameSkipBox->setCurrentIndex( frameskip );
    ui.showFPSbox->setChecked( showFps );
    connect(ui.frameSkipBox, SIGNAL(currentIndexChanged(int)), this, SLOT(setFrameskip(int)));
    connect(ui.showFPSbox, SIGNAL(stateChanged(int)), this, SLOT(showFPSChecked(int)));
	
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
