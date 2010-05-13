/*
========================================================================
 Name        : AntSnesAudioItemList.cpp
 Author      : 
 Copyright   : Your copyright notice
 Description : 
========================================================================
*/
// [[[ begin generated region: do not modify [Generated System Includes]
#include <avkon.hrh>
#include <avkon.rsg>
#include <eikmenup.h>
#include <aknappui.h>
#include <eikcmobs.h>
#include <eikappui.h>
#include <barsread.h>
#include <stringloader.h>
#include <aknpopupfieldtext.h>
#include <eikenv.h>
#include <AntSnes.rsg>
// ]]] end generated region [Generated System Includes]

// [[[ begin generated region: do not modify [Generated User Includes]
#include "AntSnesAudioItemList.h"
#include "AntSnesAudioItemListSettings.h"
#include "AntSnes.hrh"
#include "AntSnesSettingItemList.hrh"
#include "AntSnesAppUi.h"
// ]]] end generated region [Generated User Includes]

// [[[ begin generated region: do not modify [Generated Constants]
// ]]] end generated region [Generated Constants]

/**
 * Construct the CAntSnesAudioItemList instance
 * @param aCommandObserver command observer
 */ 
CAntSnesAudioItemList::CAntSnesAudioItemList( 
		TAntSnesAudioItemListSettings& aSettings, 
		MEikCommandObserver* aCommandObserver )
	: iSettings( aSettings ), iCommandObserver( aCommandObserver )
	{
	// [[[ begin generated region: do not modify [Generated Contents]
	// ]]] end generated region [Generated Contents]
	
	}
/** 
 * Destroy any instance variables
 */
CAntSnesAudioItemList::~CAntSnesAudioItemList()
	{
	// [[[ begin generated region: do not modify [Generated Contents]
	// ]]] end generated region [Generated Contents]
	
	}

/**
 * Handle system notification that the container's size has changed.
 */
void CAntSnesAudioItemList::SizeChanged()
	{
	if ( ListBox() ) 
		{
		ListBox()->SetRect( Rect() );
		}
	}

/**
 * Create one setting item at a time, identified by id.
 * CAknSettingItemList calls this method and takes ownership
 * of the returned value.  The CAknSettingItem object owns
 * a reference to the underlying data, which EditItemL() uses
 * to edit and store the value.
 */
CAknSettingItem* CAntSnesAudioItemList::CreateSettingItemL( TInt aId )
	{
	switch ( aId )
		{
	// [[[ begin generated region: do not modify [Initializers]
		case EAntSnesAppUiBinarySetting13:
			{			
			CAknBinaryPopupSettingItem* item = new ( ELeave ) 
				CAknBinaryPopupSettingItem( 
					aId,
					iSettings.BinarySetting1() );
			return item;
			}
		case EAntSnesAppUiEnumeratedTextPopup13:
			{			
			CAknEnumeratedTextPopupSettingItem* item = new ( ELeave ) 
				CAknEnumeratedTextPopupSettingItem( 
					aId,
					iSettings.EnumeratedTextPopup1() );
			return item;
			}
		case EAntSnesAppUiBinarySetting22:
			{			
			CAknBinaryPopupSettingItem* item = new ( ELeave ) 
				CAknBinaryPopupSettingItem( 
					aId,
					iSettings.BinarySetting2() );
			return item;
			}
		case EAntSnesAppUiVolumeSetting12:
			{			
			CAknVolumeSettingItem* item = new ( ELeave ) 
				CAknVolumeSettingItem( 
					aId,
					iSettings.VolumeSetting1() );
			return item;
			}
		case EAntSnesAppUiBinarySetting32:
			{			
			CAknBinaryPopupSettingItem* item = new ( ELeave ) 
				CAknBinaryPopupSettingItem( 
					aId,
					iSettings.BinarySetting3() );
			return item;
			}
	// ]]] end generated region [Initializers]
	
		}
		
	return NULL;
	}
	
/**
 * Edit the setting item identified by the given id and store
 * the changes into the store.
 * @param aIndex the index of the setting item in SettingItemArray()
 * @param aCalledFromMenu true: a menu item invoked editing, thus
 *	always show the edit page and interactively edit the item;
 *	false: change the item in place if possible, else show the edit page
 */
void CAntSnesAudioItemList::EditItemL ( TInt aIndex, TBool aCalledFromMenu )
	{
	CAknSettingItem* item = ( *SettingItemArray() )[aIndex];
	switch ( item->Identifier() )
		{
	// [[[ begin generated region: do not modify [Editing Started Invoker]
	// ]]] end generated region [Editing Started Invoker]
	
		}
	
	CAknSettingItemList::EditItemL( aIndex, aCalledFromMenu );
	
	TBool storeValue = ETrue;
	switch ( item->Identifier() )
		{
	// [[[ begin generated region: do not modify [Editing Stopped Invoker]
	// ]]] end generated region [Editing Stopped Invoker]
	
		}
		
	if ( storeValue )
		{
		item->StoreL();
		SaveSettingValuesL();
		}	
	}
/**
 *	Handle the "Change" option on the Options menu.  This is an
 *	alternative to the Selection key that forces the settings page
 *	to come up rather than changing the value in place (if possible).
 */
void CAntSnesAudioItemList::ChangeSelectedItemL()
	{
	if ( ListBox()->CurrentItemIndex() >= 0 )
		{
		EditItemL( ListBox()->CurrentItemIndex(), ETrue );
		}
	}

/**
 *	Load the initial contents of the setting items.  By default,
 *	the setting items are populated with the default values from
 * 	the design.  You can override those values here.
 *	<p>
 *	Note: this call alone does not update the UI.  
 *	LoadSettingsL() must be called afterwards.
 */
void CAntSnesAudioItemList::LoadSettingValuesL()
	{
	// load values into iSettings
	}
	
/**
 *	Save the contents of the setting items.  Note, this is called
 *	whenever an item is changed and stored to the model, so it
 *	may be called multiple times or not at all.
 */
void CAntSnesAudioItemList::SaveSettingValuesL()
	{
	// store values from iSettings
	iCommandObserver->ProcessCommandL( EAudioSettingsSaved );
	}


/** 
 * Handle global resource changes, such as scalable UI or skin events (override)
 */
void CAntSnesAudioItemList::HandleResourceChange( TInt aType )
	{
	CAknSettingItemList::HandleResourceChange( aType );
	SetRect( static_cast< CEikAppUi* >( iCoeEnv->AppUi() )->ClientRect() );
	// [[[ begin generated region: do not modify [Generated Contents]
	// ]]] end generated region [Generated Contents]
	
	}
				
/** 
 * Handle key event (override)
 * @param aKeyEvent key event
 * @param aType event code
 * @return EKeyWasConsumed if the event was handled, else EKeyWasNotConsumed
 */
TKeyResponse CAntSnesAudioItemList::OfferKeyEventL( 
		const TKeyEvent& aKeyEvent, 
		TEventCode aType )
	{
	// [[[ begin generated region: do not modify [Generated Contents]
	// ]]] end generated region [Generated Contents]
	
	
	return CAknSettingItemList::OfferKeyEventL( aKeyEvent, aType );
	}
				
