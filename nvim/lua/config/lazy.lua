--- =================== -- Bootstrap lazy.nvim -- =================== ---

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim' --Default path

---@diagnostic disable-next-line: undefined-field
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }

  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

--Activating lazy --
vim.opt.rtp:prepend(lazypath) -- The prepend command puts the lazypath
-- nvim kows it needs to look there

--- =============== -- Setup lazy.nvim -- ================== ----

require('lazy').setup {
  spec = {

    --Importing plugins --

    { import = 'config.plugins' },
  },
}
