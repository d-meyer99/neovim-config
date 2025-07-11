vim.g.rustaceanvim = {
    server = {
        on_attach = function(client, bufnr)
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
            vim.api.nvim_buf_set_keymap(
                bufnr,
                "n",
                "[d",
                "<cmd>lua vim.diagnostic.goto_prev({ border = 'rounded' })<CR>",
                opts
            )
            -- vim.api.nvim_buf_set_keymap(
            -- 	bufnr,
            -- 	"n",
            -- 	"gl",
            -- 	"<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>",
            -- 	opts
            -- )
            vim.api.nvim_buf_set_keymap(
                bufnr,
                "n",
                "]d",
                "<cmd>lua vim.diagnostic.goto_next({ border = 'rounded' })<CR>",
                opts
            )
            vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
            vim.cmd([[ command! Format execute "lua vim.lsp.buf.format() { async = true }" ]])
        end,
    },
}
