#include "tracer.h"
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
#include <avkon.hrh>
#include <aknmessagequerydialog.h>
#include <aknnotewrappers.h>
#include <stringloader.h>
#include <f32file.h>
#include <s32file.h>
#include <hlplch.h>
#include <aknwaitdialog.h> 
#include <aknappui.h>
//Dialogs
#include <AknCommonDialogs.h> // For single function calls
#include <CAknFileSelectionDialog.h>

#include <AntSnes.rsg>

//#include "AntSnes.hlp.hrh"
#include "AntSnes.hrh"
#include "AntSnes.pan"
#include "AntSnesApplication.h"
#include "AntSnesAppUi.h"
#include "AntSnesContainer.h"
#include "AntSnesController.h"
#include "AntKeyDialog.h"
#include "tracer.h"

#include "symb_debug.h"
namespace
{
_LIT( KFileName, "C:\\private\\E5712A80\\AntSnes.txt" );
#define KFILEPATHLENGHT 100
#define KAntSnesSettingsVersion 8 //the settings version
const TUid KAntSettings={0xE5712A80};

};

// ============================ MEMBER FUNCTIONS ===============================


// -----------------------------------------------------------------------------
// CAntSnesAppUi::ConstructL()
// Symbian 2nd phase constructor can leave.
// -----------------------------------------------------------------------------
//
void CAntSnesAppUi::ConstructL()
	{
    TRACER("void CAntSnesAppUi::ConstructL()")
	CDictionaryStore* prefs = Application()->OpenIniFileLC(CCoeEnv::Static()->FsSession()); 
	InternalizeL(*prefs);
	CleanupStack::PopAndDestroy();//close prefs
#ifdef __S60_50__
	BaseConstructL( EAknEnableSkin | EAppOrientationLandscape);
#else
    if( iSettings.iScreenMode == EPortrait)
    	{
    	BaseConstructL(EAknEnableSkin | EAppOrientationPortrait);
    	                    	
    	}
    else if( iSettings.iScreenMode == ELandscape)
    	{
    	BaseConstructL( EAknEnableSkin | EAppOrientationLandscape);
    	}
    else if( iSettings.iScreenMode == ENGage)
    	{
    	BaseConstructL( EAknEnableSkin | EAppOrientationLandscape);
    	}
#endif
#ifdef __S60_50__
    //5th edition resosulution is 640 × 360, leveave 128 x and 128 for each control
    TRect subrect( 128,0, 512,360);
    TRect subrect2( 512,0,640,360);
    TRect subrect3(0,0,128,360);
    iAppContainer = new (ELeave) CAntSnesContainer;
    iAppContainer->ConstructL( subrect, iSettings );
    AddToStackL( iAppContainer );
    
    iLeftButtonControl = new (ELeave) CLeftButtonControl();
    AddToStackL( iLeftButtonControl );
    iLeftButtonControl->ConstructL( subrect3, iAppContainer->GetEngine(), this ); //uncomment, for game
        
    iRightButtonControl = new (ELeave) CRightButtonControl();
    AddToStackL( iRightButtonControl );
    iRightButtonControl->ConstructL( subrect2, iAppContainer->GetEngine() ); 
#else
    iAppContainer = new (ELeave) CAntSnesContainer;
    iAppContainer->ConstructL( ApplicationRect(), iSettings );
    AddToStackL( iAppContainer );
#endif
    //set generated itemlist
#ifndef __S60_50__
    iItemList = TAntSnesSettingItemListSettings::NewL();
    iItemList->SetEnumeratedTextPopup1(iSettings.iScreenMode);
    iItemList->SetEnumeratedTextPopup2(iSettings.iRenderer); 
    iItemList->SetEnumeratedTextPopup3( iSettings.iFrameSkip );
    iItemList->SetBinarySetting1( iSettings.iShowFPS );
#endif
    //Set Audio
    iAudioList = TAntSnesAudioItemListSettings::NewL();
    iAudioList->SetBinarySetting1( iSettings.iAudioOn );
    iAudioList->SetBinarySetting2( iSettings.iStereo );
    iAudioList->SetEnumeratedTextPopup1( iSettings.iSampleRate );
    iAudioList->SetBinarySetting3( iSettings.iEnableSpeedHack );
    iAudioList->SetVolumeSetting1( iSettings.iVolume );
    
    iResetRequired = EFalse;
    // Start in  fullscreen because of problem issue in 3.0 openGL 
    iFullScreen = 1;
	
    // series60 blocks simultaneous key presses by default
    // this game uses throttle and steering keys at the same time
    // and this line makes it possible
    SetKeyBlockMode( ENoKeyBlock );

    //Display menubar
#ifndef __S60_50__
    CEikonEnv::Static()->AppUiFactory()->MenuBar()->TryDisplayMenuBarL();
#endif
	}
