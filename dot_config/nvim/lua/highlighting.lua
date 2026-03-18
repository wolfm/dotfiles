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
