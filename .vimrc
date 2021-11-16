" Syntax highlighting and line numbers
syntax on
set number

" Indentation settings
set tabstop=4
set shiftwidth=4
set autoindent

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

python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

set laststatus=2
