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

signals:
	void virtualKeyEvent( quint32 aKey, bool isDown );
    	
protected:
	void mousePressEvent(QMouseEvent* event );
	void mouseReleaseEvent(QMouseEvent* event );
	void mouseMoveEvent(QMouseEvent* event);
    	
private:
	void processbuttons( QMouseEvent* event );
	quint32 getSnesKeys( QMouseEvent* event );
	
private:
    Ui::buttonwidgetClass ui;
    quint32 prevkeys;
};

#endif // BUTTONWIDGET_H
