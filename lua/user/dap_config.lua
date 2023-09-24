local status_ok_dap, dap = pcall(require, "dap")
if not status_ok_dap then
	return
end

local status_ok_dapui, dapui = pcall(require, "dapui")
if not status_ok_dapui then
	return
end

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end

dap.listeners.after.event_terminated["dapui_config"] = function()
	dapui.close()
end

dap.listeners.after.event_exited["dapui_config"] = function()
	dapui.close()
end

vim.keymap.set("n", "<leader>dt", ":DapToggleBreakpoint<CR>")
vim.keymap.set("n", "<leader>dx", ":DapTerminate<CR>")
vim.keymap.set("n", "<leader>do", ":DapStepOver<CR>")
vim.keymap.set("n", "<leader>di", ":DapStepInto<CR>")
vim.keymap.set("n", "<leader>du", ":DapStepOut<CR>")
