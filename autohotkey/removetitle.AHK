#SingleInstance, force
#NoEnv

^#t::
WinGetTitle, currentWindow, A
IfWinExist %currentWindow%
{
	WinSet, Style, ^0xC00000 ; toggle title bar
}
return


; The hotkey is Control+Win+b. It applies changes to whatever window has focus.
^#b::
WinGetTitle, currentWindow, A
IfWinExist %currentWindow%
{
	WinSet, Style, ^0x840000 ; toggle thin line border / dialog frame 
}
return
