local status_ok, template = pcall(require, "template")
if not status_ok then
	return
end

template.setup({
	temp_dir = "~/AppData/Local/nvim/templates",
})

require("telescope").load_extension("find_template")
