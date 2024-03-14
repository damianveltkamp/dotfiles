return {
	{ "romgrk/barbar.nvim", event = "VimEnter" },
	{ "hoob3rt/lualine.nvim", event = "VimEnter" },
	{ "norcalli/nvim-colorizer.lua", event = "BufReadPost", opts = {} },
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufReadPost",
		main = "ibl",
		opts = { scope = { enabled = false } },
	},
	{ "lambdalisue/nerdfont.vim", event = "VimEnter" },
	{ "lambdalisue/glyph-palette.vim", event = "VimEnter" },
	{ "kyazdani42/nvim-web-devicons", event = "VimEnter" },
	{ "kosayoda/nvim-lightbulb", event = "BufReadPost" },
}
