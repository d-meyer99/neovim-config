local fn = vim.fn

-- ensure packer is installed
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    vim.cmd([[packadd packer.nvim]])
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Reload neovim every time the plugins.lua file is saved
vim.cmd([[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]])

packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

-- Startup and configure plugins
packer.startup(function(use)
    use("wbthomason/packer.nvim") -- Packer itself
    use("nvim-lua/popup.nvim") -- Popup API from vim in Neovim
    use("nvim-lua/plenary.nvim") -- Lua functions used by many plugins
    use("windwp/nvim-autopairs") -- Autopairs
    use("akinsho/toggleterm.nvim") -- ToggleTerm
    use("tpope/vim-fugitive")

    use("loctvl842/monokai-pro.nvim")
    use("norcalli/nvim-colorizer.lua") -- Colorizer
    use("numToStr/Comment.nvim") -- Comments

    use({
        -- Status Line
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
    })

    -- Cmp plugins
    use("hrsh7th/nvim-cmp") -- Completion
    use("hrsh7th/cmp-buffer") -- Buffer completions
    use("hrsh7th/cmp-path") -- Path completion
    use("hrsh7th/cmp-cmdline") -- Commandline completions
    use("hrsh7th/cmp-nvim-lsp") -- LSP completions
    use("saadparwaiz1/cmp_luasnip") -- Snippet completions

    -- Snippets
    use("L3MON4D3/LuaSnip") -- Snippet Engine
    use("rafamadriz/friendly-snippets") -- Snippet Library

    -- LSP
    use({
        "neovim/nvim-lspconfig", -- LSP
    })
    use("jose-elias-alvarez/null-ls.nvim")

    -- Telescope
    use("nvim-telescope/telescope.nvim")
    use("nvim-telescope/telescope-media-files.nvim")
    use("AckslD/nvim-neoclip.lua")

    -- Treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    })
    use("HiPhish/rainbow-delimiters.nvim")

    -- Netrw
    use("prichrd/netrw.nvim")

    -- Templates
    use("glepnir/template.nvim")

    -- Git
    use("lewis6991/gitsigns.nvim")

    -- Rust
    use("mfussenegger/nvim-dap")
    use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } })
    use("leoluz/nvim-dap-go")

    -- Tint
    use("levouh/tint.nvim")

    use("vimwiki/vimwiki")

    use("anuvyklack/pretty-fold.nvim")

    -- Rust
    use({ "mrcjkb/rustaceanvim" })

    use({ "windwp/nvim-ts-autotag" })

    use({ "klen/nvim-test" })

    use({ "mikavilpas/yazi.nvim" })

    use({ "chentoast/marks.nvim" })

    use({
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { "nvim-lua/plenary.nvim" },
    })

    use("kylechui/nvim-surround")

    -- Auto set config after cloning packer
    -- Keep this after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
