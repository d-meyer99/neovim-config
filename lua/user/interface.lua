-- Lualine
local status_ok, custom_gruvbox = pcall(require, 'lualine.themes.gruvbox-material')
if status_ok then
	custom_gruvbox.normal.a.bg = '#aa9267'
	custom_gruvbox.normal.c.bg = '#543937'
	custom_gruvbox.insert.c.bg = '#543937'
	custom_gruvbox.visual.c.bg = '#543937'
	custom_gruvbox.command.c.bg = '#543937'
	custom_gruvbox.terminal.c.bg = '#543937'
	custom_gruvbox.replace.c.bg = '#543937'

	require('lualine').setup{
		options = { 
			theme = custom_gruvbox,
			globalstatus = true
		}
	}
else
	require('lualine').setup{
		options = { 
			theme = 'gruvbox-material',
			globalstatus = true
		}
	}
end

-- Bufferline
require('bufferline').setup()

require('colorizer').setup()
