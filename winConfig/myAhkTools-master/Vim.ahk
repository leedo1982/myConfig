
^b::Send, {PGUP}

/* / Ű ���� ����
	(Capslock Mode) / : �˻� (^f)
	(Capslock Mode) ? : ���� 
*/
VKBF::Send,^f

/* i, o Ű�� �Է� ���� ��ȯ (vim �� ���� ��ɰ����� �ܼ��� Ű��Ʈ��ũ�� ������ ���̴�)
*/
*i::
*o::
	SetCapsLockState, Off
	GetKeyState, isShiftDown, Shift, P
	changeMode("auto")
	if(A_ThisHotkey == "*i"){
		if("D" == isShiftDown) 
			Send, {Home}
	} else if (A_ThisHotkey == "*o"){
		if("D" == isShiftDown) 
			Send, {Up}
		Send, {End}{Enter}
	}
return

*y::Send {LShift up}^c
p::Send ^v
*u::Send ^z

/*	 �����ؼ� ����
x Ű�� ���� (vi/vim ��Ÿ��)
x::Send, {Delete}
+x::Send, {BackSpace}
*/

/*	0, ^ �� $ �� Home, End
*/
+6::Send, {Home}
+4::Send, {End}
0:: Send {Home}

/*	hjkl �� ����Ű ��� 
*/
*h::Send {Left}
*j::Send {Down}
*k::Send {Up}
*l::Send {Right}

/*	visual mode
*/
v::
+v::
	if(1 == GetKeyState("LShift", "D")){
		Send {LShift up}
	} else {
		send {LShift down}
	}
return
