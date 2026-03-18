" Specify vimrc encoding
scriptencoding utf-8
set encoding=utf-8

" Leader key
let mapleader = " "

" Plugins
call plug#begin()

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'godlygeek/tabular'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/git-messenger.vim', { 'on': 'GitMessenger' }
nnoremap <leader>m :GitMessenger<cr>

" Neovim-only plugins
if has('nvim')
    " Tree
    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'nvim-tree/nvim-tree.lua'

    " Colorschemes
    Plug 'shaunsingh/nord.nvim'
    Plug 'Mofiqul/dracula.nvim'

    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', {'rev': '0.1.x'}
    nnoremap <C-p> :Telescope find_files<cr>
    nnoremap <leader>f :Telescope live_grep<cr>
    nnoremap <leader>r :Telescope resume<cr>

    Plug 'APZelos/blamer.nvim'
    let g:blamer_date_format = '%b %d %y'
    let g:blamer_relative_time = 1
    let g:blamer_enabled = 1

    " LSP
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'folke/trouble.nvim'

    " Completion
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'hrsh7th/cmp-nvim-lua'

    " Snippet Engine
    Plug 'L3MON4D3/LuaSnip'

    " Snippets
    Plug 'rafamadriz/friendly-snippets'

" Vanilla-vim-only plugins
else
    Plug 'arcticicestudio/nord-vim'
	Plug 'preservim/nerdtree'
endif

call plug#end()

" Neovim-only configuration
if has('nvim')
    lua require('tree')
    lua require('search')
    lua require('highlighting')
    lua require('lsp')
    lua require('completion')

" Vanilla-vim-only configuration
else
    " Tree
    nnoremap <leader>b :NERDTreeToggle<cr>

    syntax on

    " Enable code highlighting within Markdown
    let g:markdown_fenced_languages = ['html', 'typescript', 'javascript', 'python', 'bash']
endif

" Default colorscheme
colorscheme nord

" Improved list mode
nnoremap <leader>l :set list!<cr>
set listchars=eol:¬,tab:⇥\.,nbsp:_,extends:»,precedes:«

" Shortcut to source nvimrc
nnoremap <leader>c :source $MYVIMRC<cr>

" Shortcut to turn off search highlighting
nnoremap <leader>n :noh<cr>

" Shortcut to open vimrc
nnoremap <leader>v :tabnew $MYVIMRC<cr>

" Shortcut to toggle spellcheck
nnoremap <leader>s :set spell!<cr>

" Rulers
set colorcolumn=81,121

" Set split directions for sp and vsp commands
set splitright
set splitbelow

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

" Check spelling on markdown files
set spelllang=en_us
autocmd FileType markdown setlocal spell

" Use true colors if available
if has ('termguicolors')
    set termguicolors
endif

" Automatically install vim-plug if not installed
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

