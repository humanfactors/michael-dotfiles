; Emacs key bindings for the Outlook 2007 email editor -- by John Cooper.
; Last updated: September 24th 2007
; 
; Requires AutoHotkey: http://www.autohotkey.com
;
; This ahk script provides a basic set of Emacs key bindings for use in the
; Outlook 2007 email editor.
;
; In Outlook 2003 and earlier (and Word 2007), an enhanced version of this
; functionality is already provided by VBacs (http://rath.ca/Misc/VBacs/), a
; set of VBA (Visual Basic for Applications) macros to remap the keyboard and
; implement functionality for a basic set of Emacs key bindings.
;
; In Outlook 2007 it is no longer possible to bind arbitrary key sequences to
; macros; user-defined macros can be added to the "Quick Access Toolbar" on the
; left side of the titlebar, but these are consecutively bound to Alt+1, Alt+2,
; Alt+3, etc.
;
; This script implements a limited subset of Emacs bindings, primarily by
; simple key remapping. When interaction with the Word object model is
; required, Outlook macros have been written and added to the Quick Launch
; Toolbar; these are then invoked by mapping the relevant Emacs key sequence to
; the corresponding Alt+<n> binding.
;
; The commands that use macros in this way are:
;   Ctrl+T - Transpose previous 2 characters
;   Ctrl+X Ctrl+X - Exchange point and mark
;
; To configure these 2 macro-based commands, you need to do the following:
;
; 1) In Outlook, open "Tools>Macro>Visual Basic Editor" and enter the following
;    code in the "ThisOutlookSession" project:
;
;      Sub ExchangePointAndMark()
;          Set oDoc = ActiveInspector.WordEditor
;          Set oWord = oDoc.Application
;          Set s = oWord.Selection
;      
;          s.StartIsActive = Not s.StartIsActive
;      End Sub
;      
;      Sub TransposeChars()
;          Set oDoc = ActiveInspector.WordEditor
;          Set oWord = oDoc.Application
;          Set s = oWord.Selection
;      
;          s.MoveLeft Unit:=wdCharacter, Count:=1, Extend:=wdExtend
;          On Error GoTo ErrExit
;          s.Cut
;          s.MoveLeft Unit:=wdCharacter, Count:=1
;          s.Paste
;          s.MoveRight Unit:=wdCharacter, Count:=1
;      ErrExit:
;      End Sub
;   
;   Click the Save icon on the toolbar.
;
; 2) In Outlook, select "File>New>Mail Message" to open a blank email
;    composition window. In this window, locate the "Quick Access Toolbar"
;    towards the left of the title bar and click the down arrow. Select "More
;    Commands" and then in the "Choose commands from" dropdown select
;    "Macros". Select each of the new macros in the left pane and click the
;    "Add" button to add the macros to the quick launch toolbar.
;
; 3) Return to the New Message window and tap and release the Alt key to
;    determine what key sequence (Alt+<number>) is bound to each of the macros
;    that were added to the Quick Launch Toolbar.
;
; 4) Update this script if necessary to send the appropriate macro binding in
;    response to the corresponding Emacs key sequence.


; Match strings anywhere in the window title
SetTitleMatchMode, 2

numericPrefix = 1
ctrlXPrefix = 0

; Emacs key bindings for the Microsoft Outlook 2007 email editor
#IfWinActive, ahk_exe outlook.exe
#IfWinActive - Message ahk_class rctrl_renwnd32
; Ctrl+A - Start of line
^a::
  Send, {Home}
  ctrlXPrefix = 0
  numericPrefix = 1
  return

; Ctrl+B - Character backward
^b::
  Send, {Left %numericPrefix% }
  ctrlXPrefix = 0
  numericPrefix = 1
  return

; Ctrl+D - Delete character forward
^d::
  Send, {Delete}
  ctrlXPrefix = 0
  numericPrefix = 1
  return

; Ctrl+E - End of line
^e::
  Send, {End}
  ctrlXPrefix = 0
  numericPrefix = 1
  return

; Ctrl+F - Character forward
^f::
  Send, {Right %numericPrefix% }
  ctrlXPrefix = 0
  numericPrefix = 1
  return

; Ctrl+G - Cancel
^g::
  Send, {Escape}
  ctrlXPrefix = 0
  numericPrefix = 1
  Return

; Ctrl+K - Delete to end of line
^k::
  ControlGetFocus, OutputVar, A
  If ErrorLevel
    MsgBox, The target window doesn't exist or none of its controls has input focus.
  Else
    If (OutputVar = "RichEdit20WPT2" or OutputVar = "RichEdit20WPT3")
    {
        Send, ^k
        ;MsgBox, Found it!
    }
    Else 
    {
      Send, +{End}
      Send, +{Left}
      Send, ^{c}
      Send, {Delete}
      ctrlXPrefix = 0
      numericPrefix = 1
    }
    ;MsgBox, Control with focus = %OutputVar%
  return

