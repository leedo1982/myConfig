/*	capslock Ű�� ��� ��ȯ Ű�� ����Ѵ�
	��� 0 : command ��� - vim �� �븻 ���� ���� ����Ű �׺���̼� , ���콺 ���� ���� �� ���
	��� 1 : insert ��� - ����� Ű���� �Է��� �� �� �ִ� ���
	��� 2 : capslock ��� - capslock �� ����� �뵵�� ����� �� �ִ� ��� 
*/
CapsLock::
+Capslock::
^CapsLock::
{
    ctrlFlag := GetKeyState("Control")	; window / super Ű�� ���� Ű���带 ���� ���  ctrl + capslock �� ������ ������ Ű ����� �Ѵ�
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
	�迭�� ���� ����̱� ������ �Ʒ��� ���� �������� �ڵ带 �ۼ��ؾ� �Ѵ�. �� ���� ����� ������.
*/
CapsLock & b::Send, #b			; task bar ������ ������ ����
CapsLock & d::Send, #d			; ����ȭ�� ����
CapsLock & e::Send, #e			; �� ��ǻ��
;CapsLock & f:: Send, #f			; �˻� ( �� �� ���� ����̶� �ٸ� ����� ���ϱ� �����)
CapsLock & m::Send, #m		; ��� â �ּ�ȭ (�� �� ���� ����̶� �ٸ� ����� ���ϱ� �����)
CapsLock & p::Send, #p			; �������� ����� �ɼ� (����, Ȯ�� ��)
CapsLock & r::Send, #r			; ����
CapsLock & t::Send, #t			; task bar �� �����ܵ� ���� ��üȭ�� �̸�����
CapsLock & u::Send, #u			; ���ټ� ���� ���� (�� �� ���� ����̶� �ٸ� ����� ���ϱ� �����)
;CapsLock & x::Send, #x			; ����� ���� 

/* ctrl key imitation
*/
CapsLock & a::Send, ^a			;��ü ���� 
CapsLock & c::Send, ^c			;copy
CapsLock & f::Send, ^f			;find
CapsLock & s::Send, ^s			;save
CapsLock & v::Send, ^v			;paste
CapsLock & w::Send, ^w		;close tab
CapsLock & x::Send, ^x			;cut
CapsLock & z::Send, ^z			;undo

/* â ��ġ ����
*/
CapsLock & h::Send, #{Left}
CapsLock & j::Send, #{Down}
CapsLock & k::Send, #{Up}
CapsLock & l::Send, #{Right}

/* MS Windows �� cmd â���� ctrl + v ������ ����� �� �ְ� �Ѵ�.
*/
#IfWinActive	ahk_class ConsoleWindowClass 
	^V:: 
		SendInput {Raw}%clipboard% 
	return 
#IfWinActive


/* capslock ��� ��ȯ �Լ�
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




/* ���� ǥ�� �Լ�
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
