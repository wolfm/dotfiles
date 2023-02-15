" Leader key
let mapleader = " "

" Plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'arcticicestudio/nord-vim'
Plug 'airblade/vim-gitgutter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'

Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
nnoremap <leader>b :NERDTreeToggle<cr>

Plug 'tpope/vim-commentary'

Plug 'junegunn/fzf', { 'do': { -> fzf#install(I) } }
Plug 'junegunn/fzf.vim'
nnoremap <leader>p :GFiles<cr>
nnoremap <leader>f :Rg<cr>

Plug 'rhysd/git-messenger.vim', { 'on': 'GitMessenger' }
nnoremap <leader>m :GitMessenger<cr>

" Enable to conveniently measure startup time
" Plug 'dstein64/vim-startuptime'

call plug#end()

" Default colorscheme
colorscheme nord

" Improved list mode
nnoremap <leader>l :set list!<cr>
set listchars=eol:¬,tab:⇥\.,nbsp:_,extends:»,precedes:«

" Shortcut to source nvimrc
nnoremap <leader>r :source $MYVIMRC<cr>

" Shortcut to turn off search highlighting
nnoremap <leader>n :noh<cr>

" Set working directory to that of opened file
" set autochdir

" TODO If opening in directory, open NERDTree to the side
" If opening files, set working directory to the nearest common ancestor of
" those files?
" If opening a directory, make that the working directory, open an empty file,
" and start NERDTree to the side
" if isdirectory :q

" endif

" Rulers
set colorcolumn=81,121

" Autoformatting
set textwidth=80

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

" Mouse
set mouse=a "enable mouse scroll

" Prevent text wrapping in middle of word
set wrap
set linebreak

" Search case settings
" ignorecase: makes search case-insensitive by default
" smartcase: makes search case-sensitive if the query has a capital letter
" Use \c or \C in a search to override (insensitive/sensitive, respectively)
set ignorecase
set smartcase

" Use true colors if available
if has ('termguicolors')
    set termguicolors
endif

" Automatically install vim-plug if  ot installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

