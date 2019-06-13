
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance, force
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

File = %1%

MsgBox, %File%

run, "C:\Users\278330A\bin\emacs\bin\runemacs.exe" --find-file=%1% -q -l "~/.emacs.base/init.el" 