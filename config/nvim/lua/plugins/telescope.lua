return {
  "nvim-telescope/telescope.nvim",
  lazy = false,
  tag = "0.1.2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
    }
  },
  opts = {
  },
  keys = {
    -- keymap with lazy.nvim
    -- { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find Files" },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("fzf")

    local builtin = require("telescope.builtin")
    -- keymap with vim script
    --vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
    --vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
    --vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
    --vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Help" })

    -- keymap with which-key 
    local wk = require("which-key")
    wk.register({
      ["<leader>f"] = { name = "Find" },
      ["<leader>ff"] = { builtin.find_files, "Find Files" },
      ["<leader>fg"] = { builtin.live_grep, "Live Grep" },
      ["<leader>fb"] = { builtin.buffers, "Find Buffers" },
      ["<leader>fh"] = { builtin.help_tags, "Find Help" },
    })
  end,
}
