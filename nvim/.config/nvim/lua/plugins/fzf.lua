return {
  {
    'ibhagwan/fzf-lua',
    keys = { '<leader>' },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local fzf_status_ok, fzf = pcall(require, 'fzf-lua')
      if not fzf_status_ok then
        vim.notify('Not able to load in fzf', vim.log.levels.Error)
        return
      end

      fzf.setup {
        'telescope',
      }
      vim.keymap.set('n', '<leader>ff', function()
        fzf.files()
      end, { desc = '[F]ind [F]iles' })
      vim.keymap.set('n', '<leader>fd', function()
        fzf.files { cwd = vim.fn.expand '%:p:h' }
      end, { desc = '[F]ind file in current [D]irectory' })
      vim.keymap.set('n', '<leader>sp', function()
        fzf.live_grep()
      end, { desc = '[S]earch [P]roject' })
      vim.keymap.set('n', '<leader>sd', function()
        fzf.live_grep { cwd = vim.fn.expand '%:p:h' }
      end, { desc = '[S]earch [W]ord inside current [D]irectory' })
      vim.keymap.set('n', '<leader>swp', function()
        local word = vim.fn.expand '<cword>'
        fzf.live_grep { search = word }
      end, { desc = '[S]earch [W]ord inside [P]roject' })
      vim.keymap.set('n', '<leader>sWp', function()
        local word = vim.fn.expand '<cWORD>'
        fzf.live_grep { search = word }
      end, { desc = '[S]earch [W]ord inside [P]roject' })
      vim.keymap.set('n', '<leader>fb', function()
        fzf.buffers()
      end, { desc = '[F]ind [B]uffer' })
      vim.keymap.set('n', '<leader>sh', function()
        fzf.help_tags()
      end, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>fn', function()
        fzf.files {
          cwd = '$HOME/documents/development/2nd-brain',
        }
      end, { desc = '[F]ind [N]otes' })
      vim.keymap.set('n', '<leader>sn', function()
        fzf.live_grep {
          cwd = '$HOME/documents/development/2nd-brain',
        }
      end, { desc = '[S]earch [N]otes' })
      vim.keymap.set('n', '<leader>sb', function()
        fzf.lgrep_curbuf()
      end, { desc = '[S]earch [B]uffer' })
    end,
  },
}
