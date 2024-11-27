vim.keymap.set(
  'n',
  '<leader>csd',
  '<cmd>s/\\(\\S.*\\)/console.dir(\\1, { depth: null })<CR><cmd>noh<CR>',
  { desc = 'Put the content below cursor inside console log' }
)
vim.keymap.set(
  'i',
  '<leader>csd',
  '<cmd>s/\\(\\S.*\\)/console.dir(\\1, { depth: null })<CR><cmd>noh<CR><Esc>A',
  { desc = 'Put the content from the current line inside console log' }
)
vim.keymap.set(
  'c',
  '<leader>csd',
  's/\\(\\S.*\\)/console.dir(\\1, { depth: null })/<CR><cmd>noh<CR>',
  { desc = 'Put the content that is visually selected inside console logs' }
)
vim.keymap.set('n', '<leader>csl', '<cmd>s/\\(\\S.*\\)/console.log(\\1)<CR><cmd>noh<CR>', { desc = 'Put the content below cursor inside console log' })
vim.keymap.set(
  'i',
  '<leader>csl',
  '<cmd>s/\\(\\S.*\\)/console.log(\\1)<CR><cmd>noh<CR><Esc>A',
  { desc = 'Put the content from the current line inside console log' }
)
vim.keymap.set(
  'c',
  '<leader>csl',
  's/\\(\\S.*\\)/console.log(\\1)/<CR><cmd>noh<CR>',
  { desc = 'Put the content that is visually selected inside console logs' }
)
