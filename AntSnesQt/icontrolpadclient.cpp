/* iControlPadClient
 *
 * Copyright (c) 2011 Antti Pohjola, http://www.summeli.fi
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

#include "icontrolpadclient.h"

#include <QThread>
#include <QApplication>
#include <QKeyEvent>
#include <qbluetoothdeviceinfo.h>
#include <qbluetoothaddress.h>

#define KiControlPadPollInterval 25
#define KDigitalButtonsBytes 2
#define KAnalogButtonsBytes 4
const QString KiCPServiceName("iCP-SPP");
#define CMD_GET_DIGITALS 0xA5
#define CMD_GET_ANALOGS 0x87

const quint16 getDigitalKeys = CMD_GET_DIGITALS;
const quint16 getAnaloglNubs = CMD_GET_ANALOGS;

enum iCPButtons
{
  BUTTON_UP = 0x1,
  BUTTON_DOWN = 0x8,
  BUTTON_LEFT = 0x4,
  BUTTON_RIGHT = 0x2,
  BUTTON_START = 0x200,
  BUTTON_SELECT = 0x100,
  BUTTON_X = 0x1000,
  BUTTON_A = 0x800,
  BUTTON_Y = 0x400,
  BUTTON_B = 0x2000,
  BUTTON_LR = 0x4000,
  BUTTON_LL = 10,
  BUTTON_NONE = 0x00
};


iControlPadClient::iControlPadClient( QObject* parent ) :
    QObject(parent),
    m_connected(false),
    m_discoveryAgent(new QBluetoothServiceDiscoveryAgent() ),
    m_socket( NULL ),
    m_DigitalButtons(0),
    m_AnalogButtons(0),
    m_readProperties(0)
{
    connect(m_discoveryAgent, SIGNAL(serviceDiscovered(QBluetoothServiceInfo)),
                 this, SLOT(serviceDiscovered(QBluetoothServiceInfo)));

    connect(m_discoveryAgent, SIGNAL(finished()), this, SLOT(discoveryFinished()));

    m_timer = new QTimer(this);
    connect(m_timer, SIGNAL(timeout()), this, SLOT(readControlPadKeys()));

    m_receiver = parent;

}

iControlPadClient::~iControlPadClient()
{
    delete m_discoveryAgent;
    m_socket->disconnect();
    delete m_socket;
}

void iControlPadClient::subscribeKeyEvent(QObject* aObject )
{
    m_receiver = aObject;
}

void iControlPadClient::readControlPadKeys()
{
    //read digital
    if( m_readProperties & iCPReadDigital ){
        quint16 buttonData;
        //send get request to the iCP
        m_socket->write( (char*)&getDigitalKeys );
        m_dataRequested.append(eDigitalButtons);
    }

    //read analog
    //something is still wrong with the analog logic...
    /*
     if( m_readProperties & iCPReadAnalog ){
        quint32 nubs;
         m_socket->write( (char*)&getAnaloglNubs );
         m_dataRequested.append(eAnalogButtons);
     }*/
}
void iControlPadClient::readSocket()
{
    while( m_socket->bytesAvailable() ){
        if( m_dataRequested.isEmpty() ){
            //should not be empty, if so, then flush the socket
            m_socket->readAll();
        }
        else if( m_dataRequested.first() == eDigitalButtons ){
            quint16 buttonData;
            m_socket->read((char*) &buttonData, KDigitalButtonsBytes);
            updateDigitalButtons(buttonData);
            m_dataRequested.removeFirst();
        }
        else if( m_dataRequested.first() == eAnalogButtons  ){
            quint32 nubs;
            m_socket->read((char*) &nubs, KAnalogButtonsBytes);
            updateAnalogNubs(nubs);
            m_dataRequested.removeFirst();
        }
        else{
            //should not happen, flush socket, to continue...
            m_socket->readAll();
        }
    }

}

void iControlPadClient::discoverAndConnect(iCPReadableKeyEvent readKeys)
{
    if (m_discoveryAgent->isActive())
            m_discoveryAgent->stop();

    m_readProperties = readKeys;
    m_discoveryAgent->start();
}