// -----------------------------------------------------------------------------
// CAntSnesAppUi::CAntSnesAppUi()
// C++ default constructor can NOT contain any code, that might leave.
// -----------------------------------------------------------------------------
//
CAntSnesAppUi::CAntSnesAppUi()
	{
    TRACER("CAntSnesAppUi::CAntSnesAppUi()")
	// No implementation required
	}

// -----------------------------------------------------------------------------
// CAntSnesAppUi::~CAntSnesAppUi()
// Destructor.
// -----------------------------------------------------------------------------
//
CAntSnesAppUi::~CAntSnesAppUi()
	{
    TRACER("CAntSnesAppUi::~CAntSnesAppUi()")
	if ( iAppContainer )
		{
		RemoveFromStack( iAppContainer );
		delete iAppContainer;
		}
#ifndef __S60_50__
	if ( iSettingsList )
		{
		RemoveFromStack( iSettingsList );
		delete iSettingsList;
		delete iItemList;
		}
#endif
	if( iAudioItemList )
		{
		RemoveFromStack( iAudioItemList );
		delete iAudioItemList;
		delete iAudioList;
		}
	
	delete iSettings.iROMPath;
	}

void CAntSnesAppUi::ShowMenu()
	{/*
	iAppContainer->LoadROM( _L("E:\\snes\\smw.smc") );
        	iRomLoaded = ETrue;
	iAppContainer->Start();*/
	CEikonEnv::Static()->AppUiFactory()->MenuBar()->TryDisplayMenuBarL();
	}
