local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

require("user.lsp.lsp-config")
require("user.lsp.handlers").setup()
