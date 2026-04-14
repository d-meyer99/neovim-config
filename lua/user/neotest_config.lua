local plugin_name = "neotest"
local status_ok, plugin = pcall(require, plugin_name)
if not status_ok then
    print(string.format("Failed to load %s", plugin_name))
    return
end

plugin.setup({
    adapters = {
        require('rustaceanvim.neotest')
    }
})
