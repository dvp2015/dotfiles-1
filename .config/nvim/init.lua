-- Mostly borrwed from https://habr.com/ru/post/706110/
-- https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
----------------------
-- Import Lua modules
----------------------
require('plugins')
require('settings')
require('keymaps')
require('treesitter')