// -----------------------------------------------------------------------------
// CAntSnesAppUi::HandleCommandL()
// Takes care of command handling.
// -----------------------------------------------------------------------------
//
void CAntSnesAppUi::HandleCommandL(TInt aCommand)
	{
    TRACER("void CAntSnesAppUi::HandleCommandL(TInt aCommand)")
	iMenuOpen = EFalse;
    TBool answer;
    CAknQueryDialog* dlg;
    HBufC* textResource;
    CEikonEnv::Static()->AppUiFactory()->MenuBar()->StopDisplayingMenuBar();
	switch (aCommand)
		{	
		case EContinueGame:
			DismissSettings();
			iAppContainer->UpdateRunTimeSettings( iSettings );
			break;
		case ELoadRom:
			{
			DismissSettings();
			HBufC* buf = HBufC::NewLC(KFILEPATHLENGHT);
			TPtr ptr = buf->Des();
			TBool selected;
			//Commented this since some 3.x phones will get bugs in the settins, if it's used
			/*
			if( iSettings.iROMPath )
				selected = AknCommonDialogs::RunSelectDlgLD(ptr, iSettings.iROMPath->Des(), R_MEMORY_SELECTION_DIALOG, R_LOAD_ROM_DIALOG);
			else*/
				selected = AknCommonDialogs::RunSelectDlgLD(ptr, R_MEMORY_SELECTION_DIALOG, R_LOAD_ROM_DIALOG);
	        if( selected )
	        	{
	        	//save the path
	        	if( iSettings.iROMPath )
	        		{
	        		delete iSettings.iROMPath;
	        		iSettings.iROMPath = NULL;
	        		}
	        	TParse parse;
	        	parse.Set(*buf, NULL, NULL); 
	        	iSettings.iROMPathLenght = parse.DriveAndPath().Length();
	        	iSettings.iROMPath = HBufC::NewL(iSettings.iROMPathLenght);
	        	TPtr romPtr = iSettings.iROMPath->Des();
	        	romPtr.Copy( parse.DriveAndPath() );
	        	
	        	//Load ROM
	        	iAppContainer->LoadROM( ptr );
	        	iRomLoaded = ETrue;
	        	}
	        CleanupStack::PopAndDestroy(buf);
			}
			break;
		case ESaveState1:
		case ESaveState2:
		case ESaveState3:
		case ESaveState4:
		case ESaveState5:
			{
			TInt state = ESaveState5 - aCommand;
			iAppContainer->SaveStateL( state );
			}
			break;
			
		case ELoadState1:
		case ELoadState2:
		case ELoadState3:
		case ELoadState4:
		case ELoadState5:
			{
			TInt state = ELoadState5 - aCommand;
			iAppContainer->LoadStateL( state );
			}
			break;
		case EResetGame:
			{
			iAppContainer->ResetGame();
			}
			break;
#ifndef __S60_50__
		case EVideoSettings:
			{
			//run settings dialog
			RemoveFromStack(iAppContainer);
			DismissSettings();
		    iSettingsList = new (ELeave) CAntSnesSettingItemList( *iItemList, this );
		    iSettingsList->SetMopParent( this );
			iSettingsList->ConstructFromResourceL( R_ANT_SNES_SETTING_ITEM_LIST_ANT_SNES_SETTING_ITEM_LIST_2 );
			iSettingsList->ActivateL();
			iSettingsList->LoadSettingValuesL();
			iSettingsList->LoadSettingsL();
			AddToStackL( iSettingsList );
			}
			break;
#endif
		case EAudioSettings:
			//run settings dialog
			RemoveFromStack(iAppContainer);
			DismissSettings();
			iAudioItemList = new (ELeave) CAntSnesAudioItemList( *iAudioList, this );
			iAudioItemList->SetMopParent( this );
			iAudioItemList->ConstructFromResourceL( R_ANT_SNES_AUDIO_ITEM_LIST_ANT_SNES_AUDIO_ITEM_LIST );
			iAudioItemList->ActivateL();
			iAudioItemList->LoadSettingValuesL();
			iAudioItemList->LoadSettingsL();
			AddToStackL( iAudioItemList );
			break;
		case ESetDefaultSettings:
		    dlg = CAknQueryDialog::NewL();
		   textResource = StringLoader::LoadLC(R_SET_DEFAULT_SETTINS);
		   answer = dlg->ExecuteLD( R_CONFIRMATION_QUERY, *textResource );
		   CleanupStack::PopAndDestroy();
			if( answer )
				{
				SetDefaultSettings();
				CDictionaryStore* prefs = Application()->OpenIniFileLC(iEikonEnv->FsSession());
				ExternalizeL(*prefs);
				prefs->CommitL();
				CleanupStack::PopAndDestroy();//close prefs
				CAknInformationNote* informationNote;
				informationNote = new ( ELeave ) CAknInformationNote;
				textResource = StringLoader::LoadLC(R_SET_DEFAULT_SETTINS_SET);
				informationNote->ExecuteLD( *textResource );
				CleanupStack::PopAndDestroy();
				}
			break;
		case EAntSnesKeyConfig:
			{
			//run keyconfig
			DEBUGPRINT(_L("StartKeyConfig"));
			StartKeyConfigL();	
		    //Save Settings
			DEBUGPRINT(_L("Save settings"));
		    SaveSettingsL( EFalse ); //no restart required
		    //update keyconfig
		    DEBUGPRINT(_L("UpdateRuntime"));
		    iAppContainer->UpdateRunTimeSettings( iSettings );
		    DEBUGPRINT(_L("Done"));
			}
			break;
		case ESettingsSaved:
			{
			TBool screenChanged = EFalse;
#ifndef __S60_50__
			TScreenMode screenmode = (TScreenMode) iItemList->EnumeratedTextPopup1();
			TScreenRenderer renderer =  (TScreenRenderer) iItemList->EnumeratedTextPopup2();
			if( iSettings.iScreenMode != screenmode )
				{
				screenChanged = ETrue;
				iSettings.iScreenMode = screenmode;
			    if( iSettings.iScreenMode == EPortrait)
			    	{
			    	SetOrientationL(CAknAppUiBase::EAppUiOrientationPortrait);
			    	                    	
			    	}
			    else if( iSettings.iScreenMode == ELandscape)
			    	{
			    	SetOrientationL(CAknAppUiBase::EAppUiOrientationLandscape);
			    	}
			    else if( iSettings.iScreenMode == ENGage)
			    	{
			    	SetOrientationL(CAknAppUiBase::EAppUiOrientationLandscape);
			    	}
				}
			if( iSettings.iRenderer != renderer )
				{
				screenChanged = ETrue;
				iSettings.iRenderer = renderer;
				}
#endif
			SaveSettingsL( ETrue );
			
			if( screenChanged )
				{
				//modify settings
				iAppContainer->UpdateRunTimeSettings( iSettings );
				iAppContainer->UpdateRenderer( iSettings.iRenderer, iSettings.iScreenMode, ApplicationRect().Size() );
				}
			}
			break;
		case EAudioSettingsSaved:
			
		    iSettings.iAudioOn = iAudioList->BinarySetting1();
		    iSettings.iEnableSpeedHack = iAudioList->BinarySetting3();
		    iSettings.iSampleRate = iAudioList->EnumeratedTextPopup1();
		    iSettings.iStereo =  iAudioList->BinarySetting2();
		    iSettings.iVolume = iAudioList->VolumeSetting1();
		    iAppContainer->UpdateAudioSettings( iSettings.iAudioOn, iSettings.iEnableSpeedHack, iSettings.iSampleRate, iSettings.iStereo, iSettings.iVolume );
		    
			SaveSettingsL( EFalse );
			break;
		case EAbout:
			{

			CAknMessageQueryDialog* dlg = new (ELeave) CAknMessageQueryDialog();
			dlg->PrepareLC(R_ABOUT_QUERY_DIALOG);
			HBufC* title = iEikonEnv->AllocReadResourceLC(R_ABOUT_DIALOG_TITLE);
			dlg->QueryHeading()->SetTextL(*title);
			CleanupStack::PopAndDestroy(); //title
			HBufC* msg = iEikonEnv->AllocReadResourceLC(R_ABOUT_DIALOG_TEXT);
			dlg->SetMessageTextL(*msg);
			CleanupStack::PopAndDestroy(); //msg
			dlg->RunLD();
			}
			break;
		case EAknSoftkeyExit:
		case EEikCmdExit:
			{
			DismissSettings();
			if( iResetRequired )
				{
				HBufC* textResource = StringLoader::LoadLC(R_RESTART_REQUIRED_NOTE);
				CAknNoteDialog* dialog = new (ELeave) CAknNoteDialog(CAknNoteDialog::ENoTone,CAknNoteDialog::ENoTimeout);
				dialog->SetTextL( *textResource );
				CleanupStack::PopAndDestroy(textResource); //text
				TInt key = dialog->ExecuteDlgLD( R_INFORM_USER );
				}
			SaveSettingsL( 0 );
			Exit();
			break;
			}		
		case EFrameskipAuto:
		case EFrameskip1:
		case EFrameskip2:
		case EFrameskip3:
		case EFrameskip4:
		case EFrameskip5:
		case EFrameskip6:
		case EFrameskip7:
			{
			TInt command = EFrameskip7 - aCommand;
			iSettings.iFrameSkip = 7 - command;
			SaveSettingsL( 0 );
			iAppContainer->UpdateRunTimeSettings( iSettings );
			}
		case EAknSoftkeyDone:
			//do nothing in here
			break;
		default:
			break;
		}
	iAppContainer->Start();
	}

