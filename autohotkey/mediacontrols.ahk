#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance, force
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


^Volume_Down::Media_Prev
^Volume_Up::Media_Next
^Volume_Mute::Media_Play_Pause
