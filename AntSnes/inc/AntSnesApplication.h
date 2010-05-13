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

#ifndef __ANTSNESAPPLICATION_H__
#define __ANTSNESAPPLICATION_H__

// INCLUDES
#include <aknapp.h>
#include "AntSnes.hrh"

// UID for the application;
// this should correspond to the uid defined in the mmp file
const TUid KUidAntSnesApp =
	{
	_UID3
	};

// CLASS DECLARATION

/**
 * CAntSnesApplication application class.
 * Provides factory to create concrete document object.
 * An instance of CAntSnesApplication is the application part of the
 * AVKON application framework for the AntSnes example application.
 */
class CAntSnesApplication : public CAknApplication
	{
public:
	// Functions from base classes

	/**
	 * From CApaApplication, AppDllUid.
	 * @return Application's UID (KUidAntSnesApp).
	 */
	TUid AppDllUid() const;
	
	CDictionaryStore* OpenIniFileLC(RFs& aFs) const;

protected:
	// Functions from base classes

	/**
	 * From CApaApplication, CreateDocumentL.
	 * Creates CAntSnesDocument document object. The returned
	 * pointer in not owned by the CAntSnesApplication object.
	 * @return A pointer to the created document object.
	 */
	CApaDocument* CreateDocumentL();
	};

#endif // __ANTSNESAPPLICATION_H__
// End of File
