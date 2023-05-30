" Leader key
let mapleader = " "

" Plugins
call plug#begin()

Plug 'arcticicestudio/nord-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'godlygeek/tabular'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Git plugins
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'APZelos/blamer.nvim'
let g:blamer_date_format = '%b %d %y'
let g:blamer_relative_time = 1
let g:blamer_enabled = 1
Plug 'rhysd/git-messenger.vim', { 'on': 'GitMessenger' }
nnoremap <leader>m :GitMessenger<cr>

" Tree plugins
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
nnoremap <leader>b :NvimTreeFocus<cr>

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', {'rev': '0.1.x'}
nnoremap <C-p> :Telescope find_files<cr>
nnoremap <leader>f :Telescope live_grep<cr>

" Enable to conveniently measure startup time
" Plug 'dstein64/vim-startuptime'

call plug#end()

" Configure Lua plugins
lua << EOF
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
require("nvim-tree").setup {
    sync_root_with_cwd = true,
}

local telescope = require('telescope').setup {
    defaults = {
        file_ignore_patterns = { ".git/" }
    },
    pickers = {
        find_files = {
            hidden = true,
        },
        live_grep = {
            additional_args = function(opts)
                return {"--hidden"}
            end
        },
    },
}
EOF

" Default colorscheme
colorscheme nord

" Improved list mode
nnoremap <leader>l :set list!<cr>
set listchars=eol:¬,tab:⇥\.,nbsp:_,extends:»,precedes:«

" Shortcut to source nvimrc
nnoremap <leader>r :source $MYVIMRC<cr>

" Shortcut to turn off search highlighting
nnoremap <leader>n :noh<cr>

" Shortcut to open vimrc
nnoremap <leader>v :tabnew $MYVIMRC<cr>

" Set working directory to that of opened file
" set autochdir

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

