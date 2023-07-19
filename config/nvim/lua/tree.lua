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

vim.api.nvim_set_keymap('n', 'b', ':NvimTreeToggle<cr>', { noremap = true, silent = true })
