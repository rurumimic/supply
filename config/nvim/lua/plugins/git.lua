return {
  { 
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      { "<leader>n", "<cmd>Neogit<cr>", desc = "Neogit" },
    },
    config = function()
      require("neogit").setup({})
    end,
  },
  {
    "tpope/vim-fugitive",
    keys = {
      { "<leader>g", "<cmd>G<cr>", desc = "Fugitive" },
  },
}

