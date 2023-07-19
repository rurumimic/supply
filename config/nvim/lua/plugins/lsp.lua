return {
  -- Mason
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason").setup({})
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"clangd",
				},
			})

			require("lspconfig").lua_ls.setup({})
			require("lspconfig").clangd.setup({})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = "williamboman/mason.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"stylua",
					"clang-format",
          "cpplint",
				},
			})
		end,
	},
	{
		"mfussenegger/nvim-lint",
    config = function()
      require("lint").linter_by_ft = {
        lua = {'stylua',},
        c = {'cpplint',},
      }
    end,
	},
	{
		"mhartington/formatter.nvim",
		config = function()
			local util = require("formatter.util")
			require("formatter").setup({
				logging = true,
				log_level = vim.log.levels.WARN,
				filetype = {
					lua = require("formatter.filetypes.lua").stylua,
					c = require("formatter.defaults.clangformat"),
					cpp = require("formatter.defaults.clangformat"),
					["*"] = {
						require("formatter.filetypes.any").remove_trailing_whitespace,
					},
				},
			})
		end,
	},
}
