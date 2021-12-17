vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function()
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
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use 'unblevable/quick-scope'
  use 'lumiliet/vim-twig'
  use 'mbbill/undotree'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'
  use 'kosayoda/nvim-lightbulb'
  use 'jiangmiao/auto-pairs'
  use 'norcalli/snippets.nvim'
  use 'joshdick/onedark.vim'
  use 'onsails/lspkind-nvim'
  use 'hrsh7th/vim-vsnip'
  use 'Glench/Vim-Jinja2-Syntax'
  use 'styled-components/vim-styled-components'
  use 'vim-pandoc/vim-pandoc'
  use 'vim-pandoc/vim-pandoc-syntax'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use {
    "ray-x/lsp_signature.nvim",
  }
end)
