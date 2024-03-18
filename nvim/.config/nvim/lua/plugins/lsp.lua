return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
      -- used for completion, annotations and signatures of Neovim apis
      { 'folke/neodev.nvim', opts = {} },
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(event)
          local bufopts = { noremap = true, silent = true, buffer = event.buf }
          vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
          vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')

          vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, bufopts, { desc = 'Go to previous [D]iagnostic message' })
          vim.keymap.set('n', ']d', vim.diagnostic.goto_next, bufopts, { desc = 'Go to next [D]iagnostic message' })

          vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, { desc = '[G]o to [D]efinition' })
          vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { desc = '[G]o to [R]eference' })
          vim.keymap.set('n', 'gI', require('telescope.builtin').lsp_implementations, { desc = '[G]o to [I]mplementation' })
          vim.keymap.set('n', 'gh', '<cmd>Lspsaga hover_doc <CR>', { desc = '[G]et [H]over documentation' })
          vim.keymap.set('n', 'rn', '<cmd>Lspsaga rename<CR>', { desc = '[R]e[N]ame' })
          vim.keymap.set('n', '<leader>ca', '<cmd> Lspsaga code_action <CR>', { desc = '[C]ode [A]ction' })
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
        html = {},
        cssls = {},
        yamlls = {},
        tsserver = {
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
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for tsserver)
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },
  { 'hrsh7th/cmp-nvim-lsp', event = 'InsertEnter' },
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
  { 'jose-elias-alvarez/nvim-lsp-ts-utils', event = 'BufReadPost' },
  { 'tami5/lspsaga.nvim', event = 'BufReadPost' },
  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      highlight = {
        enable = true,
        disable = function()
          local filetype = vim.bo.filetype
          if filetype == 'help' then
            return true
          end
        end,
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
    },
    event = 'BufReadPost',
    run = ':TSUpdate',
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
  {
    'folke/trouble.nvim',
    event = 'BufReadPost',
    dependencies = 'kyazdani42/nvim-web-devicons',
    opts = {},
  },
  {
    'pmizio/typescript-tools.nvim',
    event = 'BufReadPost',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
  },
}
