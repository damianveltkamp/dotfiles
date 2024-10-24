return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    cmd = { 'Neotree' },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    opts = {
      filesystem = {
        follow_current_file = {
          enabled = true,
        },
      },
    },
  },
}
-- return {
--   'nvim-tree/nvim-tree.lua',
--   -- event = 'VeryLazy',
--   cmd = { 'NvimTreeFindFileToggle' },
--   dependencies = {
--     'nvim-tree/nvim-web-devicons',
--   },
--   config = function()
--     vim.g.loaded_netrw = 1
--
--     vim.g.loaded_netrwPlugin = 1
--
--     -- set termguicolors to enable highlight groups
--     vim.opt.termguicolors = true
--
--     local function nvim_tree_on_attach(bufnr)
--       local api = require 'nvim-tree.api'
--
--       -- local function opts(desc)
--       --   return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
--       -- end
--
--       -- default mappings
--       api.config.mappings.default_on_attach(bufnr)
--
--       -- custom mappings
--       -- vim.keymap.set('n', 'n', api.fs.create, opts 'Create')
--       -- vim.keymap.set('n', 'R', api.fs.create, opts 'Create')
--     end
--
--     -- OR setup with some options
--     require('nvim-tree').setup {
--       sort_by = 'case_sensitive',
--       on_attach = nvim_tree_on_attach,
--       view = {
--         adaptive_size = true,
--       },
--       renderer = {
--         icons = {
--           glyphs = {
--             default = '',
--             symlink = '',
--             bookmark = '',
--             folder = {
--               arrow_closed = '',
--               arrow_open = '',
--               default = '',
--               open = '',
--               empty = '',
--               empty_open = '',
--               symlink = '',
--               symlink_open = '',
--             },
--             git = {
--               unstaged = 'M',
--               staged = '✓',
--               unmerged = '',
--               renamed = 'R',
--               untracked = '+',
--               deleted = '-',
--               ignored = '◌',
--             },
--           },
--         },
--       },
--       filters = {
--         dotfiles = true,
--       },
--     }
--   end,
-- }
