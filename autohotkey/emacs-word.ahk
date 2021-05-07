#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance, force
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Forces the use of the hook to implement all or some keyboard hotkeys.
#InstallKeybdHook
#UseHook On

; The following line is a contribution of NTEmacs wiki http://www49.atwiki.jp/ntemacs/pages/20.html
; Sets the delay that will occur after each keystroke sent by Send or ControlSend
; 0 for the smallest possible delay, -1 for no delay at all, leaving blank to retain the current Delay
SetKeyDelay 0

$^F11::Suspend, Toggle

$CapsLock::Ctrl

SendCommand(emacsKey, translationToWindowsKeystrokes) {
    Send, %translationToWindowsKeystrokes% ;passthrough original keystroke
    return
}


#IfWinActive ahk_class OpusApp

   $^p::SendCommand("^p","{Up}")

   $^n::SendCommand("^n","{Down}")
   
   $!f::SendCommand("!f","^{Right}")

   $!b::SendCommand("!b","^{Left}")

   $!<::SendCommand("!<","^{Home}")

   $!>::SendCommand("!>","^{End}")


   ;==========================
   ;Line Navigation
   ;==========================

   $^a::SendCommand("^a","{Home}")

   $^e::SendCommand("^e","{End}")

#IfWinActive