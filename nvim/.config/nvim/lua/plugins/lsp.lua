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
    'folke/trouble.nvim',
    event = 'BufReadPost',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      modes = {
        diagnostics = {
          groups = {
            { 'filename', format = '{file_icon} {basename:Title} {count}' },
          },
        },
      },
    },
  },
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for neovim
      'williamboman/mason.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      -- LSP Status updater
      {
        'j-hui/fidget.nvim',
        opts = {
          notification = {
            window = {
              winblend = 0,
            },
          },
        },
        -- Completion
      },
      'saghen/blink.cmp',
    },
    opts = {
      inlay_hints = { enabled = true },
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(event)
          local bufopts = function(desc)
            return { noremap = true, silent = true, buffer = event.buf, desc = desc }
          end
          vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', bufopts '[G]o to [I]mplementation')
          vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', bufopts '[G]o to [R]eference')
          vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', bufopts '[G]o to [D]efinition')
          vim.keymap.set('n', 'gh', vim.lsp.buf.hover, { desc = '[G]et [H]over documentation' })
          vim.keymap.set('n', 'rn', vim.lsp.buf.rename, { desc = '[R]e[N]ame' })
          vim.keymap.set('n', '<leader>ca', '<cmd>FzfLua lsp_code_actions<CR>', { desc = '[C]ode [A]ction' })

          vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, bufopts 'Go to previous [D]iagnostic message')
          vim.keymap.set('n', ']d', vim.diagnostic.goto_next, bufopts 'Go to next [D]iagnostic message')

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client:supports_method('textDocument/inlayHint', event.buf) then
            vim.keymap.set('n', '<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, { desc = '[T]oggle Inlay [H]ints' })
          end
        end,
      })

      local capabilities = require('blink.cmp').get_lsp_capabilities()

      -- NOTE: for some reason on_attach on eslint server settings is not firing.
      -- Therefore I am putting the creation of the autocmd for BufWritePre outside of the server setup.
      -- We check if eslint is attached to the current buffer, if not we dont need to format with eslint.
      vim.api.nvim_create_autocmd('BufWritePre', {
        callback = function()
          local clients = vim.lsp.get_active_clients { bufnr = vim.api.nvim_get_current_buf() }
          for _, client in ipairs(clients) do
            if client.name == 'eslint' then
              vim.cmd 'LspEslintFixAll'
              return
            end
          end
        end,
      })

      -- Enable the following language servers
      --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
      --  See `:help lsp-config` for information about keys and how to configure
      local servers = {
        eslint = {},
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
        markdownlint = {},
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
          on_attach = function(client)
            vim.notify('ts_ls on_attach fired', vim.log.levels.INFO)
            client.server_capabilities.document_formatting = false
          end,
        },
      }

      -- Ensure the servers and tools above are installed
      --  To check the current status of installed tools and/or manually install
      --  other tools, you can run
      --    :Mason
      --
      --  You can press `g?` for help in this menu
      require('mason').setup()

      -- You can add other tools here that you want Mason to install
      -- for you, so that they are available from within Neovim.
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'lua_ls',
        'stylua',
        'prettier',
        'prettierd',
        'typescript-language-server',
        'css-lsp',
        'css-variables-language-server',
        'yaml-language-server',
        'html-lsp',
        'graphql-language-service-cli',
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      for name, server in pairs(servers) do
        server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
        vim.lsp.config(name, server)
        vim.lsp.enable(name)
      end

      vim.lsp.config('lua_ls', {
        on_init = function(client)
          if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if path ~= vim.fn.stdpath 'config' and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc')) then
              return
            end
          end

          client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
              version = 'LuaJIT',
              path = { 'lua/?.lua', 'lua/?/init.lua' },
            },
            workspace = {
              checkThirdParty = false,
              -- NOTE: this is a lot slower and will cause issues when working on your own configuration.
              --  See https://github.com/neovim/nvim-lspconfig/issues/3189
              library = vim.api.nvim_get_runtime_file('', true),
            },
          })
        end,
        settings = {
          Lua = {},
        },
      })
      vim.lsp.enable 'lua_ls'
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
    config = function(_, opts)
      require('lspkind').init(opts)
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = 'BufReadPost',
    -- TODO: Reimplement this when we get our new macbook
    -- dependencies = {
    --   'nvim-treesitter/nvim-treesitter-textobjects',
    -- },
    opts = {
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
      ensure_installed = {
        'typescript',
        'tsx',
        'javascript',
        'lua',
        'html',
        'json',
        'scss',
        'css',
        'graphql',
      },
      -- TODO: Reimplement this when we get our new macbook
      -- textobjects = {
      --   move = {
      --     enable = true,
      --     set_jumps = true,
      --     goto_next_start = {
      --       [']k'] = { query = '@block.outer', desc = 'Next block start' },
      --       [']f'] = { query = '@function.outer', desc = 'Next function start' },
      --       [']a'] = { query = '@parameter.outer', desc = 'Next argument start' },
      --     },
      --     goto_next_end = {
      --       [']K'] = { query = '@block.outer', desc = 'Next block end' },
      --       [']F'] = { query = '@function.outer', desc = 'Next function end' },
      --       [']A'] = { query = '@parameter.outer', desc = 'Next argument end' },
      --     },
      --     goto_previous_start = {
      --       ['[k'] = { query = '@block.outer', desc = 'Previous block start' },
      --       ['[f'] = { query = '@function.outer', desc = 'Previous function start' },
      --       ['[a'] = { query = '@parameter.outer', desc = 'Previous argument start' },
      --     },
      --     goto_previous_end = {
      --       ['[K'] = { query = '@block.outer', desc = 'Previous block end' },
      --       ['[F'] = { query = '@function.outer', desc = 'Previous function end' },
      --       ['[A'] = { query = '@parameter.outer', desc = 'Previous argument end' },
      --     },
      --   },
      -- },
    },
    config = function(_, opts)
      require('nvim-treesitter').setup(opts)
    end,
  },
}
