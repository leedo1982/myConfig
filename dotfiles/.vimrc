
" source ~/git/dotfiles/init.vim
source ~/myConfig/dotfiles/vimConfig/plugin.vim
source ~/myConfig/dotfiles/vimConfig/vimSetting.vim


" insert mode 에  따른  cursor 모드 변경
" autocmd InsertEnter * : silent exec "!printf '\033]50;CursorShape=1\x7'" | exec ":redraw!"
" autocmd InsertLeave * : silent exec "!printf '\033]50;CursorShape=0\x7'" | exec ":redraw!"



" let g:lightline = { 'colorscheme': 'flatcolor' }
