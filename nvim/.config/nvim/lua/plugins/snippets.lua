return {
  'L3MON4D3/LuaSnip',
  event = { 'InsertEnter' },
  -- follow latest release.
  version = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  -- install jsregexp (optional!).
  build = 'make install_jsregexp',
  config = function()
    local luasnip_status_ok, luasnip = pcall(require, 'luasnip')
    if not luasnip_status_ok then
      vim.notify('Not able to load in luasnip', vim.log.levels.Error)
      return
    end

    require('luasnip.loaders.from_snipmate').lazy_load()

    luasnip.config.set_config {
      history = true,
      -- This enables dynamic snippets update as you type.
      updateevents = 'TextChanged,TextChangedI',
      enable_autosnippets = true,
    }

    -- Luasnip keymap
    vim.keymap.set({ 'i', 's' }, '<c-k>', function()
      if luasnip.expand_or_jumpable() then
        print '44'
        luasnip.expand_or_jump()
      end
    end, { silent = true })

    vim.keymap.set({ 'i', 's' }, '<c-j>', function()
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      end
    end, { silent = true })

    luasnip.snippets = {
      all = {
        luasnip.parser.parse_snippet('Expand', '--testing'),
      },
    }
  end,
}
