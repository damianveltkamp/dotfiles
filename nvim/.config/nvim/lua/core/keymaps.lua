-- Set leader key
vim.g.mapleader = ' '

-- Extreme movementkeys
vim.keymap.set('n', 'H', '0', { desc = 'Jump to the beginning of the current line' })
vim.keymap.set('n', 'J', 'G', { desc = 'Jump to the bottom of the file' })
vim.keymap.set('n', 'K', 'gg', { desc = 'Jump to the Top of the file' })
vim.keymap.set('n', 'L', '$', { desc = 'Jump to the end of the current line' })

-- Insertmode movement movement
vim.keymap.set('i', '<C-h>', '<Left>', { desc = 'Move one character to the left in insert mode' })
vim.keymap.set('i', '<C-l>', '<Right>', { desc = 'Move one character to the right in insert mode' })

-- Command line movement
vim.keymap.set('c', '<C-h>', '<Left>', { desc = 'Move one character to the left in command mode' })
vim.keymap.set('c', '<C-j>', '<Down>', { desc = 'Move one line down in command mode' })
vim.keymap.set('c', '<C-k>', '<Up>', { desc = 'Move one line up in command mode' })
vim.keymap.set('c', '<C-l>', '<Right>', { desc = 'Move one character to the right in command mode' })

-- Window hopping
vim.keymap.set('n', '<leader>h', '<cmd> wincmd h <CR>', { desc = 'Focus window on the left of the current window' })
vim.keymap.set('n', '<leader>j', '<cmd> wincmd j <CR>', { desc = 'Focus window underneath current window' })
vim.keymap.set('n', '<leader>k', '<cmd> wincmd k <CR>', { desc = 'Focus window above current window' })
vim.keymap.set('n', '<leader>l', '<cmd> wincmd l <CR>', { desc = 'Focus window on the right of the current window' })

-- Buffer hopping
vim.keymap.set('n', '<TAB>', '<cmd> bnext <CR>', { desc = 'Focus on the next buffer' })
vim.keymap.set('n', '<S-TAB>', '<cmd> bprevious <CR>', { desc = 'Focus on the previous buffer' })

-- Search replace
vim.keymap.set('n', '<leader>rw', 'yiw :%s/<C-r>"/', { desc = '[R]ename [W]ord under cursor' })

-- Closes all buffers except current one
vim.keymap.set('n', '<leader>cab', '<cmd> %bd|e#|bd# <CR>', { desc = '[C]lose [A]ll other [B]uffers' })

-- Closes current buffer
vim.keymap.set('n', '<leader>cb', '<cmd> bd <CR>', { desc = '[C]lose [B]uffer' })

-- Paste from blackhole register
vim.keymap.set('v', '<leader>p', '"_dP', { desc = '[P]aste from blackhole register' })

-- Delete to blackhole register
vim.keymap.set('v', '<leader>d', '"_d', { desc = '[D]elete to blackhole register' })

