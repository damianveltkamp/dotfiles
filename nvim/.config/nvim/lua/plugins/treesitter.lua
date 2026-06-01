return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = 'BufReadPost',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    opts = {
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
    },
    config = function(_, opts)
      local treesitter = require 'nvim-treesitter'
      treesitter.setup(opts)

      local parsers = {
        'bash',
        'typescript',
        'diff',
        'tsx',
        'javascript',
        'jsx',
        'lua',
        'luadoc',
        'html',
        'json',
        'scss',
        'css',
        'graphql',
        'markdown',
        'markdown_inline',
        'query',
        'vim',
        'vimdoc',
      }

      treesitter.install(parsers)

      local function treesitter_try_attach(buf, language)
        if not vim.treesitter.language.add(language) then return end
        vim.treesitter.start(buf, language)

        -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        -- vim.wo.foldmethod = 'expr'

        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end

      local available_parsers = require('nvim-treesitter').get_available()

      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('EnableTreesitterHighlighting', { clear = true }),
        desc = 'Try to enable tree-sitter syntax highlighting',
        pattern = '*',
        callback = function(args)
          local buf, filetype = args.buf, args.match

          local language = vim.treesitter.language.get_lang(filetype)
          if not language then return end

          local installed_parsers = require('nvim-treesitter').get_installed 'parsers'

          if vim.tbl_contains(installed_parsers, language) then
            treesitter_try_attach(buf, language)
          elseif vim.tbl_contains(available_parsers, language) then
            require('nvim-treesitter').install(language):await(function() treesitter_try_attach(buf, language) end)
          else
            treesitter_try_attach(buf, language)
          end
        end,
      })

      local move = require 'nvim-treesitter-textobjects.move'

      vim.keymap.set('n', ']f', function() move.goto_next_start('@function.outer', 'textobjects') end)
      vim.keymap.set('n', '[f', function() move.goto_previous_start('@function.outer', 'textobjects') end)
      vim.keymap.set('n', ']F', function() move.goto_next_start('@function.inner', 'textobjects') end)
      vim.keymap.set('n', '[F', function() move.goto_previous_start('@function.inner', 'textobjects') end)

      vim.keymap.set('n', ']p', function() move.goto_next_start('@parameter.inner', 'textobjects') end)
      vim.keymap.set('n', '[p', function() move.goto_previous_start('@parameter.inner', 'textobjects') end)

      vim.keymap.set('n', ']r', function() move.goto_next_start('@return.outer', 'textobjects') end)
      vim.keymap.set('n', '[r', function() move.goto_previous_start('@return.outer', 'textobjects') end)
    end,
  },
}
