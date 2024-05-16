local status_ok, theme = pcall(require, "catppuccin")
if not status_ok then
	return
end

theme.setup({
	flavour = "macchiato", -- latte, frappe, macchiato, mocha
	background = {
		-- :h background
		light = "latte",
		dark = "macchiato",
	},
	transparent_background = false,
	show_end_of_buffer = false, -- show the '~' characters after the end of buffers
	term_colors = true,
	dim_inactive = {
		enabled = true,
		shade = "dark",
		percentage = 0,
	},
	no_italic = false, -- Force no italic
	no_bold = false, -- Force no bold
	styles = {
		comments = { "bold" },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = { },
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	color_overrides = {},
	custom_highlights = {},
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		telescope = true,
		notify = false,
		mini = false,
		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	},
})

vim.cmd("colorscheme catppuccin")
vim.api.nvim_set_hl(0, "CursorLine", { underline = true })
