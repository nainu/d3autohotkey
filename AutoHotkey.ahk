^SPACE::  Winset, Alwaysontop,On, A
^!SPACE::  Winset, Alwaysontop,Off, A

d3hwnd := InitDiabloHandle()


count := 0
centerX := 1
centerY := 1
width := 0
height := 0

F11::
InitDiabloHandle()
count++

if Mod(count, 2) = 1
{
  ControlClick,, ahk_id %d3hwnd%,, MIDDLE,, NA D x%centerX% y%centerY%
  ControlSend, , z, ahk_id %d3hwnd%
  SetTimer, Skill1, 3171
  SetTimer, Skill2, 1623
  SetTimer, skill3, 3305
  SetTimer, Skill4, 350607
  SetTimer, SkillQ, 30000
  SetTimer, SkillRBtn, 1009
  SetTimer, SkillLBtn, 12573
}
else
{
  ControlClick,, ahk_id %d3hwnd%,, MIDDLE,, NA U x%centerX% y%centerY%
  ControlSend, , z, ahk_id %d3hwnd%
  SetTimer, Skill1, off
  SetTimer, Skill2, off
  SetTimer, Skill3, off
  SetTimer, Skill4, off
  SetTimer, SkillQ, off
  SetTimer, SkillLBtn, off
  SetTimer, SkillRBtn, off
}
return

Skill1:
ControlSend, , 1, ahk_id %d3hwnd%
return
Skill2:
ControlSend, , 2, ahk_id %d3hwnd%
return
Skill3:
ControlSend, , 3, ahk_id %d3hwnd%
return
Skill4:
ControlSend, , 4, ahk_id %d3hwnd%
return
SkillQ:
ControlSend, , q, ahk_id %d3hwnd%
return
SkillLBtn:
Random,rx,centerX - 10, centerX + 20
Random,ry,centerY - 10, centerY + 100
ControlClick,, ahk_id %d3hwnd%,, MIDDLE,, NA D x%centerX% y%centerY%
ControlClick,, ahk_id %d3hwnd%,,L,, NA x%rx% y%ry%
return
SkillRBtn:
Random,rx,centerX - 10, centerX + 20
Random,ry,centerY -10 , centerY + 100
ControlClick,, ahk_id %d3hwnd%,, MIDDLE,, NA D x%centerX% y%centerY%
ControlClick,, ahk_id %d3hwnd%,,R,, NA x%rx% y%ry%
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
Send m
;ControlSend, , m, ahk_id %d3hwnd%
MenuClick(370,100)
MenuClick(200,333)
MouseMove, 160, 220
return

F9::
WinActivate,ahk_id %d3hwnd% 
CloseAllOpenedUI()
Send {ESC}
;ControlSend, , {ESC}, ahk_id %d3hwnd%
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
