local status_ok_dap, dap = pcall(require, "dap")
if not status_ok_dap then
    return
end

local status_ok_dapui, dapui = pcall(require, "dapui")
if not status_ok_dapui then
    return
end

local status_ok_dapgo, dapgo = pcall(require, "dap-go")
if not status_ok_dapgo then
    return
end

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = "", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "󰛂", texthl = "", linehl = "", numhl = "" })

dapgo.setup()
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

-- Dap
vim.keymap.set("n", "<leader>bp", function()
    dap.toggle_breakpoint()
end)
vim.keymap.set("n", "<leader>bl", function()
    dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end)
vim.keymap.set("n", "<leader>bc", function()
    dap.set_breakpoint(vim.fn.input("Condition: "), nil, nil)
end)
vim.keymap.set("n", "<leader>br", function()
    dap.continue()
end)
vim.keymap.set("n", "<leader>bs", function()
    dap.terminate()
end)
vim.keymap.set("n", "<leader>bn", function()
    dap.step_over()
end)
vim.keymap.set("n", "<leader>bi", function()
    dap.step_into()
end)
vim.keymap.set("n", "<leader>bo", function()
    dap.step_out()
end)
vim.keymap.set("n", "<leader>bh", function()
    require("dap.ui.widgets").hover()
end)
