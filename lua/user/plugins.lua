local fn = vim.fn

-- ensure packer is installed
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		"git",
		"clone",
		"https://github.com/wbthomason/packer.nvim",
		install_path
	}
	vim.cmd [[packadd packer.nvim]]
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Reload neovim every time the plugins.lua file is saved
vim.cmd [[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]]

packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end,
	},
}

-- Startup and configure plugins
packer.startup(function(use)
	use "wbthomason/packer.nvim" -- Packer itself
	use "nvim-lua/popup.nvim" -- Popup API from vim in Neovim
	use "nvim-lua/plenary.nvim" -- Lua functions used by many plugins
	use "windwp/nvim-autopairs" -- Autopairs

	use "sainnhe/gruvbox-material" -- Gruvbox material theme
	use "norcalli/nvim-colorizer.lua" -- Colorizer
	use "numToStr/Comment.nvim" -- Comments

	use { -- Status Line
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons" }
	}

	use { -- Buffer Line
		"akinsho/bufferline.nvim",
		tag = "v3.*",
		requires = { "nvim-tree/nvim-web-devicons" }
	}

	-- Cmp plugins
	use "hrsh7th/nvim-cmp" -- Completion
	use "hrsh7th/cmp-buffer" -- Buffer completions
	use "hrsh7th/cmp-path" -- Path completion
	use "hrsh7th/cmp-cmdline" -- Commandline completions
	use "hrsh7th/cmp-nvim-lsp" -- LSP completions
	use "saadparwaiz1/cmp_luasnip" -- Snippet completions

	-- Snippets
	use "L3MON4D3/LuaSnip" -- Snippet Engine
	use "rafamadriz/friendly-snippets" -- Snippet Library

	-- LSP
	use {
		"neovim/nvim-lspconfig", -- LSP
		requires = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim"
		}
	}

	--Razor syntax highlighting
	use "jlcrochet/vim-razor"

	-- Telescope
	use "nvim-telescope/telescope.nvim"
	use "nvim-telescope/telescope-media-files.nvim"

	-- Treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	}
	use "mrjones2014/nvim-ts-rainbow"

	-- Auto set config after cloning packer
	-- Keep this after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end
)
