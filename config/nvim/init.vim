" Leader key
let mapleader = " "

" Plugins
call plug#begin()

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-eunuch'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'rhysd/git-messenger.vim', { 'on': 'GitMessenger' }
nnoremap <leader>m :GitMessenger<cr>

" Colorschmes
if has('nvim')
    Plug 'shaunsingh/nord.nvim'
    Plug 'Mofiqul/dracula.nvim'
else
    Plug 'arcticicestudio/nord-vim'
endif

" Tree
if has('nvim')
    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'nvim-tree/nvim-tree.lua'
else
	Plug 'preservim/nerdtree'
endif

" Neovim-only plugins
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

    " cmp plugins
    " Plug 'neovim/nvim-lspconfig'
    " Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'

    " Snippet Engine
    Plug 'L3MON4D3/LuaSnip'

    " Snippets
    Plug 'rafamadriz/friendly-snippets'
endif

call plug#end()

" Completion
if has('nvim')
lua <<EOF
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

-- Completion Icond (find more here: https://www.nerdfonts.com/cheat-sheet)
local kind_icons = {
  Text = "󰊄",
  Method = "m",
  Function = "󰊕",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "󰫧",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = {
    -- ["<C-k>"] = cmp.mapping.select_prev_item(),
    -- ["<C-j>"] = cmp.mapping.select_next_item(),
    -- ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    -- ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    -- ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<C-e>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm { select = true },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif check_backspace() then
        fallback()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      vim_item.menu = ({
        luasnip = "[Snippet]",
        buffer = "[Buffer]",
        path = "[Path]",
      })[entry.source.name]
      return vim_item
    end,
  },
  sources = {
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  window = {
    documentation = cmp.config.window.bordered(),
  },
  experimental = {
    ghost_text = false,
  },
}

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

EOF
endif

" Enable to conveniently measure startup time
" Plug 'dstein64/vim-startuptime'

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
        ignore_install = { "smali" }, -- Error installing on mac
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

