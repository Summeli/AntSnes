#include "tracer.h"
/* AntSnes
 *
 * Copyright (C) 2009 Summeli <summeli@summeli.fi>
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

#include "AntAudio.h"
#include "tracer.h"
#ifdef OUTPUT_TO_FILE
_LIT( KTESTDATA, "c:\\Data\\test_data\\testdata.dat");
#endif	
#include "symb_debug.h"
/*******************************************
 *
 * CAntAudio
 *
 *******************************************/

CAntAudio::CAntAudio(TInt aRate, TBool aStereo, TInt aPcmFrames, TInt aVolume )
: iRate(aRate), iStereo(aStereo), iPcmFrames(aPcmFrames), iVolume( aVolume )
{
    TRACER("CAntAudio::CAntAudio(TInt aRate, TBool aStereo, TInt aPcmFrames, TInt aVolume)")
}


CAntAudio* CAntAudio::NewL(TInt aRate, TBool aStereo, TInt aPcmFrames, TInt aVolume, MAudioListener* aListener )
{
    TRACER("CAntAudio* CAntAudio::NewL(TInt aRate, TBool aStereo, TInt aPcmFrames, TInt aVolume)")
	CAntAudio* self = new(ELeave) CAntAudio(aRate, aStereo, aPcmFrames, aVolume );
	CleanupStack::PushL(self);
	self->ConstructL( aListener);
	CleanupStack::Pop(self);		// self
	return self;
}


CAntAudio::~CAntAudio()
{
    TRACER("CAntAudio::~CAntAudio()")
	if(iMdaAudioOutputStream) 
		{
		Stop();
		delete iMdaAudioOutputStream;
		}

	for (TInt i=0 ; i<KSoundBuffers+1 ; i++)
		delete iSoundBuffers[i];

	delete iWait;
	iEmptyBufQ.Reset();
	iEmptyBufQ.Close();
#ifdef OUTPUT_TO_FILE
	iFile.Close();
	iFs.Close();
#endif	
}


void CAntAudio::ConstructL( MAudioListener* aListener )
{
    TRACER("void CAntAudio::ConstructL()")

	switch(iRate) {
		case 11025: iMdaAudioDataSettings.iSampleRate = TMdaAudioDataSettings::ESampleRate11025Hz; break;
		case 16000: iMdaAudioDataSettings.iSampleRate = TMdaAudioDataSettings::ESampleRate16000Hz; break;
		case 22050: iMdaAudioDataSettings.iSampleRate = TMdaAudioDataSettings::ESampleRate22050Hz; break;
		case 44100: iMdaAudioDataSettings.iSampleRate = TMdaAudioDataSettings::ESampleRate44100Hz; break;
		default:    iMdaAudioDataSettings.iSampleRate = TMdaAudioDataSettings::ESampleRate8000Hz;  break;
	}

	iMdaAudioDataSettings.iChannels   = (iStereo) ? TMdaAudioDataSettings::EChannelsStereo : TMdaAudioDataSettings::EChannelsMono;
	iMdaAudioDataSettings.iCaps       = TMdaAudioDataSettings::ESampleRateFixed | iMdaAudioDataSettings.iSampleRate;
	iMdaAudioDataSettings.iFlags      = TMdaAudioDataSettings::ENoNetworkRouting;
	
	//TInt	bytesPerFrame = iStereo ? iPcmFrames << 2 : iPcmFrames << 1;
    TInt bytesPerFrame = iPcmFrames;
	for (TInt i=0 ; i<KSoundBuffers ; i++)
	{
		//TODO: calculate correct buffer size!
		iSoundBuffers[i] = HBufC8::NewL(bytesPerFrame );
		iSoundBuffers[i]->Des().FillZ  (bytesPerFrame );
		TInt err = iEmptyBufQ.Append(i);
		User::LeaveIfError(err);
	}

	iFrameCount = 0;
	iMdaAudioOutputStream = CMdaAudioOutputStream::NewL(*this);
	
	iWait = new (ELeave) CActiveSchedulerWait;
	iListener = aListener;
#ifdef OUTPUT_TO_FILE
	iFs.Connect();
	TInt err = iFile.Open(iFs, KTESTDATA, EFileWrite);
	if( err )
		iFile.Create(iFs, KTESTDATA, EFileWrite);
#endif	
}

