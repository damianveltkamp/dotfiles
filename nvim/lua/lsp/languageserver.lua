require('utils/setvariable')
require('utils/setoptions')
require('lsp/diagnostics')

-- TODO define own mappings
-- require'snippets'.use_suggested_mappings()

local nvim_lsp = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true;

-- Set completion menu options
setOption('global', 'completeopt', 'menuone,noselect')

-- Completion compe setup
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    vsnip = true;
    nvim_lsp = true;
    nvim_lua = true;
    spell = true;
    tags = true;
    snippets_nvim = true;
    treesitter = true;
  };
}

-- Saves buffer after document format
vim.lsp.handlers["textDocument/formatting"] = function(err, _, result, _, bufnr)
  if err ~= nil or result == nil then
    return
  end
  if not vim.api.nvim_buf_get_option(bufnr, "modified") then
    local view = vim.fn.winsaveview()
    vim.lsp.util.apply_text_edits(result, bufnr)
    vim.fn.winrestview(view)
    if bufnr == vim.api.nvim_get_current_buf() then
      vim.cmd [[noautocmd :update]]

      -- TODO check why gitgutter is called here
      -- vim.cmd [[GitGutter]]
    end
  end
end

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col('.') - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    return true
  else
    return false
  end
end

_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.tab_complete()', {expr = true})
vim.api.nvim_set_keymap('s', '<Tab>', 'v:lua.tab_complete()', {expr = true})
vim.api.nvim_set_keymap('i', '<S-Tab>', 'v:lua.s_tab_complete()', {expr = true})
vim.api.nvim_set_keymap('s', '<S-Tab>', 'v:lua.s_tab_complete()', {expr = true})

-- TODO check why this fks up my enter key when completion window has no selection
vim.cmd "inoremap <silent><expr> <CR>      compe#confirm('<CR>')"
vim.cmd "inoremap <silent><expr> <C-Space> compe#complete()"
-- vim.api.nvim_set_keymap('i', '<CR>', 'compe#confirm("<CR>")', {expr = true})

-- Config symbols
require('lspkind').init({
    with_text = true,
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
      Struct = ''
    },
})

-- Format telescope

-- Format options for prettier
local format_options_prettier = {
  tabWidth = 2,
  singleQuote = true,
  trailingComma = 'all',
  configPrecedence = 'prefer-file'
}

-- Binding format options
vim.g.format_options_typescript = format_options_prettier
vim.g.format_options_javascript = format_options_prettier
vim.g.format_options_typescriptreact = format_options_prettier
vim.g.format_options_javascriptreact = format_options_prettier
vim.g.format_options_json = format_options_prettier
vim.g.format_options_css = format_options_prettier
vim.g.format_options_scss = format_options_prettier
vim.g.format_options_html = format_options_prettier
vim.g.format_options_yaml = format_options_prettier
vim.g.format_options_markdown = format_options_prettier

_G.formatting = function()
  if not vim.g[string.format("format_disabled_%s", vim.bo.filetype)] then
    vim.lsp.buf.formatting(vim.g[string.format("format_options_%s", vim.bo.filetype)] or {})
  end
end

local on_attach = function(client, bufnr)
  -- TODO set signs
  -- vim.lsp.diagnostic.set_signs('LspDiagnosticsSignError', bufnr, client, '', { text = "", texthl = "LspDiagnosticsDefaultError" })
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local opts = { noremap=true}

  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'ghi', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gsi', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '[d', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', 'gdw', '<Cmd>lua require("telescope.builtin").lsp_workspace_diagnostics()<CR>', opts)

  if client.resolved_capabilities.completion then
    vim.cmd 'imap <silent> <C-n> <Plug>(completion_trigger)'
  end

  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_exec([[
    augroup Format
    autocmd! * <buffer>
    autocmd BufWritePre <buffer> lua formatting()
    augroup END
    ]], true)
  elseif client.resolved_capabilities.document_range_formatting then
    -- TODO set range formatting stuff
  end

  if client.resolved_capabilities.code_action then
    vim.cmd [[augroup CodeAction]]
    vim.cmd [[autocmd! * <buffer>]]
    vim.cmd [[autocmd CursorHold * lua require'nvim-lightbulb'.update_lightbulb()]]
    vim.cmd [[augroup END]]

    -- TODO find out why telescope code actions is not working
    -- buf_set_keymap('n', 'ga', '<Cmd>lua require("telescope.builtin").lsp_code_actions()<CR>', opts)
    buf_set_keymap('n', 'ga', '<Cmd> lua vim.lsp.buf.code_action() <CR>', opts)
  end
end

-- Tsserver setup
nvim_lsp.tsserver.setup {
  root_dir = nvim_lsp.util.root_pattern('.git'),
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    on_attach(client)
  end
}

-- requires snippet support to provide completion
nvim_lsp.html.setup {
  capabilities = capabilities;
  on_attach = on_attach,
}

-- Css server
nvim_lsp.cssls.setup {
  capabilities = capabilities;
  on_attach = on_attach
}

-- Formatting via efm
local eslint = require 'lsp/efm/eslint'
local prettier = require 'lsp/efm/prettier'

-- TODO add back prettier for html when i find a way to implement nunjucks formatting
local languages = {
  typescript = {prettier, eslint},
  javascript = {prettier, eslint},
  typescriptreact = {prettier, eslint},
  javascriptreact = {prettier, eslint},
  yaml = {prettier},
  json = {prettier},
  html = {},
  scss = {prettier},
  css = {prettier},
  markdown = {prettier},
  pandoc = {prettier},
  bib = {prettier}
}

nvim_lsp.efm.setup {
  on_attach = on_attach,
  filetypes = vim.tbl_keys(languages),
  init_options = {
    documentFormatting = true,
    hover = true,
    documentSymbol = true,
    codeAction = true,
    completion = true
  },
  settings = {
    log_file = '~/.config/efm.log',
    rootMarkers = {
      ".lua-format",
      ".eslintrc.cjs",
      ".eslintrc",
      ".eslintrc.json",
      ".eslintrc.js",
      ".prettierrc",
      ".prettierrc.js",
      ".prettierrc.json",
      ".prettierrc.yml",
      ".prettierrc.yaml",
      ".prettier.config.js",
      ".prettier.config.cjs",
    },
    languages = languages,
  }
}

local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

local sumneko_root_path = os.getenv( "HOME" ) .. '/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

-- Lua language server setup
nvim_lsp.sumneko_lua.setup {
  on_attach = on_attach,
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    -- Insert your settings here
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    },
  }
}

-- Yaml language server setup
nvim_lsp.yamlls.setup {
  on_attach = on_attach
}

-- Vim language server setup
nvim_lsp.vimls.setup {
  on_attach = on_attach
}

-- Json language server setup
nvim_lsp.jsonls.setup {
  on_attach = on_attach
}
