#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, force


#F1:: Run, "C:\Program Files (x86)\Microsoft Office\Office16\OUTLOOK.EXE" /c ipm.note
#F2:: Run, "C:\Program Files (x86)\Microsoft Office\Office16\OUTLOOK.EXE" /select outlook:inbox
#F3:: Run, "C:\Program Files (x86)\Microsoft Office\Office16\OUTLOOK.EXE" /select outlook:calendar
#F4:: Run, "C:\Program Files (x86)\Microsoft Office\Office16\WINWORD.EXE" /w
#F5:: Run www.google.com


F12::
	olEmail := ComObjActive("Outlook.Application").ActiveWindow.CurrentItem	; Expects an Email to be open
	olEmail.MarkAsTask(2) ; olMarkThisWeek := 2
	olEmail.TaskDueDate := DatePlusDays(3)
	olEmail.FlagRequest := "Call " olEmail.SenderName
	olEmail.ReminderSet := true
	olEmail.ReminderTime  := DatePlusDays(2)
	olEmail.Save
return