void CAntAudio::Reset()
	{
    TRACER("void CAntAudio::Reset()")

	iMdaAudioOutputStream->Open(&iMdaAudioDataSettings);
		
    iWait->Start();
	iMdaAudioOutputStream->SetPriority(EPriorityMuchMore, EMdaPriorityPreferenceNone);
	TInt MaxVol = iMdaAudioOutputStream->MaxVolume();
	TInt vol = (MaxVol * iVolume) / MaxVol;
	iMdaAudioOutputStream->SetVolume(vol);
	}

// returns a pointer to buffer for next frame,
// to be used when iSoundBuffers are used directly
TUint8 *CAntAudio::NextFrameL()
{
#ifdef OUTPUT_TO_FILE	
	return (TUint8*) iSoundBuffers[iEmptyBufQ[0]]->Ptr();
#endif
	if( (iEmptyBufQ.Count() < 1) )
		{
		return NULL;
		}
	return (TUint8*) iSoundBuffers[iEmptyBufQ[0]]->Ptr();
}

void CAntAudio::FrameMixed()
	{
    TRACER("void CAntAudio::FrameMixed()")
#ifdef OUTPUT_TO_FILE	
	TInt err = iFile.Write(*iSoundBuffers[0]);
#else
	TInt nextFrame = 0;
	TBool bufferComplete = EFalse;
	
	nextFrame = iEmptyBufQ[0];
	iEmptyBufQ.Remove(0);
	iEmptyBufQ.Compress();
	iMdaAudioOutputStream->WriteL(*iSoundBuffers[nextFrame]);
#endif	 
	}

void CAntAudio::Stop()
	{
    TRACER("void CAntAudio::Stop()")
	iMdaAudioOutputStream->Stop();
	TInt queuedbuffers = KSoundBuffers - iEmptyBufQ.Count();
	for( TInt i= queuedbuffers; i>0; i--)
		{
		//iWait->Start();
		}
	}

TInt CAntAudio::FreeBufferCount()
	{
    TRACER("TInt CAntAudio::FreeBufferCount()")
	return iEmptyBufQ.Count();
	}

void CAntAudio::MaoscOpenComplete(TInt aError)
{
    TRACER("void CAntAudio::MaoscOpenComplete(TInt aError)")
    if (aError==KErrNone)
    {
	//iMdaAudioOutputStream->SetPriority(EPriorityMuchMore, EMdaPriorityPreferenceNone);
    }
    if( aError == KErrServerBusy )
    	{
    	//iMdaAudioOutputStream->Open(&iMdaAudioDataSettings);
    	}
    iListener->AudioChannelOpened();
    iWait->AsyncStop();
}

void CAntAudio::MaoscBufferCopied(TInt aError, const TDesC8& aBuffer)
{
    TRACER("void CAntAudio::MaoscBufferCopied(TInt aError, const TDesC8& aBuffer)")

	if( aBuffer.Ptr() == iSoundBuffers[0]->Ptr())
		iEmptyBufQ.Append(0);
	else if(  aBuffer.Ptr() == iSoundBuffers[1]->Ptr() )
		iEmptyBufQ.Append(1);
	else if(  aBuffer.Ptr() == iSoundBuffers[2]->Ptr() )
		iEmptyBufQ.Append(2);
	else if(  aBuffer.Ptr() == iSoundBuffers[3]->Ptr() )
		iEmptyBufQ.Append(3);

	//if( !iPlaying )
	//	iWait->AsyncStop();
}
void CAntAudio::MaoscPlayComplete(TInt aError)
{
    TRACER("void CAntAudio::MaoscPlayComplete(TInt aError)")
	//iPlaying = EFalse;
}