void iControlPadClient::discoveryFinished()
{
    emit ( iControlPadNotFound() );
}

void iControlPadClient::serviceDiscovered(const QBluetoothServiceInfo &serviceInfo)
{
    qDebug() << "Discovered service on"
             << serviceInfo.device().name() << serviceInfo.device().address().toString();
    qDebug() << "\tService name:" << serviceInfo.serviceName();
    qDebug() << "\tDescription:"
             << serviceInfo.attribute(QBluetoothServiceInfo::ServiceDescription).toString();
    qDebug() << "\tProvider:"
             << serviceInfo.attribute(QBluetoothServiceInfo::ServiceProvider).toString();
    qDebug() << "\tL2CAP protocol service multiplexer:"
             << serviceInfo.protocolServiceMultiplexer();
    qDebug() << "\tRFCOMM server channel:" << serviceInfo.serverChannel();

    if(  QString::compare ( serviceInfo.serviceName(), KiCPServiceName, Qt::CaseInsensitive ) == 0 )
        connectToService( serviceInfo );
}

void iControlPadClient::connectToService(const QBluetoothServiceInfo &remoteService)
{
    if (m_socket)
        return;

    // Connect to service
    m_socket = new QBluetoothSocket(QBluetoothSocket::RfcommSocket);
    qDebug() << "Create socket";
    m_socket->connectToService(remoteService);
    qDebug() << "Connecte Service done";
    connect(m_socket, SIGNAL(readyRead()), this, SLOT(readSocket()));
    connect(m_socket, SIGNAL(connected()), this, SLOT(connected()));
    connect(m_socket, SIGNAL(disconnected()), this, SLOT(disconnected()));
}

void iControlPadClient::connected()
{
    m_connected = true;
    qDebug() << "Connected to the iControlPad, starting the polling loop";
    m_timer->start(KiControlPadPollInterval);
    emit( connectedToiControlPad() );
}

void iControlPadClient::disconnected()
{
    qDebug() << "disconnected, ending the polling loop";
    m_connected = false;
}

