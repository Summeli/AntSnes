#ifndef ICONTROLPADSETTINGS_H
#define ICONTROLPADSETTINGS_H

#include <QWidget>
#include "ui_icontrolpadsettings.h"

class iControlPadSettings : public QWidget
{
    Q_OBJECT

public:
     iControlPadSettings(QWidget *parent = 0);
    ~iControlPadSettings();

public slots:
    void connectClicked();

private:
    Ui::iControlPadSettings ui;
};

#endif // ICONTROLPADSETTINGS_H
