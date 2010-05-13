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
#ifndef ANTSNESSETTINGITEMLISTSETTINGS_H
#define ANTSNESSETTINGITEMLISTSETTINGS_H
			
// [[[ begin generated region: do not modify [Generated Includes]
#include <e32std.h>
// ]]] end generated region [Generated Includes]

// [[[ begin generated region: do not modify [Generated Constants]
// ]]] end generated region [Generated Constants]

/**
 * @class	TAntSnesSettingItemListSettings AntSnesSettingItemListSettings.h
 */
class TAntSnesSettingItemListSettings
	{
public:
	// construct and destroy
	static TAntSnesSettingItemListSettings* NewL();
	void ConstructL();
		
private:
	// constructor
	TAntSnesSettingItemListSettings();
	// [[[ begin generated region: do not modify [Generated Accessors]
public:
	TInt& EnumeratedTextPopup2();
	void SetEnumeratedTextPopup2(const TInt& aValue);
	TInt& EnumeratedTextPopup1();
	void SetEnumeratedTextPopup1(const TInt& aValue);
	TInt& EnumeratedTextPopup3();
	void SetEnumeratedTextPopup3(const TInt& aValue);
	TBool& BinarySetting1();
	void SetBinarySetting1(const TBool& aValue);
	// ]]] end generated region [Generated Accessors]
	
	// [[[ begin generated region: do not modify [Generated Members]
protected:
	TInt iEnumeratedTextPopup2;
	TInt iEnumeratedTextPopup1;
	TInt iEnumeratedTextPopup3;
	TBool iBinarySetting1;
	// ]]] end generated region [Generated Members]
	
	};
#endif // ANTSNESSETTINGITEMLISTSETTINGS_H
