local g = vim.g
vim.opt.background = "dark"

g.gruvbox_material_transparent_background = 2
g.gruvbox_material_disable_italic_comment = 1
g.gruvbox_material_foreground = 'material'
g.gruvbox_material_background = 'hard'
g.gruvbox_material_transparent_background = 2
g.gruvbox_material_dim_inactive_window = 1
g.gruvbox_material_visual = 'red background'
g.gruvbox_material_better_performance = 1
g.gruvbox_material_ui_contrast = 'high'
g.gruvbox_material_diagnostic_line_highlight = 1
g.gruvbox_material_colors_override = { bg2 = {'#543937', '52'}}
vim.cmd("colorscheme gruvbox-material")
