local custom_gruvbox = require('lualine.themes.gruvbox-material')

custom_gruvbox.normal.a.bg = '#aa9267'

require('lualine').setup{
	options = { theme = custom_gruvbox }
}

require('bufferline').setup()

require('colorizer').setup()
