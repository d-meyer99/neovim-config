local status_ok, nvimtree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

nvimtree.setup({
	view = {
		width = 30,
		hide_root_folder = true,
	},
	renderer = {
		highlight_git = true,
		group_empty = true,
		full_name = true,
		indent_markers = {
			enable = true,
			inline_arrows = true,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				bottom = "─",
				none = " ",
			},
		},
	},
	filters = {
		dotfiles = true,
	},
})
