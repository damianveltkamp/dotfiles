-- Set leader key
vim.g.mapleader = " "

-- Extreme movementkeys
vim.keymap.set("n", "H", "0")
vim.keymap.set("n", "L", "$")
vim.keymap.set("n", "J", "G")
vim.keymap.set("n", "J", "G")
vim.keymap.set("n", "K", "gg")

-- Insertmode movement movement
vim.keymap.set("i", "<C-h>", "<Left>")
-- vim.keymap.set("i", "<C-j>", "<Down>")
-- vim.keymap.set("i", "<C-k>", "<Up>")
vim.keymap.set("i", "<C-l>", "<Right>")

-- Command line movement
vim.keymap.set("c", "<C-h>", "<Left>")
vim.keymap.set("c", "<C-j>", "<Down>")
vim.keymap.set("c", "<C-k>", "<Up>")
vim.keymap.set("c", "<C-l>", "<Right>")

-- Window hopping
vim.keymap.set("n", "<leader>h", "<cmd> wincmd h <CR>")
vim.keymap.set("n", "<leader>j", "<cmd> wincmd j <CR>")
vim.keymap.set("n", "<leader>k", "<cmd> wincmd k <CR>")
vim.keymap.set("n", "<leader>l", "<cmd> wincmd l <CR>")

-- Buffer hopping
vim.keymap.set("n", "<TAB>", "<cmd> bnext <CR>")
vim.keymap.set("n", "<S-TAB>", "<cmd> bprevious <CR>")

-- Closes all buffers except current one
vim.keymap.set("n", "<leader>cab", "<cmd> %bd|e#|bd# <CR>")
-- Closes current buffer
vim.keymap.set("n", "<leader>cb", "<cmd> BufferClose <CR>")

-- Paste from blackhole register
vim.keymap.set("v", "<leader>p", '"_dP')

-- Delete to blackhole register
vim.keymap.set("v", "<leader>d", '"_d')
vim.keymap.set("n", "<leader>d", '"_d')

-- Better tabbing
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Spellchecking
vim.keymap.set("", "<F6>", "<cmd> set spelllang=nl<CR>")
vim.keymap.set("", "<F7>", "<cmd> set spelllang=en_us<CR>")

-- Remove highlighting from previous search
vim.keymap.set("n", "<Space>", "<cmd> noh <CR>")

-- Launch telescope
vim.keymap.set("n", "<leader>f", '<cmd> lua require("telescope.builtin").find_files() <CR>')
vim.keymap.set("n", "<leader>ps", '<cmd> lua require("telescope.builtin").live_grep() <CR>')
vim.keymap.set("n", "<leader>pb", '<cmd> lua require("telescope.builtin").buffers() <CR>')
vim.keymap.set("n", "<leader>th", '<cmd> lua require("telescope.builtin").help_tags()<CR>')
vim.keymap.set("n", "<leader>vrc", '<cmd> lua require("plugins/telescope").search_dotfiles()<CR>')
vim.keymap.set("n", "<leader>bf", '<cmd> lua require("plugins/telescope").search_notes()<CR>')
vim.keymap.set("n", "<leader>bs", '<cmd> lua require("plugins/telescope").grep_notes()<CR>')
vim.keymap.set("n", "<leader>mf", '<cmd> lua require("telescope").extensions.media_files.media_files() <CR>')

-- Git keybindings
vim.keymap.set("n", "<leader>gs", "<cmd> Git <CR>")
vim.keymap.set("n", "<leader>gc", "<cmd> Git commit <CR>")
vim.keymap.set("n", "<leader>gp", "<cmd> TermExec cmd='git push' <CR>")
vim.keymap.set("n", "<leader>gsu", "<cmd> TermExec cmd='git su' <CR>")
vim.keymap.set("n", "<leader>gj", "<cmd> diffget //3 <CR>")
vim.keymap.set("n", "<leader>gf", "<cmd> diffget //2 <CR>")
vim.keymap.set("n", "<leader>gb", '<cmd> lua require"gitsigns".blame_line{full=true} <CR>')
vim.keymap.set("n", "<leader>gpr", "<cmd> DVOpenNewPullRequest <CR>")
vim.keymap.set("n", "<leader>gor", "<cmd> DVOpenCurrentRepo <CR>")
vim.keymap.set("n", "<leader>gbt", "<cmd> Gitsigns toggle_current_line_blame <CR>")

-- Undotree bindings
vim.keymap.set("n", "<leader>u", "<cmd> UndotreeShow <CR>")

vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeFindFileToggle <CR>")

-- Keymapping to start a development server
vim.keymap.set("n", "<leader>ss", "<cmd> silent lua startServer() <CR>")

-- Keymappings for quickfix list
vim.keymap.set("n", "<leader>qo", "<cmd> copen <CR>")
vim.keymap.set("n", "<leader>qc", "<cmd> cexpr []<CR>")
vim.keymap.set("n", "<leader>qn", "<cmd> cn <CR>")
vim.keymap.set("n", "<leader>qp", "<cmd> cp <CR>")

-- Opening current folder in finder
vim.keymap.set("n", "<leader>of", "<cmd> silent !open . <CR>")

-- Moving text
-- TODO find out why this does not work
-- vim.keymap.set("<cmd> :m '>+1<CR>gv=gv")
-- vim.keymap.set("<cmd> :m '<-2<CR>gv=gv")
vim.keymap.set("n", "<C-j>", "<cmd> :m .+1 <CR> ==")
vim.keymap.set("n", "<C-k>", "<cmd> :m .-2 <CR> ==")

-- Eslint_d
vim.keymap.set("n", "<leader>ef", "mF:%!eslint_d --stdin --fix-to-stdout<CR>`F")

-- Don't yank with x
vim.keymap.set("n", "x", '"_x')

-- Increment/decrement
vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")

-- Select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G")

-- Markdown preview
vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreview<CR>")

-- Start search and replace
vim.keymap.set("n", "<leader>rp", ":%s/")

-- Resource luasnips
vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>")

-- Open floating terminal
vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm <CR>")

-- Take code screenshot and copy to clopboard
vim.keymap.set("n", "<leader>ts", "<cmd>DVSiliconScreenshot <CR>")

-- Nvim hop
vim.keymap.set("n", "s", "<cmd>HopChar2 <CR>")

-- Safe file faster
vim.keymap.set("n", "<leader>w", "<cmd>w <CR>")
vim.keymap.set("n", "<leader>W", "<cmd>noa w <CR>")

-- Close buffer
vim.keymap.set("n", "<leader>q", "<cmd>q <CR>")
