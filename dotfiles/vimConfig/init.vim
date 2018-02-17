" init.vim : .nvimrc
" location of init.vim : ../

" for deoplete plugin
    function! DoRemote(arg)
        UpdateRemotePlugins
    endfunction

" Vim-Plug 설정 ------------------------------------------------------------------
" 아래와 같이 설정한 다음 :PlugInstall<CR> 해주면 된다.
filetype off 
set rtp+=~/.vim/bundle/vundle.vim

call plug#begin('~/.vim/plugged')
"    Plug 'tpope/vim-fugitive'          " git wrapper
"    Plug 'scrooloose/nerdtree'
"    Plug 'jistr/vim-nerdtree-tabs'
"    Plug 'scrooloose/syntastic'        " 파일을 저장할 때 자동으로 문법 검사
    Plug 'tpope/vim-surround'
"    Plug 'bling/vim-airline'           " TAB navigator, status line 을 제공한다.
    Plug 'luochen1990/rainbow'         " 괄호를 level 별로 다르게 색칠한다. html 태그에도 적용.
    Plug 'kshenoy/vim-signature'       " m mark 위치를 표시해준다.
    Plug 'airblade/vim-gitgutter'      " git diff 를 라인 넘버 옆에 표시.
    Plug 'easymotion/vim-easymotion'
  "  Plug 'johngrib/FlatColor-johngrib' " color theme
    Plug 'godlygeek/tabular'           " 텍스트 세로 정렬 도구
    Plug 'ap/vim-css-color'           " #rrggbb 형식의 문자열에 색깔을 입혀준다.
    Plug 'tpope/vim-commentary'
    Plug 'junegunn/vim-xmark', { 'do': 'make' }
    Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        Plug 'junegunn/fzf.vim'
    Plug 'matchit.zip'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'taglist.vim'
    Plug 'othree/eregex.vim'
    " Plug 'sirver/ultisnips'
        " Plug 'honza/vim-snippets'
    "Plug 'yggdroot/indentline'        " 문자열 ** 을 hidden 상태로 바꾼다. 몹시 짜증남. 다시는 설치하지 말 것.
    "Plug 'raimondi/delimitmate'        " 따옴표, 괄호 등을 입력하면 닫는 따옴표,괄호를 추가해준다.
    Plug 'valloric/youcompleteme', { 'do': './install.py --all'}
    "Plug 'junegunn/vim-peekaboo'
call plug#end()


syntax on
filetype plugin indent on " Put your non-Plugin stuff after this line

" set ----------------------------------------------------------------------
    if executable('ag')
        set grepprg=ag\ --nogroup\ --nocolor\ --column
        set grepformat=%f:%l:%c%m
    elseif executable('ack')
        set grepprg=ack\ --nogroup\ --column\ $*
        set grepformat=%f:%l:%c:%m
    endif

    if has("nvim")
        set termguicolors
        set clipboard+=unnamedplus
    endif

    if has("gui_macvim")
        set macmeta
        set guifont=Meslo\ LG\ M\ DZ\ for\ Powerline:h11
    endif

    "set noimd  " normal 모드에서 한국어 입력시에도 영문으로 입력한 것처럼 동작 -> 제대로 작동하지 않는다.
    set nocompatible                  " vi 기능을 사용하지 않고, vim 만의 기능을 사용.
    " set linebreak                     " break at word boundary
    set showbreak=+++\ 
    set list listchars=tab:»·,trail:·,extends:>,precedes:<
    set omnifunc=syntaxcomplete#Complete
    set mouse=a

    set hidden

    set smartcase ignorecase hlsearch incsearch
    "set tildeop    "~ 를 다른 오퍼레이터와 함께 사용한다.
    set wmnu        " tab 자동완성시 가능한 목록을 보여줌

    " 화면 표시
    set nu               " 라인 넘버 출력
    set ruler            " 현재 커서 위치 (row, col) 좌표 출력
    set noerrorbells     " 에러 알림음 끄기
    set background=dark  " 검정배경을 사용 (이 색상에 맞춰 문법 하이라이트 색상이 달라짐.)
    set laststatus=2     " 상태바를 언제나 표시할 것
    set showmatch        " 일치하는 괄호 하이라이팅
    set cursorline       " highlight current line
    set lazyredraw       " redraw only when we need to.
    "set showcmd         " airline 플러그인과 충돌하기 때문에 주석처리
    "set nowrap
    " set sidescroll=2 sidescrolloff=10
    set wildmenu wildignorecase
    set wildmode=full

    set noerrorbells visualbell t_vb= " 사운드 벨, 비주얼 벨 비활성화
    autocmd GUIEnter * set visualbell t_vb=

    "사용
    set bs=indent,eol,start  " backspace 키 사용 가능
    set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab
    "set noimd               " no imdisable 한글 입력기 관련인데 mac 에서는 안 통하는듯
    set cindent autoindent smartindent
    set history=200 undolevels=2000
    set cursorcolumn
    set langmap=ㅁa,ㅠb,ㅊc,ㅇd,ㄷe,ㄹf,ㅎg,ㅗh,ㅑi,ㅓj,ㅏk,ㅣl,ㅡm,ㅜn,ㅐo,ㅔp,ㅂq,ㄱr,ㄴs,ㅅt,ㅕu,ㅍv,ㅈw,ㅌx,ㅛy,ㅋz

