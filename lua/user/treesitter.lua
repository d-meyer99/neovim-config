local status_ok, treesitter = pcall(require, "nvim-treesitter")
if not status_ok then
    return
end

require("rainbow-delimiters.setup").setup()

treesitter.install({
    "c",
    "vim",
    "rust",
    "toml",
    "html",
    "svelte",
    "javascript",
    "typescript",
    "css",
})
