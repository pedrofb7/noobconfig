return {

  'stevearc/conform.nvim',

  config = function()
    require('conform').setup {

      formatters_by_ft = {

        c = { 'clang-format' },
        cpp = { 'clang-format' },
        lua = { 'stylua' },
        python = { 'isort', 'black' },
        rust = { 'rustywind' },
        sh = { 'shfmt' },
        javascript = { 'prettierd', 'prettier', stop_after_first = true },
        markdown = { 'prettier', 'prettierd' },
      },
    }

    -- To override some defaults of shmt formatter --
    -- (this took me an awful amount of time to work it out)
    require('conform').formatters.shfmt = {
      append_args = { '-i', '2' },
      -- The base args are { "-filename", "$FILENAME" } so the final args will be
      -- { "-filename", "$FILENAME", "-i", "2" }
    }

    vim.api.nvim_create_autocmd('BufWritePre', {
      pattern = '*',
      callback = function(args)
        require('conform').format { bufnr = args.buf }
      end,
    })
  end,
}
