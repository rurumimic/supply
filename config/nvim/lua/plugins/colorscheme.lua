return {
  {
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent_background = true,
      terminal_colors = true,
      devicons = true,
      background_clear = {
        -- "nvim-tree",
        "telescope",
        "which-key",
      },
    },
    config = function(_, opts)
      require("monokai-pro").setup(opts)
      vim.cmd([[colorscheme monokai-pro]])
    end,
  }
}

