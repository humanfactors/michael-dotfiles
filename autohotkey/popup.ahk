; PopFav -- simple popup menu launcher inspired by PopSel

; Sample menus are given in the special commented section below between /* */.
; Two menus are created. Use hotkeys Ctrl-1 and Ctrl-2 to launch them.
; If you want to read menus from another file, change POPFAV_MENU_FILE below.
;
; First line of a menu definition contains a unique Menu Name which identifies
; the menu.  It must be the first instance of this Name in the file.
; Next line with Menu Name ends Menu definition.  Menu Names must conform to
; the rules of AHK variable naming: letters, numbers, and _ only, no spaces.
;
; Within each menu, one line corresponds to one menu item.
; Specify the name of the menu item first, followed by the == string, followed
; by the Target parameter for the Run command.
; See http://www.autohotkey.com/docs/commands/Run.htm for details.
; It's not possible to specify Run parameters other than Target.
;
; To create separator line, omit text after the == string.
; Lines without == are ignored, e.g., blank lines, comments.
;
; Use >> string to create submenu. Only one level sumbenus are possible, that
; is only the first >> string is treated as sumbenu separator.
;
; Once a menu name is defined, use it to create popup menu:
; 1. Call function
;   POPFAV_Create_Menu("MenuName", POPFAV_MENU_FILE)
; 2. Create hotkey
;   {Hotkey}::Menu, MenuName, Show
; See below for examples.

/*
=========== MENU DEFINITIONS =================================================

___________ POPFAV_DEMO_MENU1 ________________________________________________
/Documents and Settings    == C:\Documents and Settings
        folders can open faster if file manager is specified
/Program Files             == explorer.exe %ProgramFiles%
        create separator in main menu
--------==
/%A_Temp%                  == explorer.exe %A_Temp%

        create sumbenu Applications
Applications >> !Notepad.exe  == notepad.exe
Applications >> edit this script in notepad   == notepad.exe %A_ScriptFullPath%
Applications >> !Calc.exe     == Calc.exe
Applications >> !cmd.exe      ==  %comspec% /k cd %A_ScripDir%

        these are examples from AHK help for Run command
AHK help examples >> My Computer        == ::{20d04fe0-3aea-1069-a2d8-08002b30309d}
AHK help examples >> Recycle Bin        == ::{645ff040-5081-101b-9f08-00aa002f954e}
AHK help examples >> ------------------ ==
        Do not escape , in Target string.
AHK help examples >> Display Properties->Settings == rundll32.exe shell32.dll,Control_RunDLL desk.cpl,, 3

        create separator in main menu, this ends previous sumbenu
--------==

        Potential gotchas with deref. Don't use %% unless you have to.
Gotchas >> this menu name: %MenuName%        == %A_Space%
Gotchas >> edit menu definition file in notepad   == notepad.exe %MenuFile%
___________ POPFAV_DEMO_MENU1 ________________________________________________


___________ POPFAV_DEMO_MENU2 ________________________________________________
        links
autohotkey.com          == http://www.autohotkey.com
autohotkey.com/docs     == http://www.autohotkey.com/docs/
google                      == http://www.google.com/webhp?num=100
___________ POPFAV_DEMO_MENU2 ________________________________________________

========= END OF MENU DEFINITIONS ============================================
*/

;;;;; Specify file which contains PopFav menu definitions.
; Menus are defined at the start of this script file between /* */.
POPFAV_MENU_FILE = %A_ScriptFullPath%
; Menus are defined in external file in this script's dir.
; POPFAV_MENU_FILE = %A_ScriptDir%\PopFav.menus

;;;;; Create PopFav menus.  Use menu names defined in menu file.
POPFAV_Create_Menu("POPFAV_DEMO_MENU1", POPFAV_MENU_FILE)
POPFAV_Create_Menu("POPFAV_DEMO_MENU2", POPFAV_MENU_FILE)

;;;;; Create hotkeys which show PopFav menus.
^1::Menu, POPFAV_DEMO_MENU1, Show
^2::Menu, POPFAV_DEMO_MENU2, Show

;;;;; End of PopFav configuration. ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
return
;====================== end of auto-execute section ==========================
;=============================================================================


