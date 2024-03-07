local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local opts = {}

local plugins = {
	-- Colorscheme
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },

	-- Git
	"tpope/vim-fugitive",
	{
		"lewis6991/gitsigns.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		tag = "v0.5",
	},
	"f-person/git-blame.nvim",

	-- Lsp
	"neovim/nvim-lspconfig",
	"hrsh7th/cmp-nvim-lsp",
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

	-- Formatting
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		opts = {
			-- Define your formatters
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { { "prettierd", "prettier" } },
			},
			format_on_save = { timeout_ms = 500, lsp_fallback = true },
		},
	},

	-- Linting
	"mfussenegger/nvim-lint",

	-- Completion
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-buffer",
	"mattn/emmet-vim",
	"saadparwaiz1/cmp_luasnip",

	-- UI
	"romgrk/barbar.nvim",
	"hoob3rt/lualine.nvim",
	"norcalli/nvim-colorizer.lua",
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

	-- Snipets
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
	},

	-- Fuzy finding
	{
		"nvim-telescope/telescope.nvim",
		event = "VeryLazy",
		dependencies = {
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
			{
				"nvim-telescope/telescope-fzy-native.nvim",
			},
		},
	},

	-- Optimization
	"lewis6991/impatient.nvim",

	-- File finder
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"kyazdani42/nvim-web-devicons",
		},
	},

	-- Fonts & icons
	"lambdalisue/nerdfont.vim",
	"lambdalisue/glyph-palette.vim",
	"kyazdani42/nvim-web-devicons",
	"kosayoda/nvim-lightbulb",

	-- Navigation
	"unblevable/quick-scope",
	{
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	},

	-- Autopairing
	{
		"windwp/nvim-autopairs",
		opts = {},
	},
	"windwp/nvim-ts-autotag",

	-- MDX
	"jxnblk/vim-mdx-js",

	-- Markdown preview
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown", "markdown.mdx", "pandoc" }
		end,
		ft = { "markdown" },
	},

	-- Commenting
	"numToStr/Comment.nvim",
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		event = "BufReadPost",
	},

	-- Surround operations
	"tpope/vim-surround",

	-- Undo history explorer
	"mbbill/undotree",

	-- Custom notifications plugin
	"rcarriga/nvim-notify",

	-- Terminal integration
	{ "akinsho/toggleterm.nvim", version = "*", opts = {} },

	-- TODO comment highlighting
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
}
require("lazy").setup(plugins, opts)
