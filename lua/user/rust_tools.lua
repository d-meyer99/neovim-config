local status_ok, rt = pcall(require, "rust-tools")
if not status_ok then
    return
end

local codelldb = require("mason-registry").get_package("codelldb")
local extension_path = codelldb:get_install_path() .. "/extension/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

local handlers = require("user.lsp.handlers")

rt.setup({
    dap = {
        adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
    },
    server = {
        on_attach = function(client, bufnr)
            handlers.on_attach(client, bufnr)
            -- hover actions
            vim.keymap.set("n", "<c-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- code action groups
            vim.keymap.set("n", "<leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
    },
    tools = {
        hover_actions = {
            auto_focus = true,
        },
    },
})
