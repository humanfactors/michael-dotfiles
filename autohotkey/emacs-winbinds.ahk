;;
;; An autohotkey script that provides emacs-like keybinding on Windows
;;
#InstallKeybdHook
#UseHook


; The following line is a contribution of NTEmacs wiki http://www49.atwiki.jp/ntemacs/pages/20.html
SetKeyDelay 0

; Applications you want to disable emacs-like keybindings
; (Please comment out applications you don't use)
is_target()
{
  IfWinActive,ahk_class ConsoleWindowClass ; Cygwin
    Return 1 
IfWinActive,ahk_class MEADOW ; Meadow
  Return 1 
IfWinActive,ahk_class cygwin/x X rl-xterm-XTerm-0
  Return 1
IfWinActive, ahk_class emacs@T470
IfWinActive,ahk_class MozillaUIWindowClass ; keysnail on Firefox
  Return 1
; Avoid VMwareUnity with AutoHotkey
IfWinActive,ahk_class VMwareUnityHostWndClass
  Return 1
IfWinActive,ahk_class Vim ; GVIM
  Return 1
;  IfWinActive,ahk_class SWT_Window0 ; Eclipse
;    Return 1
;   IfWinActive,ahk_class Xming X
;     Return 1
;   IfWinActive,ahk_class SunAwtFrame
;     Return 1
;   IfWinActive,ahk_class Emacs ; NTEmacs
;     Return 1  
;   IfWinActive,ahk_class XEmacs ; XEmacs on Cygwin
;     Return 1
Return 0
}


move_beginning_of_line()
{
  global
  if is_pre_spc
    Send +{HOME}
  Else
    Send {HOME}
    Return
}
move_end_of_line()
{
  global
  if is_pre_spc
    Send +{END}
  Else
    Send {END}
    Return
}

^a::
If is_target()
  Send %A_ThisHotkey%
Else
  move_beginning_of_line()
  Return
^e::
If is_target()
  Send %A_ThisHotkey%
Else
  move_end_of_line()
Return    
