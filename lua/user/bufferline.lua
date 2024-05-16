local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

bufferline.setup({
	options = {
		mode = "buffer",               -- set to "tabs" to only show tabpages instead
		numbers = "ordinal",
		close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
		right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
		left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
		middle_mouse_command = nil,    -- can be a string | function, see "Mouse actions"
		indicator = {
			style = "underline",
		},
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		--- name_formatter can be used to change the buffer's label in the bufferline.
		--- Please note some names can/will break the
		--- bufferline so use this at your discretion knowing that it has
		--- some limitations that will *NOT* be fixed.
		max_name_length = 18,
		max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
		truncate_names = true, -- whether or not tab names should be truncated
		tab_size = 18,
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = false,
		-- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
		diagnostics_indicator = function(count, level, _, _)
			local icon = level:match("error") and " " or " "
			return " " .. icon .. count
		end,
		offsets = {
			{
				filetype = "NvimTree",
				text = "Nvim Tree",
				text_align = "center",
				separator = true,
			},
		},
		color_icons = true, -- whether or not to add the filetype icon highlights
		show_buffer_icons = true, -- disable filetype icons for buffers
		show_buffer_close_icons = false,
		show_close_icon = false,
		separator_style = "slant",
		always_show_bufferline = true,
		sort_by = "insert_at_end",
		highlights = require("catppuccin.groups.integrations.bufferline").get(),
		groups = {
			options = {
				toggle_hidden_on_enter = true -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
			},
			items = {
				require('bufferline.groups').builtin.pinned:with({ icon = "" }),
				require('bufferline.groups').builtin.ungrouped,
				{
					name = "Wiki", -- Mandatory
					auto_close = true, -- whether or not close this group if it doesn't contain the current buffer
					matcher = function(buf) -- Mandatory
						return buf.filename:match('%.wiki')
					end,
				},
			}
		}
	},
})
