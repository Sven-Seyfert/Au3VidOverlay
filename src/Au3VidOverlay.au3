; compiler information for AutoIt
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=y
#AutoIt3Wrapper_Icon=..\media\favicon.ico
#AutoIt3Wrapper_Outfile_x64=..\build\Au3VidOverlay.exe
#AutoIt3Wrapper_Res_Description=Au3VidOverlay (2021-10-08)
#AutoIt3Wrapper_Res_Fileversion=1.0.0
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
_writeFile($aFile[$eHtml], $sHtml)

Global $iReturnValue = _upload($aFile[$eHtml])
If $iReturnValue == -1 Then _disposeAndExit()

FileDelete($aFile[$eHtml])

Global $sDuration = _getVidDuration($sVidId)
Global $iDuration = _getVidDurationInSeconds($sDuration)

_loadGuiAndPlayVideo()

Global $hTimer = TimerInit()
While Round(TimerDiff($hTimer) / 1000) < $iDuration + 2
    Sleep(250)
WEnd

_disposeAndExit()
