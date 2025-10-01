return {

  {
    'nvim-treesitter/nvim-treesitter',

    build = ':TSUpdate', -- Command to run after install

    event = 'BufReadPost', -- Load only after a buffer is read

    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 'lua', 'vim', 'bash', 'c', 'cpp', 'r', 'java', 'html', 'javascript' },
        auto_install = true,
        highlight = { enable = true },
      }
    end,
  },
}
