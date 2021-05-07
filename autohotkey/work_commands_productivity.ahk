#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%
SetTitleMatchMode,1

#Pause::
    If Not WinExist("SnapTimer")
        Run, "C:\bin\SnapTimer.exe"
    Else
        WinActivate, SnapTimer
Return