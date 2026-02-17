local status_ok, harpoon = pcall(require, "harpoon")
if not status_ok then
    return
end

harpoon.setup({
    settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
    },
})

-- Harpoon
vim.keymap.set("n", "<leader>ha", function()
    harpoon:list():add()
end)
vim.keymap.set("n", "<leader>hl", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<M-j>", function()
    harpoon:list():select(1)
end)
vim.keymap.set("n", "<M-k>", function()
    harpoon:list():select(2)
end)
vim.keymap.set("n", "<M-l>", function()
    harpoon:list():select(3)
end)
vim.keymap.set("n", "<M-;>", function()
    harpoon:list():select(4)
end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<leader>hp", function()
    harpoon:list():prev()
end)
vim.keymap.set("n", "<leader>hn", function()
    harpoon:list():next()
end)
