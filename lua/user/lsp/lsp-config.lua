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
local jsonls = add_opts(require("user.lsp.settings.jsonls"))
lsp_config.jsonls.setup(jsonls)

-- Tsserver
lsp_config.ts_ls.setup(default_opts)

-- HTML
local html_opts = add_opts({
    cmd = { "vscode-html-language-server", "--stdio" },
})
lsp_config.html.setup(html_opts)

-- CSS
local css_opts = add_opts({
    cmd = { "vscode-css-language-server", "--stdio" },
})
lsp_config.cssls.setup(css_opts)

-- Bash
lsp_config.bashls.setup(default_opts)

lsp_config.nil_ls.setup(default_opts)

-- Svelte
lsp_config.svelte.setup(default_opts)

-- Go
lsp_config.gopls.setup(default_opts)

-- Latex
local texlab_opts = add_opts(require("user.lsp.settings.texlab"))
lsp_config.texlab.setup(texlab_opts)

-- Docker
-- lsp_config.dockerls.setup(default_opts)


-- SQLLS
-- lsp_config.sqlls.setup(default_opts)
