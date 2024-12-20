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
          auto_show_delay_ms = 10,
          update_delay_ms = 10,
        },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        cmdline = {},
      },
      signature = { enabled = true },
    },
  },
}
