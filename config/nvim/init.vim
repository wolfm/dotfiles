" Leader key
let mapleader = " "

" Plugins
call plug#begin()

" Colorschmes
if has('nvim')
    Plug 'shaunsingh/nord.nvim'
    Plug 'Mofiqul/dracula.nvim'
else
    Plug 'arcticicestudio/nord-vim'
endif

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'godlygeek/tabular'

" Git plugins
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'rhysd/git-messenger.vim', { 'on': 'GitMessenger' }
nnoremap <leader>m :GitMessenger<cr>

" Tree
if has('nvim')
    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'nvim-tree/nvim-tree.lua'
else
	Plug 'preservim/nerdtree'
endif

if has('nvim')
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', {'rev': '0.1.x'}
    nnoremap <C-p> :Telescope find_files<cr>
    nnoremap <leader>f :Telescope live_grep<cr>

    Plug 'APZelos/blamer.nvim'
    let g:blamer_date_format = '%b %d %y'
    let g:blamer_relative_time = 1
    let g:blamer_enabled = 1
endif

" Enable to conveniently measure startup time
" Plug 'dstein64/vim-startuptime'

call plug#end()

" Tree
if has('nvim')
lua << EOF
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    require("nvim-tree").setup {
        sync_root_with_cwd = true,
        actions = {
        open_file = {
            quit_on_open = true,
        },
  },
    }
EOF
    nnoremap <leader>b :NvimTreeToggle<cr>
else
    nnoremap <leader>b :NERDTreeToggle<cr>
endif

" Search
if has('nvim')
lua << EOF
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
endif

" Syntax Highlighting Highlighting
if has('nvim')
lua << EOF
    require'nvim-treesitter.configs'.setup {
        ensure_installed = "all",
        sync_install = false,
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
    }
EOF
else
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
nnoremap <leader>r :source $MYVIMRC<cr>

" Shortcut to turn off search highlighting
nnoremap <leader>n :noh<cr>

" Shortcut to open vimrc
nnoremap <leader>v :tabnew $MYVIMRC<cr>

" Rulers
set colorcolumn=81,121

" Autoformatting
set textwidth=80

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

