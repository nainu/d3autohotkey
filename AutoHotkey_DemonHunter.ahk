^SPACE::  Winset, Alwaysontop,On, A
^!SPACE::  Winset, Alwaysontop,Off, A

;SetTitleMatchMode, 2
;#IfWinExist ahk_class 디아블로
d3hwnd := InitDiabloHandle()

count := 0
centerX := 1
centerY := 1
width := 0
height := 0

MoveToGhomeGate()
{
  Click 746, 192
  sleep 3000
  MouseMove, 10, 10
}

ItemSearchAndPick()
{
  Loop, 10
  {
    MouseMove, 10, 10
    global width
    global height
    _lx := 200
    _ly := 170
    _rx := width - _lx
    _ry := height - _ly
    PixelSearch, Px, Py, %_lx%, %_ly%, %_rx%, %_ry%, 0x01ef01, 6, Fast
    if ErrorLevel = 0
    {
      sleep 500
      Click %Px%, %Py%
      sleep 1500
    }
    else
    {
      PixelSearch, Px, Py, %_lx%, %_ly%, %_rx%, %_ry%, 0x027af1, 6, Fast
      ;0x027af1
      if ErrorLevel = 0
      {
        sleep 500
        Click %Px%, %Py%
        sleep 1500
      }
      else
      {
        return
      }
    }
  }
}

ExitRoom()
{
  global d3hwnd
  WinActivate,ahk_id %d3hwnd%
  CloseAllOpenedUI()
  CloseAllOpenedUI()
  CloseAllOpenedUI()
  CloseAllOpenedUI()
  CloseAllOpenedUI()
  CloseAllOpenedUI()
  Sleep 10000
  WinActivate,ahk_id %d3hwnd%
  ControlSend, , {esc}, ahk_id %d3hwnd%
  Sleep 200
  MenuClick(139,296)
  Sleep 14000
  WinActivate,ahk_id %d3hwnd%
}

RemoveAllSkillFromSkillWin()
{
  global d3hwnd
  InitDiabloHandle()
  WinActivate,ahk_id %d3hwnd%
  CloseAllOpenedUI()
;  ControlSend, , {s}, ahk_id %d3hwnd%

  Send S
  marginx := 37
  uix := 238
  Loop, 6
  {
    Click down l %uix% 601
    sleep 50
    Click up l %uix% 543
    sleep 50
    click l %uix% 543
    uix := uix + marginx
  }
  sklx := 305
  skrx := 515
  sk1y := 145
  sk2y := 240
  sk3y := 320
  ;Loop, 6
  ssky := 145
  runey := 272
  rune1x := 286
  rune2x := 366
  rune3x := 446
  rune4x := 526
  rune5x := 606
  {
    click l %sklx% %sk1y%
    click l 190 %ssky%
    click l 447 %ssky%
    click l %rune4x% %runey%
    click l 340 481

    click l %skrx% %sk1y%
    click l 625 %ssky%
    click l 625 %ssky%
    click l 367 %ssky%
    click l %rune2x% %runey%
    click l 340 481

    click l %sklx% %sk2y%
    click l 625 %ssky%
    click l 625 %ssky%
    click l 527 %ssky%
    click l %rune5x% %runey%
    click l 340 481

    click l %skrx% %sk2y%
    click l 190 %ssky%
    click l 330 %ssky%
    click l %rune5x% %runey%
    click l 340 481

    click l %sklx% %sk3y%
    click l 190 %ssky%
    click l 447 %ssky%
    click l %rune5x% %runey%
    click l 340 481

    click l %skrx% %sk3y%
    click l 190 %ssky%
    click l 190 %ssky%
    click l 527 %ssky%
    click l %rune4x% %runey%
    click l 340 481
  }
}

F1::
InitDiabloHandle()
WinActivate,ahk_id %d3hwnd%
click r 79 582
click l 142 476
return

+F2::
F2::
pause
return

F3::
ToggleDemonHunterSkill:
;static executeCount := 0
RemoveAllSkillFromSkillWin()
if executeCount = 0
{
  
}
else
{
  
}
return 

F4::
GhomeRun:
send, {shift up}
InitDiabloHandle()
WinActivate,ahk_id %d3hwnd%
OpenGameSettingSelectMode("Campaign")
;Change2PreviousQuest()
MenuClick(405,400)
MenuClick(400,365)
MenuClick(400,432)
MenuClick(345,460)
MenuClick(345,395)
ClickStartButton()
sleep, 24000
; open map and move to ghome
WinActivate,ahk_id %d3hwnd%
Send, {space}
sleep 100
;ControlSend, , m, ahk_id %d3hwnd%
Send, m
Sleep, 2000
WinActivate,ahk_id %d3hwnd%
Click 257, 464
Sleep, 6000
WinActivate,ahk_id %d3hwnd%
MoveToGhomeGate()
Click 780, 68
Sleep, 4000
Click 780, 68
Sleep, 6000
WinActivate,ahk_id %d3hwnd%
;FightGhome()
gosub, FightGh
send, {shift up}
InitDiabloHandle()
WinActivate,ahk_id %d3hwnd%
ItemSearchAndPick()
;ControlSend, , t, ahk_id %d3hwnd%
Send, T
sleep 9000
ExitRoom()
Send, {F4}
goto GhomeRun
return

FightGh:
Click 780, 68
Sleep, 2200
Click 680, 145
Sleep, 3000
send, 1
sleep, 200
send, 2
sleep, 200
send, 3
sleep, 200
send, 4
sleep, 200
send, {shift down}
;settimer, SkillLBtn, 600
click down, left, 400, 300
settimer, SkillRBtn, 4000
settimer, SkillQ, 10000
loop, 5
{
 sleep, 3500
}
WinActivate,ahk_id %d3hwnd%
send, {shift up}
settimer, SkillRBtn, off
settimer, SkillQ, off
click up, left
return

