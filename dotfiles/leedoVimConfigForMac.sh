

#심볼릭링크 설정
if [ ! -f ~/.vimrc ] ; then
    ln -s ~/git/dotfiles/.vimrc ~/.vimrc
fi

if [ ! -d ~/.vim/bundle ] ; then
    echo "make vim/bundle dir"
    mkdir ~/.vim/bundle
fi

if [ ! -d ~/.vim/color ] ; then
    echo "make vim/color dir"
    mkdir ~/.vim/color
fi
cd ~/.vim/bundle

# 번들 설치
if [ ! -d ~/.vim/bundle/Vundle.vim ] ; then
    cd ~/.vim/bundle
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi


# syntastic 플러그인
if [ ! -d ~/.vim/bundle/syntastic ] ; then
    cd ~/.vim/bundle
    echo "make vim/bundle/syntastic  dir"
    git clone https://github.com/vim-syntastic/syntastic.git
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
    git clone --depth=1 https://github.com/vim-syntastic/syntastic.git
fi


if [ ! -d ~/.vim/bundle/vim-fugitive ] ; then
    cd ~/.vim/bundle
    git clone git://github.com/tpope/vim-fugitive.git
    vim -u NONE -c "helptags vim-fugitive/doc" -c q

fi



if [ ! -d ~/.vim/bundle/onedark.vim ] ; then
    cd ~/.vim/bundle
    git clone https://github.com/joshdick/onedark.vim

fi

if [ ! -d ~/.vim/bundle/molokai ] ; then
    cd ~/.vim/bundle
    git clone https://github.com/tomasr/molokai

fi


if [ ! -d ~/.vim/bundle/nerdtree ] ; then
    cd ~/.vim/bundle
    git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
fi






