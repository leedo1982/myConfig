/* capslock 모드에서 ? 를 입력하면 도움말이 나온다.
*/
+VKBF::
	title := "도움말"
	help := ""
	help .= "모드 전환		Capslock 		: 명령/입력모드 전환`n"
	help .= "		shift+Capslock	: 대문자 입력 모드`n"
	help .= "		Capslock+Space	: 한/영 모드 전환`n`n"
	
	help .= "명령 모드 시 vi/vim 스타일 키 사용`n"
	help .= "	HJKL, ^F, ^B, 0, ^, $, y, p, u`n"
	help .= "	(shift+) I, O	: 입력 모드로 전환`n`n"
	
	help.= "v : 비주얼 모드`n`n"

	help .= "명령 모드 시 마우스 제어`n"
    help .= "	WASD : 마우스 이동 (n+ : 가속, m+ : 감속, comma+ : 1픽셀 단위 이동)`n"
	help .= "	Q E : 클릭, 우클릭 / ^Q : 클릭 홀드 (드래그)`n"
	help .= "	R F : 휠 위로, 아래로`n`n"

	help .= "한자 부가가능`n"
	help .= "	한자+ 	QWEASDZXC	: 창 이동 `n"
    help .= "	한자+alt+	QWEASDZXC	: 창 활성화`n"
	help .= "	한자+ctrl+	QWEASDZXC	: 마우스 이동`n`n"

	help .= "AppsKey 부가가능`n"
	help .= "	AppsKey + ↑ ↓   	 : 대소문자 변환`n" 
    help .= "	AppsKey + Esc    	 : 창 숨기기`n"
    help .= "	AppsKey + Shift + Esc     : 숨긴 창 복구`n`n"

    help .= "?	: 도움말`n"
    help .= "한자+2	: 종료`n"
	help .= "한자+5	: 리로드`n"
	help .= "한자+t	: 활성화된 창이 항상 위에 있도록 설정 (토글)`n`n"
	
	help .= "^``	: 추가 백 스페이스`n"
	help.= "cmd 창에서 ^v : 우리 모두가 사랑하는 그 기능`n`n"
    help .= "만든이 : 이종립 ( johngrib82@gmail.com )`n버전 : v2.01`n제작일 : 2014년 1월 16일, 최신 업데이트: 2015년 6월 2일"
    MsgBox, 0, %title%, %help%
return