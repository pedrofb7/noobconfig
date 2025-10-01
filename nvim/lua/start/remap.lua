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
map('n', '<leader>4', '$', 'go to the end of the line')
map('n', '<leader>-', '_', 'go to the first character of the line')

-- Save and quit --
map('n', '<C-S>', ':w<CR>', 'save file')
map('i', '<C-S>', '<ESC>:w<CR>i', 'save file')
map('n', '<C-q>', '<cmd> q <CR>', 'quit file')

-- Movement --
map('v', 'K', ":m '<-2<CR>gv=gv", 'moving selection up')
map('v', 'J', ":m '>+1<CR>gv=gv", 'moving selection down')

-- The greatest shortcut of all time --
map('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], 'serch current word and replace')

-- Vertical scroll and center --
map('n', '<C-d>', '<C-d>zz', 'scroll half screen down')
map('n', '<C-u>', '<C-u>zz', 'scroll half screen up')

-- Find and center --
map('n', 'n', 'nzzzv', 'next occurrence of the search')
map('n', 'N', 'Nzzzv', 'previous occurrence of the search')

-- Resize with arrows --
map('n', '<Up>', ':resize -2<CR>', 'resize split windw up')
map('n', '<Down>', ':resize +2<CR>', 'resize split windw down')
map('n', '<Left>', ':vertical resize -2<CR>', 'resize split windw left')
map('n', '<Right>', ':vertical resize +2<CR>', 'resize split windw right')

-- Buffers --
map('n', '<Tab>', ':bnext<CR>', 'next buffer')
map('n', '<S-Tab>', ':bprevious<CR>', 'previous buffer')
map('n', '<leader>x', ':bdelete!<CR>', 'close buffer')
map('n', '<leader>b', '<cmd> enew <CR>', 'new buffer')

-- Window management --
map('n', '<leader>v', '<C-w>v', 'split window vertically')
map('n', '<leader>h', '<C-w>s', 'split window horrizontally')
map('n', '<leader>se', '<C-w>=', 'make split window equal')
map('n', '<leader>xs', ':close<CR>', 'close current split window')

-- Navigate between splits --
map('n', '<C-k>', ':wincmd k<CR>', 'go to up window')
map('n', '<C-j>', ':wincmd j<CR>', 'go to down window')
map('n', '<C-h>', ':wincmd h<CR>', 'go to left window')
map('n', '<C-l>', ':wincmd l<CR>', 'go to right window')

-- Tabs --
map('n', 'tn', ':tabnew<CR>', 'new tab')
map('n', 'tq', ':tabclose<CR>', 'close tab')
map('n', 'tk', ':tabn<CR>', 'next tab')
map('n', 'tj', ':tabp<CR>', 'previous tab')

-- Toggle line wrapping --
map('n', '<leader>lw', '<cmd>set wrap!<CR>', 'toggle line wrapping')

-- Stay in indent mode --
map('v', '<', '<gv', 'indent left')
map('v', '>', '>gv', 'indent right')

-- Keep last yanked when pasting --
map('v', 'p', '"_dP', 'paste')

-- Copying the system's clipboard --
map({ 'n', 'v' }, '<leader>y', [["+y]], "copy to the system's clipboard")
map('n', '<leader>Y', [["+Y]], "copy to the system's clipboard")

--Selection --
map('n', '<leader>w', 'viw', 'select current word')

-- Git --
map('n', '<leader>gs', ':Git status<CR>', 'git status')
map('n', '<leader>ga', ':Git add', 'git add')
map('n', '<leader>ga.', ':Git add .<CR>', 'git add .')
map('n', '<leader>gc', ':Git commit -m ', 'git commit')
map('n', '<leader>gp', ':Git push<CR> ', 'git push')
map('n', '<leader>gpl', ':Git pull<CR> ', 'git pull')
map('n', '<leader>gl', ':Git log<CR> ', 'git log')
