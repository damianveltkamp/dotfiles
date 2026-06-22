return {
  {
    'christoomey/vim-tmux-navigator',
    lazy = false,
    init = function()
      -- Disable the default <C-\> "previous pane" mapping so it doesn't
      -- shadow toggleterm's <C-\> toggle keymap; keep h/j/k/l navigation.
      vim.g.tmux_navigator_no_mappings = 1
    end,
    keys = {
      { '<C-h>', '<cmd>TmuxNavigateLeft<cr>', desc = 'Navigate to left tmux pane/window' },
      { '<C-j>', '<cmd>TmuxNavigateDown<cr>', desc = 'Navigate to below tmux pane/window' },
      { '<C-k>', '<cmd>TmuxNavigateUp<cr>', desc = 'Navigate to above tmux pane/window' },
      { '<C-l>', '<cmd>TmuxNavigateRight<cr>', desc = 'Navigate to right tmux pane/window' },
    },
  },
}
