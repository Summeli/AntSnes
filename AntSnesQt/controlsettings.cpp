#include "controlsettings.h"

controlsettings::controlsettings(QWidget *parent)
    : QWidget(parent)
{
	ui.setupUi(this);
	connect(ui.keyconfigButton, SIGNAL(clicked()), this, SLOT(keyConfig()));
}

controlsettings::~controlsettings()
{

}

void controlsettings::keyConfig()
	{
	emit( runkeyconfig() );
	}
