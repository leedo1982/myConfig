" set the runtime path to include Vundle and initialize
" 플러그인 설치 
" so %
" BundleInstall
 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

    Plugin 'VundleVim/Vundle.vim'

    Plugin 'scrooloose/syntastic'

    Plugin 'tomasr/molokai'

    Plugin 'scrooloose/nerdtree'

    Plugin 'godlygeek/tabular'

    "마크다운 관련 플러그인
    Plugin 'JamshedVesuna/vim-markdown-preview'
"    Plugin 'valloric/youcompleteme'

    " f 검색시 한글도 포함 made by johngrib
    Plugin 'johngrib/vim-f-hangul'

call vundle#end()            " required
filetype plugin indent on    " required

" execute pathogen#infect()

set statusline+=%#warningmsg#
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" nerdTree setting
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" nerdTree 열면 nerdtree 창은 자동으로 닫힘 설정
let NERDTreeQuitOnOpen=1
" 숨겨진 파일까지 NERDTree에 표시되게 하는 옵션
let NERDTreeShowHidden=1

