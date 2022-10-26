vim.g.mapleader = " "
local keymap = vim.keymap

--keymap.set("i", "jk", "<ESC>")

keymap.set("n", "<A-t>", ":NvimTreeOpen<CR>")
keymap.set("n", "<A-c>", ":NvimTreeClose<CR>")

keymap.set("n", "<A-e>", ":Telescope<CR>")
