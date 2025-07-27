local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Core dependencies
    { "nvim-lua/plenary.nvim" },
    { "nvim-lua/popup.nvim" },

    -- UI & Themes
    { "loctvl842/monokai-pro.nvim" },
    { "norcalli/nvim-colorizer.lua" },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "kyazdani42/nvim-web-devicons" }
    },
    { "levouh/tint.nvim" },
    { "anuvyklack/pretty-fold.nvim" },

    -- Editing
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter"
    },
    {
        "numToStr/Comment.nvim",
        event = "BufReadPost"
    },
    {
        "kylechui/nvim-surround",
        event = "BufReadPost"
    },

    -- Terminal
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = true
    },

    -- Git
    { "tpope/vim-fugitive" },
    {
        "lewis6991/gitsigns.nvim",
        event = "BufReadPost"
    },

    -- Completion (cmp)
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "saadparwaiz1/cmp_luasnip" },

    -- Snippets
    { "L3MON4D3/LuaSnip" },
    { "rafamadriz/friendly-snippets" },

    -- LSP & Formatting
    { "neovim/nvim-lspconfig" },
    { "nvimtools/none-ls.nvim" },

    -- Telescope
    { "nvim-telescope/telescope.nvim" },
    { "nvim-telescope/telescope-media-files.nvim" },
    { "AckslD/nvim-neoclip.lua" },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
    },
    { "HiPhish/rainbow-delimiters.nvim" },
    { "windwp/nvim-ts-autotag" },

    -- File Explorer
    { "prichrd/netrw.nvim" },

    -- Templates
    { "glepnir/template.nvim" },

    -- Rust
    { "mfussenegger/nvim-dap" },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" }
    },
    { "leoluz/nvim-dap-go" },
    { "mrcjkb/rustaceanvim" },

    -- Misc
    { "vimwiki/vimwiki" },
    { "klen/nvim-test" },
    { "mikavilpas/yazi.nvim" },
    { "chentoast/marks.nvim" },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
})