TKeyResponse CAntSnesAppUi::HandleKeyEventL(const TKeyEvent& aKeyEvent,TEventCode aType)
	{
    TRACER("TKeyResponse CAntSnesAppUi::HandleKeyEventL(const TKeyEvent& aKeyEvent,TEventCode aType)")
	if( aKeyEvent.iScanCode == EStdKeyDevice1 && iMenuOpen )
		{
		//The menu is cancelled, continue emulation
		iAppContainer->Start();
		iMenuOpen = EFalse;
		}
	return EKeyWasNotConsumed;
	}

void CAntSnesAppUi::DynInitMenuPaneL( TInt aResourceId, CEikMenuPane* aMenuPane )
    {
    TRACER("void CAntSnesAppUi::DynInitMenuPaneL(TInt aResourceId, CEikMenuPane* aMenuPane)")
    if( aResourceId == R_MENU )
    	{
    	iAppContainer->Pause();
    	iMenuOpen = ETrue;
        if( iRomLoaded )
        	aMenuPane->SetItemDimmed(EContinueGame, EFalse);
        else
        	aMenuPane->SetItemDimmed(EContinueGame, ETrue);
    	}
    }


CArrayFix<TCoeHelpContext>* CAntSnesAppUi::HelpContextL() const
	{
    TRACER("CAntSnesAppUi::HelpContextL()")
#warning "Please see comment about help and UID3..."
	// Note: Help will not work if the application uid3 is not in the
	// protected range.  The default uid3 range for projects created
	// from this template (0xE0000000 - 0xEFFFFFFF) are not in the protected range so that they
	// can be self signed and installed on the device during testing.
	// Once you get your official uid3 from Symbian Ltd. and find/replace
	// all occurrences of uid3 in your project, the context help will
	// work. Alternatively, a patch now exists for the versions of 
	// HTML help compiler in SDKs and can be found here along with an FAQ:
	// http://www3.symbian.com/faq.nsf/AllByDate/E9DF3257FD565A658025733900805EA2?OpenDocument

	/*
	CArrayFixFlat<TCoeHelpContext>* array = new (ELeave) CArrayFixFlat<
			TCoeHelpContext> (1);
	CleanupStack::PushL(array);
	array->AppendL(TCoeHelpContext(KUidAntSnesApp, KGeneral_Information));
	CleanupStack::Pop(array);
	return array;*/
	}

