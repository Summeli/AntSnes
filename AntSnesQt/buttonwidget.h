#ifndef BUTTONWIDGET_H
#define BUTTONWIDGET_H

#include <QtGui/QWidget>

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
