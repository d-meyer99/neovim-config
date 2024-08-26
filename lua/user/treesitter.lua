local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

require("nvim-treesitter.install").prefer_git = false
require("rainbow-delimiters.setup").setup()

configs.setup({
    -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ensure_installed = {
        "c",
        "lua",
        "vim",
        "rust",
        "toml",
        "html",
        "svelte",
        "javascript",
        "typescript",
        "css",
    },
    -- install languages synchronously (only applied to `ensure_installed`)
    sync_install = false,
    ignore_install = { "help" },
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "" },
        additional_vim_regex_highlighting = { "org" },
    },
    indent = { enable = true }
})

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