void CAntSnesAppUi::SaveSettingsL( TBool aRestartRequired )
{
    TRACER("void CAntSnesAppUi::SaveSettingsL(TBool aRestartRequired)")
	//save settings 
#ifndef __S60_50__
	iSettings.iScreenMode = (TScreenMode) iItemList->EnumeratedTextPopup1();
	iSettings.iRenderer = (TScreenRenderer) iItemList->EnumeratedTextPopup2();
	iSettings.iFrameSkip = iItemList->EnumeratedTextPopup3();
	iSettings.iShowFPS = iItemList->BinarySetting1();
#endif
    iSettings.iAudioOn = iAudioList->BinarySetting1();
    iSettings.iEnableSpeedHack = iAudioList->BinarySetting3();
    iSettings.iSampleRate = iAudioList->EnumeratedTextPopup1();
    iSettings.iStereo = iAudioList->BinarySetting2();
    iSettings.iVolume = iAudioList->VolumeSetting1();
    
	CDictionaryStore* prefs = Application()->OpenIniFileLC(iEikonEnv->FsSession());
	ExternalizeL(*prefs);
	prefs->CommitL();
	CleanupStack::PopAndDestroy();//close prefs
	if( !iResetRequired )
		{
		iResetRequired = aRestartRequired;
		}
}


void CAntSnesAppUi::ExternalizeL(CDictionaryStore& aStore) 
{
    TRACER("void CAntSnesAppUi::ExternalizeL(CDictionaryStore& aStore)")	
	RDictionaryWriteStream writeStream;
	writeStream.AssignLC(aStore, KAntSettings);
	writeStream.WriteInt32L(iSettings.iVersion);
	for(TInt i=0;i<12;i++)
		{
		writeStream.WriteInt32L(iSettings.iScanKeyTable[i]);
		}
	
	writeStream.WriteInt32L(iSettings.iScreenMode);
	writeStream.WriteInt32L( iSettings.iRenderer );
	
	writeStream.WriteInt32L(iSettings.iROMPathLenght);
	if( iSettings.iROMPathLenght )
		writeStream.WriteL(*iSettings.iROMPath);
	writeStream.WriteInt32L(iSettings.iShowFPS);
	writeStream.WriteInt32L(iSettings.iFrameSkip);
	writeStream.WriteInt32L( iSettings.iAudioOn );
	writeStream.WriteInt32L( iSettings.iEnableSpeedHack );
	writeStream.WriteInt32L( iSettings.iSampleRate );
	writeStream.WriteInt32L( iSettings.iStereo );
	writeStream.WriteInt32L( iSettings.iVolume );
    
	writeStream.CommitL();
	
	
	CleanupStack::PopAndDestroy();//writeStream
}

