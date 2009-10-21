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

#ifndef ANTKEYDIALOG_H_
#define ANTKEYDIALOG_H_

#include <e32std.h>
#include <e32base.h>
#include <AknGlobalNote.h>
#include <aknnotedialog.h> 

/**
* Dialog class for keyconfig. 
*/
class CAntKeyDialog : public CAknNoteDialog
{
public:
	CAntKeyDialog(const TTone aTone, const TTimeout aTimeout);
    
    ~CAntKeyDialog();
   
    TInt RunKeyDialogLD( const TDesC& aText);
  

private:
    TKeyResponse OfferKeyEventL(const TKeyEvent& aKeyEvent,TEventCode aType);
    TInt iKeyScanCode;
    CActiveSchedulerWait* iWait;
};

#endif /* ANTKEYDIALOG_H_ */
