/*
========================================================================
 Name        : AntSnesAudioItemListSettings.h
 Author      : 
 Copyright   : Your copyright notice
 Description : 
========================================================================
*/
#ifndef ANTSNESAUDIOITEMLISTSETTINGS_H
#define ANTSNESAUDIOITEMLISTSETTINGS_H
			
// [[[ begin generated region: do not modify [Generated Includes]
#include <e32std.h>
// ]]] end generated region [Generated Includes]

// [[[ begin generated region: do not modify [Generated Constants]
// ]]] end generated region [Generated Constants]

/**
 * @class	TAntSnesAudioItemListSettings AntSnesAudioItemListSettings.h
 */
class TAntSnesAudioItemListSettings
	{
public:
	// construct and destroy
	static TAntSnesAudioItemListSettings* NewL();
	void ConstructL();
		
private:
	// constructor
	TAntSnesAudioItemListSettings();
	// [[[ begin generated region: do not modify [Generated Accessors]
public:
	TBool& BinarySetting1();
	void SetBinarySetting1(const TBool& aValue);
	TInt& EnumeratedTextPopup1();
	void SetEnumeratedTextPopup1(const TInt& aValue);
	TBool& BinarySetting2();
	void SetBinarySetting2(const TBool& aValue);
	TInt& VolumeSetting1();
	void SetVolumeSetting1(const TInt& aValue);
	TBool& BinarySetting3();
	void SetBinarySetting3(const TBool& aValue);
	// ]]] end generated region [Generated Accessors]
	
	// [[[ begin generated region: do not modify [Generated Members]
protected:
	TBool iBinarySetting1;
	TInt iEnumeratedTextPopup1;
	TBool iBinarySetting2;
	TInt iVolumeSetting1;
	TBool iBinarySetting3;
	// ]]] end generated region [Generated Members]
	
	};
#endif // ANTSNESAUDIOITEMLISTSETTINGS_H
