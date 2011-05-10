#ifndef BUTTONWIDGET_H
#define BUTTONWIDGET_H

#include <QtGui/QWidget>
#include "ui_buttonwidget.h"

class buttonwidget : public QObject
{
    Q_OBJECT

    public:
        buttonwidget(QObject *parent = 0);
        ~buttonwidget();
        quint32 getSnesKey(int x, int y);

    private:
       // Ui::buttonwidgetClass ui;
};

#endif // BUTTONWIDGET_H
