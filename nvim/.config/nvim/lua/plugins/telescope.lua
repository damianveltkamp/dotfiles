local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local previewers = require('telescope.previewers')
local sorters = require('telescope.sorters')

telescope.setup {
  defaults = {
    file_sorter = sorters.get_fzy_sorter,
    prompt_prefix = ' 🔍 ',
    color_devicons = true,

    file_previewer = previewers.vim_buffer_cat.new,
    grep_previewer = previewers.vim_buffer_vimgrep.new,
    qflist_previewer = previewers.vim_buffer_qflist.new,

    file_ignore_patterns = {'undodir/*', 'node_modules/*', 'package.lock.json', 'legacy/*'},

    mappings = {
      i = {
        ["<C-x>"] = false,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.send_to_qflist,
      },
    }
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = {"png", "webp", "jpg", "jpeg"},
      find_cmd = "rg" -- find command (defaults to `fd`)
    }
  }
}

telescope.load_extension('fzy_native')

local export = {}
export.search_dotfiles = function()
  builtin.find_files({
      prompt_title = '< VimRC >',
      cwd = '$HOME/.config/nvim/'
  })
end
export.search_notes = function ()
  builtin.find_files({
      prompt_title = '< VimRC >',
      cwd = '$HOME/documents/notes'
  })
end
export.grep_todos = function ()
  builtin.live_grep({
      prompt_title = '< TODOS >',
  })
end

return export
