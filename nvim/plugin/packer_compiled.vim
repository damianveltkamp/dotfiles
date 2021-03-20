" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/Users/damianveltkamp/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/damianveltkamp/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/damianveltkamp/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/damianveltkamp/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/damianveltkamp/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["Vim-Jinja2-Syntax"] = {
    loaded = true,
    path = "/Users/damianveltkamp/.local/share/nvim/site/pack/packer/start/Vim-Jinja2-Syntax"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/Users/damianveltkamp/.local/share/nvim/site/pack/packer/start/auto-pairs"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/Users/damianveltkamp/.local/share/nvim/site/pack/packer/start/emmet-vim"
  },
  ["fern-renderer-nerdfont.vim"] = {
    loaded = true,
    path = "/Users/damianveltkamp/.local/share/nvim/site/pack/packer/start/fern-renderer-nerdfont.vim"
  },
  ["fern.vim"] = {
    loaded = true,
    path = "/Users/damianveltkamp/.local/share/nvim/site/pack/packer/start/fern.vim"
  },
  ["glyph-palette.vim"] = {
    loaded = true,
    path = "/Users/damianveltkamp/.local/share/nvim/site/pack/packer/start/glyph-palette.vim"
  },
  gruvbox = {
    loaded = true,
    path = "/Users/damianveltkamp/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/damianveltkamp/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nÁ\3\0\0\a\0\26\0\0316\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\3=\3\t\0025\3\v\0005\4\n\0=\4\f\0034\4\3\0005\5\r\0005\6\14\0=\6\15\5>\5\1\4=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\0035\4\21\0=\4\22\0035\4\23\0=\4\24\3=\3\25\2B\0\2\1K\0\1\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\3\0\0\rencoding\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\ncolor\1\0\2\afg\f#000000\abg\f#FFA1AA\1\2\2\0\vbranch\nupper\2\ticon\bîœ‚\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\25component_separators\1\3\0\0\6|\6|\23section_separators\1\3\0\0\5\5\1\0\2\18icons_enabled\2\ntheme\vwombat\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/Users/damianveltkamp/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["nerdfont.vim"] = {
    loaded = true,
    path = "/Users/damianveltkamp/.local/share/nvim/site/pack/packer/start/nerdfont.vim"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/Users/damianveltkamp/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lightbulb"] = {
    loaded = true,
    path = "/Users/damianveltkamp/.local/share/nvim/site/pack/packer/start/nvim-lightbulb"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/damianveltkamp/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/damianveltkamp/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["onedark.vim"] = {
    loaded = true,
    path = "/Users/damianveltkamp/.local/share/nvim/site/pack/packer/start/onedark.vim"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/damianveltkamp/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/damianveltkamp/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/damianveltkamp/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["quick-scope"] = {
    loaded = true,
    path = "/Users/damianveltkamp/.local/share/nvim/site/pack/packer/start/quick-scope"
  },
  ["snippets.nvim"] = {
    loaded = true,
    path = "/Users/damianveltkamp/.local/share/nvim/site/pack/packer/start/snippets.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/Users/damianveltkamp/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/damianveltkamp/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  undotree = {
    loaded = true,
    path = "/Users/damianveltkamp/.local/share/nvim/site/pack/packer/start/undotree"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/damianveltkamp/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/damianveltkamp/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/Users/damianveltkamp/.local/share/nvim/site/pack/packer/start/vim-gitgutter"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/damianveltkamp/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-twig"] = {
    loaded = true,
    path = "/Users/damianveltkamp/.local/share/nvim/site/pack/packer/start/vim-twig"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/damianveltkamp/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  }
}

-- Config for: lualine.nvim
try_loadstring("\27LJ\2\nÁ\3\0\0\a\0\26\0\0316\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\3=\3\t\0025\3\v\0005\4\n\0=\4\f\0034\4\3\0005\5\r\0005\6\14\0=\6\15\5>\5\1\4=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\0035\4\21\0=\4\22\0035\4\23\0=\4\24\3=\3\25\2B\0\2\1K\0\1\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\3\0\0\rencoding\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\ncolor\1\0\2\afg\f#000000\abg\f#FFA1AA\1\2\2\0\vbranch\nupper\2\ticon\bîœ‚\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\25component_separators\1\3\0\0\6|\6|\23section_separators\1\3\0\0\5\5\1\0\2\18icons_enabled\2\ntheme\vwombat\nsetup\flualine\frequire\0", "config", "lualine.nvim")
END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
