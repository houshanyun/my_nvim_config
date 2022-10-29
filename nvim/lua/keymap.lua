vim.g.mapleader = " "
local keymap = vim.keymap

-- keymap.set("i", "jk", "<ESC>")

keymap.set("n", "<A-n>", ":NvimTreeToggle<CR>")

keymap.set("n", "<A-e>", ":Telescope<CR>")

keymap.set('n', 'x', '"_x')


-- window management
keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")
keymap.set("n", "<leader>sx", ":close<CR>")



