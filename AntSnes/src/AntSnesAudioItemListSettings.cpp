/*
========================================================================
 Name        : AntSnesAudioItemListSettings.cpp
 Author      : 
 Copyright   : Your copyright notice
 Description : 
========================================================================
*/
/**
 *	Generated helper class which manages the settings contained 
 *	in 'AntSnesAudioItemList'.  Each CAknSettingItem maintains
 *	a reference to data in this class so that changes in the setting
 *	item list can be synchronized with this storage.
 */
 
// [[[ begin generated region: do not modify [Generated Includes]
#include <e32base.h>
#include <stringloader.h>
#include <barsread.h>
#include <AntSnes.rsg>
#include "AntSnesAudioItemListSettings.h"
// ]]] end generated region [Generated Includes]

/**
 * C/C++ constructor for settings data, cannot throw
 */
TAntSnesAudioItemListSettings::TAntSnesAudioItemListSettings()
	{
	}

/**
 * Two-phase constructor for settings data
 */
TAntSnesAudioItemListSettings* TAntSnesAudioItemListSettings::NewL()
	{
	TAntSnesAudioItemListSettings* data = new( ELeave ) TAntSnesAudioItemListSettings;
	CleanupStack::PushL( data );
	data->ConstructL();
	CleanupStack::Pop( data );
	return data;
	}
	
/**
 *	Second phase for initializing settings data
 */
void TAntSnesAudioItemListSettings::ConstructL()
	{
	// [[[ begin generated region: do not modify [Generated Initializers]
	SetBinarySetting1( 0 );
	SetEnumeratedTextPopup1( 8000 );
	SetBinarySetting2( 0 );
	SetVolumeSetting1( 4 );
	SetBinarySetting3( 1 );
	// ]]] end generated region [Generated Initializers]
	
	}
	
// [[[ begin generated region: do not modify [Generated Contents]
TBool& TAntSnesAudioItemListSettings::BinarySetting1()
	{
	return iBinarySetting1;
	}

void TAntSnesAudioItemListSettings::SetBinarySetting1(const TBool& aValue)
	{
	iBinarySetting1 = aValue;
	}

TInt& TAntSnesAudioItemListSettings::EnumeratedTextPopup1()
	{
	return iEnumeratedTextPopup1;
	}

void TAntSnesAudioItemListSettings::SetEnumeratedTextPopup1(const TInt& aValue)
	{
	iEnumeratedTextPopup1 = aValue;
	}

TBool& TAntSnesAudioItemListSettings::BinarySetting2()
	{
	return iBinarySetting2;
	}

void TAntSnesAudioItemListSettings::SetBinarySetting2(const TBool& aValue)
	{
	iBinarySetting2 = aValue;
	}

TInt& TAntSnesAudioItemListSettings::VolumeSetting1()
	{
	return iVolumeSetting1;
	}

void TAntSnesAudioItemListSettings::SetVolumeSetting1(const TInt& aValue)
	{
	iVolumeSetting1 = aValue;
	}

TBool& TAntSnesAudioItemListSettings::BinarySetting3()
	{
	return iBinarySetting3;
	}

void TAntSnesAudioItemListSettings::SetBinarySetting3(const TBool& aValue)
	{
	iBinarySetting3 = aValue;
	}

// ]]] end generated region [Generated Contents]

