; compiler information for AutoIt
#pragma compile(CompanyName, © SOLVE SMART)
#pragma compile(FileVersion, 1.4.0)
#pragma compile(LegalCopyright, © Sven Seyfert)
#pragma compile(ProductName, Au3VidOverlay)
#pragma compile(ProductVersion, 1.4.0 - 2022-02-14)

#AutoIt3Wrapper_AU3Check_Stop_OnWarning=y
#AutoIt3Wrapper_Icon=..\media\favicon.ico
#AutoIt3Wrapper_Outfile_x64=..\build\Au3VidOverlay.exe
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_UseX64=y



; opt and just singleton -------------------------------------------------------
Opt('MustDeclareVars', 1)
Global $aInst = ProcessList('Au3VidOverlay.exe')
If $aInst[0][0] > 1 Then Exit



; includes ---------------------------------------------------------------------
#include-once
#include <GUIConstantsEx.au3>
#include <IE.au3>
#include <String.au3>
#include <WindowsConstants.au3>



; references -------------------------------------------------------------------
#include "Enum.au3"
#include "Declaration.au3"
#include "Init.au3"
#include "Gui.au3"
#include "Functions.au3"



; processing -------------------------------------------------------------------
_WriteFile($aFile[$eHtml], $sHtml)

Global $iReturnValue = _Upload($aFile[$eHtml])
If $iReturnValue == -1 Then _DisposeAndExit()

FileDelete($aFile[$eHtml])

Global $sDuration = _GetVidDuration($sVidId)
Global $iDuration = _GetVidDurationInSeconds($sDuration)

_LoadGuiAndPlayVideo()

Global $hTimer = TimerInit()
While Round(TimerDiff($hTimer) / 1000) < $iDuration + 2
    Sleep(250)
WEnd

_DisposeAndExit()
