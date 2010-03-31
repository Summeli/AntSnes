#ifndef CONTROLSETTINGS_H
#define CONTROLSETTINGS_H

#include <QtGui/QWidget>
#include "ui_controlsettings.h"

class controlsettings : public QWidget
{
    Q_OBJECT

public:
    controlsettings(QWidget *parent = 0);
    ~controlsettings();

public slots: 
	 void keyConfig();

signals:
	 void runkeyconfig();
	 
private:
    Ui::controlsettingsClass ui;
};

#endif // CONTROLSETTINGS_H
