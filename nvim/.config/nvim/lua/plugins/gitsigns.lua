return {
  {
    'lewis6991/gitsigns.nvim',
    event = 'BufReadPost',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    tag = 'v0.5',
    opts = {
      signs = {
        add = { hl = 'GitSignsAdd', text = '|', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
        change = { hl = 'GitSignsChange', text = '|', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
        delete = { hl = 'GitSignsDelete', text = '|', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
        topdelete = {
          hl = 'GitSignsDelete',
          text = '|',
          numhl = 'GitSignsDeleteNr',
          linehl = 'GitSignsDeleteLn',
        },
        changedelete = {
          hl = 'GitSignsChange',
          text = '|',
          numhl = 'GitSignsChangeNr',
          linehl = 'GitSignsChangeLn',
        },
      },
      numhl = false,
      linehl = false,
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        vim.api.nvim_buf_create_user_command(bufnr, 'GitHunkReset', function()
          gs.reset_hunk()
        end, { desc = 'Reset git hunk under cursor' })
      end,
      keymaps = {
        -- Default keymap options
        noremap = true,
        buffer = true,
      },
      watch_gitdir = {
        interval = 1000,
      },
      sign_priority = 10,
      update_debounce = 200,
      status_formatter = nil, -- Use default
    },
  },
}
