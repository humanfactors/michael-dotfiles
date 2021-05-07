#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance, force
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



changeDialDir(path) {

    WinGet, hWnd, ID, A ;Get handle of active window
    #IfWinActive ahk_class #32770 ; Check if active window a save as thing
        
     Send ^l
     ControlSetText, Edit2, %path%, ahk_id %hWnd%
     ControlSend, Edit2, {Enter}, ahk_id %hWnd%

    
    #IfWinActive
}

; Set conditional keybinds
#IfWinActive ahk_class #32770
    >+c::changeDialDir("C:\")
    >+d::changeDialDir("C:\Downloads")
    >+l::changeDialDir("C:\LibraryImports")
    >+o::changeDialDir(A_MyDocuments)
    >+h::changeDialDir("C:\Users\278330A\")
    >+b::changeDialDir("C:\Users\278330A\Dropbox\Library")
#IfWinActive

; #IfWinActive ahk_class #32770

;     Send ^l
;     ControlSetText, Edit2, %path%, ahk_id %hWnd%

;     ; Sleep, 1
;     ; ControlFocus, Edit1, ahk_id %hWnd%
;     ; ControlClick, Edit1, ahk_id %hWnd%

;     ;Navigate the the users desktop folder
;     ; ControlFocus, ToolbarWindow324, ahk_id %hWnd%
;     ; ControlClick, ToolbarWindow324, ahk_id %hWnd%,,,2, NA
;     ; ControlSetText, Edit2, `%HOMEPATH`%\Desktop\, ahk_id %hWnd%

;     ; ControlFocus , x, y,,, Edit3, ahk_class #32770
;     ; ControlFocus, ToolbarWindow323, ahk_class #32770
;     ; ControlClick, ToolbarWindow323, ahk_class #32770
    
; #IfWinActive                           ; End context sensitivity for CabinetWClass
; Return


Esc::ExitApp

; #IfWinActive ahk_class Notepad

;     ^Y::
;         explorer_path := "" ; empty variable
;         IfWinNotExist ahk_class CabinetWClass ; explorer
;             return  ; do nothing
;         ; otherwise:
;         ; https://autohotkey.com/boards/viewtopic.php?p=28751#p28751
;         ; get the path of the first explorer window:
;         for window in ComObjCreate("Shell.Application").Windows
;         {
;             try explorer_path := window.Document.Folder.Self.Path
;                     break
;         }
;         ; MsgBox, %explorer_path%
;         Send, ^s ; save the new document
;         ; wait for the Save As window and activate it
;         WinWait, Save As ahk_class #32770
;         WinActivate, Save As ahk_class #32770
;         WinWaitActive, Save As ahk_class #32770
;         ; open the folder "explorer_path" in Save As
;         SendInput, %explorer_path%
;         Sleep, 300
;         Send, {Enter}
;     return

; #IfWinActive


; #O::
; wClass = ahk_class #32770
; Loop {
;    ControlFocus ComboBox1, %wClass%
;    ControlGetText DirName, ComboBox1, %wClass%
;    StringRight Root, DirName, 4
;    StringRight End, Root, 2
;    StringLeft Start, Root, 1
;    If (Start = "(") and (End = ":)")
;    {
;       StringLeft Tmp, Root, 2
;       StringRight Letter, Tmp, 1
;       DirPath = %Letter%:\%DirPath%
;       MsgBox The full path of this folder is:- `n" %DirPath% "
;       ControlSetText Edit1, %DirPath%, %wClass%
;       ControlSend Edit1, {Enter}, %wClass%
;       Break
;       }
;    DirPath = %DirName%\%DirPath%
;    ControlFocus SysListView321, %wClass%
;    ControlSend SysListView321, {Bs}, %wClass%
;    }
; DirPath =
; Return