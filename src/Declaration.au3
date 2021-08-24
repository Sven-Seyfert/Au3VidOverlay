Global $iArgumentCount = $CmdLine[0]
If $iArgumentCount <> 1 Then
    MsgBox( 16, 'Error', _
        'Expected is one argument which is the RC4 crypt key.' & _
        @CRLF & _
        'Please call the program again with that expected value.', 60 )
    Exit -1
EndIf

Global $aFile[$iMaxEnumIndex]
       $aFile[$eHtml]          = _getUniqueString() & '.html'
       $aFile[$eConfig]        = '..\config\config.ini'

Global $sVidId                 = IniRead( $aFile[$eConfig], 'Youtube', 'VideoId', '' )
Global $sUrl                   = IniRead( $aFile[$eConfig], 'Video', 'VideoUrl', '' ) & $aFile[$eHtml]

Global $aFtp[$iMaxEnumIndex]
       $aFtp[$eFileLocal]      = $aFile[$eHtml]
       $aFtp[$eFileRemote]     = '/www/' & $aFile[$eHtml]
       $aFtp[$eRc4CryptKey]    = $CmdLine[1]
       $aFtp[$eServer]         = IniRead( $aFile[$eConfig], 'FtpServer', 'Server', '' )
       $aFtp[$eUser]           = IniRead( $aFile[$eConfig], 'FtpServer', 'User', '' )
       $aFtp[$ePass]           = IniRead( $aFile[$eConfig], 'FtpServer', 'Pass', '' )

Global $aGui[$iMaxEnumIndex]
       $aGui[$eHandle]         = ''
       $aGui[$eWidth]          = @DesktopWidth
       $aGui[$eHeight]         = @DesktopHeight
       $aGui[$eXPosition]      = 0
       $aGui[$eYPosition]      = 0

Global $aTransparency[$iMaxEnumIndex]
       $aTransparency[$eMax]   = 255
       $aTransparency[$eMin]   = 25
       $aTransparency[$eStep]  = 15
       $aTransparency[$eValue] = 45

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