void CAntSnesAppUi::InternalizeL(const CDictionaryStore& aStore)
{
    TRACER("void CAntSnesAppUi::InternalizeL(const CDictionaryStore& aStore)")
	if (!aStore.IsPresentL(KAntSettings))
		{
		SetDefaultSettings();
        return;
		}
	RDictionaryReadStream	readStream;
	readStream.OpenLC(aStore, KAntSettings);
	
	iSettings.iVersion = readStream.ReadInt32L();
	if( iSettings.iVersion != KAntSnesSettingsVersion )
		{
		//it was old version, use defaults intead
		SetDefaultSettings();
		CleanupStack::PopAndDestroy(); //readstream
		return;
		}
	
	for(TInt i=0;i<12;i++)
	{
	iSettings.iScanKeyTable[i] = readStream.ReadInt32L();
	}
	
	iSettings.iScreenMode = (TScreenMode) readStream.ReadInt32L();
	iSettings.iRenderer = (TScreenRenderer) readStream.ReadInt32L();
    
	iSettings.iROMPathLenght = readStream.ReadInt32L();
	if( iSettings.iROMPathLenght )
		{
		iSettings.iROMPath = HBufC::NewL(iSettings.iROMPathLenght);
		TPtr romPtr = iSettings.iROMPath->Des();
		readStream.ReadL(romPtr,iSettings.iROMPathLenght);
		}
	
	iSettings.iShowFPS = (TBool) readStream.ReadInt32L();
	iSettings.iFrameSkip = readStream.ReadInt32L();
    iSettings.iAudioOn = (TBool) readStream.ReadInt32L();
    iSettings.iEnableSpeedHack = (TBool) readStream.ReadInt32L();
    iSettings.iSampleRate = readStream.ReadInt32L();
    iSettings.iStereo = (TBool) readStream.ReadInt32L();
    iSettings.iVolume = readStream.ReadInt32L();
    
	CleanupStack::PopAndDestroy(); //readstream
}

void CAntSnesAppUi::SetDefaultSettings()
	{
    TRACER("void CAntSnesAppUi::SetDefaultSettings()")
	//default settings
	iSettings.iScreenMode = EPortrait;
	iSettings.iRenderer = EDSA;
	iSettings.iVersion = KAntSnesSettingsVersion;
	iSettings.iScanKeyTable[0]= EStdKeyUpArrow;			
	iSettings.iScanKeyTable[1]= EStdKeyDownArrow;
	iSettings.iScanKeyTable[2]=EStdKeyLeftArrow;
	iSettings.iScanKeyTable[3]= EStdKeyRightArrow;
    iSettings.iScanKeyTable[4]= 49;
    iSettings.iScanKeyTable[5]= 50;
    iSettings.iScanKeyTable[6]= 51;
    iSettings.iScanKeyTable[7]= 52;
    iSettings.iScanKeyTable[8]= 0;
    iSettings.iScanKeyTable[9]= 0;
    iSettings.iScanKeyTable[10]= 0;
    iSettings.iScanKeyTable[11]= 0;
	
    iSettings.iROMPathLenght = 0;
    iSettings.iROMPath = NULL;
    iSettings.iFrameSkip = 0;
    iSettings.iShowFPS = EFalse;
    
    iSettings.iAudioOn = EFalse;
    iSettings.iEnableSpeedHack = ETrue;
    iSettings.iSampleRate = 8000;
    iSettings.iStereo = EFalse;
    iSettings.iVolume = 4;
	
	}

