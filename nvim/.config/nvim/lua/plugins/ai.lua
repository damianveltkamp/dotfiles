local function send_with_skill(skill, msg)
  require('sidekick.cli').send {
    name = 'claude',
    msg = skill .. '\n' .. msg,
  }
end

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
      {
        '<c-.>',
        function() require('sidekick.cli').focus() end,
        desc = 'Sidekick Focus',
        mode = { 'n', 't', 'i', 'x' },
      },
      {
        '<leader>ao',
        function() require('sidekick.cli').toggle { name = 'claude' } end,
        desc = 'Sidekick Toggle CLI',
      },
      {
        '<leader>ad',
        function() require('sidekick.cli').close() end,
        desc = 'Detach a CLI Session',
      },
      {
        '<leader>at',
        function() send_with_skill('/caveman', '{this}') end,
        mode = { 'x', 'n' },
        desc = 'Send This',
      },
      {
        '<leader>af',
        function() send_with_skill('/caveman', '{file}') end,
        desc = 'Send File',
      },
      {
        '<leader>as',
        function() send_with_skill('/caveman', '{selection}') end,
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