-- Better tabbing
vim.keymap.set('v', '<', '<gv', { desc = 'Indent current line to the left' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent current line to the right' })

-- Spellchecking
vim.keymap.set('', '<F6>', '<cmd> set spelllang=nl<CR>', { desc = 'Set spellcheck to NL' })
vim.keymap.set('', '<F7>', '<cmd> set spelllang=en_us<CR>', { desc = 'Set spellcheck to EN' })

-- Remove highlighting from previous search
vim.keymap.set('n', '<leader><leader>', '<cmd> noh <CR>', { desc = 'Remove search highlight' })

-- Git keybindings
vim.keymap.set('n', '<leader>gs', '<cmd> Neogit <CR>', { desc = '[G]it [S]tage' })
vim.keymap.set('n', '<leader>gc', '<cmd> Neogit commit <CR>', { desc = '[G]it [C]ommit' })
vim.keymap.set('n', '<leader>ga', '<cmd> TermExec cmd="git ammend" go_back=0 <CR>', { desc = '[G]it [A]mmend' })
vim.keymap.set('n', '<leader>gp', '<cmd> TermExec cmd="git push" go_back=0 <CR>', { desc = '[G]it [P]ush' })
vim.keymap.set('n', '<leader>gsu', '<cmd> TermExec cmd="git su" go_back=0 <CR>', { desc = '[G]it [S]et [U]pstream' })
-- vim.keymap.set('n', '<leader>gj', '<cmd> diffget //3 <CR>', { desc = 'Accept left git changes' })
-- vim.keymap.set('n', '<leader>gf', '<cmd> diffget //2 <CR>', { desc = 'Accept right git changes' })
vim.keymap.set('n', '<leader>gb', '<cmd> lua require"gitsigns".blame_line{full=true} <CR>', { desc = '[G]it [B]lame' })
vim.keymap.set('n', '<leader>gpr', '<cmd> DVOpenNewPullRequest <CR>', { desc = '[G]it [P]ull [R]equest' })
vim.keymap.set('n', '<leader>gor', '<cmd> DVOpenCurrentRepo <CR>', { desc = '[G]it [O]pen [R]epo' })
vim.keymap.set('n', '<leader>gtn', '<cmd> DVGetTicketNumber<CR>', { desc = '[G]it [T]icket [N]umber' })

-- Search MDN
vim.keymap.set('n', '<leader>mdn', '<cmd> DVSearchMDNCss<CR>', { desc = '[G]it [T]icket [N]umber' })

-- Undotree bindings
vim.keymap.set('n', '<leader>u', '<cmd> UndotreeShow <CR>', { desc = '[U]ndo' })

vim.keymap.set('n', '<C-n>', '<cmd>NvimTreeFindFileToggle <CR>', { desc = 'Open file tree' })

-- Keymappings for quickfix list
vim.keymap.set('n', '<leader>qo', '<cmd> copen <CR>', { desc = '[Q]uickfixlist [O]pen' })
vim.keymap.set('n', '<leader>qc', '<cmd> cexpr []<CR>', { desc = '[Q]uickfixlist [C]lean' })
vim.keymap.set('n', '<leader>qn', '<cmd> cn <CR>', { desc = '[Q]uickfixlist [N]ext' })
vim.keymap.set('n', '<leader>qp', '<cmd> cp <CR>', { desc = '[Q]uickfixlist [P]revious' })

-- Opening current folder in finder
vim.keymap.set('n', '<leader>of', '<cmd> silent !open . <CR>', { desc = '[O]pen project [F]older in finder' })

-- Moving text
vim.keymap.set('v', '<C-j>', ":m '>+1<CR>gv=gv", { silent = true, desc = 'Move Selected Down' })
vim.keymap.set('v', '<C-k>', ":m '<-2<CR>gv=gv", { silent = true, desc = 'Move Selected Up' })
vim.keymap.set('n', '<C-j>', '<cmd> :m .+1 <CR> ==', { desc = 'Move current line downwards' })
vim.keymap.set('n', '<C-k>', '<cmd> :m .-2 <CR> ==', { desc = 'Move current line upwards' })

-- Don't yank with x
vim.keymap.set('n', 'x', '"_x')

-- Increment/decrement
vim.keymap.set('n', '+', '<C-a>', { desc = 'Increment number' })
vim.keymap.set('n', '-', '<C-x>', { desc = 'Decrement number' })

-- Select all
vim.keymap.set('n', '<C-a>', 'gg<S-v>G', { desc = 'Select everything in buffer' })

-- Markdown preview
vim.keymap.set('n', '<leader>mp', '<cmd>MarkdownPreview<CR>', { desc = '[M]arkdown [P]review' })

-- Resource luasnips
vim.keymap.set('n', '<leader><leader>s', '<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>')

-- Take code screenshot and copy to clopboard
vim.keymap.set('n', '<leader>ts', '<cmd>DVSiliconScreenshot <CR>', { desc = '[T]ake [S]creenshot of currently yanked text' })

-- Safe file faster
vim.keymap.set('n', '<leader>w', '<cmd>w <CR>', { desc = 'Save file' })
vim.keymap.set('n', '<leader>W', '<cmd>noa w <CR>', { desc = 'Save without formatting' })

-- Close buffer
vim.keymap.set('n', '<leader>q', '<cmd>q <CR>', { desc = 'Quit Neovim' })

-- Remove default bindings
vim.keymap.set('n', 's', '<Nop>')

-- Toggle Trouble window
vim.keymap.set('n', '<leader>tb', '<cmd>Trouble diagnostics toggle focus=true<CR>')
