/* AntSnes
 *
 * Copyright (C) 2011 Summeli <summeli@summeli.fi>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of
 * the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 */

#include "meegoAdaptation.h"

#include <QApplication>
#include <QWidget>

#include "debug.h"

#include <QX11Info>
#include <X11/Xatom.h>
#include <X11/Xlib.h>

meegoAdaptation::meegoAdaptation(QObject *parent)
    : QObject(parent), m_SwipeEnabled( true ), m_timer(NULL)
{
}

meegoAdaptation::~meegoAdaptation()
{
}

void meegoAdaptation::enableSwipe()
{
    __DEBUG1("Enable swipe");
    if( m_timer )
        return;
    m_timer = new QTimer(this);
    connect(m_timer, SIGNAL(timeout()), this, SLOT(doEnableSwipe()));
    m_timer->start(2000);

}

void meegoAdaptation::disableSwipe()
{
    if( m_timer )
        return;
    m_timer = new QTimer(this);
    connect(m_timer, SIGNAL(timeout()), this, SLOT(doDisableSwipe()));
    m_timer->start(3000);
}

void meegoAdaptation::doEnableSwipe()
{
        setSwipeEnabled( true );
}

void meegoAdaptation::doDisableSwipe()
{
        setSwipeEnabled( false );
}

//taken from mdeclarative screen
//https://qt.gitorious.org/qt-components/qt-components/blobs/master/src/meego/mdeclarativescreen.cpp
void meegoAdaptation::setSwipeEnabled(bool enabled )
{

    if (enabled != m_SwipeEnabled) {
        QWidget * activeWindow = QApplication::activeWindow();
         if(!activeWindow) {
             __DEBUG1("no active window");
             return;
         }
         if( !enabled )
             __DEBUG1("NOW DISABLING THE SWIPE...");
         Display *dpy = QX11Info::display();
         Window w = activeWindow->effectiveWinId();

         unsigned long val = (enabled) ? 1 : 0;

         Atom atom = XInternAtom(dpy, "_MEEGOTOUCH_CANNOT_MINIMIZE", false);

         if (!atom) {

             qWarning("Unable to obtain _MEEGOTOUCH_CANNOT_MINIMIZE. This example will only work "
                      "with the MeeGo Compositor!");
             return;
         }

         XChangeProperty (dpy,
                 w,
                 atom,
                 XA_CARDINAL,
                 32,
                 PropModeReplace,
                 reinterpret_cast<unsigned char *>(&val),
                 1);

         m_SwipeEnabled = enabled;

    }
    delete m_timer;
    m_timer = NULL;
}
