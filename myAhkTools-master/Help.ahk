/* capslock ��忡�� ? �� �Է��ϸ� ������ ���´�.
*/
+VKBF::
	title := "����"
	help := ""
	help .= "��� ��ȯ		Capslock 		: ���/�Է¸�� ��ȯ`n"
	help .= "		shift+Capslock	: �빮�� �Է� ���`n"
	help .= "		Capslock+Space	: ��/�� ��� ��ȯ`n`n"
	
	help .= "��� ��� �� vi/vim ��Ÿ�� Ű ���`n"
	help .= "	HJKL, ^F, ^B, 0, ^, $, y, p, u`n"
	help .= "	(shift+) I, O	: �Է� ���� ��ȯ`n`n"
	
	help.= "v : ���־� ���`n`n"

	help .= "��� ��� �� ���콺 ����`n"
    help .= "	WASD : ���콺 �̵� (n+ : ����, m+ : ����, comma+ : 1�ȼ� ���� �̵�)`n"
	help .= "	Q E : Ŭ��, ��Ŭ�� / ^Q : Ŭ�� Ȧ�� (�巡��)`n"
	help .= "	R F : �� ����, �Ʒ���`n`n"

	help .= "���� �ΰ�����`n"
	help .= "	����+ 	QWEASDZXC	: â �̵� `n"
    help .= "	����+alt+	QWEASDZXC	: â Ȱ��ȭ`n"
	help .= "	����+ctrl+	QWEASDZXC	: ���콺 �̵�`n`n"

	help .= "AppsKey �ΰ�����`n"
	help .= "	AppsKey + �� ��   	 : ��ҹ��� ��ȯ`n" 
    help .= "	AppsKey + Esc    	 : â �����`n"
    help .= "	AppsKey + Shift + Esc     : ���� â ����`n`n"

    help .= "?	: ����`n"
    help .= "����+2	: ����`n"
	help .= "����+5	: ���ε�`n"
	help .= "����+t	: Ȱ��ȭ�� â�� �׻� ���� �ֵ��� ���� (���)`n`n"
	
	help .= "^``	: �߰� �� �����̽�`n"
	help.= "cmd â���� ^v : �츮 ��ΰ� ����ϴ� �� ���`n`n"
    help .= "������ : ������ ( johngrib82@gmail.com )`n���� : v2.01`n������ : 2014�� 1�� 16��, �ֽ� ������Ʈ: 2015�� 6�� 2��"
    MsgBox, 0, %title%, %help%
return