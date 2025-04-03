return {
  {
    'razak17/tailwind-fold.nvim',
    event = 'BufReadPost',
    opts = {},
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    ft = { 'html', 'svelte', 'astro', 'vue', 'javascript', 'typescriptreact', 'php', 'blade' },
  },
}
