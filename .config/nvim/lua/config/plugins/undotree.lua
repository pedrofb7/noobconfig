return {
  'mbbill/undotree',

  config = function()
    local opts = { desc = 'Undotree' }
    vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, opts)
  end,
}