POPFAV_Create_Menu(MenuName, MenuFile) {
; Parse menu definition MenuName from file MenuFile.
; Create menu MenuName and its submenus.
    global
    local pos
    local _left, _right ; parts before and after == separator
    local _left1, _left2 ; parts before and after >> separator
    local OutsideOfMenu = 1
    local SubLev = 0 ; 0 if in main menu, 1 if in submenu
    local SubName ; current submenu item; part before >> with whitespace stripped
    local MenuIdx = 1 ; main menu item index, also a submenu id: %MenuName%%MenuIdx%
    local SubIdx = 1 ; current sumbenu item index, increment after adding to sumbenu

    Loop, Read, %MenuFile%
    {
        ; Skip lines until the first line with MenuName.
        if OutsideOfMenu
        {
            IfInString, A_LoopReadLine, %MenuName%
                OutsideOfMenu = 0
            continue
        }
        ; Second line with MenuName marks the end of menu definition.
        ; Add last submenu, if any, and exit loop.
        IfInString, A_LoopReadLine, %MenuName%
        {
            if SubLev = 1
                Menu, %MenuName%, Add, %SubName%, :%MenuName%%MenuIdx%
            break
        }
        ; We are inside menu definition.
        ; Add menu item to (sub)menu and create global variable containing the
        ; command of this (sub)menu item. Variables are named:
        ;      %MenuName%_cmd%MenuIdx%           --main menu
        ;      %MenuName%%MenuIdx%_cmd%SubIdx%   --submenu
        ; Add menu separator if there is nothing after the first == string.
        ; NOTE: increment (sub)menu item index after adding any item, including
        ; separator or submenu.
        ;
        ; get location of ==
        StringGetPos, pos, A_LoopReadLine, ==
        if pos < 0; ignore line without ==
            continue
        ; get part after ==
        StringTrimLeft, _right, A_LoopReadLine, pos+2
        _right = %_right%  ; strip whitespace
        ; get part before ==
        StringLeft, _left, A_LoopReadLine, pos
        ; resolve any references to variables (assumes that submenu separator cannot be created)
        Transform, _left, deref, %_left%
        _left = %_left%  ; strip whitespace
        ; check for submenu separator
        StringGetPos, pos, _left, >>
        ;;;;;;;;;; there is no submenu, add item to main menu
        if pos < 0
        {
            if SubLev = 1 ; previous submenu ended, add it
            {
                SubLev = 0
                Menu, %MenuName%, Add, %SubName%, :%MenuName%%MenuIdx%
                MenuIdx++
                SubIdx = 1
            }
            if _right =
            {
                Menu, %MenuName%, Add
                MenuIdx++
            }
            else
            {
                Transform, %MenuName%_cmd%MenuIdx%, deref, %_right%
                Menu, %MenuName%, Add, %_left%, POPFAV_MENU_HANDLER
                MenuIdx++
            }
        }
        ;;;;;;;;;; there is a submenu; add item to it
        else
        {
            StringLeft, _left1, _left, pos ; sumbenu name
            _left1 = %_left1%
            StringTrimLeft, _left2, _left, pos+2 ; sumbenu item name
            _left2 = %_left2%
            ;;;;; new submenu after main menu
            if SubLev = 0
            {
                SubLev = 1
                SubName = %_left1%
            }
            ;;;;; another item of previous submenu, nothing changed
            else if _left1 = %SubName%
            {
            }
            ;;;;; new submenu after previous submenu
            else
            {
                ; add previous submenu
                Menu, %MenuName%, Add, %SubName%, :%MenuName%%MenuIdx%
                MenuIdx++
                SubIdx = 1
                ; start building new submenu
                SubName = %_left1%
            }
            ;;;;; add item to sumbenu, add separator if there is nothing after ==
            if _right =
            {
                Menu, %MenuName%%MenuIdx%, Add
                SubIdx++
            }
            else
            {
                Transform, %MenuName%%MenuIdx%_cmd%SubIdx%, deref, %_right%
                Menu, %MenuName%%MenuIdx%, Add, %_left2%, POPFAV_MENU_HANDLER
                SubIdx++
            }
        }
    }
}


POPFAV_MENU_HANDLER:
; Handler for all PopFav menu items.
    ; Fetch variable containing action for selected menu item.
    ; _popfav_cmd contains last menu action: handy for debugging
    _popfav_cmd := %A_ThisMenu%_cmd%A_ThisMenuItemPos%
    Run, %_popfav_cmd%
return