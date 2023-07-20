return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { 
        "c", "cpp",
        "python",
        "lua", "vim", "vimdoc",
        "markdown", "markdown_inline",
      },
      sync_install = false,
      highlight = { enable = true, use_languagetree = true },
      indent = { enable = true },
    })
  end,
}

