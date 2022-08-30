#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance, force
#Persistent
#InstallKeybdHook
SendMode Input  ; Recommended for new scripts due to its superior speed and 

NumLock::End
+Numlock::+End

;; Make sure we can turn this off if needed
$#NumLock::NumLock


$F12::Home
$+F12::+Home
