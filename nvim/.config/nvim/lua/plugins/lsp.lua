return {
	"neovim/nvim-lspconfig",
	{ "hrsh7th/cmp-nvim-lsp", event = "InsertEnter" },
	"onsails/lspkind-nvim",
	"jose-elias-alvarez/nvim-lsp-ts-utils",
	"tami5/lspsaga.nvim",
	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	},
	{
		"folke/trouble.nvim",
		dependencies = "kyazdani42/nvim-web-devicons",
		opts = {},
	},
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},
}
