#SingleInstance, force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.

; ResizeWin(Width,Height) {
;     WinMove,A,50,100,%Width%,%Height%
;     return
; }


; F8::
;     WinMove,A,,,,1150,1050
; return
;     ; ResizeWin(1150,1050)
; ; return

; Run, calc.exe
; WinWait, Calculator
; WinMove, 0, 0 ; Move the window found by WinWait to the upper-left corner of the screen.

^XButton2::
<#^Right
Return

^XButton1::
<#^Left
Return
