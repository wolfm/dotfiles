" Syntax highlighting and line numbers
syntax on
set number

" Indentation settings
set tabstop=4
set shiftwidth=4
set autoindent
set expandtab

" Prevent text wrapping in middle of word
set wrap
set linebreak

" Enable mouse scroll
set mouse=a

" Use true colors if available
if has ("termguicolors")
	set termguicolors
endif

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

	Plug 'preservim/nerdtree'
	Plug 'cespare/vim-toml'
	Plug 'tpope/vim-fugitive'
	Plug 'vim-syntastic/syntastic'
	Plug 'arcticicestudio/nord-vim'
	Plug 'airblade/vim-gitgutter'
	Plug 'vim-airline/vim-airline'

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

" python3 << EOF
" try:
" 	from powerline.vim import setup as powerline_setup
" 	powerline_setup()
" 	del powerline_setup
" except ModuleNotFoundError: # Works in python3 version >= 3.6
" 	pass
" EOF

set laststatus=2
