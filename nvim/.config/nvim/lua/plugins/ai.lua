return {
  {
    'folke/sidekick.nvim',
    event = 'BufReadPost',
    opts = {
      cli = {
        mux = {
          backend = 'tmux',
          enabled = true,
        },
      },
    },
    keys = {
      -- {
      --   '<tab>',
      --   function()
      --     -- if there is a next edit, jump to it, otherwise apply it if any
      --     if not require('sidekick').nes_jump_or_apply() then
      --       return '<Tab>' -- fallback to normal tab
      --     end
      --   end,
      --   expr = true,
      --   desc = 'Goto/Apply Next Edit Suggestion',
      -- },
      {
        '<c-.>',
        function() require('sidekick.cli').focus() end,
        desc = 'Sidekick Focus',
        mode = { 'n', 't', 'i', 'x' },
      },
      {
        '<leader>ao',
        function() require('sidekick.cli').toggle { name = 'opencode' } end,
        desc = 'Sidekick Toggle CLI',
      },
      {
        '<leader>ad',
        function() require('sidekick.cli').close() end,
        desc = 'Detach a CLI Session',
      },
      {
        '<leader>at',
        function() require('sidekick.cli').send { name = 'opencode', msg = '{this}' } end,
        mode = { 'x', 'n' },
        desc = 'Send This',
      },
      {
        '<leader>af',
        function() require('sidekick.cli').send { name = 'opencode', msg = '{file}' } end,
        desc = 'Send File',
      },
      {
        '<leader>as',
        function() require('sidekick.cli').send { name = 'opencode', msg = '{selection}' } end,
        mode = { 'x' },
        desc = 'Send Visual Selection',
      },
      {
        '<leader>ap',
        function() require('sidekick.cli').prompt() end,
        mode = { 'n', 'x' },
        desc = 'Sidekick Select Prompt',
      },
    },
  },
}
