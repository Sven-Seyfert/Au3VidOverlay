Global $aGui[$iEnumVariables]
       $aGui[$eHandle]         = ''
       $aGui[$eWidth]          = @DesktopWidth
       $aGui[$eHeight]         = @DesktopHeight
       $aGui[$eXPosition]      = 0
       $aGui[$eYPosition]      = 0

Global $aTransparency[$iEnumVariables]
       $aTransparency[$eMax]   = 255
       $aTransparency[$eMin]   = 25
       $aTransparency[$eStep]  = 15
       $aTransparency[$eValue] = 45

Global $sFileHtml              = _getUniqueString() & '.html'
Global $sUrl                   = 'http://vidoverlay.bplaced.net/' & $sFileHtml
Global $sVidId                 = 'VI4ssGtfdxw'

Global $aFtp[$iEnumVariables]
       $aFtp[$eRc4CryptKey]    = '<hereShouldBeYourCryptKey>'       ; adjust this
       $aFtp[$eFileLocal]      = $sFileHtml
       $aFtp[$eFileRemote]     = '/www/' & $sFileHtml
       $aFtp[$eServer]         = '0xC1C57D234AB7456FF0815'          ; adjust this (use your crypt key above to generate that RC4 key)
       $aFtp[$eUser]           = '0x2A55BAB72269DC22134'            ; adjust this (use your crypt key above to generate that RC4 key)
       $aFtp[$ePass]           = '0x0F99BCC1C57DAB72269DC221349'    ; adjust this (use your crypt key above to generate that RC4 key)

If $CmdLine[0] == 1 Then $sVidId = $CmdLine[1]

Global $sHtml = _
'<!DOCTYPE html>' & @CRLF & _
    '<html lang="en">' & @CRLF & _
    '<head>' & @CRLF & _
    '    <meta charset="UTF-8">' & @CRLF & _
    '    <meta name="viewport" content="width=device-width, initial-scale=1.0">' & @CRLF & _
    '    <meta http-equiv="X-UA-Compatible" content="ie=edge">' & @CRLF & _
    '    <title>VidOverlay</title>' & @CRLF & _
    '    <style>' & @CRLF & _
    '        * { margin: 0; overflow: hidden; padding: 0; }' & @CRLF & _
    '        iframe { height: ' & $aGui[$eHeight] & 'px; width: ' & $aGui[$eWidth] & 'px; }' & @CRLF & _
    '    </style>' & @CRLF & _
    '</head>' & @CRLF & _
    '<body>' & @CRLF & _
    '    <iframe src="https://www.youtube.com/embed/' & $sVidId & '?vq=hd720&autoplay=1&modestbranding=1&rel=0&autohide=0&showinfo=0&controls=1&playsinline=1&webkit-playsinline=1"' & @CRLF & _
    '    frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope;" allowfullscreen></iframe>' & @CRLF & _
    '</body>' & @CRLF & _
    '</html>'
