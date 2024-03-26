return {
  'nvim-telescope/telescope.nvim',
  keys = { '<leader>' },
  dependencies = {
    { 'nvim-lua/popup.nvim' },
    { 'nvim-lua/plenary.nvim' },
    {
      'nvim-telescope/telescope-fzy-native.nvim',
    },
    {
      'nvim-telescope/telescope-live-grep-args.nvim',
      -- This will not install any breaking changes.
      -- For major updates, this must be adjusted manually.
      version = '^1.0.0',
    },
  },
  config = function()
    local telescope_status_ok, telescope = pcall(require, 'telescope')
    if not telescope_status_ok then
      vim.notify('Not able to load in telescope', 'error')
      return
    end

    local actions_status_ok, actions = pcall(require, 'telescope.actions')
    if not actions_status_ok then
      vim.notify('Not able to load in telescope actions', 'error')
      return
    end

    local builtin_status_ok, builtin = pcall(require, 'telescope.builtin')
    if not builtin_status_ok then
      vim.notify('Not able to load in telescope builtin', 'error')
      return
    end

    local utils_status_ok, utils = pcall(require, 'telescope.utils')
    if not utils_status_ok then
      vim.notify('Not able to load in telescope utils', 'error')
      return
    end

    local previewers_status_ok, previewers = pcall(require, 'telescope.previewers')
    if not previewers_status_ok then
      vim.notify('Not able to load in telescope previewers', 'error')
      return
    end

    local sorters_status_ok, sorters = pcall(require, 'telescope.sorters')
    if not sorters_status_ok then
      vim.notify('Not able to load in telescope sorters', 'error')
      return
    end

    local lga_actions_status_ok, lga_actions = pcall(require, 'telescope-live-grep-args.actions')
    if not sorters_status_ok then
      vim.notify('Not able to load in telescope live grep args', 'error')
      return
    end

    telescope.load_extension 'live_grep_args'

    telescope.setup {
      defaults = {
        file_sorter = sorters.get_fzy_sorter,
        prompt_prefix = ' 🔍 ',
        color_devicons = true,

        file_previewer = previewers.vim_buffer_cat.new,
        grep_previewer = previewers.vim_buffer_vimgrep.new,
        qflist_previewer = previewers.vim_buffer_qflist.new,

        file_ignore_patterns = { 'undodir/*', 'node_modules/*', 'package.lock.json', 'legacy/*' },

        mappings = {
          i = {
            ['<C-x>'] = false,
            ['<C-j>'] = actions.move_selection_next,
            ['<C-k>'] = actions.move_selection_previous,
            ['<C-q>'] = actions.send_to_qflist,
          },
        },
        layout_config = {
          horizontal = {
            preview_cutoff = 0,
          },
        },
      },
      extensions = {
        fzy_native = {
          override_generic_sorter = false,
          override_file_sorter = true,
        },
        live_grep_args = {
          auto_quoting = true, -- enable/disable auto-quoting
          -- define mappings, e.g.
          mappings = { -- extend mappings
            i = {
              ['<C-k>'] = lga_actions.quote_prompt(),
            },
          },
        },
      },
    }

    telescope.load_extension 'fzy_native'

    vim.api.nvim_create_user_command('SearchDotfiles', function()
      builtin.find_files {
        prompt_title = 'VimRC',
        cwd = '$HOME/.config/nvim/',
      }
    end, {})
    vim.api.nvim_create_user_command('FindNotes', function()
      builtin.find_files {
        prompt_title = 'File 2nd brain',
        cwd = '$HOME/documents/development/2nd-brain',
      }
    end, {})
    vim.api.nvim_create_user_command('SearchNotes', function()
      builtin.live_grep {
        prompt_title = 'Grep 2nd brain',
        cwd = '$HOME/documents/development/2nd-brain',
      }
    end, {})
    vim.api.nvim_create_user_command('SearchBuffer', function()
      builtin.current_buffer_fuzzy_find()
    end, {})

    -- Telescope
    vim.keymap.set('n', '<leader>ff', '<cmd> lua require("telescope.builtin").find_files() <CR>', { desc = '[F]ind [F]iles' })
    vim.keymap.set('n', '<leader>fd', function()
      builtin.find_files { cwd = utils.buffer_dir() }
    end, { desc = '[F]ind file in current [D]irectory' })
    vim.keymap.set('n', '<leader>sp', '<cmd> lua require("telescope.builtin").live_grep() <CR>', { desc = '[S]earch [P]roject' })
    vim.keymap.set('n', '<leader>swp', function()
      local word = vim.fn.expand '<cword>'
      builtin.grep_string { search = word }
    end, { desc = '[S]earch [W]ord inside [P]roject' })
    vim.keymap.set('n', '<leader>sWp', function()
      local word = vim.fn.expand '<cWORD>'
      builtin.grep_string { search = word }
    end, { desc = '[S]earch [W]ord inside [P]roject' })
    vim.keymap.set('n', '<leader>swa', ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
    vim.keymap.set('n', '<leader>fb', '<cmd> lua require("telescope.builtin").buffers() <CR>', { desc = '[F]ind [B]uffer' })
    vim.keymap.set('n', '<leader>sh', '<cmd> lua require("telescope.builtin").help_tags()<CR>', { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>fn', '<cmd> FindNotes <CR>', { desc = '[F]ind [N]otes' })
    vim.keymap.set('n', '<leader>sn', '<cmd> SearchNotes <CR>', { desc = '[S]earch [N]otes' })
    vim.keymap.set('n', '/', '<cmd> SearchBuffer <CR>', { desc = '[S]earch [B]uffer' })
    vim.keymap.set('n', '<leader>sk', '<cmd> lua require("telescope.builtin").keymaps() <CR>', { desc = '[S]earch [K]eymaps' })
  end,
}
