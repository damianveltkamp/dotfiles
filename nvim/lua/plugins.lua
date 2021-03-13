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
  use 'airblade/vim-gitgutter'
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
end)
