require("mason").setup()
require("mason-lspconfig").setup()

local status_ok, lsp_config = pcall(require, "lspconfig")
if not status_ok then
    return
end

local handlers = require("user.lsp.handlers")

local function add_opts(opts)
    opts["on_attach"] = handlers.on_attach
    opts["capabilities"] = handlers.capabilities
    return opts
end

local default_opts = add_opts({})

-- Sumenko Lua
local sumneko_lua_opts = add_opts(require("user.lsp.settings.sumneko_lua"))
lsp_config.lua_ls.setup(sumneko_lua_opts)

-- Jsonls
-- local jsonls = add_opts(require("user.lsp.settings.jsonls"))
-- lsp_config.jsonls.setup(jsonls)

lsp_config.tsserver.setup(default_opts)

-- HTML
lsp_config.html.setup(default_opts)

-- Tailwind
lsp_config.tailwindcss.setup(default_opts)

-- OmniSharp
local omnisharp_opts = add_opts(require("user.lsp.settings.omnisharp"))
lsp_config.omnisharp.setup(omnisharp_opts)

-- RustAnalyzer
-- local rust_analyzer_opts = add_opts(require("user.lsp.settings.rust_analyzer"))
-- lsp_config.rust_analyzer.setup(rust_analyzer_opts)

-- Bash
lsp_config.bashls.setup(default_opts)

-- Haskell
local haskell_opts = add_opts({
    filetypes = { "haskell", "lhaskell", "cabal" },
    settings = {
        haskell = {
            formattingProvider = "fourmolu",
        },
    },
    single_file_support = true
})
lsp_config.hls.setup(haskell_opts)

lsp_config.nil_ls.setup(default_opts)

-- SQLLS
-- lsp_config.sqlls.setup(default_opts)
