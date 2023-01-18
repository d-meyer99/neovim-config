local custom_gruvbox = require('lualine.themes.gruvbox-material')

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

require('bufferline').setup()

require('colorizer').setup()