"    colorscheme flatcolor-johngrib

    "if has("syntax")
    "syntax on
    "endif

" initialize 설정 ---------------------------------------------------------------

" 마지막으로 수정된 곳에 커서를 위치함
    au BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "norm g`\"" |
    \ endif

" map ----------------------------------------------------------------------
    nnoremap <Space>e :browse oldfiles<CR>
    nnoremap <f5> :!ctags -R<CR>

    nnoremap k gk
    nnoremap gk k
    nnoremap j gj
    nnoremap gj j

    nnoremap & :&&<CR>
    xnoremap & :&&<CR>

    "nnoremap <F10>r :source ~/.vimrc<CR>
    nnoremap <F10>r :source ~/.config/nvim/init.vim<CR>
    "nnoremap gv `[v`]    " highlight last inserted text
    nnoremap <NL> i<CR><ESC>

    " copy , paste , select 기능 보완
    nnoremap Y y$
    nnoremap <Space>y "*y
    nnoremap <Space>Y "*yg_
    vnoremap <Space>y "*y
    nnoremap <Space>p "*p
    nnoremap <Space>P "*P
    nnoremap <Space>a gg<S-v>G
    "nnoremap gn       :call ToggleNumber()<cr>
    nnoremap <F3>     :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

    " 버퍼 관리
    if has('mac')
        nnoremap † :enew<CR>          " 새로운 버퍼를 연다
        nnoremap ≤ :bprevious!<CR>    " 이전 버퍼로 이동
        nnoremap ≥ :bnext!<CR>        " 다음 버퍼로 이동
        nnoremap œ :bp <BAR> bd #<CR> " 현재 버퍼를 닫고 이전 버퍼로 이동
    endif
    nnoremap <M-t> :enew<CR>          " 새로운 버퍼를 연다
    nnoremap <M-.> :bnext!<CR>        " 다음 버퍼로 이동
    nnoremap <M-,> :bprevious!<CR>    " 이전 버퍼로 이동
    nnoremap <M-q> :bp <BAR> bd #<CR> " 현재 버퍼를 닫고 이전 버퍼로 이동

    "Bubble lines
    if has('mac')
        nnoremap ˚ ddkP
        nnoremap ∆ ddp
        vnoremap ˚ xkP`[V`]
        vnoremap ∆ xp`[V`]
    endif
    nnoremap <M-k> ddkP
    nnoremap <M-j> ddp
    vnoremap <M-k> xkP`[V`]
    vnoremap <M-j> xp`[V`]

    " nnoremap gV `[v`]

