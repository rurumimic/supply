return {
  {
    "neovim/nvim-lspconfig",
  },
  {
    "williamboman/mason-lspconfig.nvim",
  },
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup({})
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "clangd",
        },
      })

      require("lspconfig").lua_ls.setup {}
      require("lspconfig").clangd.setup {}
    end,
  },
}

