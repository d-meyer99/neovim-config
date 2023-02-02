local status_ok, nvimtree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

nvimtree.setup{
	view = {
		width = 30,
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
			}
		}
	},
	renderer = {
		highlight_git = true,
	}
}
