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

#ifndef ICONTROLPADCLIENT_H
#define ICONTROLPADCLIENT_H

#include <QObject>
#include <QTimer>


#include <qbluetoothuuid.h>
#include <qbluetoothserviceinfo.h>
#include <qbluetoothservicediscoveryagent.h>
#include <qbluetoothsocket.h>

QTM_USE_NAMESPACE

class iControlPadClient : public QObject
{
    Q_OBJECT

public:
    enum iCPReadableKeyEvent{
        iCPReadDigital = 1,
        iCPReadAnalog = 2,
        iCPReadDigitalAndAnalog = 3
    };

public:
    iControlPadClient( QObject* parent = 0 );
    ~iControlPadClient();

public:
    void discoverAndConnect( iCPReadableKeyEvent readKeys );
    void subscribeKeyEvent(QObject* aObject );

signals:
    void connectedToiControlPad();
    void iControlPadNotFound();
    void analogNubsUpdated( qint8 l_x, qint8 l_y, qint8 r_x, qint8 r_y );

private slots:
    void serviceDiscovered(const QBluetoothServiceInfo &serviceInfo);
    void connected();
    void disconnected();
    void discoveryFinished();
    void readControlPadKeys();
    void readSocket();


private:
     void connectToService(const QBluetoothServiceInfo &remoteService);
     void updateDigitalButtons(quint16 keys);
     void updateAnalogNubs(quint32 nubs);

private:
     enum eDataRequested{
        eDigitalButtons = 1,
        eAnalogButtons =2
     };

protected:
    bool m_connected;
    int m_readProperties;
    QList<eDataRequested> m_dataRequested;

    QObject* m_receiver;
    QTimer* m_timer;
    QBluetoothServiceDiscoveryAgent *m_discoveryAgent;
    QBluetoothServiceInfo m_service;
    QBluetoothSocket* m_socket;

    quint16 m_DigitalButtons;
    quint32 m_AnalogButtons;
};

#endif // ICONTROLPADCLIENT_H