void iControlPadClient::updateDigitalButtons( quint16 keys )
{
    //if no update, then return
    if( keys == m_DigitalButtons )
        return;

    //qDebug() << "prev keys " << m_DigitalButtons << "new keys " << keys;

    //update released buttons
    quint16 tmp =  m_DigitalButtons & ~keys;
    if( tmp & BUTTON_UP ){
      QKeyEvent e(QKeyEvent::KeyRelease,Qt::Key_Up,0,0 );
      QApplication::sendEvent(m_receiver,&e);
    }
    if( tmp & BUTTON_DOWN ){
        QKeyEvent e(QKeyEvent::KeyRelease,Qt::Key_Down,0,0 );
        QApplication::sendEvent(m_receiver,&e);
    }
    if( tmp & BUTTON_LEFT ){
        QKeyEvent e(QKeyEvent::KeyRelease,Qt::Key_Left,0,0 );
        QApplication::sendEvent(m_receiver,&e);
    }
    if( tmp & BUTTON_RIGHT ){
        QKeyEvent e(QKeyEvent::KeyRelease,Qt::Key_Right,0,0 );
        QApplication::sendEvent(m_receiver,&e);
    }
    if( tmp & BUTTON_START ){
         QKeyEvent e(QKeyEvent::KeyRelease,Qt::Key_Return,0,0 );
         QApplication::sendEvent(m_receiver,&e);
    }
    if( tmp & BUTTON_SELECT ){
        QKeyEvent e(QKeyEvent::KeyRelease,Qt::Key_Space,0,0 );
        QApplication::sendEvent(m_receiver,&e);
    }
    if( tmp & BUTTON_X ){
        QKeyEvent e(QKeyEvent::KeyRelease,Qt::Key_W,0,0 );
        QApplication::sendEvent(m_receiver,&e);
    }
    if( tmp & BUTTON_Y ){
        QKeyEvent e(QKeyEvent::KeyRelease,Qt::Key_A,0,0 );
        QApplication::sendEvent(m_receiver,&e);
    }
    if( tmp & BUTTON_B ){
        QKeyEvent e(QKeyEvent::KeyRelease,Qt::Key_S,0,0 );
        QApplication::sendEvent(m_receiver,&e);
    }
    if( tmp & BUTTON_A ){
        QKeyEvent e(QKeyEvent::KeyRelease,Qt::Key_D,0,0 );
        QApplication::sendEvent(m_receiver,&e);
    }
    if( tmp & BUTTON_LR ){
        QKeyEvent e(QKeyEvent::KeyRelease,Qt::Key_R,0,0 );
        QApplication::sendEvent(m_receiver,&e);
    }
    if( tmp & BUTTON_LL ){
         QKeyEvent e(QKeyEvent::KeyRelease,Qt::Key_F,0,0 );
         QApplication::sendEvent(m_receiver,&e);
    }

    //update pressed buttons
    tmp = ~m_DigitalButtons & keys;
    if( tmp & BUTTON_UP ){
      QKeyEvent e(QKeyEvent::KeyPress,Qt::Key_Up,0,0 );
      QApplication::sendEvent(m_receiver,&e);
    }
    if( tmp & BUTTON_DOWN ){
        QKeyEvent e(QKeyEvent::KeyPress,Qt::Key_Down,0,0 );
        QApplication::sendEvent(m_receiver,&e);
    }
    if( tmp & BUTTON_LEFT ){
        QKeyEvent e(QKeyEvent::KeyPress,Qt::Key_Left,0,0 );
        QApplication::sendEvent(m_receiver,&e);
    }
    if( tmp & BUTTON_RIGHT ){
        QKeyEvent e(QKeyEvent::KeyPress,Qt::Key_Right,0,0 );
        QApplication::sendEvent(m_receiver,&e);
    }
    if( tmp & BUTTON_START ){
         QKeyEvent e(QKeyEvent::KeyPress,Qt::Key_Return,0,0 );
         QApplication::sendEvent(m_receiver,&e);
    }
    if( tmp & BUTTON_SELECT ){
        QKeyEvent e(QKeyEvent::KeyPress,Qt::Key_Space,0,0 );
        QApplication::sendEvent(m_receiver,&e);
    }
    if( tmp & BUTTON_X ){
        QKeyEvent e(QKeyEvent::KeyPress,Qt::Key_W,0,0 );
        QApplication::sendEvent(m_receiver,&e);
    }
    if( tmp & BUTTON_Y ){
        QKeyEvent e(QKeyEvent::KeyPress,Qt::Key_A,0,0 );
        QApplication::sendEvent(m_receiver,&e);
    }
    if( tmp & BUTTON_B ){
        QKeyEvent e(QKeyEvent::KeyPress,Qt::Key_S,0,0 );
        QApplication::sendEvent(m_receiver,&e);
    }
    if( tmp & BUTTON_A ){
        QKeyEvent e(QKeyEvent::KeyPress,Qt::Key_D,0,0 );
        QApplication::sendEvent(m_receiver,&e);
    }
    if( tmp & BUTTON_LR ){
        QKeyEvent e(QKeyEvent::KeyPress,Qt::Key_R,0,0 );
        QApplication::sendEvent(m_receiver,&e);
    }
    if( tmp & BUTTON_LL ){
         QKeyEvent e(QKeyEvent::KeyPress,Qt::Key_F,0,0 );
         QApplication::sendEvent(m_receiver,&e);
    }

    m_DigitalButtons = keys;
}

void iControlPadClient::updateAnalogNubs( quint32 nubs )
{
    if( m_AnalogButtons == nubs )
        return;

    qint8 n_x = nubs & 0xFF;
    qint8 n_y = nubs >> 8 & 0xFF;
    qint8 m_x = nubs >> 16 & 0xFF;
    qint8 m_y = nubs >> 24;
    qDebug() << "N_X: " << n_x << "N_Y: " << n_y << "M_X: " << m_x << "M_Y: " << m_y;
    emit(analogNubsUpdated( n_x,  n_y, m_x, m_y ) );
    m_AnalogButtons = nubs;
}
