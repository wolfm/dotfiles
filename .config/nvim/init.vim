" Syntax highlighting and line numbers
syntax on
set number

" Indentation
set tabstop=4
set shiftwidth=4
set autoindent
set expandtab

" Prevent text wrapping in middle of word
set wrap
set linebreak

" Use true colors if available
if has ('termguicolors')
	set termguicolors
endif

" Key Mappings
map <F3> :NERDTreeToggle<CR>

" Plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'preservim/nerdtree'
Plug 'arcticicestudio/nord-vim'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'bronson/vim-trailing-whitespace'

call plug#end()

colorscheme nord

