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
        win = {
          layout = 'left',
          split = {
            width = 0.6,
          },
        },
      },
    },
    config = function(_, opts)
      require('sidekick').setup(opts)

      -- Re-apply the AI split width when the terminal/GUI window is resized
      -- (e.g. Ghostty tiled to half the screen alongside Chrome).
      vim.api.nvim_create_autocmd('VimResized', {
        callback = function()
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            if vim.w[win].sidekick_cli then
              vim.api.nvim_win_set_width(win, math.floor(vim.o.columns * 0.6))
            end
          end
        end,
      })
    end,
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
        function() send_with_skill('/grill-with-docs', '{this}') end,
        mode = { 'x', 'n' },
        desc = 'Send This',
      },
      {
        '<leader>af',
        function() send_with_skill('/grill-with-docs', '{file}') end,
        desc = 'Send File',
      },
      {
        '<leader>as',
        function() send_with_skill('/grill-with-docs', '{selection}') end,
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
