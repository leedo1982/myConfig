/*	한자 키 조작 관련
	한자 : 한자
	한자 + 5 : 프로그램 리로드
	한자 +2 : 프로그램 종료
	한자 + t : 현재 활성화된 창을 항상 제일 위에
*/
SC11D:: Send, {SC11D}
SC11D & 5::Reload
SC11D & 2::ExitApp
SC11D & t::WinSet, AlwaysOnTop, Toggle, A

/*
	move, activate window / move mouse pointer
*/
SC11D & q::
SC11D & w::
SC11D & e::
SC11D & a::
SC11D & s::
SC11D & d::
SC11D & z::
SC11D & x::
SC11D & c::
{
    ctrlFlag := GetKeyState("LControl")
    altFlag := GetKeyState("Alt")
	;var := % SubStr(A_ThisHotkey, 9)
	if(A_ThisHotkey == "SC11D & z")
		var = 1
	if(A_ThisHotkey == "SC11D & x")
		var = 2
	if(A_ThisHotkey == "SC11D & c")
		var = 3
	if(A_ThisHotkey == "SC11D & a")
		var = 4
	if(A_ThisHotkey == "SC11D & s")
		var = 5
	if(A_ThisHotkey == "SC11D & d")
		var = 6
	if(A_ThisHotkey == "SC11D & q")
		var = 7
	if(A_ThisHotkey == "SC11D & w")
		var = 8
	if(A_ThisHotkey == "SC11D & e")
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
