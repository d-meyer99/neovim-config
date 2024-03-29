vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.rust_recommended_style = 0
vim.g.rust_fold = 1

-- Options
local options = {
	encoding = "utf-8", -- Use UTF-8 encoding.
	number = true,      -- Show line numbers.
	relativenumber = true, -- Show line numbers relative to current line.
	ignorecase = true,  -- Ignore case in search patterns.
	smartcase = true,   -- Don"t ignore case if search contains uppercase.
	swapfile = false,   -- Disable swapfiles.
	backspace = "2",    -- Allow backspace over autoindent, eol and start.
	tabstop = 4,        -- Number of spaces that a tab uses.
	softtabstop = 4,    -- Number of spaces a tab uses when editing.
	showtabline = 2,    -- Always show tabline.
	termguicolors = true, -- Enable 24-bit RGB in terminal.
	shiftwidth = 4,     -- Number of spaces to use for auto indent.
	expandtab = false,  -- Do not replace tabs with spaces.
	listchars = {
		-- Show whitespace configuration list.
		space = "•", -- Show spaces as "•".
		tab = ">-",  -- Show tabs as ">---".
		trail = "~",
	},               -- Show trailing spaces as "~".
	list = true,     -- Show whitespace.
	signcolumn = "yes", -- Always show sign column.
	textwidth = 200,  -- Set max text width to 85 characters.
	colorcolumn = "91", -- Show column 86 as colored.
	wrap = false,     -- Wrap text.
	linebreak = false, -- Wrap at logical place.
	foldcolumn = "0",
	foldminlines = 3,
	foldlevelstart = 99, -- On startup, open 2 outer levels of folds.
	foldnestmax = 3,
	foldenable = true,
	smartindent = true,     -- Use smart autoindenting.
	splitbelow = true,      -- Force new splits to appear below current split.
	splitright = true,      -- Force new vertical splits to appear to the right.
	clipboard = "unnamedplus", -- Use system clipboard for neovim.
	scrolloff = 10,         -- Start vertical scrolling 10 chars before edge.
	sidescrolloff = 8,      -- Start horizontal scrolling 8 chars before edge.
	cursorline = true,      -- Highlight line at cursor position.
	cursorlineopt = "line",
}

-- Loop through and set options.
for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd("set iskeyword+=-") -- Set "-" to be treated as part of a word.
vim.cmd("set ww+=h,l")      -- Allow h and l to wrap on lines.

-- Do not automatically insert comments on new line after a comment.
vim.cmd("autocmd FileType * setlocal formatoptions-=cro")
vim.cmd("set guifont=SauceCodePro\\ NFM:h11")
vim.cmd([[
		let &shell = executable('pwsh') ? 'pwsh' : 'powershell'
		let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
		let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
		let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
		set shellquote= shellxquote=
]])
