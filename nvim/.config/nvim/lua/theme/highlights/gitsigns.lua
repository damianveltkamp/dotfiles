-- TODO refactor this when nvim provides proper highlight api
-- also add colors from global colors file
vim.api.nvim_command([[
  hi GitSignsAdd guifg=#98c379
  hi GitSignsChange guifg=#61afef
  hi GitSidnsDelete guifg=#e06c75
]])
