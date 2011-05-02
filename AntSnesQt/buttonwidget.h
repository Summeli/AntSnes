#ifndef BUTTONWIDGET_H
#define BUTTONWIDGET_H

#include <QtGui/QWidget>
#include "ui_buttonwidget.h"

class buttonwidget : public QWidget
{
    Q_OBJECT

    public:
        buttonwidget(QWidget *parent = 0);
        ~buttonwidget();
        quint32 getSnesKey(int x, int y);

    private:
        Ui::buttonwidgetClass ui;
};

#endif // BUTTONWIDGET_H
