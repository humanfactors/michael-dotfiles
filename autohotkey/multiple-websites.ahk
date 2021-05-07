sites:="www.gmail.com|www.facebook.com|www.ahkscript.org"
Loop, parse, sites, |
{
If A_Index=1 && WinNotExist ahk_class MozillaWindowClass ; match this with  your default browser
   {
   Run %A_LoopField% ; if your browser is not open, this will open your browser and start on this page
   continue
   }
WinActivate, ahk_class MozillaWindowClass
Send ^t ; command for new tab
Sleep 300
Send ^l ; focuses on the address bar. Could use F6 as well in Firefox I believe.
Sleep 200
SendInput %A_LoopField%{Enter}
}
return
