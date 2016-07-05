set nocompatible                   " be iMproved, required
filetype off                       " required

set rtp+=~/.vim/bundle/Vundle.vim  " set the runtime path to include Vundle and initialize
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'      " let Vundle manage Vundle, required
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'MarcWeber/vim-addon-mw-utils' " Dependency from vim-snipmate
Plugin 'tomtom/tlib_vim'              " Dependency from vim-snipmate
Plugin 'garbas/vim-snipmate'

call vundle#end()                  " All of your Plugins must be added before this line
filetype plugin indent on          " required

" NerdTree
nmap <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.git$', '\~$', '\.swp$', '\.svn$']

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/]\.(git|svn)$',
	\ 'file': '\v\.(exe|so|dll)$',
	\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
	\ }

" Settings

setlocal foldmethod=indent
set number
set nowrap
set nobackup
set noswapfile
set tabstop=2
set shiftwidth=2
set expandtab
set ignorecase
set splitright
set splitbelow
set list listchars=tab:»·,trail:·

" Highlighting

au BufNewFile,BufRead *.erb		set filetype=ruby

" Shortcuts

" F12 reloads the ~/.vimrc file
nnoremap <F12> :source ~/.vimrc

" Ctrl+S to save the current file
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>

" Management tabs
nnoremap <C-t> :tabnew<cr>
nnoremap <C-T> :tabnew<cr>

" Functions
" <leader> == \

" Removes trailing spaces
function TrimWhiteSpace()
  %s/\s*$//
  ''
:endfunction

map  <leader>= :call TrimWhiteSpace()<CR>
map! <leader>= :call TrimWhiteSpace()<CR>

" Collapse multiple blank lines (regardless of quantity) into a single blank line.
function CollapseMultipleBlankLines()
  g/^\_$\n\_^$/d
  ''
:endfunction

map  <leader>- :call CollapseMultipleBlankLines()<CR>
map! <leader>- :call CollapseMultipleBlankLines()<CR>