void CAntSnesAppUi::StartKeyConfigL()
	{
    TRACER("void CAntSnesAppUi::StartKeyConfigL()")
	HBufC* textResource = NULL;
	CAntKeyDialog* dialog = NULL;
	
	//UP
	textResource = StringLoader::LoadLC(R_PRESS_UP_BUTTON);
	dialog = new (ELeave) CAntKeyDialog(CAknNoteDialog::ENoTone,CAknNoteDialog::ENoTimeout);
	iSettings.iScanKeyTable[0] = dialog->RunKeyDialogLD( *textResource);
    CleanupStack::PopAndDestroy(textResource);		
	
	//DOWN
	textResource = StringLoader::LoadLC(R_PRESS_DOWN_BUTTON);
	dialog = new (ELeave) CAntKeyDialog(CAknNoteDialog::ENoTone,CAknNoteDialog::ENoTimeout);
	iSettings.iScanKeyTable[1] = dialog->RunKeyDialogLD( *textResource);
    CleanupStack::PopAndDestroy(textResource);	
	
	//LEFT
	textResource = StringLoader::LoadLC(R_PRESS_LEFT_BUTTON);
	dialog = new (ELeave) CAntKeyDialog(CAknNoteDialog::ENoTone,CAknNoteDialog::ENoTimeout);
	iSettings.iScanKeyTable[2] = dialog->RunKeyDialogLD( *textResource);
    CleanupStack::PopAndDestroy(textResource);	
	
	//RIGHT
	textResource = StringLoader::LoadLC(R_PRESS_RIGHT_BUTTON);
	dialog = new (ELeave) CAntKeyDialog(CAknNoteDialog::ENoTone,CAknNoteDialog::ENoTimeout);
	iSettings.iScanKeyTable[3] = dialog->RunKeyDialogLD( *textResource);
    CleanupStack::PopAndDestroy(textResource);	
	
	//A button
	textResource = StringLoader::LoadLC(R_PRESS_A_BUTTON);
	dialog = new (ELeave) CAntKeyDialog(CAknNoteDialog::ENoTone,CAknNoteDialog::ENoTimeout);
	iSettings.iScanKeyTable[4] = dialog->RunKeyDialogLD( *textResource);
    CleanupStack::PopAndDestroy(textResource);
    
    //X Button
	textResource = StringLoader::LoadLC(R_PRESS_X_BUTTON);
	dialog = new (ELeave) CAntKeyDialog(CAknNoteDialog::ENoTone,CAknNoteDialog::ENoTimeout);
	iSettings.iScanKeyTable[5] = dialog->RunKeyDialogLD( *textResource);
    CleanupStack::PopAndDestroy(textResource);
    
    //Y Button
	textResource = StringLoader::LoadLC(R_PRESS_Y_BUTTON);
	dialog = new (ELeave) CAntKeyDialog(CAknNoteDialog::ENoTone,CAknNoteDialog::ENoTimeout);
	iSettings.iScanKeyTable[6] = dialog->RunKeyDialogLD( *textResource);
    CleanupStack::PopAndDestroy(textResource);
    
    //B Button
	textResource = StringLoader::LoadLC(R_PRESS_B_BUTTON);
	dialog = new (ELeave) CAntKeyDialog(CAknNoteDialog::ENoTone,CAknNoteDialog::ENoTimeout);
	iSettings.iScanKeyTable[7] = dialog->RunKeyDialogLD( *textResource);
    CleanupStack::PopAndDestroy(textResource);
    
    //Start Button
	textResource = StringLoader::LoadLC(R_PRESS_START_BUTTON);
	dialog = new (ELeave) CAntKeyDialog(CAknNoteDialog::ENoTone,CAknNoteDialog::ENoTimeout);
	iSettings.iScanKeyTable[8] = dialog->RunKeyDialogLD( *textResource);
    CleanupStack::PopAndDestroy(textResource);
    
    //Select Button
	textResource = StringLoader::LoadLC(R_PRESS_SELECT_BUTTON);
	dialog = new (ELeave) CAntKeyDialog(CAknNoteDialog::ENoTone,CAknNoteDialog::ENoTimeout);
	iSettings.iScanKeyTable[9] = dialog->RunKeyDialogLD( *textResource);
    CleanupStack::PopAndDestroy(textResource);
    
    //TL Button
	textResource = StringLoader::LoadLC(R_PRESS_TL_BUTTON);
	dialog = new (ELeave) CAntKeyDialog(CAknNoteDialog::ENoTone,CAknNoteDialog::ENoTimeout);
	iSettings.iScanKeyTable[10] = dialog->RunKeyDialogLD( *textResource);
    CleanupStack::PopAndDestroy(textResource);
    
    //TR Button
	textResource = StringLoader::LoadLC(R_PRESS_TR_BUTTON);
	dialog = new (ELeave) CAntKeyDialog(CAknNoteDialog::ENoTone,CAknNoteDialog::ENoTimeout);
	iSettings.iScanKeyTable[11] = dialog->RunKeyDialogLD( *textResource);
    CleanupStack::PopAndDestroy(textResource);
    
	}

void CAntSnesAppUi::DismissSettings()
	{
    TRACER("void CAntSnesAppUi::DismissSettings()")
#ifndef __S60_50__
    if( iSettingsList )
		{
		RemoveFromStack(iSettingsList);
		delete iSettingsList;
		iSettingsList = NULL;
		}
#endif
	if( iAudioItemList )
		{
		RemoveFromStack( iAudioItemList );
		delete iAudioItemList;
		iAudioItemList = NULL;
		}
	
	}
// End of File
