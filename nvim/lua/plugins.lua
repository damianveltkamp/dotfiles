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
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function()
      require('lualine').setup{
        options = {
          theme = 'wombat',
          section_separators = {'', ''},
          component_separators = {'|', '|'},
          icons_enabled = true,
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = {
            {'branch', icon = '', upper = true, color = {fg = '#000000', bg = '#FFA1AA'}}
          },
          lualine_c = { 'filename' },
          lualine_x = { 'encoding', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location'  },
        }
      }
    end
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
end)
