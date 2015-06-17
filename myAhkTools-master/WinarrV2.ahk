#SingleInstance 
#Persistent
#Include CapslockMode.ahk	;캡스락 모드와 함께 on/off 될 키 설정
#Include Hanja.ahk		;한자 키 관련 기능들
#Include Help.ahk		;도움말
#Include Mouse.ahk		;마우스 관련
#Include WinKey.ahk		;win키 및 win키와 조합되는 키 설정
#Include Vim.ahk		;vi/vim 흉내 기능
#Include AppsKey.ahk	;AppsKey 기능


SetDefaultMouseSpeed, 0 
SetKeyDelay, -1
SetMouseDelay, -1

; 프로그램 시작시 capslock 과 싱크가 맞지 않는 경우가 있을 수 있으므로 
; 반드시 캡스락 상태를 체크하여 모드를 변환해 주어야 한다.
changeMode("auto")


/* 백 스페이스 기능 ctrl + ~ 
*/
^SC029::Send {BackSpace}

/* Eclipse vrapper 한글 입력 관련
	vrapper (VIM for eclipse) 사용을 위한 기능
	ESC 나 : 를 누르면 한글 모드를 영문으로 바꾼다.
*/
#IfWinActive, ahk_class SWT_Window0
	~Esc::
	~+SC027::
		ret:=IME_CHECK("A")  ; 한글체크
		if(ret = 1) {
			Send, {VK15}    ; 한글이면 한/영키를 입력하여 영문으로 변환
		}
	return
#IfWinActive

/*
RWin:: 
		ret:=IME_CHECK("A")  ; 한글체크
		if(ret = 1) {
			Send, {VK15}    ; 한글이면 한/영키를 입력하여 영문으로 변환
		}
	Send, {Esc}
return
*/

/* 한/영 전환 Capslock + Space 로 이용할 수 있도록
*/
CapsLock & Space::Send, {VK15}


;*******************************************************************************
; functions
;*******************************************************************************
/*
	IME 체크 (한글 입력기 체크)
*/
IME_CHECK(WinTitle)
{
	WinGet,hWnd,ID,%WinTitle%
	Return Send_ImeControl(ImmGetDefaultIMEWnd(hWnd),0x005,"")
}
Send_ImeControl(DefaultIMEWnd, wParam, lParam)
{
	DetectSave := A_DetectHiddenWindows 	 
	DetectHiddenWindows,ON                     	 

 	SendMessage 0x283, wParam,lParam,,ahk_id %DefaultIMEWnd%
	if (DetectSave <> A_DetectHiddenWindows)
    	DetectHiddenWindows,%DetectSave%
	return ErrorLevel
}
ImmGetDefaultIMEWnd(hWnd)
{
	return DllCall("imm32\ImmGetDefaultIMEWnd", Uint,hWnd, Uint)
}
