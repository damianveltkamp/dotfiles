return {
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPost",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		tag = "v0.5",
		opts = {
			signs = {
				add = { hl = "GitSignsAdd", text = "|", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
				change = { hl = "GitSignsChange", text = "|", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
				delete = { hl = "GitSignsDelete", text = "|", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
				topdelete = {
					hl = "GitSignsDelete",
					text = "|",
					numhl = "GitSignsDeleteNr",
					linehl = "GitSignsDeleteLn",
				},
				changedelete = {
					hl = "GitSignsChange",
					text = "|",
					numhl = "GitSignsChangeNr",
					linehl = "GitSignsChangeLn",
				},
			},
			numhl = false,
			linehl = false,
			keymaps = {
				-- Default keymap options
				noremap = true,
				buffer = true,
			},
			watch_gitdir = {
				interval = 1000,
			},
			sign_priority = 1,
			update_debounce = 200,
			status_formatter = nil, -- Use default
		},
	},
}
