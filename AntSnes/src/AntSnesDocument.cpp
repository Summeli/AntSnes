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
#include "AntSnesAppUi.h"
#include "AntSnesDocument.h"

// ============================ MEMBER FUNCTIONS ===============================

// -----------------------------------------------------------------------------
// CAntSnesDocument::NewL()
// Two-phased constructor.
// -----------------------------------------------------------------------------
//
CAntSnesDocument* CAntSnesDocument::NewL(CEikApplication& aApp)
	{
	CAntSnesDocument* self = NewLC(aApp);
	CleanupStack::Pop(self);
	return self;
	}

// -----------------------------------------------------------------------------
// CAntSnesDocument::NewLC()
// Two-phased constructor.
// -----------------------------------------------------------------------------
//
CAntSnesDocument* CAntSnesDocument::NewLC(CEikApplication& aApp)
	{
	CAntSnesDocument* self = new (ELeave) CAntSnesDocument(aApp);

	CleanupStack::PushL(self);
	self->ConstructL();
	return self;
	}

// -----------------------------------------------------------------------------
// CAntSnesDocument::ConstructL()
// Symbian 2nd phase constructor can leave.
// -----------------------------------------------------------------------------
//
void CAntSnesDocument::ConstructL()
	{
	// No implementation required
	}

// -----------------------------------------------------------------------------
// CAntSnesDocument::CAntSnesDocument()
// C++ default constructor can NOT contain any code, that might leave.
// -----------------------------------------------------------------------------
//
CAntSnesDocument::CAntSnesDocument(CEikApplication& aApp) :
	CAknDocument(aApp)
	{
	// No implementation required
	}

// ---------------------------------------------------------------------------
// CAntSnesDocument::~CAntSnesDocument()
// Destructor.
// ---------------------------------------------------------------------------
//
CAntSnesDocument::~CAntSnesDocument()
	{
	// No implementation required
	}

// ---------------------------------------------------------------------------
// CAntSnesDocument::CreateAppUiL()
// Constructs CreateAppUi.
// ---------------------------------------------------------------------------
//
CEikAppUi* CAntSnesDocument::CreateAppUiL()
	{
	// Create the application user interface, and return a pointer to it;
	// the framework takes ownership of this object
	return new (ELeave) CAntSnesAppUi;
	}

// End of File
