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

#ifndef __ANTSNESAPPUI_h__
#define __ANTSNESAPPUI_h__

// INCLUDES
#include <aknappui.h>
#include <f32file.h>
#include <aknprogressdialog.h>

#include "AntSettings.h"
#include "AntSnesContainer.h"
// the generated settings
#include "AntSnesSettingItemList.h"
#include "AntSnesSettingItemListSettings.h"
#include "AntSnesAudioItemList.h"
#include "AntSnesAudioItemListSettings.h"
#include "MMenuObserver.h"
#ifdef __S60_50__
#include "RightButtonControl.h"
#include "LeftButtonControl.h"
#endif

// FORWARD DECLARATIONS
class CAntSnesContainer;


// CLASS DECLARATION
/**
 * CAntSnesAppUi application UI class.
 * Interacts with the user through the UI and request message processing
 * from the handler class
 */
class CAntSnesAppUi : public CAknAppUi, MRequestMenuObserver
	{
public:
	// Constructors and destructor

	/**
	 * ConstructL.
	 * 2nd phase constructor.
	 */
	void ConstructL();

	/**
	 * CAntSnesAppUi.
	 * C++ default constructor. This needs to be public due to
	 * the way the framework constructs the AppUi
	 */
	CAntSnesAppUi();

	/**
	 * ~CAntSnesAppUi.
	 * Virtual Destructor.
	 */
	virtual ~CAntSnesAppUi();

private:
	// Functions from base classes

	// From CCoeAppU
	TKeyResponse HandleKeyEventL(const TKeyEvent& aKeyEvent,TEventCode aType);
	
	/**
	 * From CEikAppUi, HandleCommandL.
	 * Takes care of command handling.
	 * @param aCommand Command to be handled.
	 */
	void HandleCommandL(TInt aCommand);

    /// From CEikAppUi, enables dynamic menus
    void DynInitMenuPaneL( TInt aResourceId, CEikMenuPane* aMenuPane );
    
	/**
	 *  From CCoeAppUi, HelpContextL.
	 *  Provides help context for the application.
	 *  size is changed.
	 */
	CArrayFix<TCoeHelpContext>* HelpContextL() const;
	
	void ExternalizeL(CDictionaryStore& aStore);
	void InternalizeL(const CDictionaryStore& aStore);
	void SaveSettingsL( TBool aRestartRequired  );
	void SetDefaultSettings();
	
	void StartKeyConfigL();
	void DismissSettings();
	
public:
	void ShowMenu();
private:
	// Data
	/**
	 * The application view
	 * Owned by CAntSnesAppUi
	 */
	TBool iFullScreen;
	TBool iResetRequired;
	TBool iMenuOpen;
	TBool iRomLoaded;
	TAntSettings iSettings;
	
	CAntSnesContainer* iAppContainer; 
	
	CAntSnesSettingItemList* iSettingsList;
	TAntSnesSettingItemListSettings* iItemList;
	
	CAntSnesAudioItemList* iAudioItemList;
	TAntSnesAudioItemListSettings* iAudioList;
#ifdef __S60_50__
    CLeftButtonControl* iLeftButtonControl;
    CRightButtonControl* iRightButtonControl;
#endif
	};

#endif // __ANTSNESAPPUI_h__
// End of File
