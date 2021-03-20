require('utils/setoptions')
require('utils/setvariable')

vim.cmd 'filetype plugin indent on'
vim.cmd 'syntax on'
vim.cmd 'set noswapfile'
vim.cmd 'set cindent'
vim.cmd 'set signcolumn=yes'
vim.cmd 'set jumpoptions+=stack'
setOption('global', 'mouse', 'a')
setOption('global', 'encoding', 'utf-8')
setOption('window', 'number', true)
setOption('window', 'relativenumber', true)
setOption('global', 'clipboard', 'unnamedplus')
setOption('buffer', 'expandtab', true)
setOption('buffer', 'tabstop', 2)
setOption('buffer', 'shiftwidth', 2)
setOption('buffer', 'softtabstop', 2)
setOption('global', 'hidden', true)
setOption('global', 'showmode', false)
setOption('global', 'termguicolors', true)
setOption('global', 'updatetime', 50)
setOption('window', 'wrap', false)
setOption('global', 'backup', false)
setOption('global', 'undofile', true)
setOption('global', 'undodir', os.getenv( "HOME" ) .. '/.config/nvim/undodir')
setOption('global', 'scrolloff', 16)
setOption('buffer', 'autoindent', true)
setOption('global', 'smarttab', true)
setOption('buffer', 'smartindent', true)
setOption('global', 'splitbelow', true)
setOption('global', 'splitright', true)

-- Quickscope highlight on specific keys
setGlobalVariable('qs_highlight_on_keys', {'f', 'F', 't', 'T'})

-- TODO KEEP AN EYE OUT ON WHY I NEED TO INSERT A = SIGN BEFORE END
-- Highlight yanked text
vim.api.nvim_command([[
augroup LuaHighlight
    autocmd TextYankPost * lua require 'vim.highlight'.on_yank({timeout = 80})
augroup = END
]])

-- Return to the same line you left off at
vim.api.nvim_command([[
augroup line_return
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \	execute 'normal! g`"zvzz' |
        \ endif
augroup END
]])

-- Trim whitespace on safe
vim.api.nvim_command([[
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup THE_PRIMEAGEN
    autocmd BufWritePre * :call TrimWhitespace()
augroup END
]])

-- Unset default keymappings for fern
setGlobalVariable('fern#disable_default_mappings', 1)
setGlobalVariable('fern#renderer', 'nerdfont')
setGlobalVariable('loaded_netrw', 1)
setGlobalVariable('loaded_netrwPlugin', 1)
setGlobalVariable('loaded_netrwFileHandlers', 1)

-- GitGutter
setGlobalVariable('gitgutter_enabled', 1)
setGlobalVariable('git_gutter_sign_priority', 1)
