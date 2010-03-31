#ifndef VIDEOSETTINGS_H
#define VIDEOSETTINGS_H

#include <QtGui/QWidget>
#include "ui_videosettings.h"

class videosettings : public QWidget
{
    Q_OBJECT

public:
    videosettings(int frameskip, QWidget *parent = 0);
    ~videosettings();
    
public slots:
    void setFrameskip(int framestoskip);
    
 signals:
    void frameskip( int framestoskip );

private:
    Ui::videosettingsClass ui;
};

#endif // VIDEOSETTINGS_H
