set nocompatible                   " be iMproved, required
filetype off                       " required

set rtp+=~/.vim/bundle/Vundle.vim  " set the runtime path to include Vundle and initialize
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'      " let Vundle manage Vundle, required

call vundle#end()                  " All of your Plugins must be added before this line
filetype plugin indent on          " required
