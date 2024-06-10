return {
  'mfussenegger/nvim-lint',
  event = 'BufReadPost',
  config = function()
    local lint_status_ok, lint = pcall(require, 'lint')
    if not lint_status_ok then
      return
    end

    lint.linters_by_ft = {
      markdown = { 'markdownlint' },
    }
  end,
}
