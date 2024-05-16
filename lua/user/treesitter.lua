local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

require("nvim-treesitter.install").prefer_git = false

require('orgmode').setup_ts_grammar()

configs.setup {
	-- one of "all", "maintained" (parsers with maintainers), or a list of languages
	ensure_installed = { "lua", "vim", "help", "c_sharp", "org" },
	-- install languages synchronously (only applied to `ensure_installed`)
	sync_install = false,
	ignore_install = { "" },
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "" },
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true },
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	}
}

require('orgmode').setup {}
