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

// INCLUDE FILES
#include "AntSnes.hrh"
#include "AntSnesDocument.h"
#include "AntSnesApplication.h"

// ============================ MEMBER FUNCTIONS ===============================

// -----------------------------------------------------------------------------
// CAntSnesApplication::CreateDocumentL()
// Creates CApaDocument object
// -----------------------------------------------------------------------------
//
CApaDocument* CAntSnesApplication::CreateDocumentL()
	{
	// Create an AntSnes document, and return a pointer to it
	return CAntSnesDocument::NewL(*this);
	}

// -----------------------------------------------------------------------------
// CAntSnesApplication::AppDllUid()
// Returns application UID
// -----------------------------------------------------------------------------
//
TUid CAntSnesApplication::AppDllUid() const
	{
	// Return the UID for the AntSnes application
	return KUidAntSnesApp;
	}


CDictionaryStore* CAntSnesApplication::OpenIniFileLC(RFs& aFs) const
{
    return CEikApplication::OpenIniFileLC(aFs);
}

// End of File
