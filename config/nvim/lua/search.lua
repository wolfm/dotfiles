local telescope = require('telescope').setup {
    defaults = {
        file_ignore_patterns = { ".git/" },
        layout_strategy = "vertical",
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

local telescope_status_ok, telescope = pcall(require, "telescope")
if not telescope_status_ok then
  return
end

-- vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope find_files<cr>', { noremap = true })
