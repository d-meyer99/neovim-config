local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("user.lsp.lsp-config")
require("user.lsp.handlers").setup()

local lint_ok, lint = pcall(require, "lint")
if not lint_ok then
	return
end

lint.linters_by_ft = {
	typescript = {'eslint'}
}
vim.api.nvim_create_autocmd("BufWritePost", {
	callback = function()
		lint.try_lint()
	end
})
