local actions = require('telescope.actions')
require('telescope').setup {
  defaults = {
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    prompt_prefix = ' 🔍 ',
    color_devicons = true,

    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

    file_ignore_patterns = {'undodir/*', 'node_modules/*', 'package.lock.json'},

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
    }
  }
}

-- Trim whitespace on safe
vim.api.nvim_command([[
augroup THE_PRIMEAGEN
  autocmd User TelescopePreviewerLoaded call glyph_palette#apply()
augroup END
]])

require('telescope').load_extension('fzy_native')

local export = {}
export.search_dotfiles = function()
  require('telescope.builtin').find_files({
      prompt_title = '< VimRC >',
      cwd = '$HOME/.config/nvim/'
  })
end
export.search_notes = function ()
  require('telescope.builtin').find_files({
      prompt_title = '< VimRC >',
      cwd = '$HOME/documents/notes'
  })
end
export.grep_todos = function ()
  require('telescope.builtin').live_grep({
      prompt_title = '< TODOS >',
  })
end

return export
