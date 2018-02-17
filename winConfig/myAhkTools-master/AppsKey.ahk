
/*	Appskey (context menu key) 가 본래의 기능을 수행할 수 있도록 한다.  
    대신, 키를 눌릴 때 기능이 작동하지 않고, 키가  올라올 때 작동한다
	*/
AppsKey::Send, {AppsKey}

/* Capslock extention -> capslock 을 안 쓰면서 appskey 로 대체
    선택한 문자열을 전부 대문자/소문자로 변환해준다
*/
AppsKey & Up::
AppsKey & Down::
{
; 전처리 : 변수 준비
    key := % SubStr(A_ThisHotkey,11)
    old := ClipboardAll   						 ; 기존 클립보드 보존
    Clipboard := ""   							 ; 혹시 모르니 Clipboard 를 비워둔다
    Send, ^c   									 
    ClipWait 0.5
   	 if (ErrorLevel){   						 ; 에러 발생시 기존 클립보드 복구
   		 Clipboard := old
   		 return
   	 }
; 메인 처리 : 소문자 / 대문자 변환
    if("Up" = key || "a" = key)
   	 StringUpper, Clipboard, Clipboard    
    else if ("Down" = key || "z" = key)
   	 StringLower, Clipboard, Clipboard
; 후처리 : 원상복구
    Send, ^v   									 ; 변환된 문자열을 붙여넣고
    Clipboard := old   						 ; 클립보드 복구
    Return
}

/*
	Boss Key : 지정한 윈도우를 숨겨준다. 갯수는 제한 없다.
*/
AppsKey & Esc::
{
    If (GetKeyState("shift")){    		 ; shift 키가 함께 눌렸다면 복구 작업
   	 Loop Parse, invisWins, |    
   		 WinShow ahk_id %A_LoopField%
   	 invisWins := ""
    } else {    									 ; shift 키 입력이 없다면 숨김 작업
   	 activeWin := WinExist("A")
   	 invisWins .= (invisWins ? "|" : "") . activeWin
   	 WinHide ahk_id %activeWin%
   	 GroupActivate All
    }
    return
}

/*
   capslock 키가 없을 때를 대비한 조합 
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
