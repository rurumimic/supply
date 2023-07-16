return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      { "<leader>g", desc = "Git" },
      { "<leader>gn", "<cmd>Neogit kind=auto<cr>", desc = "Neogit" },
    },
    config = function()
      require("neogit").setup({})
    end,
  },
  {
    "tpope/vim-fugitive",
    keys = {
      { "<leader>gf", "<cmd>G<cr>", desc = "Fugitive" },
    },
  }
}

