/*
	wasd �� ���콺 ����
	n + wasd :	�ſ� ����
	wasd : 				ǥ�� ������
	m + wasd : 	���� ������
	, + wasd : 		1 �ȼ� ������ ������
*/
$w::
$a::
$s::
$d::
	; ���� control Ű�� �����Ѵٸ� ������ ����� �����Ѵ�
	if(1 == GetKeyState("control", "P")){
		sKey := "^" . SubStr(A_ThisHotkey, 3)
		Send, % GetKeyState("shift", "P")
		return
	}
	
	; �ӵ� ������ n, (�߸�), m, shift ������ �����Ѵ�
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
	Q, E : Ŭ��, ��Ŭ��
	^Q : Ŭ�� Ȧ�� (�巡��)
	r, f : �� up, down
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