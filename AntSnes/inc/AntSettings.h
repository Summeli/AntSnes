/*
 * AntSettings.h
 *
 *  Created on: 23.1.2009
 *      Author: Antti Pohjola
 */

#ifndef ANTSETTINGS_H_
#define ANTSETTINGS_H_

#include "e32std.h"

enum TScreenMode
{
	EPortrait = 1,
	ELandscape,
	ENGage
};

enum TScreenRenderer
{
	EDSA = 0,
	EOpenGLES,
	EAntiTearingDSA
};

struct TAntSettings
{
	TInt iVersion;
	//matches to the snes-keys
	TUint16 iScanKeyTable[12];
	TScreenMode iScreenMode;
	TScreenRenderer iRenderer;
	TInt iROMPathLenght;
	HBufC* iROMPath;
	TBool iShowFPS;
	TInt iFrameSkip;
	
	//Audio Settings
	TBool iAudioOn;
	TBool iEnableSpeedHack;
	TInt iSampleRate;
	TBool iStereo;
	TInt iVolume;
};

#endif /* ANTSETTINGS_H_ */
