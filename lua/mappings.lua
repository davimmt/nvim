require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- disable
-- toggle nvimtree
map("n", "<leader>e", "")
-- new/close buffer
map("n", "<leader>b", "")
map("n", "<leader>x", "")
-- comment
map("n", "<leader>/", "")
-- nvchad themes
map("n", "<leader>th", "")
-- nvchad cheatsheet
map("n", "<leader>ch", "")
-- telescope bookmarks
map("n", "<leader>ma", "")
-- pick a hidden term
map("n", "<leader>pt", "")
-- nvterm
map("n", "<leader>h", "")
map("n", "<leader>v", "")
-- line numbers
map("n", "<leader>rn", "")
-- telescope
map("n", "<leader>cm", "")
map("n", "<leader>gt", "")
map("n", "<leader>fm", "")
-- which-key
map("n", "<leader>wk", "")
map("n", "<leader>wK", "")

-- normal movement
map("n", "Q", ":q!<CR>", { desc = "Quit" })
map("n", "<leader>N", "<cmd> enew <CR>", { desc = "New file buffer" })
map("n", "<C-w>", function() require("nvchad.tabufline").close_buffer() end, { desc = "Close file buffer" })
map("n", "<C-A-w>", "<cmd> lua require('which-key').show('\23', {mode = 'n', auto = true})<CR>", { desc = "Windows options" })
map("n", "<leader>gg", ":LazyGit<CR>", { desc = "LazyGit" })
map("n", "<A-Up>", "yyP", { desc = "Yank line up" })
map("n", "<A-Down>", "yyp", { desc = "Yank line down" })
map("n", "<C-A-Up>", ":m -2<CR>", { desc = "Move line up" }) -- "ddkP" deletes line if on top
map("n", "<C-A-Down>", "ddp", { desc = "Move line down" })
map("n", "<C-A-s>", ":noa w <CR>", { desc = "Save file without " })
-- nvchad
map("n", "<leader>ct", "<cmd> Telescope themes <CR>", { desc = "NvChad Themes" })
map("n", "<leader>cc", "<cmd> NvCheatsheet <CR>", { desc = "Mapping cheatsheet" })
-- telescope
map("n", "<leader>fm", "<cmd> Telescope marks <CR>", { desc = "Telescope Bookmarks" })
map("n", "<leader>fg", "<cmd> Telescope git_status <CR>", { desc = "Git status" })
-- nvim
map("n", "<leader>nn", "<cmd> set rnu! <CR>", { desc = "Toggle relative number" })
map("n", "<leader>nh", "<cmd> Telescope help_tags <CR>", { desc = "Help page" })
-- which-key
map("n", "<leader>ww", function() vim.cmd "WhichKey" end, { desc = "Which-key all keymaps" })
-- lsp
map("n", "<leader>lf", function() vim.lsp.buf.format { async = true } end, { desc = "LSP formatting" })
