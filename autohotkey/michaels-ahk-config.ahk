
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance, force
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;; ----------------------------------------------------------
;;                     GENERAL BINDS
;; ----------------------------------------------------------
;; Capslock to Control
CapsLock::Ctrl

    #IfWinActive ahk_class Emacs
    ;; Right control to Ctrl + Shift
    *RCtrl::
    SetKeyDelay -1
    Send {Blind}{Ctrl DownTemp}{Shift DownTemp}
    return

    *RCtrl up::
    SetKeyDelay -1
    Send {Blind}{Ctrl Up}{Shift Up}
    return

    ;; Right shift to control M
    RShift::Send {Alt Down}{m}{Alt Up}

#IfWinActive

;; You can use ctrl+v to paste like normal and insert to paste without new lines
Ins::
	clipBak		:= ClipboardAll
	Clipboard	:= RegExReplace(Clipboard, "\s*(\n|\r\n)", A_Space)
	Send, ^v
return


; XButton2::Send {Ctrl Down}{WheelUp}{Ctrl Up}

;; ----------------------------------------------------------
;;                     APPLICATION SHORTCUTS
;; ----------------------------------------------------------

;; Windows key F1 Start rstudio
#F1:: Run "C:\Program Files\RStudio\bin\rstudio.exe"

;; Run visual studio code in current windows explorer directory
#If WinActive("ahk_class CabinetWClass") ; explorer

    #F2::
    WinGetTitle, ActiveTitle, A
    If InStr(ActiveTitle, "\")  ; If the full path is displayed in the title bar (Folder Options)
        Fullpath := ActiveTitle
    else
    If InStr(ActiveTitle, ":") ; If the title displayed is something like "DriveName (C:)"
    {
        Fullpath := SubStr(ActiveTitle, -2)
        Fullpath := SubStr(Fullpath, 1, -1)
    }
    else    ; If the full path is NOT displayed in the title bar 
    ; https://autohotkey.com/boards/viewtopic.php?p=28751#p28751
    for window in ComObjCreate("Shell.Application").Windows
    {
        try Fullpath := window.Document.Folder.Self.Path
        SplitPath, Fullpath, title
        If (title = ActiveTitle)
            break
    }
    Run cmd /k code "%Fullpath%" && exit
    return 

#If

; #F3:: Run, "C:\Program Files (x86)\Microsoft Office\Office16\OUTLOOK.EXE" /select outlook:calendar

#F8:: Run, "C:\Users\278330A\AppData\Local\Microsoft\Teams\Update.exe"  --processStart "Teams.exe"

;; Start firefox or default browser
#F5:: Run http://www.google.com

;; ----------------------------------------------------------
;;                     HOTSTRING INSERTS
;; ----------------------------------------------------------

:*:dt|::
FormatTime, CurrentDateTime,, yyyy-MM-dd HH:mm
SendInput %CurrentDateTime%
return

:*:em|::
SendInput michaelwilson1991@gmail.com
return

:*:.---::
SendInput {Asc 0151}
return

;; ----------------------------------------------------------
;;                     RSTUDIO CONFIG
;; ----------------------------------------------------------

;; Get current selection and send to console and then call function on selection
SendPasteRgument(argument) {
    Send, ^c
    ClipWait 
    Send, ^2
    clipboard = %clipboard%
    command = %argument%(%clipboard%)
    Send, %command%
}


SendRgument(argument) {
    clipboard = %clipboard%
    command = %argument%(%clipboard%)
    Send, %command%
}

SendMatrixNames() {
    clipboard = %clipboard%
    command = as.matrix(names(%clipboard%))
    Send, %command%
}

SendPasteMatrixNames() {
    Send, ^c
    ClipWait 
    Send, ^2
    clipboard = %clipboard%
    command = as.matrix(names(%clipboard%))
    Send, %command%
}

SendRmdPrint() {
    clipboard = %clipboard%
    command = ``r rmdprint(%clipboard%)``
    Send, %command%
}


#IfWinActive ahk_exe rstudio.exe
^F1::SendRgument("summary")
^+F1::SendPasteRgument("summary")

^F2::SendRgument("View")
^+F2::SendPasteRgument("View")

^F3::SendMatrixNames()
^+F3::SendPasteMatrixNames()

^F4::SendRmdPrint()
#IfWinActive
