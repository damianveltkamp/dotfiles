vim.cmd([[packadd packer.nvim]])

local packer_status_ok, packer = pcall(require, "packer")
if not packer_status_ok then
	vim.notify("Not able to load in Packer", "error")
	return
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- and automatically installs plugins
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

packer.startup(function()
	use({ "wbthomason/packer.nvim", opt = true })

	-- Git
	use("tpope/vim-fugitive")
	use({
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		tag = "release",
	})

	-- Lsp
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use("onsails/lspkind-nvim")
	use("jose-elias-alvarez/nvim-lsp-ts-utils")
	use("tami5/lspsaga.nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	-- Completion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-buffer")
	use("mattn/emmet-vim")

	-- UI
	use("navarasu/onedark.nvim")
	use("romgrk/barbar.nvim")
	use("glepnir/dashboard-nvim")
	use("hoob3rt/lualine.nvim")
	use("norcalli/nvim-colorizer.lua")
	use("lukas-reineke/indent-blankline.nvim")

	-- Snipets
	use("norcalli/snippets.nvim")
	use("hrsh7th/vim-vsnip")
	use("L3MON4D3/LuaSnip")

	-- Fuzy finding
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
			{
				"nvim-telescope/telescope-fzy-native.nvim",
			},
		},
	})

	-- Optimization
	use("lewis6991/impatient.nvim")

	-- File finder
	use("lambdalisue/fern.vim")

	-- Fonts & icons
	use("lambdalisue/fern-renderer-nerdfont.vim")
	use("lambdalisue/nerdfont.vim")
	use("lambdalisue/glyph-palette.vim")
	use("kyazdani42/nvim-web-devicons")
	use("kosayoda/nvim-lightbulb")

	-- Navigation
	use("unblevable/quick-scope")
	use("justinmk/vim-sneak")

	-- Autopairing
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
	use("windwp/nvim-ts-autotag")

	-- JSX
	use("peitalin/vim-jsx-typescript")

	-- Pandoc & MDX
	use({
		"vim-pandoc/vim-pandoc",
		ft = { "markdown" },
	})
	use({
		"vim-pandoc/vim-pandoc-syntax",
		ft = { "markdown" },
	})
	use("jxnblk/vim-mdx-js")

	-- Markdown preview
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown", "markdown.mdx", "pandoc" }
		end,
		ft = { "markdown" },
	})

	-- Commenting
	use("numToStr/Comment.nvim")
	use({
		"JoosepAlviste/nvim-ts-context-commentstring",
		event = "BufReadPost",
	})

	-- Surround operations
	use("tpope/vim-surround")

	-- Undo history explorer
	use("mbbill/undotree")

	-- Custom notifications plugin
	use("rcarriga/nvim-notify")
end)
