#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance, force
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;; ----------------------------------------------------------
;;                     GENERAL BINDS
;; ----------------------------------------------------------

$CapsLock::Ctrl
$LShift::Shift

;; Make sure we can turn this off if needed
$#CapsLock::
    SetCapsLockState, AlwaysOff
Return


;; ^XButton1::#Left
;; ^XButton2::#Right

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
    RShift::Send {Ctrl Down}{`\}{Ctrl Up}

#IfWinActive

;; You can use ctrl+v to paste like normal and insert to paste without new lines
Ins::
	clipBak		:= ClipboardAll
	Clipboard	:= RegExReplace(Clipboard, "\s*(\n|\r\n)", A_Space)
	Send, ^v
return



CurtinURLPapers() {
    REDIRECT_BASE := "https://link.library.curtin.edu.au/gw?url=&url="
    URL_snippet := clipboard
	clippy	:= REDIRECT_BASE . URL_snippet
	SendInput, %clippy%
}

^F12::CurtinURLPapers()



; XButton2::Send {Ctrl Down}{WheelUp}{Ctrl Up}

;; ----------------------------------------------------------
;;                     APPLICATION SHORTCUTS
;; ----------------------------------------------------------

;; Windows key F1 Start rstudio
; #F1:: Run "C:\Program Files\RStudio\bin\rstudio.exe"

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
    Run, cmd /k code "%Fullpath%" && exit
    return 

#If

; #F3:: Run, "C:\Program Files (x86)\Microsoft Office\Office16\OUTLOOK.EXE" /select outlook:calendar
; #F5:: Run, cmd /k code "C:\Users\278330A\Dropbox\Code\AHK\michaels-ahk-config.ahk |"
; #F8:: Run, "C:\Users\278330A\AppData\Local\Microsoft\Teams\Update.exe"  --processStart "Teams.exe"

;; Start firefox or default browser
; #F5:: Run http://www.google.com

;; ----------------------------------------------------------
;;                     HOTSTRING INSERTS
;; ----------------------------------------------------------

:*:dt|::
FormatTime, CurrentDateTime,, yyyy-MM-dd HH:mm
SendInput %CurrentDateTime%
return

:*:ff|::
SendInput 1926869023
return

:*:em|::
SendInput michaelwilson1991@gmail.com
return

:*:wem|::
SendInput michael.d.wilson@curtin.edu.au
return

:*:mdw|::
SendInput Michael David Wilson
return

:*:045|::
SendInput 0452075551
return

:*:sn|::
SendInput 278330A
return

; :*:.--::
; Send {U+2013}
; return

:*:.---::
Send {U+2014}
return

:*:.!=::
Send {U+2260}
return

:*:.~=::
Send {U+2248}
return

:*:.T.::
Send {U+2234}
return

:*:.B.::
Send {U+2235}
return

:*:.E.::
Send {U+2208}
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


changeDialDir(path) {

    WinGet, hWnd, ID, A ;Get handle of active window
    #IfWinActive ahk_class #32770 ; Check if active window a save as thing
        
     Send ^l
     ControlSetText, Edit2, %path%, ahk_id %hWnd%
     ControlSend, Edit2, {Enter}, ahk_id %hWnd%

    
    #IfWinActive
}

;; Set conditional keybinds
#IfWinActive ahk_class #32770
    >+c::changeDialDir("C:\")
    >+d::changeDialDir("C:\Users\278330A\Downloads")
    >+l::changeDialDir("C:\LibraryImports")
    >+o::changeDialDir(A_MyDocuments)
    >+h::changeDialDir("C:\Users\278330A\")
    >+b::changeDialDir("C:\Users\278330A\Dropbox\Library")
#IfWinActive



WinPathFix() {
    StringReplace,clipboard,clipboard,\,/,All
    send %clipboard%
}

WinPathFix2() {
    StringReplace,clipboard,clipboard,/,\,All
    send %clipboard%
}



^Insert::WinPathFix() ;replaces backslashes with forward slashes in a file name that is stored on the clipboard
^!Insert::WinPathFix2() ;replaces backslashes with forward slashes in a file name that is stored on the clipboard

