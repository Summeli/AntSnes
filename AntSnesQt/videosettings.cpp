#include "videosettings.h"

videosettings::videosettings(int frameskip, QWidget *parent)
    : QWidget(parent)
{
	ui.setupUi(this);
	ui.frameSkipBox->setCurrentIndex( frameskip );
	connect(ui.frameSkipBox, SIGNAL(currentIndexChanged(int)), this, SLOT(setFrameskip(int)));
	
}

videosettings::~videosettings()
{

}

void videosettings::setFrameskip( int framestoskip )
	{
	emit (frameskip( framestoskip ));
	}
