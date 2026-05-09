return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  dependencies = {
    'nhattVim/alpha-ascii.nvim', -- for ascii headers
    opts = {
      -- Header name, use "random" for a random header
      header = 'random',

      -- Use some default headers
      use_default = false,

      user_path = vim.fn.stdpath 'config' .. '/ascii',
    },
  },
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    dashboard.section.buttons.val = {
      dashboard.button('SPC f f', '  Find File  ', ':Telescope find_files<CR>'),
      dashboard.button('SPC f o', '  Recent File  ', ':Telescope oldfiles<CR>'),
      dashboard.button('SPC f w', '  Find Word  ', ':Telescope live_grep theme=ivy<CR>'),
      dashboard.button('SPC f b', '  Bookmarks  ', ':Telescope marks theme=ivy<CR>'),
      -- dashboard.button('SPC f t', '  Themes  ', ':Telescope colorscheme enable_preview=false<CR>'), -- no need
      -- dashboard.button('SPC f s', '  Settings', ':e $MYVIMRC | :cd %:p:h <CR>'), -- no need
      dashboard.button('SPC c i', '  Change header image', ':AlphaAsciiNext<CR>'),
    }

    -- Display the amount of loaded plugins
    vim.api.nvim_create_autocmd('User', {
      once = true,
      pattern = 'LazyVimStarted',
      callback = function()
        local stats = require('lazy').stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        dashboard.section.footer.val = {
          ' ',
          ' Loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins  in ' .. ms .. ' ms ',
        }
        pcall(vim.cmd.AlphaRedraw)
      end,
    })

    -- To make alpha load alone
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'alpha',
      callback = function()
        vim.opt_local.laststatus = 0
        vim.opt_local.showtabline = 0
      end,
    })

    alpha.setup(dashboard.opts)
  end,
}
