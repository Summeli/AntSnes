/* AntSnes
 *
 * Copyright (C) 2011 Summeli <summeli@summeli.fi>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of
 * the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 */

#include "icontrolpadsettings.h"
#include "ui_icontrolpadsettings.h"

iControlPadSettings::iControlPadSettings(iControlPadClient* client, QWidget *parent) :
    QWidget(parent), m_cpClient( client ), m_connected(false)
{
    ui.setupUi(this);
    connect(ui.connectButton, SIGNAL(clicked()), this, SLOT(connectClicked()));
    connect( m_cpClient, SIGNAL(connectedToiControlPad()), this, SLOT(connected()) );
    connect( m_cpClient, SIGNAL(iControlPadNotFound()), this, SLOT(discoveryFinished()) );
}

iControlPadSettings::~iControlPadSettings()
{

}

void iControlPadSettings::connectClicked()
{
    if( !m_connected){
        ui.textLabel->setText("Seaching iControlpad.... ");
        m_cpClient->discoverAndConnect( iControlPadClient::iCPReadDigital );
    }
    else
        m_cpClient->disconnect();
}

void iControlPadSettings::connected()
{
    m_connected = true;
    ui.textLabel->setText("iControlPad Connected \n Run keyconfig if needed ");
    ui.connectButton->setText("Disconnect");
}

void iControlPadSettings::discoveryFinished()
{
    m_connected = false;
    ui.textLabel->setText("iControlPad not Found \n Did you start it in the SPP mode? ");
    ui.connectButton->setText("Connect");
}
