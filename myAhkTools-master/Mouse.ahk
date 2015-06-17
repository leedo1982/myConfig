/*
	wasd 로 마우스 조작
	n + wasd :	매우 빠름
	wasd : 				표준 움직임
	m + wasd : 	느린 움직임
	, + wasd : 		1 픽셀 단위로 움직임
*/
$w::
$a::
$s::
$d::
	; 만약 control 키와 조합한다면 본래의 기능을 수행한다
	if(1 == GetKeyState("control", "P")){
		sKey := "^" . SubStr(A_ThisHotkey, 3)
		Send, % GetKeyState("shift", "P")
		return
	}
	
	; 속도 조절은 n, (중립), m, shift 순으로 조절한다
	mul = 70
	if(1 == GetKeyState("n", "P")){
		mul = 400
	} else if ( 1 == GetKeyState("m", "P")){
		mul = 10
	} else if ( 1 == GetKeyState("SC033", "P")){
		mul = 1
	}
	leftFlag := GetKeyState("a", "P") * -1 * mul
	rightFlag := GetKeyState("d", "P") * mul
	upFlag := GetKeyState("w", "P") * -1 * mul
	downFlag := GetKeyState("s", "P") * mul
	MouseMove, % leftFlag + rightFlag, upFlag + downFlag, 0, R
return

$n::return
$m::return
SC033::return

/*
	Q, E : 클릭, 우클릭
	^Q : 클릭 홀드 (드래그)
	r, f : 휠 up, down
	^f : page down
	^b : page up
*/
q::
^q::
	if(1 == GetKeyState("Control", "P")){
		MouseClick, Left, , , , , D
	} else {
		MouseClick
	}
return
e::MouseClick,Right
r::MouseClick, WheelUp
f::
^f::
	if(1 == GetKeyState("Control", "P")){
		Send, {PGDN}
	} else {
		MouseClick, WheelDown
	}
return