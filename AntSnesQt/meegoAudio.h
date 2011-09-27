/* AntSnes
 *
 * Copyright (C) 2010 Summeli <summeli@summeli.fi>
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

#ifndef __MEEGO_AUDIO_H_
#define __MEEGO_AUDIO_H_

#include <QObject>

#include <pulse/simple.h>
#include <pulse/error.h>
#include <pulse/gccmacro.h>

#include "port.h"

const int KSoundBuffers = 4;
const int KBlockTime = 1000000 / 5; // hardcoded: 5 updates/sec
const int KMaxLag = 260000; // max sound lag, lower values increase chanse of underflow
const int KMaxUnderflows = 50; // max underflows/API errors we are going allow in a row (to prevent lockups)


class CAntAudio : public QObject
{
	Q_OBJECT
	
public:
	~CAntAudio();
	CAntAudio();
	
public:
        void setAudioSettings(int aRate, bool aStereo, int aPcmFrames, int aVolume );
        int8* NextFrameL();
        int FreeBufferCount();
	void Stop();

public slots:
	void FrameMixed();
	void Reset();

protected:

    uint8_32* m_buf;

    pa_simple *m_s;
    int m_audioBufSize;

};
#endif //__MEEGO_AUDIO_H_