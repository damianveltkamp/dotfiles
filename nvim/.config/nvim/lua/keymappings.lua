require('utils/setmapping')

-- Set leader key
vim.cmd 'let mapleader = " "'

-- Extreme movementkeys
map('n', 'H', '0')
map('n', 'L', '$')
map('n', 'J', 'G')
map('n', 'K', 'gg')

-- Insertmode movement movement
map('i', '<C-h>', '<Left>')
map('i', '<C-j>', '<Down>')
map('i', '<C-k>', '<Up>')
map('i', '<C-l>', '<Right>')

-- Command line movement
map('c', '<C-h>', '<Left>')
map('c', '<C-j>', '<Down>')
map('c', '<C-k>', '<Up>')
map('c', '<C-l>', '<Right>')

-- Window hopping
map('n', '<leader>h', '<cmd> wincmd h <CR>')
map('n', '<leader>j', '<cmd> wincmd j <CR>')
map('n', '<leader>k', '<cmd> wincmd k <CR>')
map('n', '<leader>l', '<cmd> wincmd l <CR>')

-- Buffer hopping
map('n', '<TAB>', '<cmd> bnext <CR>')
map('n', '<S-TAB>', '<cmd> bprevious <CR>')

-- Closes all buffers except current one
map('n', 'cb', '<cmd> %bd|e#|bd# <CR>');

-- Paste from blackhole register
map('v', '<leader>p', '"_dP')

-- Delete to blackhole register
map('v', '<leader>d', '"_d')
map('n', '<leader>d', '"_d')

-- Better tabbing
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Spellchecking
map('', '<F6>', '<cmd> set spelllang=nl<CR>')
map('', '<F7>', '<cmd> set spelllang=en_us<CR>')

-- Remove highlighting from previous search
map('n', '<Space>', '<cmd> noh <CR>')

-- Launch telescope
map('n', '<leader>f', '<cmd> lua require("telescope.builtin").find_files() <CR>')
map('n', '<leader>ps', '<cmd> lua require("telescope.builtin").live_grep() <CR>')
map('n', '<leader>pb', '<cmd> lua require("telescope.builtin").buffers() <CR>')
map('n', '<leader>th', '<cmd> lua require("telescope.builtin").help_tags()<CR>')
map('n', '<leader>vrc', '<cmd> lua require("plugins/telescope").search_dotfiles()<CR>')
map('n', '<leader>nd', '<cmd> lua require("plugins/telescope").search_notes()<CR>')

-- Git keybindings
map('n', '<leader>gs', '<cmd> Git <CR>')
map('n', '<leader>gc', '<cmd> Git commit <CR>')
map('n', '<leader>gp', '<cmd> Git push <CR>')
map('n', '<leader>gsu', '<cmd> !git su <CR>')
map('n', '<leader>gj', '<cmd> diffget //3 <CR>')
map('n', '<leader>gf', '<cmd> diffget //2 <CR>')
map('n', '<leader>gb', '<cmd> lua require"gitsigns".blame_line{full=true} <CR>')
-- map('n', '<leader>gbt', '<cmd> Gitsigns toggle_current_line_blame <CR>')

-- Undotree bindings
map('n', '<leader>u', '<cmd> UndotreeShow <CR>')

-- Fern bindings
map('n', '<C-n>', '<cmd> Fern . -drawer -reveal=% -toggle -width=35 <CR>')

-- Format document
map('n', '<leader>fd', '<cmd> silent !eslint --fix % <CR>')

-- Switch tab stop
map('n', '<leader>ts2', '<cmd> set tabstop=2 shiftwidth=2 softtabstop=2 <CR>')
map('n', '<leader>ts4', '<cmd> set tabstop=4 shiftwidth=4 softtabstop=4 <CR>')
