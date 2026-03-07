local plugin_name = "neorg"
local status_ok, plugin = pcall(require, plugin_name)
if not status_ok then
    print(string.format("Failed to load %s", plugin_name))
    return
end

plugin.setup {
    load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.neorgcmd"] = {},
        ["core.dirman"] = {
            config = {
                workspaces = {
                    notes = vim.fn.expand("~/notes"),
                    harc = vim.fn.expand("~/Harc/Notes")
                },
                default_workspace = "notes"
            },
        },
    },
}
