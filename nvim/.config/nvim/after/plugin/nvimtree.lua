vim.g.loaded_netrw = 1

vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		adaptive_size = true,
		mappings = {
			list = {
				{ key = "n", action = "create" },
				{ key = "d", action = "remove" },
				{ key = "R", action = "refresh" },
				{ key = "r", action = "rename" },
				{ key = "<C-v>", action = "vsplit" },
			},
		},
	},
	renderer = {
		icons = {
			glyphs = {
				default = "",
				symlink = "",
				bookmark = "",
				folder = {
					arrow_closed = "",
					arrow_open = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "M",
					staged = "✓",
					unmerged = "",
					renamed = "R",
					untracked = "+",
					deleted = "-",
					ignored = "◌",
				},
			},
		},
	},
	filters = {
		dotfiles = true,
	},
})
