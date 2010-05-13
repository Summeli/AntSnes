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

// INCLUDES
#include "CSnesTimer.h"
#include <e32svr.h>
#include <coemain.h>
#include "MSnesTimerObserver.h"
            
// MEMBER FUNCTIONS
CSnesTimer* CSnesTimer::NewLC(MSnesTimerObserver& aObserver)
    {
    CSnesTimer* self = new (ELeave) CSnesTimer( aObserver );
    CleanupStack::PushL(self);
    self->ConstructL();
    return self;
    }

CSnesTimer* CSnesTimer::NewL(MSnesTimerObserver& aObserver)
    {
    CSnesTimer* self = CSnesTimer::NewLC( aObserver );
    CleanupStack::Pop();
    return self;
    }

CSnesTimer::CSnesTimer( MSnesTimerObserver& aObserver )
    : iObserver( aObserver )
    {
    }

void CSnesTimer::ConstructL()
    {
    iIdle = CIdle::NewL( CIdle::EPriorityIdle );
    }

CSnesTimer::~CSnesTimer()
    {
    iIdle->Cancel();
    delete iIdle;
    }

void CSnesTimer::Start( TInt aFrameSkip )
    {
    if( aFrameSkip == 0 )//if auto
    	iIdle->Start( TCallBack( IdleCallBack, this ) );
    else
    	{
        iFrameSkip = aFrameSkip;
        iSkip = iFrameSkip;
        iCounter = 10;
    	iIdle->Start( TCallBack( IdleCallBackFrameSkip, this ) );
    	}
    }

void CSnesTimer::Cancel()
    {
    iIdle->Cancel();
    }

TInt CSnesTimer::IdleCallBack( TAny* aPtr )
    {
    return ( ( CSnesTimer* )aPtr )->DoCallAutoFrameSkip();
    }

TInt CSnesTimer::IdleCallBackFrameSkip( TAny* aPtr )
	{
	return ( ( CSnesTimer* )aPtr )->DoCallFrameSkip();
	}

TInt CSnesTimer::DoCallAutoFrameSkip()
    {
    return iObserver.DoSnesFrameL();
    }
TInt CSnesTimer::DoCallFrameSkip()
    {
    TBool doframe;
    if(!iCounter)
    	{
    	iCounter = 10;
    	iSkip = iFrameSkip;
    	}
    if( iSkip )
    	{
    	doframe = EFalse;
    	iSkip--;
    	}
    else
    	{
    	doframe = ETrue;
    	iSkip = iFrameSkip;
    	}
    iCounter--;
    return iObserver.DoSnesFrameL( doframe );
    }
