return {
	{ "hoob3rt/lualine.nvim", event = "VimEnter" },
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
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
