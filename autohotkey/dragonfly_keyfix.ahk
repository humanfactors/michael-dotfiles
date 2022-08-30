#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

selectLineEnd() {
    Send, {Shift Down}
    Send, {End}
    Send, {ShiftUp}
}

selectLineHome() {
    Send, {Shift Down}
    Send, {Home}
    Send, {ShiftUp}
}

RShift & Right::selectLineEnd()
RShift & Left::selectLineHome()

RAlt & Right::End
RAlt & Left::Left
