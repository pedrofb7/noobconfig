return {
  'nvim-telescope/telescope.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- optional but recommended
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },

  config = function()
    -- Making the background transparent --
    vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'TelescopeBorder', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'TelescopeResultsNormal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'TelescopePreviewNormal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', { bg = 'none' })

    require('telescope').setup {

      defaults = {
        mappings = {
          i = {
            ['<C-k>'] = require('telescope.actions').move_selection_previous, -- move to prev result
            ['<C-j>'] = require('telescope.actions').move_selection_next, -- move to next result
            ['<C-l>'] = require('telescope.actions').select_default, -- open file
          },
        },
      },

      -- Pickers --

      pickers = {
        find_files = {
          file_ignore_patterns = { 'node_modules', '%.git', '%.venv' },
          hidden = true,
        },
        live_grep = {
          file_ignore_patterns = { 'node_modules', '%.git', '%.venv' },
          additional_args = function(_)
            return { '--hidden' }
          end,
        },
      },

      -- Extensions --

      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    -- See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Search help' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = 'Search keymaps' })
    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Search files' })
    vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = 'Search select telescope' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = 'Search current word' })
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Search by grep' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = 'Search diagnostics' })
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = 'Search resume' })
    vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = 'Search recent files ("." for repeat)' })
    vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = 'Find existing buffers' })

    -- Slightly advanced example of overriding default behavior and theme
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = 'Fuzzily search in current buffer' })

    -- It's also possible to pass additional configuration options.
    --  See `:help telescope.builtin.live_grep()` for information about particular keys
    vim.keymap.set('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = 'Search in Open Files' })
  end,
}
