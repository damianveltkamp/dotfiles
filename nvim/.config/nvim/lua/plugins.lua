vim.cmd [[packadd packer.nvim]]

local packer_status_ok, packer = pcall(require, 'packer')
if not packer_status_ok then
  vim.notify('Not able to load in Packer', 'error')
  return
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- and automatically installs plugins
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

packer.startup(function()
  use {'wbthomason/packer.nvim', opt = true}
  use 'tpope/vim-fugitive'
  use 'mattn/emmet-vim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}, {'nvim-telescope/telescope-fzy-native.nvim'}}
  }
  use 'gruvbox-community/gruvbox'
  use 'lambdalisue/fern.vim'
  use 'lambdalisue/nerdfont.vim'
  use 'lambdalisue/fern-renderer-nerdfont.vim'
  use 'lambdalisue/glyph-palette.vim'
  use 'numToStr/Comment.nvim'
  use 'tpope/vim-surround'
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    tag = 'release'
  }
  use 'kyazdani42/nvim-web-devicons'
  use 'hoob3rt/lualine.nvim'
  use 'unblevable/quick-scope'
  use 'lumiliet/vim-twig'
  use 'mbbill/undotree'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'
  use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
  use 'kosayoda/nvim-lightbulb'
  use 'jiangmiao/auto-pairs'
  use 'norcalli/snippets.nvim'
  use 'navarasu/onedark.nvim'
  use 'onsails/lspkind-nvim'
  use 'hrsh7th/vim-vsnip'
  use {
    'Glench/Vim-Jinja2-Syntax',
    ft = {'html', 'jinja.html'}
  }
  use {
    'vim-pandoc/vim-pandoc',
    ft = {'markdown'}
  }
  use {
    'vim-pandoc/vim-pandoc-syntax',
    ft = {'markdown'}
  }
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use {
    "ray-x/lsp_signature.nvim",
  }
  use 'justinmk/vim-sneak'
  use 'nvim-telescope/telescope-media-files.nvim'
  use 'peitalin/vim-jsx-typescript'
  use 'tami5/lspsaga.nvim'
  use 'rcarriga/nvim-notify'
  use 'romgrk/barbar.nvim'
  use {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "BufReadPost",
  }
  use 'glepnir/dashboard-nvim'
end)
