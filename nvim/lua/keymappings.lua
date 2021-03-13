require('utils/setmapping')

-- Set leader key
vim.cmd 'let mapleader = " "'
vim.cmd 'let g:gitgutter_map_keys = 0'

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

-- Paste from blackhole register
map('v', '<leader>p', '"_dP')

-- Delete to blackhole register
map('v', '<leader>d', '"_d')
map('n', '<leader>d', '"_d')

-- Better tabbing
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Spellchecking
map('', '<F6>', '<cmd> setlocal spell! spelllang=nl<CR>')
map('', '<F7>', '<cmd> set spelllang=en_us<CR>')
map('', '<F8>', '<cmd> set nospell<CR>')

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
map('n', '<leader>gj', '<cmd> diffget //3 <CR>')
map('n', '<leader>gf', '<cmd> diffget //2 <CR>')

-- Completion menu navigation
-- local function t(str)
--     return vim.api.nvim_replace_termcodes(str, true, true, true)
-- end

-- function smart_tab()
--     return vim.fn.pumvisible() == 1 and t'<C-n>' or t'<Tab>'
-- end

-- function smart_tab_backwards()
--     return vim.fn.pumvisible() == 1 and t'<C-p>' or t'<S-Tab>'
-- end

-- vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.smart_tab()', {expr = true, noremap = true})
-- vim.api.nvim_set_keymap('i', '<S-Tab>', 'v:lua.smart_tab_backwards()', {expr = true, noremap = true})

-- Undotree bindings
map('n', '<leader>u', '<cmd> UndotreeShow <CR>')

-- Fern bindings
map('n', '<C-n>', '<cmd> Fern . -drawer -reveal=% -toggle -width=35 <CR>')
