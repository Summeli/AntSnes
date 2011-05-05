#ifndef VIDEOSETTINGS_H
#define VIDEOSETTINGS_H

#include <QtGui/QWidget>
#include "ui_videosettings.h"

class videosettings : public QWidget
{
    Q_OBJECT

public:
    videosettings(int frameskip, bool showFps, QWidget *parent = 0);
    ~videosettings();
    
public slots:
    void setFrameskip(int framestoskip);
    void showFPSChecked( int state );
    
 signals:
    void frameskip( int framestoskip );
    void showFPS( bool showFPS );

private:
    Ui::videosettingsClass ui;
};

#endif // VIDEOSETTINGS_H
