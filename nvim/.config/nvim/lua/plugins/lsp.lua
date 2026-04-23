local inlay_hints_settings = {
  includeInlayEnumMemberValueHints = true,
  includeInlayFunctionLikeReturnTypeHints = true,
  includeInlayFunctionParameterTypeHints = true,
  includeInlayParameterNameHints = 'literals',
  includeInlayParameterNameHintsWhenArgumentMatchesName = false,
  includeInlayPropertyDeclarationTypeHints = true,
  includeInlayVariableTypeHints = false,
  includeInlayVariableTypeHintsWhenTypeMatchesName = false,
}

return {
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'mason-org/mason.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      {
        'j-hui/fidget.nvim',
        opts = {
          notification = {
            window = {
              winblend = 0,
            },
          },
        },
      },
      'saghen/blink.cmp',
    },
    opts = {
      inlay_hints = { enabled = true },
    },
    config = function()
      -- NOTE: Below might get added to the default lsp command. For now it's not
      -- so I'm making my own command.
      vim.api.nvim_create_user_command('LspInfo', 'checkhealth vim.lsp', {})

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(event)
          local bufopts = function(desc) return { noremap = true, silent = true, buffer = event.buf, desc = desc } end
          vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', bufopts '[G]o to [I]mplementation')
          vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', bufopts '[G]o to [R]eference')
          vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', bufopts '[G]o to [D]efinition')
          vim.keymap.set('n', 'gh', vim.lsp.buf.hover, { desc = '[G]et [H]over documentation' })
          vim.keymap.set('n', 'rn', vim.lsp.buf.rename, { desc = '[R]e[N]ame' })
          vim.keymap.set('n', '<leader>ca', '<cmd>FzfLua lsp_code_actions<CR>', { desc = '[C]ode [A]ction' })

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client:supports_method('textDocument/inlayHint', event.buf) then
            vim.keymap.set(
              'n',
              '<leader>th',
              function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf }) end,
              { desc = '[T]oggle Inlay [H]ints' }
            )
          end
        end,
      })

      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local eslint_base_on_attach = vim.lsp.config.eslint.on_attach

      ---@type table<string, vim.lsp.Config>
      local servers = {
        lua_ls = {
          on_init = function(client)
            if client.workspace_folders then
              local path = client.workspace_folders[1].name
              if path ~= vim.fn.stdpath 'config' and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc')) then return end
            end

            client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
              runtime = {
                version = 'LuaJIT',
                path = { 'lua/?.lua', 'lua/?/init.lua' },
              },
              workspace = {
                checkThirdParty = false,
                library = vim.tbl_extend('force', vim.api.nvim_get_runtime_file('', true), {
                  '${3rd}/luv/library',
                  '${3rd}/busted/library',
                }),
              },
            })
          end,
          settings = {
            Lua = {},
          },
        },
        eslint = {
          on_attach = function(client, bufnr)
            if not eslint_base_on_attach then return end

            eslint_base_on_attach(client, bufnr)

            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = bufnr,
              command = 'LspEslintFixAll',
            })
          end,
        },
        tailwindcss = {
          settings = {
            tailwindCSS = {
              classFunctions = { 'cva', 'cx' },
              classAttributes = {
                'class',
                'className',
                'class:list',
                'classList',
                'ngClass',
                'styles',
                'style',
              },
              experimental = {
                classRegex = {
                  { 'cva\\(([^)]*)\\)', '["\'`]([^"\'`]*).*?["\'`]' },
                  { 'cx\\(([^)]*)\\)', "(?:'|\"|`)([^']*)(?:'|\"|`)" },
                  { 'tailwindMerge\\(([^)]*)\\)', "(?:'|\"|`)([^']*)(?:'|\"|`)" },
                  { 'twMerge\\(([^)]*)\\)', "(?:'|\"|`)([^']*)(?:'|\"|`)" },
                  { 'cn\\(([^)]*)\\)', "(?:'|\"|`)([^']*)(?:'|\"|`)" },
                },
              },
            },
          },
        },
        html = {},
        cssls = {},
        cssmodules_ls = {},
        css_variables = {},
        yamlls = {},
        jsonls = {},
        graphql = {
          filetypes = { 'graphql', 'typescriptreact', 'javascriptreact', 'typescript' },
        },
        ts_ls = {
          settings = {
            completions = {
              completeFunctionCalls = true,
            },
            typescript = {
              inlayHints = inlay_hints_settings,
            },
            javascript = {
              inlayHints = inlay_hints_settings,
            },
          },
          on_attach = function(client) client.server_capabilities.document_formatting = false end,
        },
        bashls = {},
        copilot = {},
      }

      -- Ensure the servers and tools above are installed
      --  To check the current status of installed tools and/or manually install
      --  other tools, you can run
      --    :Mason
      --
      --  You can press `g?` for help in this menu
      require('mason').setup()

      local ensure_installed = {
        'lua-language-server',
        'stylua',
        'prettier',
        'prettierd',
        'typescript-language-server',
        'css-lsp',
        'css-variables-language-server',
        'cssmodules-language-server',
        'yaml-language-server',
        'html-lsp',
        'graphql-language-service-cli',
        'eslint-lsp',
        'tailwindcss-language-server',
        'json-lsp',
        'markdownlint',
        'copilot-language-server',
      }

      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      for name, server in pairs(servers) do
        server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
        vim.lsp.config(name, server)
        vim.lsp.enable(name)
      end
    end,
  },
  {
    'onsails/lspkind-nvim',
    opts = {
      mode = 'symbol_text',
      symbol_map = {
        Text = '',
        Method = 'ƒ',
        Function = '',
        Constructor = '',
        Variable = '',
        Class = '',
        Interface = 'ﰮ',
        Module = '',
        Property = '',
        Unit = '',
        Value = '',
        Enum = '了',
        Keyword = '',
        Snippet = '﬌',
        Color = '',
        File = '',
        Folder = '',
        EnumMember = '',
        Constant = '',
        Struct = '',
      },
    },
    event = 'BufReadPost',
    config = function(_, opts) require('lspkind').init(opts) end,
  },
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

        -- enables treesitter based folds
        -- for more info on folds see `:help folds`
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
            -- enable the parser if it is installed
            treesitter_try_attach(buf, language)
          elseif vim.tbl_contains(available_parsers, language) then
            -- if a parser is available in `nvim-treesitter` auto install it, and enable it after the installation is done
            require('nvim-treesitter').install(language):await(function() treesitter_try_attach(buf, language) end)
          else
            -- try to enable treesitter features in case the parser exists but is not available from `nvim-treesitter`
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
