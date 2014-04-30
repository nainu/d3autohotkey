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
  MouseClick, L, 746, 192
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
    _rx := width - 100
    _ry := height - 50
    PixelSearch, Px, Py, 100, 50, %_rx%, %_ry%, 0x01ef01, 6, Fast
    if ErrorLevel = 0
    {
      sleep 500
      MouseClick, L, Px, Py
      sleep 1500
    }
    else
    {
      PixelSearch, Px, Py, 100, 50, %_rx%, %_ry%, 0x0071e0, 6, Fast
      ;0x027af1
      if ErrorLevel = 0
      {
        sleep 500
        MouseClick, L, Px, Py
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
;  CloseAllOpenedUI()
;  send, {ESC}
  ControlSend, , {space}, ahk_id %d3hwnd%
  Sleep 200
  ControlSend, , {space}, ahk_id %d3hwnd%
  Sleep 200
  ControlSend, , {space}, ahk_id %d3hwnd%
  Sleep 200
  ControlSend, , {space}, ahk_id %d3hwnd%
  Sleep 200
  ControlSend, , {ESC}, ahk_id %d3hwnd%
  Sleep 500
  MenuClick(140,300)
  Sleep 7000
}

FightGhome()
{
  SetTimer, SkillLBtn, 871
  SetTimer, Skill1, 3000
  SetTimer
}

F2::
pause
return

F3::
InitDiabloHandle()
WinActivate,ahk_id %d3hwnd%
ItemSearchAndPick()
;ControlSend, , t, ahk_id %d3hwnd%
Send, T
sleep 8000
ExitRoom()
;return
F4::
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
sleep, 18000
; open map and move to ghome
Send, {space}
sleep 100
;ControlSend, , m, ahk_id %d3hwnd%
Send, m
Sleep, 1000
MouseClick, L, 257, 464
Sleep, 6000
Send, 2
Sleep 300
Send, 3
Sleep 300
Send, 4
Sleep 300
; 
MoveToGhomeGate()
MouseClick, L, 780, 68
Sleep, 4000
MouseClick, L, 780, 68
Sleep, 6000
;FightGhome()
gosub, FightGh
Send, {F3}
return

FightGh:
send, {shift down}
sleep, 500
mouseclick, left, 400, 300
sleep, 500
mouseclick, left, 400, 300
send, 1
sleep, 500
click down, right, 700, 60
settimer, Skill1, 3000
settimer, SkillQ, 10000
loop, 5
{
 sleep, 4000
}
send, {shift up}
settimer, Skill1, off
settimer, SkillQ, off
click up, right
return

F11::
InitDiabloHandle()
count++

if Mod(count, 2) = 1
{
;  ControlClick,, ahk_id %d3hwnd%,, MIDDLE,, NA D x%centerX% y%centerY%
;  ControlSend, , z, ahk_id %d3hwnd%
  ControlSend, , {3 down}, ahk_id %d3hwnd%
  SetTimer, skill3, 9000
;  SetTimer, Skill1, 3423
;  SetTimer, Skill2, 194423
;  SetTimer, skill3, 170705
;  SetTimer, Skill4, 130607
;  SetTimer, SkillQ, 30300
;  SetTimer, SkillLBtn, 871
;  Click down
;  SetTimer, SkillRBtn, 4071
;  SetTimer, ClickRevive, 29700
}
else
{
  Click up
;  ControlClick,, ahk_id %d3hwnd%,, MIDDLE,, NA U x%centerX% y%centerY%
;  ControlSend, , z, ahk_id %d3hwnd%
  SetTimer, Skill1, off
  SetTimer, Skill2, off
  SetTimer, Skill3, off
  SetTimer, Skill4, off
  SetTimer, SkillQ, off
  SetTimer, SkillLBtn, off
  SetTimer, SkillRBtn, off
  SetTimer, ClickRevive, off
}
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
ControlClick,, ahk_id %d3hwnd%,, MIDDLE,, NA D x%centerX% y%centerY%
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
  Send {SPACE}
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
  ;ControlClick,, ahk_id %d3hwnd%,,L,, NA  x%x% y%y%
  Click %x%, %y%
  Sleep 100
  ;return x + y; "Return" expects an expression.
}
