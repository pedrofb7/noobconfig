return {
  --Colorscheme: catppuccin--
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,

    --Integrations with rainbow delimiters--
    integrations = {
      -- alpha = true,
      -- aerial = true,
      -- dap = true,
      -- dap_ui = true,
      -- mason = true,
      -- neotree = true,
      -- notify = true,
      -- nvimtree = false,
      -- semantic_tokens = true,
      -- symbols_outline = true,
      telescope = true,
      -- ts_rainbow = false,
      -- which_key = true,
      -- yazi = true
    },
    config = function()
      require('catppuccin').setup {
        flavour = 'mocha',
        transparent_background = true,

        --- Fixing the hightlilght to indent lines ---
        custom_highlights = function(colors)
          return {
            -- Make the indent lines a subtle color from the theme
            IblIndent = { fg = colors.overlay1 },

            -- For the scope highlighting
            IblScope1 = { fg = colors.red },
            IblScope2 = { fg = colors.yellow },
            IblScope3 = { fg = colors.blue },

            LineNr = { fg = colors.overlay1 }, -- A subtle grey for non-active lines
          }
        end,
      }

      vim.cmd.colorscheme 'catppuccin' --loads the theme for the first time

      -- Using a key to toggle background color --

      local backgd = true

      local set_bg_transparent = function()
        backgd = not backgd

        --running the setup again--
        require('catppuccin').setup {
          transparent_background = backgd,
        }

        vim.cmd.colorscheme 'catppuccin' --loading the theme again
      end

      vim.keymap.set('n', '<leader>bg', set_bg_transparent, { noremap = true, silent = true, desc = 'toggle background transparency' })
    end,
  },
}
