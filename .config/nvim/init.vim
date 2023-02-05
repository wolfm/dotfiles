" Custom commands
let mapleader = " "
nnoremap <leader>b :NERDTreeToggle<cr>
nnoremap <leader>r :source $MYVIMRC<cr>
nnoremap <leader>p :Files<cr>

" Plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'preservim/nerdtree'
Plug 'arcticicestudio/nord-vim'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'bronson/vim-trailing-whitespace'

Plug 'junegunn/fzf', { 'do': { -> fzf#install(I) } }
Plug 'junegunn/fzf.vim'

call plug#end()

" Default colorscheme
colorscheme nord

" Set working directory to that of opened file
set autochdir

" TODO If opening in directory, open NERDTree to the side
" If opening files, set working directory to the nearest common ancestor of those
" files?
" If opening a directory, make that the working directory, open an empty file,
" and start NERDTree to the side
" if isdirectory :q

" endif

" Rulers
set colorcolumn=81,121

" Set split directions for sp and vsp commands
set splitright
set splitbelow

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

