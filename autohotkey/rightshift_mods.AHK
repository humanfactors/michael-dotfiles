
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance, force

*RCtrl::
  SetKeyDelay -1
  Send {Blind}{Ctrl DownTemp}{Shift DownTemp}
return

*RCtrl up::
  SetKeyDelay -1
  Send {Blind}{Ctrl Up}{Shift Up}
return

RShift::Send {Alt Down}{m}{Alt Up}