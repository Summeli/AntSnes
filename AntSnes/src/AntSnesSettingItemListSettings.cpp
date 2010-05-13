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
/**
 *	Generated helper class which manages the settings contained 
 *	in 'AntSnesSettingItemList'.  Each CAknSettingItem maintains
 *	a reference to data in this class so that changes in the setting
 *	item list can be synchronized with this storage.
 */
 
// [[[ begin generated region: do not modify [Generated Includes]
#include <e32base.h>
#include <stringloader.h>
#include <barsread.h>
#include <AntSnes.rsg>
#include "AntSnesSettingItemListSettings.h"
// ]]] end generated region [Generated Includes]

/**
 * C/C++ constructor for settings data, cannot throw
 */
TAntSnesSettingItemListSettings::TAntSnesSettingItemListSettings()
	{
	}

/**
 * Two-phase constructor for settings data
 */
TAntSnesSettingItemListSettings* TAntSnesSettingItemListSettings::NewL()
	{
	TAntSnesSettingItemListSettings* data = new( ELeave ) TAntSnesSettingItemListSettings;
	CleanupStack::PushL( data );
	data->ConstructL();
	CleanupStack::Pop( data );
	return data;
	}
	
/**
 *	Second phase for initializing settings data
 */
void TAntSnesSettingItemListSettings::ConstructL()
	{
	// [[[ begin generated region: do not modify [Generated Initializers]
	SetEnumeratedTextPopup2( 0 );
	SetEnumeratedTextPopup1( 1 );
	SetEnumeratedTextPopup3( 0 );
	SetBinarySetting1( 0 );
	// ]]] end generated region [Generated Initializers]
	
	}
	
// [[[ begin generated region: do not modify [Generated Contents]
TInt& TAntSnesSettingItemListSettings::EnumeratedTextPopup2()
	{
	return iEnumeratedTextPopup2;
	}

void TAntSnesSettingItemListSettings::SetEnumeratedTextPopup2(const TInt& aValue)
	{
	iEnumeratedTextPopup2 = aValue;
	}

TInt& TAntSnesSettingItemListSettings::EnumeratedTextPopup1()
	{
	return iEnumeratedTextPopup1;
	}

void TAntSnesSettingItemListSettings::SetEnumeratedTextPopup1(const TInt& aValue)
	{
	iEnumeratedTextPopup1 = aValue;
	}

TInt& TAntSnesSettingItemListSettings::EnumeratedTextPopup3()
	{
	return iEnumeratedTextPopup3;
	}

void TAntSnesSettingItemListSettings::SetEnumeratedTextPopup3(const TInt& aValue)
	{
	iEnumeratedTextPopup3 = aValue;
	}

TBool& TAntSnesSettingItemListSettings::BinarySetting1()
	{
	return iBinarySetting1;
	}

void TAntSnesSettingItemListSettings::SetBinarySetting1(const TBool& aValue)
	{
	iBinarySetting1 = aValue;
	}

// ]]] end generated region [Generated Contents]

