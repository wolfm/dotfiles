" Custom commands
let mapleader = " "
nnoremap <leader>t :NERDTreeToggle<cr>
nnoremap <leader>f :Files<cr>
nnoremap <leader>r :Rg<cr>
nnoremap <leader>s :so ~/.vimrc<cr>

" Syntax highlighting and line numbers
syntax on
set number

" Indentation settings
set tabstop=4
set shiftwidth=4
set autoindent
set expandtab

" Disable auto-comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Search case settings
" ignorecase: makes search case-insensitive by default
" smartcase: makes search case-sensitive if the query has a capital letter
" Use \c or \C in a search to override (insensitive/sensitive, respectively)
set ignorecase
set smartcase

" Prevent text wrapping in middle of word
set wrap
set linebreak

" Enable mouse scroll
set mouse=a

" Use true colors if available
if has ("termguicolors")
	set termguicolors
endif

" Disable vim-markdown folding
let g:vim_markdown_folding_disabled = 1

" Shorten escape-key timeout from long default
" May be useful to increase if I use shortcuts involving escape,
" in particular on remote systems
set ttimeout
set ttimeoutlen=20

" Key Mappings
map <F3> :NERDTreeToggle<CR>

" Activate built-in :Man command
runtime ftplugin/man.vim

" Run with plugins if vim-plug installed
if glob('~/.vim/autoload/plug.vim')!=#""

	" vim-plug
	call plug#begin('~/.vim/plugged')

	Plug 'godlygeek/tabular'
	Plug 'preservim/vim-markdown' " Needs godlygeek/tabular
	Plug 'preservim/nerdtree'
	Plug 'cespare/vim-toml'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-sleuth'
	Plug 'vim-syntastic/syntastic'
	Plug 'arcticicestudio/nord-vim'
	Plug 'airblade/vim-gitgutter'
	Plug 'vim-airline/vim-airline'
	Plug 'bronson/vim-trailing-whitespace'
	Plug 'leafgarland/typescript-vim'
	Plug 'peitalin/vim-jsx-typescript'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'ludovicchabant/vim-gutentags'

	" TODO Manually install covim?
	Plug 'wolfm/CoVim' , { 'on' : 'CoVim' }

	call plug#end()

	" default color scheme
	if glob('~/.vim/plugged/nord-vim/')!=#""
		colorscheme nord
	endif
else
	echo "It appears vim-plug is not installed - run ~/.install to install it!"
endif

"" Gutentags configuration
" From https://www.reddit.com/r/vim/comments/d77t6j/guide_how_to_setup_ctags_with_gutentags_properly/

" Detect package.json for javascript subprojects
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['package.json', '.git', '.hg', '.svn', '.bzr', '_darcs', '_FOSSIL_', '.fslckout']

" Store tag files in cache outside of projects, add command to clear cache
let g:gutentags_cache_dir = expand('~/.cache/vim/ctags/')
command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')

" Generate more info with tags
let g:gutentags_ctags_extra_args = [
      \ '--tag-relative=yes',
      \ '--fields=+ailmnS',
      \ ]

" Ignore many file types by default
let g:gutentags_ctags_exclude = [
      \ '*.git', '*.svg', '*.hg',
      \ '*/tests/*',
      \ 'build',
      \ 'dist',
      \ '*sites/*/files/*',
      \ 'bin',
      \ 'node_modules',
      \ 'bower_components',
      \ 'cache',
      \ 'compiled',
      \ 'docs',
      \ 'example',
      \ 'bundle',
      \ 'vendor',
      \ '*.md',
      \ '*-lock.json',
      \ '*.lock',
      \ '*bundle*.js',
      \ '*build*.js',
      \ '.*rc*',
      \ '*.json',
      \ '*.min.*',
      \ '*.map',
      \ '*.bak',
      \ '*.zip',
      \ '*.pyc',
      \ '*.class',
      \ '*.sln',
      \ '*.Master',
      \ '*.csproj',
      \ '*.tmp',
      \ '*.csproj.user',
      \ '*.cache',
      \ '*.pdb',
      \ 'tags*',
      \ 'cscope.*',
      \ '*.css',
      \ '*.less',
      \ '*.scss',
      \ '*.exe', '*.dll',
      \ '*.mp3', '*.ogg', '*.flac',
      \ '*.swp', '*.swo',
      \ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
      \ '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
      \ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
      \ ]

" python3 << EOF
" try:
" 	from powerline.vim import setup as powerline_setup
" 	powerline_setup()
" 	del powerline_setup
" except ModuleNotFoundError: # Works in python3 version >= 3.6
" 	pass
" EOF

set laststatus=2
