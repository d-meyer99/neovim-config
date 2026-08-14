local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

local handlers = require("user.lsp.handlers")

local function setup_language(name, opts)
    vim.lsp.config[name] = opts;
    vim.lsp.enable(name);
end

local function add_opts(opts)
    opts.on_attach = handlers.on_attach
    opts.capabilities = handlers.capabilities
    opts.handlers = handlers.handlers()
    return opts
end

local default_opts = add_opts({})

-- Sumenko Lua
local sumneko_lua_opts = add_opts(require("user.lsp.settings.sumneko_lua"))
setup_language("lua_ls", sumneko_lua_opts)

-- Jsonls
local jsonls = add_opts(require("user.lsp.settings.jsonls"))
setup_language("jsonls", jsonls)

-- Tsserver
setup_language("ts_ls", default_opts)

-- HTML
local html_opts = add_opts({
    cmd = { "vscode-html-language-server", "--stdio" },
    filetypes = { "html" }
})
setup_language("html", html_opts)

-- CSS
local css_opts = add_opts({
    cmd = { "vscode-css-language-server", "--stdio" },
})
setup_language("cssls", css_opts)

-- Bash
setup_language("bashls", default_opts)

setup_language("nil_ls", default_opts)

-- Svelte
setup_language("svelte", default_opts)

-- Go
setup_language("gopls", default_opts)

-- Latex
local texlab_opts = add_opts(require("user.lsp.settings.texlab"))
setup_language("texlab", texlab_opts)

setup_language("sqls", {
    capabilities = default_opts.capabilities,
    handlers = default_opts.handlers,
    settings = {
        sqls = {
            connections = {
                {
                    driver = 'postgresql',
                    dataSourceName =
                    'host=localhost port=5432 user=workout password=dev dbname=workout_dev sslmode=disable'
                },
            },
        },
    },
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client.name == 'sqls' then
            local bufnr = args.buf
            local opts = { noremap = true, silent = true }
            default_opts.on_attach(client, bufnr)
            vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>se", "<cmd>SqlsExecuteQuery<CR>", opts)
            vim.api.nvim_buf_set_keymap(bufnr, "v", "<leader>se", "<cmd>SqlsExecuteQuery<CR>", opts)
        end
    end,
})

setup_language("emmet_ls", add_opts({
    init_options = {
        userLanguages = {
            eelixir = "hteml-eex",
            eruby = "erb",
            rust = "html",
        },
    },
    filetypes = { "html", "rust" },
}))
