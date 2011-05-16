#ifndef VIDEOSETTINGS_H
#define VIDEOSETTINGS_H

#include <QtGui/QWidget>
#include "ui_videosettings.h"

class videosettings : public QWidget
{
    Q_OBJECT

public:
    videosettings(int frameskip, bool showFps, int buttonOpacity, int stretch, QWidget *parent = 0);
    ~videosettings();
    
public slots:
    void setFrameskip(int framestoskip);
    void showFPSChecked( int state );
    void stretchIndexChecked( int state );
    void setOpacity(int slider);
 signals:
    void frameskip( int framestoskip );
    void showFPS( bool showFPS );
    void stretch( int stretch );
    void buttonOpacity( int buttonOpacity );

private:
    Ui::videosettingsClass ui;
};

#endif // VIDEOSETTINGS_H
