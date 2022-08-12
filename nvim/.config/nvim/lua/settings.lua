vim.scriptencoding = "utf-8"

require("utils/setoptions")
require("utils/setvariable")
require("utils/git")

vim.cmd("filetype plugin indent on")
vim.cmd("syntax on")
vim.cmd("set noswapfile")
vim.cmd("set cindent")
vim.cmd("set signcolumn=yes:2")
vim.cmd("set showmatch")
vim.cmd("let g:fern_disable_startup_warnings = 1")

vim.cmd("set jumpoptions+=stack")
setOption("global", "encoding", "utf-8")
setOption("global", "fileencoding", "a")
setOption("global", "mouse", "a")
setOption("window", "number", true)
setOption("window", "relativenumber", true)
setOption("global", "inccommand", "split")
setOption("global", "ignorecase", true)
setOption("global", "breakindent", true)
setOption("global", "clipboard", "unnamedplus")
setOption("buffer", "expandtab", true)
setOption("buffer", "tabstop", 2)
setOption("buffer", "shiftwidth", 2)
setOption("buffer", "softtabstop", 2)
setOption("global", "hidden", true)
setOption("global", "showmode", false)
setOption("global", "termguicolors", true)
setOption("global", "updatetime", 50)
setOption("window", "wrap", false)
setOption("global", "backup", false)
setOption("global", "undofile", true)
setOption("global", "undodir", os.getenv("HOME") .. "/.config/undodir")
setOption("global", "scrolloff", 16)
setOption("buffer", "autoindent", true)
setOption("global", "smarttab", true)
setOption("buffer", "smartindent", true)
setOption("global", "splitbelow", true)
setOption("global", "splitright", true)

-- Quickscope highlight on specific keys
setGlobalVariable("qs_highlight_on_keys", { "f", "F", "t", "T" })

setGlobalVariable("fern#disable_default_mappings", 1)
setGlobalVariable("fern#renderer", "nerdfont")
setGlobalVariable("loaded_netrw", 1)
setGlobalVariable("loaded_netrwPlugin", 1)
setGlobalVariable("loaded_netrwFileHandlers", 1)

-- Pandoc setup
setGlobalVariable("pandoc#completion#bib#mode", "citeproc")
vim.cmd("let g:pandoc#biblio#bibs = ['~/.pandoc/default.bib']")
vim.cmd('let g:pandoc#modules#disabled = ["folding"]')

-- Vim sneak settings
vim.cmd("let g:sneak#prompt = '🔎'")
vim.cmd("let g:sneak#use_ic_scs = 1")
vim.cmd("let g:sneak#label = 1")

-- Highlight yanked text
vim.api.nvim_command([[
augroup LuaHighlight
    autocmd TextYankPost * :lua require 'vim.highlight'.on_yank({timeout = 80})
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
