return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"kyazdani42/nvim-web-devicons",
	},
	config = function()
		vim.g.loaded_netrw = 1

		vim.g.loaded_netrwPlugin = 1

		-- set termguicolors to enable highlight groups
		vim.opt.termguicolors = true

		local function nvim_tree_on_attach(bufnr)
			local api = require("nvim-tree.api")

			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			-- default mappings
			api.config.mappings.default_on_attach(bufnr)

			-- custom mappings
			vim.keymap.set("n", "n", api.fs.create, opts("Create"))
			vim.keymap.set("n", "R", api.fs.create, opts("Create"))
		end

		-- OR setup with some options
		require("nvim-tree").setup({
			sort_by = "case_sensitive",
			on_attach = nvim_tree_on_attach,
			view = {
				adaptive_size = true,
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
	end,
}
