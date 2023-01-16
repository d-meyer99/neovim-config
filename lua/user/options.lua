-- Settings
local options ={
	backup = false,
	cmdheight = 2,
	encoding = "utf-8",
	relativenumber = true,
	number = true,
	ignorecase = true,
	smartcase = true,
	swapfile = false,
	backspace = "2",
	tabstop = 4,
	softtabstop = 4,
	showtabline = 2,
	termguicolors = true,
	shiftwidth = 4,
	expandtab = false,
	listchars = { space = '*', tab = '>-' , trail = '~'},
	list = true,
	signcolumn = "yes",
	textwidth = 85,
	colorcolumn = "86",
	wrap = true,
	linebreak = true,
	foldmethod = "syntax",
	foldlevelstart = 1,
	shell = "powershell.exe",
	smartindent = true,
	splitbelow = true,
	splitright = true,
	clipboard = "unnamedplus",
	scrolloff = 10,
	sidescrolloff = 8,
	cursorline = true
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd ("set iskeyword+=-")
vim.cmd ("set ww+=h,l")

