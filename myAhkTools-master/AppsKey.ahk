
/*	Appskey (context menu key) �� ������ ����� ������ �� �ֵ��� �Ѵ�.  
    ���, Ű�� ���� �� ����� �۵����� �ʰ�, Ű��  �ö�� �� �۵��Ѵ�
	*/
AppsKey::Send, {AppsKey}

/* Capslock extention -> capslock �� �� ���鼭 appskey �� ��ü
    ������ ���ڿ��� ���� �빮��/�ҹ��ڷ� ��ȯ���ش�
*/
AppsKey & Up::
AppsKey & Down::
{
; ��ó�� : ���� �غ�
    key := % SubStr(A_ThisHotkey,11)
    old := ClipboardAll   						 ; ���� Ŭ������ ����
    Clipboard := ""   							 ; Ȥ�� �𸣴� Clipboard �� ����д�
    Send, ^c   									 
    ClipWait 0.5
   	 if (ErrorLevel){   						 ; ���� �߻��� ���� Ŭ������ ����
   		 Clipboard := old
   		 return
   	 }
; ���� ó�� : �ҹ��� / �빮�� ��ȯ
    if("Up" = key || "a" = key)
   	 StringUpper, Clipboard, Clipboard    
    else if ("Down" = key || "z" = key)
   	 StringLower, Clipboard, Clipboard
; ��ó�� : ���󺹱�
    Send, ^v   									 ; ��ȯ�� ���ڿ��� �ٿ��ְ�
    Clipboard := old   						 ; Ŭ������ ����
    Return
}

/*
	Boss Key : ������ �����츦 �����ش�. ������ ���� ����.
*/
AppsKey & Esc::
{
    If (GetKeyState("shift")){    		 ; shift Ű�� �Բ� ���ȴٸ� ���� �۾�
   	 Loop Parse, invisWins, |    
   		 WinShow ahk_id %A_LoopField%
   	 invisWins := ""
    } else {    									 ; shift Ű �Է��� ���ٸ� ���� �۾�
   	 activeWin := WinExist("A")
   	 invisWins .= (invisWins ? "|" : "") . activeWin
   	 WinHide ahk_id %activeWin%
   	 GroupActivate All
    }
    return
}

/*
   capslock Ű�� ���� ���� ����� ���� 
AppsKey & LControl::
	if(1 == GetKeyState("CapsLock", "T")){
		SetCapsLockState, off
	} else {
		SetCapsLockState, on
	}

		if(1 == GetKeyState("shift", "P")){
		changeMode("caps")
	} else {
		changeMode("auto")	
	}
return
*/
