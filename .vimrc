" Syntax highlighting and line numbers
syntax on
set number

" Indentation settings
set tabstop=4
set shiftwidth=4
set autoindent

" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'cespare/vim-toml'
Plug 'tpope/vim-fugitive'
Plug 'vim-syntastic/syntastic'

" TODO Manually install covim?
Plug 'wolfm/CoVim' , { 'on' : 'CoVim' }

call plug#end()
