#IfWinActive ahk_class CabinetWClass 
^+Enter::
GetText(tmpvar)
If (tmpvar != "")
  Run, emacs.exe -n "%tmpvar%"
Return