local M = {}

-- TODO: backfill this to template
M.setup = function()
    local severity = vim.diagnostic.severity;

    local config = {
        -- disable virtual text
        virtual_text = false,
        -- show signs
        signs = {
            text = {
                [severity.ERROR] = "",
                [severity.WARN] = "",
                [severity.HINT] = "",
                [severity.INFO] = "",
            },
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }

    vim.diagnostic.config(config)
end

M.handlers = function()
    local function rounded_border(handler)
        return function(err, result, ctx, config)
            config = config or {}
            config.border = "rounded"
            return handler(err, result, ctx, config)
        end
    end

    return {
        ["textDocument/hover"] =
            rounded_border(vim.lsp.handlers["textDocument/hover"]),
        ["textDocument/signatureHelp"] =
            rounded_border(vim.lsp.handlers["textDocument/signatureHelp"])
    }
end

local function lsp_highlight_document(client, bufnr)
    -- Set autocommands conditional on server_capabilities
    if client.server_capabilities.documentHighlight then
        local group = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })

        vim.api.nvim_create_autocmd("CursorHold", {
            group = group,
            buffer = bufnr,
            callback = vim.lsp.buf.document_highlight,
        })

        vim.api.nvim_create_autocmd("CursorMoved", {
            group = group,
            buffer = bufnr,
            callback = vim.lsp.buf.clear_references,
        })
    end
end

-- Set LSP keymaps
local function lsp_keymaps(bufnr)
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    if vim.bo.filetype == "cs" then
        vim.api.nvim_buf_set_keymap(
            bufnr,
            "n",
            "gd",
            "<cmd>lua require('omnisharp_extended').lsp_definitions()<CR>",
            opts
        )
    else
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    end
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gk", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "v", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", "<cmd>lua vim.diagnostic.goto_prev({ border = 'rounded' })<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(
    -- 	bufnr,
    -- 	"n",
    -- 	"gl",
    -- 	"<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>",
    -- 	opts
    -- )
    vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", "<cmd>lua vim.diagnostic.goto_next({ border = 'rounded' })<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
    vim.cmd([[ command! Format execute "lua vim.lsp.buf.format() { async = true }" ]])
end

M.on_attach = function(client, bufnr)
    if client.name == "svelte" then
        vim.api.nvim_create_autocmd("BufWritePost", {
            pattern = { "*.js", "*.ts" },
            callback = function(ctx)
                client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
            end,
        })
    end
    if client.name == "texlab" then
        client.server_capabilities.document_formatting = false
        client.server_capabilities.document_range_formatting = false
    end
    lsp_keymaps(bufnr)
    lsp_highlight_document(client, bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
    return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
