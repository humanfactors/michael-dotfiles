#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, force

; Forces the use of the hook to implement all or some keyboard hotkeys.
#InstallKeybdHook
#UseHook On

^F11::Suspend, Toggle

^Volume_Down::Media_Prev
^Volume_Up::Media_Next

#XButton2::#^Right
#XButton1::#^Left
