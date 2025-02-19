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
      vim.notify('Not able to load in luasnip', 'error')
      return
    end

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

    luasnip.add_snippets(nil, {
      typescriptreact = {
        -- Generic javascript snippets
        luasnip.parser.parse_snippet('switch', 'switch ($1) { \n  case "$2": { \n    $3 \n  } \n  $4 \n}'),
        luasnip.parser.parse_snippet('lookuptable', 'const $1 = ($2) => ({\n$3\n});'),
        luasnip.parser.parse_snippet('afunc', '($1) => {$2}'),

        -- React specific snippets
        luasnip.parser.parse_snippet('component', 'export type $1 = HTMLAttributes<HTMLElement> { \n $2 \n}\n\nexport const $3 = ({$4}: $5) => { \n};'),
        luasnip.parser.parse_snippet('styles', 'import * as styles from "./styles.css"'),

        -- Tanstack
        luasnip.parser.parse_snippet('tanstackQuery', 'const { data, error } = useQuery({\n  queryKey: [$1],\n  queryFn: () => $2,\n});\n$3'),

        -- Component doc
        luasnip.parser.parse_snippet('doc', '/**\n * $1\n */'),
      },
      typescript = {
        -- Generic javascript snippets
        luasnip.parser.parse_snippet('switch', 'switch ($1) { \n  case "$2": { \n    $3 \n  } \n  $4 \n}'),
        luasnip.parser.parse_snippet('lookuptable', 'const $1 = ($2) => ({\n$3\n});'),
        luasnip.parser.parse_snippet('afunc', '($1) => {$2}'),

        -- Tanstack
        luasnip.parser.parse_snippet('tanstackQuery', 'const { data, error } = useQuery({\n  queryKey: [$1],\n  queryFn: () => $2,\n});\n$3'),

        -- Vanilla extract snippets
        luasnip.parser.parse_snippet('ve:mq', "'@media': {\n[$1]: {\n $2 \n}\n},"),
        luasnip.parser.parse_snippet('ve:selectors', "selectors: {\n'$1': {\n $2 \n}\n},"),
        luasnip.parser.parse_snippet('ve:boolean', '$1: {\n  true: {\n    $2 \n  },\n  false: {\n    $3 \n  }\n},'),
        luasnip.parser.parse_snippet('ve:font', '...theme.fonts.$1'),

        -- Component doc
        luasnip.parser.parse_snippet('doc', '/**\n * $1\n  */'),
      },
    })
  end,
}
