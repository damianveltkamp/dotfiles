vim.loader.enable()
vim.scriptencoding = 'utf-8'

vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }
vim.g.skip_ts_context_commentstring_module = true

local options = {
  swapfile = false,
  jumpoptions = 'stack', -- Make the jumplist behave like the tagstack
  timeoutlen = 500, -- Time in milliseconds to wait for a mapped sequence to complete.
  encoding = 'utf-8', -- Sets encoding to utf-8 for RPC communication.
  fileencoding = 'utf-8', -- Sets encoding to utf-8 for file content for the current buffer.
  shortmess = 'I',
  mouse = 'a', -- Enables mouse support.
  number = true, -- Enables line numbers.
  relativenumber = true, -- Enables relative line numbers.
  inccommand = 'split', -- Shows effects of a command in a preview window.
  ignorecase = true, -- Search case insensative.
  smartcase = true, -- Search case sensitive when there is capital letters inside search term.
  expandtab = true, -- Enables appropriate number of spaces to insert a tab in INSERT mode.
  tabstop = 2, -- Defines the number of spaces that a <Tab> in a file counts for.
  shiftwidth = 2, -- Number of spaces inserted for each indent.
  softtabstop = 2, -- Number of spaces inserted for each indent during editing operations.
  breakindent = true, -- Every wrapped line will continue visually indented.
  showmode = false, -- Disable showing current mode on last line.
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
  pumheight = 10, -- Sets hight of popup window
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

vim.api.nvim_create_autocmd({ 'VimEnter' }, {
  command = 'clearjumps',
})

vim.api.nvim_create_autocmd({ 'VimEnter', 'WinEnter', 'BufWinEnter' }, {
  command = 'setlocal cursorline',
})

vim.api.nvim_create_autocmd({ 'WinLeave' }, {
  command = 'setlocal nocursorline',
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