" Plugin 설정 -------------------------------------------------------------------

    " NERDTree
    let NERDTreeShowHidden = 1 "Show hidden files in NerdTree
    nnoremap <F12>n :NERDTreeToggle<CR>
    nnoremap <F12>m :NERDTreeMirrorToggle<CR>
    nnoremap <F12>s :NERDTreeTabsFind<CR>

    " rainbow
    nnoremap <F12>r :RainbowToggle<CR>

    " Easy motion
    "let g:EasyMotion_do_mapping  = 0 " Disable default mappings
    let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
    let g:EasyMotion_smartcase = 1
    map  <Space>  <Plug>(easymotion-prefix)
    vmap s        <Plug>(easymotion-bd-f)
    nmap s        <Plug>(easymotion-overwin-f2)
    nmap <Space>l <Plug>(easymotion-lineforward)
    nmap <Space>j <Plug>(easymotion-j)
    nmap <Space>k <Plug>(easymotion-k)
    nmap <Space>h <Plug>(easymotion-linebackward)

    " indentline 설정
    nnoremap <F12>i :IndentLinesToggle<CR>

    " Syntastic 설정
    " https://thechefprogrammer.blogspot.kr/2014/05/syntax-check-for-php-and-javascript.html
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_php_checkers = ['php']
    "let g:syntastic_check_on_wq = 0
    "let g:syntastic_mode_map = { 'mode': 'passive' }
    "nnoremap <silent> <F6> :SyntasticCheck<CR>

    " vim-airline 설정
    " @link http://bakyeono.net/post/2015-08-13-vim-tab-madness-translate.html
    let g:airline#extensions#tabline#enabled = 1     " vim-airline 버퍼 목록 켜기
    let g:airline#extensions#tabline#fnamemod = ':t' " vim-airline 버퍼 목록 파일명만 출력
    let g:airline#extensions#tabline#buffer_nr_show = 1 " buffer number 를 보여준다
    let g:airline#extensions#tabline#buffer_nr_format = '%s:' " buffer number format

    " air-line
     let g:airline_powerline_fonts = 1

    " rainbow
    let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

    " tabular
    vnoremap <C-t> :Tabularize /

    " peekaboo 관련
    " let g:peekaboo_window = 'vertical botright 30new'
    " let g:peekaboo_delay = 0
    " let g:peekaboo_compact = 0

    "ycm
    "let g:ycm_key_list_select_completion = ['<C-n>']    " 본래 <Tab> 이지만 ultisnip 과 충돌을 막기 위해 변경
    "let g:ycm_key_list_previous_completion=['<C-p>']
    let g:ycm_server_python_interpreter = '/usr/bin/python'
    "let g:ycm_complete_in_comments = 1

    "deoplete
    if has("nvim")
        "let g:deoplete#enable_at_startup = 1 " Use deoplete.
    endif

    "eclim
    let g:EclimCompletionMethod = 'omnifunc'

    " fzf
    let g:fzf_launcher = "In_a_new_term_function %s"

    " eregex
    nnoremap <leader>/ :call eregex#toggle()<CR>
    let g:eregex_default_enable = 0
    let g:eregex_forward_delim = '/'
    let g:eregex_backward_delim = '?'
    let g:eregex_force_case = 0

    " Trigger configuration. <Tab> 을 쓴다면 ycm 과 키가 중복되어 제대로 기능하지 않을 수 있다. 둘 중 하나의 설정을 바꿔준다.
    let g:UltiSnipsExpandTrigger="<Tab>"
    let g:UltiSnipsJumpForwardTrigger="<Tab>"
    let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
    let g:UltiSnipsEditSplit="vertical"     " If you want :UltiSnipsEdit to split your window.

" functions -------------------------------------------------------------------
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

command! ToHtml :so $VIMRUNTIME/syntax/2html.vim

" http://vim.wikia.com/wiki/Copy_filename_to_clipboard
if has('win32')
    command! GetFileName :let @*=substitute(expand("%"), "/", "\\", "g")
    command! GetFileAddress :let @*=substitute(expand("%:p"), "/", "\\", "g")<CR>
else
    command! GetFileName :let @*=expand('%')
    command! GetFileAddress :let @*=expand('%:p')
endif

" 현재 편집중인 파일 경로로 pwd 를 변경한다
command! Ncd :cd %:p:h



