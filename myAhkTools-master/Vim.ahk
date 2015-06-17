
^b::Send, {PGUP}

/* / 키 조작 관련
	(Capslock Mode) / : 검색 (^f)
	(Capslock Mode) ? : 도움말 
*/
VKBF::Send,^f

/* i, o 키로 입력 모드로 전환 (vim 과 같은 기능같지만 단순히 키스트로크를 예약한 것이다)
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

/*	 위험해서 봉인
x 키로 삭제 (vi/vim 스타일)
x::Send, {Delete}
+x::Send, {BackSpace}
*/

/*	0, ^ 와 $ 로 Home, End
*/
+6::Send, {Home}
+4::Send, {End}
0:: Send {Home}

/*	hjkl 로 방향키 대용 
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
