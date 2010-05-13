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

#include "antremconcoreresponse.h"

CAntRemConCoreKeyResponse* CAntRemConCoreKeyResponse::NewL(CRemConCoreApiTarget* 
														aRemConCoreApiTarget)
    {
    CAntRemConCoreKeyResponse* self = 
        new (ELeave) CAntRemConCoreKeyResponse();
    CleanupStack::PushL( self );
    self->ConstructL( aRemConCoreApiTarget );
    CleanupStack::Pop( self );
    return self;
    }

CAntRemConCoreKeyResponse::CAntRemConCoreKeyResponse()
      : CActive ( EPriorityNormal )
    {
    CActiveScheduler::Add( this );
    }

CAntRemConCoreKeyResponse::~CAntRemConCoreKeyResponse()
    {
	Cancel();
	iResponseQ.Reset();
	iResponseQ.Close();
    }
    
void CAntRemConCoreKeyResponse::ConstructL( CRemConCoreApiTarget* aRemConCore )
	{
	iRemConCore = aRemConCore;
	}

void CAntRemConCoreKeyResponse::DoCancel()
    {
    }

void CAntRemConCoreKeyResponse::RunL()
    {
    if ( iResponseQ.Count() )
    	{
    	CompleteMediaKeyEvent( iResponseQ[0] );
    	//remove old response from que
    	iResponseQ.Remove(0);
    	iResponseQ.Compress();
    	}
    
    }

void CAntRemConCoreKeyResponse::CompleteMediaKeyEvent( TRemConCoreApiOperationId 
																aOperationId )
	{
	if	( !IsActive() )
		{
			switch ( aOperationId )
			{
	        case ERemConCoreApiVolumeUp:
	            {
	            iRemConCore->VolumeUpResponse( iStatus, KErrNone );
				SetActive();
	            }
	            break;

	        case ERemConCoreApiVolumeDown:
	            {
	            iRemConCore->VolumeDownResponse( iStatus, KErrNone );	
				SetActive();
	            }
	            break;
	        case ERemConCoreApiPlay:
	        	{
	        	iRemConCore-> PlayResponse(iStatus, KErrNone);
	        	SetActive();
	        	}
	        	break;
	        case ERemConCoreApiStop:
	        	{
	        	iRemConCore->StopResponse(iStatus, KErrNone);
	        	SetActive();
	        	}
	        	break;
	        
	        case ERemConCoreApiPause:
	        	{
	        	iRemConCore->PauseResponse(iStatus, KErrNone);
	        	SetActive();
	        	}
	        	break;
	        case ERemConCoreApiRewind:
	        	{
	        	iRemConCore->RewindResponse(iStatus, KErrNone);
	        	SetActive();
	        	}
	        	break;
	        case ERemConCoreApiFastForward:
	        	{
	        	iRemConCore->FastForwardResponse(iStatus, KErrNone);
	        	SetActive();
	        	}
	        	break;
	        	
	        default:
	        	{
	        	}
	        	break;
			}
		}
	else
		{
		//active, append to queue
		iResponseQ.Append( aOperationId );
		}
	}
