/*
	move, activate window / move mouse pointer
*/
*#Delete::
*#End::
*#PGDN::
*#Insert::
*#Home::
*#PGUP::
{
    ctrlFlag := GetKeyState("Control")
    altFlag := GetKeyState("Alt")
	;var := % SubStr(A_ThisHotkey, 9)
		if(A_ThisHotkey == "*#Delete")
		var = 1
	if(A_ThisHotkey == "*#End")
		var = 2
	if(A_ThisHotkey == "*#PGDN")
		var = 3
	if(A_ThisHotkey == "*#Insert")
		var = 7
	if(A_ThisHotkey == "*#Home")
		var = 8
	if(A_ThisHotkey == "*#PGUP")
		var = 9
	
    if(!ctrlFlag && !altFlag){
   	 WinGetTitle, title, A
   	 moveWindow(var, title)
    }else if(!ctrlFlag && altFlag){
   	 moveMouse9Way(var)
   	 MouseGetPos, , , varWin
   	 WinActivate, ahk_id %varWin%
    }else if(ctrlFlag && !altFlag){
   	 moveMouse9Way(var)
    }
    return
}

/*
    윈도우 사이즈 조정 및 이동 함수
*/
moveWindow(var, title){
    trayLoc := getTaskbarEdge()
    scTop := getScreenFence("top", trayLoc)
    scLeft := getScreenFence("left", trayLoc)
    scWidth := getScreenFence("width", trayLoc)
    scHeight := getScreenFence("height",trayLoc)

    xx := scLeft,    ww := scWidth / 2
    yy := scTop,    hh := scHeight / 2

    if(var <= 3){
		yy := scTop + hh
    } else if(var <= 6){
		hh := scHeight
    }
    
    if(2 = Mod(var, 3))    {
   	 ww := scWidth
    } else if(0 = Mod(var, 3)) {
   	 xx := scLeft + scWidth / 2
    }
    WinMove, % title, , xx, yy, ww, hh
    return 0
}

/*
    작업 tray 의 위치를 리턴하는 함수
	@return : "top", "bot", "left", "right"
*/
getTaskbarEdge() {
  WinGetPos,TX,TY,TW,TH,ahk_class Shell_TrayWnd,,,
  if (TW = A_ScreenWidth) {
    return TY = 0 ? "top" : "bot"
  } else {
    return TX = 0 ? "left" : "right"
  }
}

/*
    화면의 경계 좌표를 구하는 함수.
*/
getScreenFence(var, loc){
    WinGetPos,TX,TY,TW,TH,ahk_class Shell_TrayWnd,,,
    if(var = "top"){
   	 return loc = var ? TH : 0
    }else if(var = "left"){
   	 return loc = var ? TW : 0
    }else if(var = "width"){
   	 return loc = "top" or loc = "bot" ? A_ScreenWidth : A_ScreenWidth - TW
    }else if(var = "height"){
   	 return loc = "top" or loc = "bot" ? A_ScreenHeight - TH : A_ScreenHeight
    }
}

/*
    마우스 포인터를 9 방향으로 이동시키는 함수
*/
moveMouse9Way(var){
    trayLoc := getTaskbarEdge()
    scTop := getScreenFence("top",trayLoc)
    scLeft := getScreenFence("left",trayLoc)
    scWidth := getScreenFence("width",trayLoc)
    scHeight := getScreenFence("height",trayLoc)

    xx := scWidth / 4
    yy := scHeight / 4

    if(var <= 3){
   	 yy := scTop + 3 * yy
    } else if(var <= 6){
   	 yy := scTop + 2 * yy
    }
    
    if(2 = Mod(var, 3))    {
   	 xx := scLeft + 2 * xx
    } else if(0 = Mod(var, 3)) {
   	 xx := scLeft + 3 * xx
    }
    WinMove, % title, , xx, yy, ww, hh
    CoordMode, mouse, screen
    MouseMove, xx, yy, 0
}
