--Numbers--
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4
vim.opt.cursorlineopt = 'number'

--Tab--
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

--Indentation--
vim.opt.autoindent = true
vim.opt.smartindent = true

--Search--
vim.opt.hlsearch = false
vim.opt.incsearch = true

--Colors--
vim.opt.termguicolors = true

--Scroll--
vim.opt.scrolloff = 8

--Visualization--
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append '@-@'
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.showmode = false
vim.opt.colorcolumn = ''
vim.opt.pumheight = 10

--Updatetime--
vim.opt.updatetime = 50

--Swapfile--
vim.opt.swapfile = false

--Mapping the leader key--
vim.g.mapleader = ' '

--Custom keybindig to toggle color column --

local column = ''
local toggle_column = function()
  if column == '80' then
    vim.opt.colorcolumn = ''
    column = ''
  else
    vim.opt.colorcolumn = '80'
    column = '80'
  end
end

vim.keymap.set('n', '<leader>cl', toggle_column, { desc = 'toggle color column' })
