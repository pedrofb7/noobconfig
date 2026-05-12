--Defining the leader key--
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--- ========= -- General map function -- ============ ---

local function map(mode, key, comnd, desc)
  local opts = { noremap = true, silent = true }

  if desc then
    opts.desc = desc
  end

  vim.keymap.set(mode, key, comnd, opts)
end

-- Ignoring normal behavior--
map('n', '<Space>', '<Nop>', ' ')
map('n', '<Tab>', '<Nop>', ' ')
map('n', 't', '<Nop>', ' ')
map('n', 'Q', '<Nop>', ' ')

--- =============== -- Remapping -- ================= ---

--Line navigation--
map({ 'n', 'v' }, '<leader>4', '$', 'Go to the end of the line')
map({ 'n', 'v' }, '<leader>-', '_', 'Go to the first character of the line')

-- Save and quit --
map('n', '<C-S>', ':w<CR>', 'Save file')
map('i', '<C-S>', '<ESC>:w<CR>i', 'Save file')
map('n', '<C-q>', '<cmd> q <CR>', 'Quit file')

-- Movement --
map('v', 'K', ":m '<-2<CR>gv=gv", 'Moving selection up')
map('v', 'J', ":m '>+1<CR>gv=gv", 'Moving selection down')

-- The greatest shortcut of all time --
map('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], 'Serch current word and replace')

-- Vertical scroll and center --
map('n', '<C-d>', '<C-d>zz', 'Scroll half screen down')
map('n', '<C-u>', '<C-u>zz', 'Scroll half screen up')

-- Find and center --
map('n', 'n', 'nzzzv', 'Next occurrence of the search')
map('n', 'N', 'Nzzzv', 'Previous occurrence of the search')

-- Resize with arrows --
map('n', '<Up>', ':resize -2<CR>', 'Resize split windw up')
map('n', '<Down>', ':resize +2<CR>', 'Resize split windw down')
map('n', '<Left>', ':vertical resize -2<CR>', 'Resize split windw left')
map('n', '<Right>', ':vertical resize +2<CR>', 'Resize split windw right')

-- Buffers --
map('n', '<Tab>', ':bnext<CR>', 'Next buffer')
map('n', '<S-Tab>', ':bprevious<CR>', 'Previous buffer')
map('n', '<leader>x', ':bdelete!<CR>', 'Close buffer')
map('n', '<leader>b', '<cmd> enew <CR>', 'New buffer')

-- Window management --
map('n', '<leader>v', '<C-w>v', 'Split window vertically')
map('n', '<leader>h', '<C-w>s', 'Split window horrizontally')
map('n', '<leader>se', '<C-w>=', 'Make split window equal')
map('n', '<leader>xs', ':close<CR>', 'close current split window')

-- Navigate between splits --
map('n', '<C-k>', ':wincmd k<CR>', 'Go to up window')
map('n', '<C-j>', ':wincmd j<CR>', 'Go to down window')
map('n', '<C-h>', ':wincmd h<CR>', 'Go to left window')
map('n', '<C-l>', ':wincmd l<CR>', 'Go to right window')

-- Tabs --
map('n', 'tn', ':tabnew<CR>', 'New tab')
map('n', 'tq', ':tabclose<CR>', 'Close tab')
map('n', 'tk', ':tabn<CR>', 'Next tab')
map('n', 'tj', ':tabp<CR>', 'Previous tab')

-- Toggle line wrapping --
map('n', '<leader>lw', '<cmd>set wrap!<CR>', 'Toggle line wrapping')

-- Stay in indent mode --
map('v', '<', '<gv', 'Indent left')
map('v', '>', '>gv', 'Indent right')

-- Keep last yanked when pasting --
map('v', 'p', '"_dP', 'paste')

-- Copying the system's clipboard --
map({ 'n', 'v' }, '<leader>Y', '"+y', "Copy to the system's clipboard")

--Selection --
map('n', '<leader>w', 'viw', 'Select current word')

-- Git --
map('n', '<leader>gs', ':Git status<CR>', 'Git status')
map('n', '<leader>ga', ':Git add', 'Git add')
map('n', '<leader>ga.', ':Git add .<CR>', 'Git add .')
map('n', '<leader>gc', ':Git commit -m ', 'Git commit')
map('n', '<leader>gp', ':Git push<CR> ', 'Git push')
map('n', '<leader>gpl', ':Git pull<CR> ', 'Git pull')
map('n', '<leader>gl', ':Git log<CR> ', 'Git log')
