#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance, force
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

RequestSingleLine() {
    InputBox, PageLine, Enter Page & Line, Seperate with space
    
    SplitPageLine := StrSplit(PageLine, A_Space)  
    formattedString := "p. " . SplitPageLine[1] . ", line " . SplitPageLine[2]
    Send % formattedString
}

RequestMultiLines()  {
    InputBox, PageLine, Enter Page & Lines, Seperate with space
    
    SplitPageLine := StrSplit(PageLine, A_Space)  
    formattedString := "p. " . SplitPageLine[1] . ", lines " . SplitPageLine[2]
    Send % formattedString
}

F9::RequestSingleLine()
^F9::RequestMultiLines()

#F9::ExitApp, 0

