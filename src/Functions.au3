Func _getUniqueString()
    Local $sMachineGuid = RegRead( 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Cryptography', 'MachineGuid' )
    $sMachineGuid = StringReplace( $sMachineGuid, '-', '' )
    $sMachineGuid = StringTrimLeft( $sMachineGuid, 5 )
    $sMachineGuid = StringTrimRight( $sMachineGuid, 7 )
    Return StringLower( $sMachineGuid )
EndFunc

Func _writeFile( $sFile, $sText )
    Local $hFile = FileOpen( $sFile, 2 + 8 + 256 )
    FileWrite( $hFile, $sText )
    FileClose( $hFile )
EndFunc

Func _upload( $sFile )
    Return RunWait( '..\utilities\SecureUpload.exe "' & $aFtp[$eRc4CryptKey] & '" "' & $aFtp[$eFileLocal] & '" "' & $aFtp[$eFileRemote] & '" "' & $aFtp[$eServer] & '" "' & $aFtp[$eUser] & '" "' & $aFtp[$ePass] & '"' )
EndFunc

Func _getVidDuration( $sId )
    Local $sUrlContent = BinaryToString( InetRead( 'https://www.youtube.com/watch?v=' & $sId, 1 ) )
    Return StringReplace( StringRegExp( $sUrlContent, 'meta itemprop="duration" content="(.+?)"', 1 )[0], 'PT', '' )
EndFunc

Func _getVidDurationInSeconds( $sTime )
    Local $iHours = 0, $iMinutes = 0, $iSeconds = 0, $iTotalSeconds = 0

    If StringInStr( $sTime, 'H' ) Then
        $iHours = _StringBetween( $sTime, '', 'H' )[0]
        $sTime  = StringReplace( $sTime, $iHours & 'H', '' )
        $iTotalSeconds += $iHours * 60 * 60
    EndIf

    If StringInStr( $sTime, 'M' ) Then
        $iMinutes = _StringBetween( $sTime, '', 'M' )[0]
        $sTime    = StringReplace( $sTime, $iMinutes & 'M', '' )
        $iTotalSeconds += $iMinutes * 60
    EndIf

    If StringInStr( $sTime, 'S' ) Then
        $iSeconds = _StringBetween( $sTime, '', 'S' )[0]
        $sTime    = StringReplace( $sTime, $iSeconds & 'S', '' )
        $iTotalSeconds += $iSeconds
    EndIf

    Return $iTotalSeconds
EndFunc

Func _setTransparency( $iValue )
    WinSetTrans( $aGui[$eHandle], '', $iValue )
    _setGuiTopMost( $iValue )
EndFunc

Func _setGuiTopMost( $iValue )
    If $iValue == $aTransparency[$eMax] Then
        WinSetOnTop( $aGui[$eHandle], '', 0 )
    Else
        WinSetOnTop( $aGui[$eHandle], '', 1 )
    EndIf
EndFunc

Func _increaseVisibility()
    $aTransparency[$eValue]    += $aTransparency[$eStep]

    If $aTransparency[$eValue] >= $aTransparency[$eMax] Then
        $aTransparency[$eValue] = $aTransparency[$eMax]
    EndIf

    _setTransparency( $aTransparency[$eValue] )
EndFunc

Func _decreaseVisibility()
    $aTransparency[$eValue]    -= $aTransparency[$eStep]

    If $aTransparency[$eValue] <= $aTransparency[$eMin] Then
        $aTransparency[$eValue] = $aTransparency[$eMin]
    EndIf

    _setTransparency( $aTransparency[$eValue] )
EndFunc

Func _disposeAndExit()
    GUIDelete()
    FileDelete( $aFile[$eHtml] )
    Exit
EndFunc
