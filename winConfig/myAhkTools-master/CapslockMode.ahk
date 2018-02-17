/*	capslock 키를 모드 전환 키로 사용한다
	모드 0 : command 모드 - vim 의 노말 모드와 같은 방향키 네비게이션 , 마우스 제어 등이 주 기능
	모드 1 : insert 모드 - 평범한 키보드 입력을 할 수 있는 모드
	모드 2 : capslock 모드 - capslock 을 평범한 용도로 사용할 수 있는 모드 
*/
CapsLock::
+Capslock::
^CapsLock::
{
    ctrlFlag := GetKeyState("Control")	; window / super 키가 없는 키보드를 위한 기능  ctrl + capslock 을 누르면 윈도우 키 기능을 한다
	if(ctrlFlag == 1){
		Send, {Control up}{LWin}
		return
	}
	
	GetKeyState, lockState, CapsLock, T)
	if(lockState == "D"){
		SetCapsLockState, Off
	} else {
		SetCapsLockState, On
	}

	;Send, {CapsLock}
	if(1 == GetKeyState("shift", "P")){
		changeMode("caps")
	} else {
		changeMode("auto")	
	}
	Send, {LShift up}
return
}

/* window key imitation 
	배열이 없는 언어이기 때문에 아래와 같은 냄새나는 코드를 작성해야 한다. 더 좋은 방법은 없을까.
*/
CapsLock & b::Send, #b			; task bar 숨겨진 아이콘 선택
CapsLock & d::Send, #d			; 바탕화면 보기
CapsLock & e::Send, #e			; 내 컴퓨터
;CapsLock & f:: Send, #f			; 검색 ( 잘 안 쓰는 기능이라 다른 기능을 붙일까 고민중)
CapsLock & m::Send, #m		; 모든 창 최소화 (잘 안 쓰는 기능이라 다른 기능을 붙일까 고민중)
CapsLock & p::Send, #p			; 프로젝터 모니터 옵션 (복제, 확장 등)
CapsLock & r::Send, #r			; 실행
CapsLock & t::Send, #t			; task bar 의 아이콘들 각각 전체화면 미리보기
CapsLock & u::Send, #u			; 접근성 센터 열기 (잘 안 쓰는 기능이라 다른 기능을 붙일까 고민중)
;CapsLock & x::Send, #x			; 모바일 센터 

/* ctrl key imitation
*/
CapsLock & a::Send, ^a			;전체 선택 
CapsLock & c::Send, ^c			;copy
CapsLock & f::Send, ^f			;find
CapsLock & s::Send, ^s			;save
CapsLock & v::Send, ^v			;paste
CapsLock & w::Send, ^w		;close tab
CapsLock & x::Send, ^x			;cut
CapsLock & z::Send, ^z			;undo

/* 창 위치 조정
*/
CapsLock & h::Send, #{Left}
CapsLock & j::Send, #{Down}
CapsLock & k::Send, #{Up}
CapsLock & l::Send, #{Right}

/* MS Windows 의 cmd 창에서 ctrl + v 조합을 사용할 수 있게 한다.
*/
#IfWinActive	ahk_class ConsoleWindowClass 
	^V:: 
		SendInput {Raw}%clipboard% 
	return 
#IfWinActive


/* capslock 모드 변환 함수
*/
changeMode(opt)
{
	KeyWait, CapsLock
	GetKeyState, lockState, CapsLock, T)
	;option = off
	If(lockState = "D" && opt == "auto")	{
		option = on
		msg := "---- COMMAND MODE ----"
		showToolTip(msg, 1000, 1000)
	} else If(lockState = "D" && opt == "caps")	{
		option = off
		msg := "CAPSLOCK"
		showToolTip(msg, 1000, 1000)
	} else {
		option = off
		msg := "insert mode"
		showToolTip(msg, 1000, 1000)
	}

	Hotkey, $w, %option%
	Hotkey, $a, %option%
	Hotkey, $s, %option%
	Hotkey, $d, %option%
	Hotkey, q, %option%
	Hotkey, ^q, %option%
	Hotkey, e, %option%
	Hotkey, r, %option%
	Hotkey, f, %option%
	Hotkey, ^f, %option%
	Hotkey, *i, %option%
	Hotkey, *o, %option%
	Hotkey, ^b, %option%
	Hotkey, *h, %option%
	Hotkey, *j, %option%
	Hotkey, *k, %option%
	Hotkey, *l, %option%
	Hotkey, 0, %option%
	Hotkey, $n, %option%
	Hotkey, $m, %option%
	Hotkey, SC033, %option%
;	Hotkey, x, %option%
;	Hotkey, +x, %option%
	Hotkey, +6, %option%
	Hotkey, +4, %option%
	Hotkey, v, %option%
	Hotkey, +v, %option%
	Hotkey, *y, %option%
	Hotkey, p, %option%
	Hotkey, *u, %option%
	Hotkey, VKBF, %option%
	Hotkey, +VKBF, %option%
	;//SetTimer, showModeToolTip, 0
return	
}




/* 툴팁 표시 함수
*/
showToolTip(msg, sec, afterSec)
{
	CoordMode, ToolTip, screen
	ToolTip, %msg%, A_ScreenWidth/2, A_ScreenHeight
	if(sec > 0)
		SetTimer, RemoveToolTip, off
	if(afterSec > 0){
		SetTimer, showModeToolTip, off
	}
	return
}
RemoveToolTip:
	SetTimer, RemoveToolTip, Off
	ToolTip
return
showModeToolTip:
	KeyWait, CapsLock
	GetKeyState, lockState, CapsLock, T
	If(lockState = "D")	{
		showToolTip("-- COMMAND MODE --", -1, -1)
	} else {
		showToolTip("-- INSERT --", -1, -1)
	}
return
