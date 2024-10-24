return {
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },
  { 'Bilal2453/luvit-meta', lazy = true },
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
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- LSP Status updater
      {
        'j-hui/fidget.nvim',
        event = 'BufReadPost',
        opts = {
          notification = {
            window = {
              winblend = 0,
            },
          },
        },
      },

      -- Allows extra capabilities provided by nvim-cmp
      'hrsh7th/cmp-nvim-lsp',
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
          -- vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, { desc = '[G]o to [D]efinition' })
          -- vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { desc = '[G]o to [R]eference' })
          -- vim.keymap.set('n', 'gi', require('telescope.builtin').lsp_implementations, { desc = '[G]o to [I]mplementation' })
          vim.keymap.set('n', 'gh', vim.lsp.buf.hover, { desc = '[G]et [H]over documentation' })
          vim.keymap.set('n', 'rn', vim.lsp.buf.rename, { desc = '[R]e[N]ame' })
          vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = '[C]ode [A]ction' })

          vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, bufopts 'Go to previous [D]iagnostic message')
          vim.keymap.set('n', ']d', vim.diagnostic.goto_next, bufopts 'Go to next [D]iagnostic message')

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
            vim.keymap.set('n', '<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
            end, { desc = '[T]oggle Inlay [H]ints' })
          end
        end,
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
            },
          },
        },
        eslint = {
          on_attach = function(_, bufnr)
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = bufnr,
              command = 'EslintFixAll',
            })
          end,
        },
        tailwindcss = {
          settings = {
            tailwindCSS = {
              validate = true,
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
                },
              },
            },
          },
        },
        html = {},
        cssls = {},
        cssmodules_ls = {},
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
              inlayHints = {
                includeInlayParameterNameHints = 'all', -- 'none' | 'literals' | 'all'
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayVariableTypeHints = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = 'all', -- 'none' | 'literals' | 'all'
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayVariableTypeHints = true,

                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
          },
          on_attach = function(client)
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
        'stylua', -- Used to format lua code
        'css-lsp',
        'prettier',
        'prettierd',
        'typescript-language-server',
        'yaml-language-server',
        'html-lsp',
        'graphql-language-service-cli',
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for ts_ls)
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
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
    event = 'BufReadPost',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
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
      },
      textobjects = {
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            [']k'] = { query = '@block.outer', desc = 'Next block start' },
            [']f'] = { query = '@function.outer', desc = 'Next function start' },
            [']a'] = { query = '@parameter.outer', desc = 'Next argument start' },
          },
          goto_next_end = {
            [']K'] = { query = '@block.outer', desc = 'Next block end' },
            [']F'] = { query = '@function.outer', desc = 'Next function end' },
            [']A'] = { query = '@parameter.outer', desc = 'Next argument end' },
          },
          goto_previous_start = {
            ['[k'] = { query = '@block.outer', desc = 'Previous block start' },
            ['[f'] = { query = '@function.outer', desc = 'Previous function start' },
            ['[a'] = { query = '@parameter.outer', desc = 'Previous argument start' },
          },
          goto_previous_end = {
            ['[K'] = { query = '@block.outer', desc = 'Previous block end' },
            ['[F'] = { query = '@function.outer', desc = 'Previous function end' },
            ['[A'] = { query = '@parameter.outer', desc = 'Previous argument end' },
          },
        },
      },
    },
    run = ':TSUpdate',
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
}