; Ctrl+N - Line down
^n::
  Send, {Down %numericPrefix% }
  ctrlXPrefix = 0
  numericPrefix = 1
  return
;^n:: SendAndClearNumericArg("{Down " . numericPrefix . "}", numericPrefix)

; Ctrl+O - Open line above
^o::
  Send, {Return}
  Send, {Left}
  ctrlXPrefix = 0
  numericPrefix = 1
  return

; Ctrl+P - Line up
^p::
  Send, {Up %numericPrefix% }
  ctrlXPrefix = 0
  numericPrefix = 1
  return

; Ctrl+R - Search backwards
^r::
  Send ^f
  Send +!;
  Send u
  Send {Return}
  Send !{n}
  Send {Return}
  ctrlXPrefix = 0
  numericPrefix = 1
  return
;$^s::
;  Send ^f
;  numericPrefix = 1
;  return

; Ctrl+S - Search forwards
; Ctrl+X Ctrl+S - Save
^s::
  If ctrlXPrefix = 1
    Send, ^s
  Else
  {
    Send ^f
    Send +!;
    Send d
    Send {Return}
    Send !{n}
    Send {Return}
    numericPrefix = 1
  }
  return

; Ctrl+T - Transpose previous characters
^t::
  ControlGetFocus, OutputVar, A
  If ErrorLevel
    MsgBox, The target window doesn't exist or none of its controls has input focus.
  Else
    If (OutputVar = "_WwG1")
    {
      Send, !7
    }
  return

; Ctrl+U - Set a numeric argument, in multiples of 4, which can be applied to
;          the following commands: Character forward, Character backward,
;          Line up, Line down, Delete character, Word forward, Word backward, Delete word.
^u::
  numericPrefix *= 4
  If numericPrefix > 256
    numericPrefix = 1
  ctrlXPrefix = 0
  return

; Ctrl+V - Page down
^v::
  Send, {PgDn}
  numericPrefix = 1
  ctrlXPrefix = 0
  return

; Ctrl+W - Cut
^w::
  Send, ^{x}
  numericPrefix = 1
  ctrlXPrefix = 0
  return

; Ctrl+X - Prefix
^x::
  If ctrlXPrefix = 1
  {
    Send, !6
    ctrlXPrefix = 0
  }
  Else
    ctrlXPrefix = 1
  return

; Ctrl+Y - Paste
$^y::
  Send, ^{v}
  numericPrefix = 1
  ctrlXPrefix = 0
  return

; Ctrl+<space> - Set mark
^Space::
  Send, {F8}
  numericPrefix = 1
  ctrlXPrefix = 0
  return

; Ctrl+/ - Undo
^/::
  Send, ^{z}
  numericPrefix = 1
  ctrlXPrefix = 0
  return

; Ctrl+Shift+Z - Redo
^+z::
  Send, ^{y}
  numericPrefix = 1
  ctrlXPrefix = 0
  return

; Ctrl+Alt+B - Bold
^!b::
  Send, !{h}
  Send, 1
  return

; Ctrl+Alt+I - Italic
^!i::
  Send, !{h}
  Send, 2
  return

; Ctrl+Alt+U - Underline
^!u::
  Send, !{h}
  Send, 3
  return

; Alt+B - Word backward
!b::
  Send, ^{Left %numericPrefix% }
  numericPrefix = 1
  ctrlXPrefix = 0
  return

; Alt+D - Delete word forward
!d::
  Send, ^{Delete %numericPrefix% }
  numericPrefix = 1
  ctrlXPrefix = 0
  return

; Alt+F - Word forward
!f::
  Send, ^{Right %numericPrefix% }
  numericPrefix = 1
  ctrlXPrefix = 0
  return

; Alt+V - Page up
!v::
  Send, {PgUp}
  numericPrefix = 1
  ctrlXPrefix = 0
  return

; Shift+Alt+, - Start of document
+!,::
  Send, ^{Home}
  numericPrefix = 1
  ctrlXPrefix = 0
  return

; Shift+Alt+. - End of document
+!.::
  Send, ^{End}
  numericPrefix = 1
  ctrlXPrefix = 0
  return

; Currently unused
SendAndClearNumericArg(key, ByRef numericPrefix)
  {
    Send, %key%
    numericPrefix = 1
    return 0
  }

#IfWinActive


; Microsoft Word's "find and replace" dialog
#IfWinActive Find and Replace
^g:: Send, {Escape}
^r::
  Send +!;
  Send u
  Send {Return}
  Send !{n}
  Send, !f
  return
^s::
  Send +!;
  Send d
  Send {Return}
  Send !{n}
  Send, !f
  return
#IfWinActive


; Microsoft Word's "save changes" confirmation dialog
#IfWinActive ahk_class #32770
^g:: Send, {Escape}
#IfWinActive