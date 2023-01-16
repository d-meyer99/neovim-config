local execute = vim.api.nvim_command
local fn = vim.fn

-- ensure packer is installed
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
	execute 'packadd packer.nvim'
end

vim.cmd('packadd packer.nvim')

local packer = require('packer')
local util = require('packer.util')

packer.init({
	package_root = util.join_paths(fn.stdpath('data'), 'site', 'pack')
})

-- startup and configure plugins
packer.startup(function(use)
	-- Packer itself
	use 'wbthomason/packer.nvim'

	-- Gruvbox material theme
	use 'sainnhe/gruvbox-material'

	--


end
)
