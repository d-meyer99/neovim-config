vim.g.rust_recommended_style = 0
vim.g.rust_fold = 1

-- Options
local options = {
    encoding = "utf-8", -- Use UTF-8 encoding.
    number = true, -- Show line numbers.
    relativenumber = true, -- Show line numbers relative to current line.
    ignorecase = true, -- Ignore case in search patterns.
    smartcase = true, -- Don"t ignore case if search contains uppercase.
    swapfile = false, -- Disable swapfiles.
    backspace = "2", -- Allow backspace over autoindent, eol and start.
    tabstop = 4, -- Number of spaces that a tab uses.
    softtabstop = 4, -- Number of spaces a tab uses when editing.
    showtabline = 0, -- Always show tabline.
    termguicolors = true, -- Enable 24-bit RGB in terminal.
    shiftwidth = 4, -- Number of spaces to use for auto indent.
    expandtab = true, -- replace tabs with spaces.
    listchars = {
        -- Show whitespace configuration list.
        space = "·", -- Show spaces as "·".
        tab = " ", -- Show tabs as "   ".
        trail = "~",
    }, -- Show trailing spaces as "~".
    list = true, -- Show whitespace.
    signcolumn = "yes", -- Always show sign column.
    textwidth = 80, -- Set max text width to 80 characters.
    colorcolumn = "81", -- Show column 81 as colored.
    wrap = false, -- Wrap text.
    linebreak = true, -- Wrap at logical place.
    foldcolumn = "0",
    foldminlines = 1,
    foldlevelstart = 10, -- On startup, open 2 outer levels of folds.
    foldnestmax = 3,
    foldenable = true,
    smartindent = true, -- Use smart autoindenting.
    splitbelow = true, -- Force new splits to appear below current split.
    splitright = true, -- Force new vertical splits to appear to the right.
    scrolloff = 10, -- Start vertical scrolling 10 chars before edge.
    sidescrolloff = 8, -- Start horizontal scrolling 8 chars before edge.
    cursorline = true, -- Highlight line at cursor position.
    cursorlineopt = "number",
}

-- Loop through and set options.
for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function ()
        vim.highlight.on_yank({ higroup = "Visual", timeout = 300})
    end
})

vim.cmd("set iskeyword+=-") -- Set "-" to be treated as part of a word.
vim.cmd("set ww+=h,l") -- Allow h and l to wrap on lines.

-- Do not automatically insert comments on new line after a comment.
vim.cmd("autocmd FileType * setlocal formatoptions-=cro")

-- Set tab size to 2 in nix, html, json, svelte and wiki files.
vim.cmd("autocmd FileType nix,html,json,svelte,vimwiki,typescript,javascript setlocal shiftwidth=2")
vim.cmd("autocmd FileType nix,html,json,svelte,vimwiki,typescript,javascript setlocal tabstop=2")

vim.cmd("autocmd FileType html,svelte,vimwiki,typescript,javascript,tex setlocal textwidth=0")
vim.cmd("autocmd FileType go setlocal noexpandtab")

vim.cmd("autocmd FileType vimwiki setlocal foldmethod=indent")
vim.cmd("autocmd FileType vimwiki setlocal cole=1")

vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
  pattern = "*",
  callback = function()
    if vim.bo.filetype == "" then
      vim.bo.filetype = "text"
    end
  end,
})
