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

#include "AntKeydialog.h"
#include <AntSnes.rsg>
#include <stringloader.h>
#include <e32keys.h>

CAntKeyDialog ::CAntKeyDialog(const TTone aTone, const TTimeout aTimeout)
:CAknNoteDialog(aTone,aTimeout)
    {
    }

CAntKeyDialog::~CAntKeyDialog() 
{
}


TKeyResponse CAntKeyDialog::OfferKeyEventL(const TKeyEvent& aKeyEvent,TEventCode aType)
{
    if( aType == EEventKeyDown)
        {
        //save the scancode
        if( aKeyEvent.iScanCode == EStdKeyDevice1 || aKeyEvent.iScanCode == 1)
        	{
        	//skip
        	iKeyScanCode = 0;
        	}
        else
        	iKeyScanCode = aKeyEvent.iScanCode;
        iWait->AsyncStop();
        StaticDeleteL(this);
        }

   return EKeyWasConsumed;
}

TInt CAntKeyDialog::RunKeyDialogLD( const TDesC& aText)
    {
    if( iWait )
    	{
    	delete iWait;
    	iWait = NULL;
    	}
    iWait = new (ELeave) CActiveSchedulerWait();
    CAknNoteDialog::SetTextL( aText );
    CAknNoteDialog::ExecuteDlgLD( R_INFORM_USER );
    iWait->Start();
    delete iWait;
    iWait = NULL;
    return iKeyScanCode;
    }
