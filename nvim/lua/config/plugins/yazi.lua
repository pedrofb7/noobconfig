    return {
      "mikavilpas/yazi.nvim",
      dependencies = {
        "nvim-tree/nvim-web-devicons", -- Optional: for file icons
      },
      config = function()
        require("yazi").setup({})
      end,

      keys = {
        -- Example keybinding to open Yazi
        { "<leader>fy", "<cmd>Yazi<CR>", desc = "Open Yazi" },
      },
    }
