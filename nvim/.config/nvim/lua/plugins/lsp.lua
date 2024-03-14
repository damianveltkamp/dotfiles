return {
	"neovim/nvim-lspconfig",
	{ "hrsh7th/cmp-nvim-lsp", event = "InsertEnter" },
	{ "onsails/lspkind-nvim", event = "BufReadPost" },
	{ "jose-elias-alvarez/nvim-lsp-ts-utils", event = "BufReadPost" },
	{ "tami5/lspsaga.nvim", event = "BufReadPost" },
	{
		"nvim-treesitter/nvim-treesitter",
		event = "BufReadPost",
		run = ":TSUpdate",
	},
	{
		"folke/trouble.nvim",
		event = "BufReadPost",
		dependencies = "kyazdani42/nvim-web-devicons",
		opts = {},
	},
	{
		"pmizio/typescript-tools.nvim",
		event = "BufReadPost",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},
}
