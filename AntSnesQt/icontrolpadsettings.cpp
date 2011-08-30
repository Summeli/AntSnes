#include "icontrolpadsettings.h"
#include "ui_icontrolpadsettings.h"

iControlPadSettings::iControlPadSettings(QWidget *parent) :
    QWidget(parent)
{
    ui.setupUi(this);
    connect(ui.connectButton, SIGNAL(clicked()), this, SLOT(connectClicked()));

}

iControlPadSettings::~iControlPadSettings()
{
}

void iControlPadSettings::connectClicked()
{
}
