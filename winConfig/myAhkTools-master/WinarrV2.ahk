#SingleInstance 
#Persistent
#Include CapslockMode.ahk	;ĸ���� ���� �Բ� on/off �� Ű ����
#Include Hanja.ahk		;���� Ű ���� ��ɵ�
#Include Help.ahk		;����
#Include Mouse.ahk		;���콺 ����
#Include WinKey.ahk		;winŰ �� winŰ�� ���յǴ� Ű ����
#Include Vim.ahk		;vi/vim �䳻 ���
#Include AppsKey.ahk	;AppsKey ���


SetDefaultMouseSpeed, 0 
SetKeyDelay, -1
SetMouseDelay, -1

; ���α׷� ���۽� capslock �� ��ũ�� ���� �ʴ� ��찡 ���� �� �����Ƿ� 
; �ݵ�� ĸ���� ���¸� üũ�Ͽ� ��带 ��ȯ�� �־�� �Ѵ�.
changeMode("auto")


/* �� �����̽� ��� ctrl + ~ 
*/
^SC029::Send {BackSpace}

/* Eclipse vrapper �ѱ� �Է� ����
	vrapper (VIM for eclipse) ����� ���� ���
	ESC �� : �� ������ �ѱ� ��带 �������� �ٲ۴�.
*/
#IfWinActive, ahk_class SWT_Window0
	~Esc::
	~+SC027::
		ret:=IME_CHECK("A")  ; �ѱ�üũ
		if(ret = 1) {
			Send, {VK15}    ; �ѱ��̸� ��/��Ű�� �Է��Ͽ� �������� ��ȯ
		}
	return
#IfWinActive

/*
RWin:: 
		ret:=IME_CHECK("A")  ; �ѱ�üũ
		if(ret = 1) {
			Send, {VK15}    ; �ѱ��̸� ��/��Ű�� �Է��Ͽ� �������� ��ȯ
		}
	Send, {Esc}
return
*/

/* ��/�� ��ȯ Capslock + Space �� �̿��� �� �ֵ���
*/
CapsLock & Space::Send, {VK15}


;*******************************************************************************
; functions
;*******************************************************************************
/*
	IME üũ (�ѱ� �Է±� üũ)
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
