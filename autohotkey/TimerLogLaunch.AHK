#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance, force
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

WinSet AlwaysOnTop, on, SnapTimer



TaskLog() {
    InputBox, taskid, What task are you about to work on?, What task are you about to work on?
    FormatTime, selDate,, yyyy-MM-dd HH:mm
    logtext = %taskid%|start|%selDate%
    return logtext
}


SnapTimer() {
    text := TaskLog()

    IfWinNotExist, SnapTimer
    {
        Run "C:\bin\SnapTimerPortable\SnapTimerPortable.exe"
    }

    FileAppend, %text%`n, .\log\worklog.csv
    
}

#F12::SnapTimer()