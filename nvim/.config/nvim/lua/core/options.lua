vim.loader.enable()
vim.scriptencoding = 'utf-8'

vim.cmd 'filetype plugin indent on'
vim.cmd 'syntax on'
vim.cmd 'set noswapfile'
vim.cmd 'set cindent'
vim.cmd 'set showmatch'
vim.cmd 'set jumpoptions+=stack'

vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }
vim.g.skip_ts_context_commentstring_module = true

local options = {
  timeoutlen = 500,
  encoding = 'utf-8', -- Sets encoding to utf-8 for RPC communication.
  fileencoding = 'utf-8', -- Sets encoding to utf-8 for file content for the current buffer.
  mouse = 'a', -- Enables mouse support.
  number = true, -- Enables line numbers.
  relativenumber = true, -- Enables relative line numbers.
  inccommand = 'split', -- Shows effects of a command in a preview window.
  ignorecase = true, -- Search case insensative.
  breakindent = true, -- Every wrapped line will continue visually indented.
  clipboard = 'unnamedplus', -- Enables system clipboard integration.
  expandtab = true, -- Enables appropriate number of spaces to insert a tab in INSERT mode.
  tabstop = 2, -- Defines the number of spaces that a <Tab> in a file counts for.
  shiftwidth = 2, -- Number of spaces inserted for each indent.
  softtabstop = 2, -- Number of spaces inserted for each indent during editing operations.
  autoindent = true, -- Copies indent from current line when starting new line.
  smartindent = true, -- Enables smart indenting.
  showmode = false, -- Disable showing current mode on last line.
  termguicolors = true, -- Enables 24-bit RGB colors in the TUI.
  updatetime = 300, -- Time till command is executed after typing last character.
  wrap = false, -- Disable wrapping.
  backup = false, -- Disable writing of backup files.
  undofile = true, -- Enables persistant undo's.
  undodir = os.getenv 'HOME' .. '/.config/undodir', -- Sets the directory in which undofiles should be saved.
  scrolloff = 16, -- Amount of screen lines to keep above and below cursor before buffer scrolls.
  splitbelow = true, -- When splitting a window will put the new window below the current one.
  splitright = true, -- When splitting a window will put the new window on the right of the current one.
  signcolumn = 'yes:2', -- Sets 2 columns for signcolumn.
  laststatus = 3, -- Enables global statusline
  cursorline = true, -- Enables cursor line
  cursorcolumn = true, -- Enables vertical cursor line
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  pattern = { '*.tsx', '*.ts', '*.jsx', '*.js' },
  command = 'silent! EslintFixAll',
})

vim.api.nvim_create_autocmd({ 'InsertLeave', 'BufWritePost', 'TextChanged' }, {
  callback = function()
    local lint_status, lint = pcall(require, 'lint')
    if lint_status then
      lint.try_lint()
    end
  end,
})

vim.api.nvim_create_autocmd({ 'TextYankPost' }, {
  callback = function()
    vim.highlight.on_yank { timeout = 200 }
  end,
})

-- Return to the same line you left off at
vim.api.nvim_command [[
augroup line_return
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \	execute 'normal! g`"zvzz' |
        \ endif
augroup END
]]

vim.api.nvim_command [[
augroup Cursorline
    au VimEnter * setlocal cursorline
    au WinEnter * setlocal cursorline
    au BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END
]]
