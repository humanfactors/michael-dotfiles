#Include %A_ScriptDir%\emacs-key-sequence.ahk
#SingleInstance, force


;; You can use ctrl+v to paste like normal and ctrl+shift+v to paste without new lines
Ins::
	clipBak		:= ClipboardAll
	Clipboard	:= RegExReplace(Clipboard, "\s*(\n|\r\n)", A_Space)
	Send, ^v
return