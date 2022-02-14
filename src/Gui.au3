Func _LoadGuiAndPlayVideo()
    $aGui[$eHandle] = GUICreate('Au3VidOverlay', $aGui[$eWidth], $aGui[$eHeight], $aGui[$eXPosition], $aGui[$eYPosition], $WS_POPUP, $WS_EX_TOPMOST + $WS_EX_TRANSPARENT)
    GUISetBkColor(0xFF000000, $aGui[$eHandle])

    Local $oIE = _IECreateEmbedded()
    GUICtrlCreateObj($oIE, 0, 0, $aGui[$eWidth], $aGui[$eHeight])
    _IENavigate($oIE, $sUrl, 0)

    WinSetTrans($aGui[$eHandle], '', $aTransparency[$eValue])
    WinSetOnTop($aGui[$eHandle], '', 1)
    GUISetState(@SW_SHOW, $aGui[$eHandle])

    Sleep(500)
    _IEAction($oIE, 'refresh')
EndFunc
