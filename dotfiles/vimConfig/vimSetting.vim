
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
        set guifont=Monaco:h12
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
    " column line view
    "set cursorcolumn 
    set langmap=ㅁa,ㅠb,ㅊc,ㅇd,ㄷe,ㄹf,ㅎg,ㅗh,ㅑi,ㅓj,ㅏk,ㅣl,ㅡm,ㅜn,ㅐo,ㅔp,ㅂq,ㄱr,ㄴs,ㅅt,ㅕu,ㅍv,ㅈw,ㅌx,ㅛy,ㅋz


    if has("syntax")
        syntax on
        colorscheme evening
        set t_Co=256
        let g:molokai_original = 1
    endif

"
" initialize 설정 ---------------------------------------------------------------

" 마지막으로 수정된 곳에 커서를 위치함
    au BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "norm g`\"" |
    \ endif

" map ----------------------------------------------------------------------
    nnoremap gr gT

    nnoremap <Space>e :browse oldfiles<CR>
    nnoremap <f5> :!ctags -R<CR>

    nnoremap k gk
    nnoremap gk k
    nnoremap j gj
    nnoremap gj j

    nnoremap & :&&<CR>
    xnoremap & :&&<CR>

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
    

"markdown settion
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_override_foldtext = 0
let g:vim_markdown_folding_level = 6
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_emphasis_multiline = 0
set conceallevel=2
let g:vim_markdown_fenced_languages = ['csharp=cs']
let g:vim_markdown_no_extensions_in_markdown = 1
let g:vim_markdown_autowrite = 1


"markdown 20171121
let vim_markdown_preview_toggle=1
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_temp_file=1
let vim_markdown_preview_github=1

let vim_markdown_preview_use_xdg_open=1


    " 현재 편집중인 파일 경로로 pwd 를 변경한다
    command! Ncd :cd %:p:h
