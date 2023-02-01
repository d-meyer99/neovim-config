require("mason").setup()
require("mason-lspconfig").setup()

local status_ok, lsp_config = pcall(require, "lspconfig")
if not status_ok then
	return
end

local handlers = require("user.lsp.handlers")

local function add_opts(opts)
	opts["on_attach"] = handlers.on_attach;
	opts["capabilities"] = handlers.capabilities;
	return opts
end

local default_opts = add_opts({})

-- Sumenko Lua
local sumneko_lua_opts = add_opts(require("user.lsp.settings.sumneko_lua"))
lsp_config.sumneko_lua.setup(sumneko_lua_opts)

-- Jsonls
local jsonls = add_opts(require("user.lsp.settings.jsonls"))
lsp_config.jsonls.setup(jsonls)

-- Tsserver
lsp_config.tsserver.setup(default_opts)

-- OmniSharp
local omnisharp_opts = add_opts(require("user.lsp.settings.omnisharp"))
lsp_config.omnisharp.setup(omnisharp_opts)

-- lsp_config.csharp_ls.setup(default_opts)
