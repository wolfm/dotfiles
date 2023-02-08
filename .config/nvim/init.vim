" Custom commands
let mapleader = " "
nnoremap <leader>b :NERDTreeToggle<cr>
nnoremap <leader>r :source $MYVIMRC<cr>
nnoremap <leader>p :GFiles<cr>
nnoremap <leader>l :set list!<cr>
set listchars=eol:¬,tab:⇥\.,nbsp:_,extends:»,precedes:«

nnoremap <leader>m :GitMessenger<cr>
nnoremap <leader>f :Rg<cr>

" Automatically install vim-plug if  ot installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" Plugins
" TODO try using packer for improved plugin loading performance?
call plug#begin('~/.config/nvim/plugged')

Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'arcticicestudio/nord-vim'
Plug 'airblade/vim-gitgutter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-commentary'
Plug 'rhysd/git-messenger.vim', { 'on': 'GitMessenger' }
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf', { 'do': { -> fzf#install(I) } }
Plug 'junegunn/fzf.vim'

" Enable to conveniently measure startup time
" Plug 'dstein64/vim-startuptime'

call plug#end()

" Shortcuts for tpope/vim-commentary
nnoremap <leader>/ :Commentary<cr>
vnoremap <leader>/ :Commentary<cr>

" Default colorscheme
colorscheme nord

" Set working directory to that of opened file
" set autochdir

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

