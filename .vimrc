" Syntax highlighting and line numbers
syntax on
set number

" Indentation settings
set tabstop=4
set shiftwidth=4
set autoindent

" Key Mappings
map <F3> :NERDTreeToggle<CR>

" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'cespare/vim-toml'
Plug 'tpope/vim-fugitive'
Plug 'vim-syntastic/syntastic'
Plug 'arcticicestudio/nord-vim'

" TODO Manually install covim?
Plug 'wolfm/CoVim' , { 'on' : 'CoVim' }

call plug#end()

" default color scheme
colorscheme nord
