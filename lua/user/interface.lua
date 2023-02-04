-- Lualine
local lualine_status_ok, lualine = pcall(require, "lualine")
if not lualine_status_ok then
	return
end

local theme

local status_ok, custom_gruvbox = pcall(require, "lualine.themes.gruvbox-material")
if status_ok then
	custom_gruvbox.normal.a.bg = "#aa9267"
	custom_gruvbox.normal.c.bg = "#543937"
	custom_gruvbox.insert.c.bg = "#543937"
	custom_gruvbox.visual.c.bg = "#543937"
	custom_gruvbox.command.c.bg = "#543937"
	custom_gruvbox.terminal.c.bg = "#543937"
	custom_gruvbox.replace.c.bg = "#543937"

	theme = custom_gruvbox
else
	theme = "gruvbox-material"
end

lualine.setup({
	options = {
		globalstatus = true,
		icons_enabled = true,
		theme = theme,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { "encoding", "progress" },
		lualine_y = { "os.date('%a %d %b %Y')" },
		lualine_z = { "os.date('%H:%M')" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})

require("colorizer").setup()
