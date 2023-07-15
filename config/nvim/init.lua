vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

-- nvim-tree
---- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
---- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
---- load plugins with lazy
require("lazy").setup("plugins")

-- colorscheme
vim.cmd[[colorscheme monokai-pro]]


