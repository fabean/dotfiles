-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Set the leader key early
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.relativenumber = true
vim.opt.swapfile = false

vim.filetype.add({
  extension = {
    theme = "php",
    module = "php",
    install = "php",
    inc = "php",
  },
})
