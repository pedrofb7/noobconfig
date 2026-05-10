return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  dependencies = {
    'nhattVim/alpha-ascii.nvim',
    opts = {
      header = 'random',
      use_default = false,
      user_path = vim.fn.stdpath 'config' .. '/ascii',
    },
  },
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    -- Buttons
    dashboard.section.buttons.val = {
      dashboard.button('SPC f f', '  Find File  ', ':Telescope find_files<CR>'),
      dashboard.button('SPC f o', '  Recent File  ', ':Telescope oldfiles<CR>'),
      dashboard.button('SPC f w', '  Find Word  ', ':Telescope live_grep theme=ivy<CR>'),
      dashboard.button('SPC f b', '  Bookmarks  ', ':Telescope marks theme=ivy<CR>'),
      dashboard.button('SPC c i', '  Change header image', ':AlphaAsciiNext<CR>'),
    }

    -- To show plugin stats
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

        -- To reset the status line
        vim.api.nvim_create_autocmd('BufUnload', {
          buffer = 0,
          once = true,
          callback = function()
            vim.opt.laststatus = 3
          end,
        })
      end,
    })

    alpha.setup(dashboard.opts)
  end,
}
