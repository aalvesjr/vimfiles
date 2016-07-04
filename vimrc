set nocompatible                   " be iMproved, required
filetype off                       " required

set rtp+=~/.vim/bundle/Vundle.vim  " set the runtime path to include Vundle and initialize
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'      " let Vundle manage Vundle, required
Plugin 'scrooloose/nerdtree'

call vundle#end()                  " All of your Plugins must be added before this line
filetype plugin indent on          " required

" NerdTree
nmap <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.git$', '\~$', '\.swp$']
