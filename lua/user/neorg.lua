local plugin_name = "neorg"
local status_ok, plugin = pcall(require, plugin_name)
if not status_ok then
    print(string.format("Failed to load %s", plugin_name))
    return
end

plugin.setup {
    load = {
        ["core.defaults"] = {},
        ["core.norg.concealer"] = {},
        ["core.norg.dirman"] = {
            config = {
                workspaces = {
                    my_notes = "~/notes",
                },
            },
        },
    },
}
