vim.opt.setlocal = 'spell!'
vim.opt.spelllang = 'en_us'
vim.opt.colorcolumn = 100
vim.opt.textwidth = 100

vim.keymap.set('n', '<leader>bn', '<cmd>!buildNote -f %<CR>')
vim.keymap.set('n', '<leader>on', '<cmd>!openNote -f %<CR>')
