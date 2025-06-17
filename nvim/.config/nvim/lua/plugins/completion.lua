return {
  {
    'saghen/blink.cmp',
    event = 'InsertEnter',
    dependencies = 'rafamadriz/friendly-snippets',
    version = 'v0.*',
    opts = {
      keymap = {
        preset = 'enter',
        ['<Tab>'] = { 'select_next', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'fallback' },
        ['<C-K>'] = { 'snippet_forward', 'fallback' },
        ['<C-J>'] = { 'snippet_backward', 'fallback' },
      },
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 50,
          update_delay_ms = 50,
        },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      snippets = {
        preset = 'luasnip',
        -- This comes from the luasnip extra, if you don't add it, won't be able to
        -- jump forward or backward in luasnip snippets
        -- https://www.lazyvim.org/extras/coding/luasnip#blinkcmp-optional
        expand = function(snippet)
          require('luasnip').lsp_expand(snippet)
        end,
        active = function(filter)
          if filter and filter.direction then
            return require('luasnip').jumpable(filter.direction)
          end
          return require('luasnip').in_snippet()
        end,
        jump = function(direction)
          require('luasnip').jump(direction)
        end,
      },
      signature = { enabled = true },
    },
  },
}