Skill1:
ControlSend, , 1, ahk_id %d3hwnd%
return
Skill2:
ControlSend, , 2, ahk_id %d3hwnd%
return
Skill3:
ControlSend, , {3 down}, ahk_id %d3hwnd%
return
Skill4:
ControlSend, , 4, ahk_id %d3hwnd%
return
SkillQ:
ControlSend, , q, ahk_id %d3hwnd%
return
SkillLBtn:
Random,rx,centerX + 100, centerX + 200
Random,ry,centerY - 1, centerY - 2
ControlClick,, ahk_id %d3hwnd%,, MIDDLE,, NA D x%centerX% y%centerY%
ControlClick,, ahk_id %d3hwnd%,,L,, NA x%rx% y%ry%
return
SkillRBtn:
Random,rx,centerX - 2, centerX + 2
Random,ry,centerY - 1, centerY - 2
;ControlClick,, ahk_id %d3hwnd%,, MIDDLE,, NA D x%centerX% y%centerY%
ControlClick,, ahk_id %d3hwnd%,,R,, NA D x%rx% y%ry%
return
HoldRBtn:
Random,rx,centerX - 100, centerX + 100
Random,ry,centerY + 100 , centerY + 200
ControlClick,, ahk_id %d3hwnd%,,R,, NA D x%rx% y%ry%
SetTimer, HoldRBtn, off
return
ClickRevive:
WinActivate,ahk_id %d3hwnd%
ControlClick,, ahk_id %d3hwnd%,, MIDDLE,, NA D x%centerX% y%centerY%
;ControlClick,, ahk_id %d3hwnd%,,L,, NA D x410 y405
Click 410, 405
return

F7::
InitDiabloHandle()
OpenGameSettingSelectMode("Campaign")
ChangeDifficulty2TormentVI()
Change2PreviousQuest()

ClickStartButton()

return

F8::
; start adventure mode
; min diablo3 win size
InitDiabloHandle()
WinActivate,ahk_id %d3hwnd%
CloseAllOpenedUI()
OpenGameSettingSelectMode("Adventure")
ChangeDifficulty2TormentVI()
ClickStartButton()
Sleep 10000
WinActivate,ahk_id %d3hwnd%
ControlSend, , m, ahk_id %d3hwnd%
;ControlSend, , m, ahk_id %d3hwnd%
MenuClick(370,100)
MenuClick(200,333)
;MouseMove, 160, 220
MouseMove, 525, 255
return

F9::
InitDiabloHandle()
WinActivate,ahk_id %d3hwnd% 
CloseAllOpenedUI()
global d3hwnd
ControlSend, , {ESC}, ahk_id %d3hwnd%
;Send {ESC}
Sleep 100
MenuClick(140,300)
Sleep 5000
Send {F8}
return

Change2PreviousQuest()
{
  MenuClick(405,400)
  MenuClick(400,365)
  MenuClick(345,460)
  MenuClick(345,395)
}

ClickStartButton()
{
  MenuClick(510,510)
}

CloseAllOpenedUI()
{
  Send {space}
;  global d3hwnd
;  ControlSend, , {SPACE}, ahk_id %d3hwnd%
  sleep 100
}

InitDiabloHandle()
{
  SetTitleMatchMode, 2
  WinGet, _d3hwnd, ID, III
  ;WinGet, _d3hwnd, ID, 디아블로
  if (!_d3hwnd)
  {
    MsgBox, diablo client is not running!
    Pause
    return
  }
  global d3hwnd = _d3hwnd

  WinGetPos,,, _width, _height, ahk_id %_d3hwnd%
  global width := _width
  global height := _height
  global centerX := _width / 2
  global centerY := _height / 2
  ;MouseGetPos,xx,yy
  return _d3hwnd
}

OpenGameSettingSelectMode(mode)
{
  if (mode = "Campaign")
  {
    MenuClick(140,350)
    MenuClick(240,240)
  }
  else
  {
    MenuClick(140,350)
    MenuClick(240,390)
  }
}

ChangeDifficulty2TormentVI()
{
  MenuClick(640,275)
  MenuClick(700,300)
  MenuClick(210,510)
  MenuClick(210,510)
  MenuClick(210,510)
  MenuClick(210,510)
  MenuClick(210,510)
  MenuClick(405,510)
}

CSend(key)
{
  ControlSend,,key, ahk-id %d3hwnd%
}

MenuClick(x, y, align = "m")
{
  global width
  global height
  zoomRate := height / 600

  if (align = "l")
  {
    xx := x * zoomRate
  }
  else if (align = "r")
  {
    xx := width - ((800 - x) * zoomRate)
  }
  else
  {
    if (x < 400)
    {
      xx := (width * 0.5) - ((400 - x) * zoomRate)
    }
    else 
    {
      xx := (width * 0.5) + ((x - 400) * zoomRate)
    }
  }
  yy := y * zoomRate
  xx := x
  yy := y
  ;MsgBox, %xx%, %x%, %width%, %yy%, %y%, %height%
;  ControlClick,, ahk_id %d3hwnd%,,L,, NA  x%x% y%y%
  Click %x%, %y%
  Sleep 100
  ;return x + y; "Return" expects an expression.
}

F5::
Reload
MsgBox, 4,, The script could not be reloaded. Would you like to open it for editing?
IfMsgBox, Yes, Edit
return

F6::
Edit
return
