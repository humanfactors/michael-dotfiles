#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance, force
SendMode Input
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


CurtinURLPapers() {
    REDIRECT_BASE := "https://link.library.curtin.edu.au/gw?url=&url="
    URL_snippet := clipboard
	  clippy	:= REDIRECT_BASE . URL_snippet
	  SendInput, %clippy%
    return
}


^F12::CurtinURLPapers()