local keymap = vim.keymap.set

keymap("n", ";", ":", { desc = "General Enter command mode" })

keymap("n", "<Esc>", "<cmd>noh<cr>", { desc = "General Clear highlights" })
keymap("n", "<C-s>", "<cmd>w<CR>", { desc = "General File save" })
keymap("n", "<C-u>", "<C-u>zz", { desc = "Vertical Scroll up" })
keymap("n", "<C-d>", "<C-d>zz", { desc = "Vertical Scroll down" })

keymap("n", "n", "nzzzv", { desc = "Find/Replace Move to next match" })
keymap("n", "N", "Nzzzv", { desc = "Find/Replace Move to previous match" })
keymap(
    "n",
    "<leader>s",
    ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
    { desc = "Find/Replace Replace current word" }
)

keymap("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "Editing Move line down" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "Editing Move line up" })

keymap({ "n", "v" }, "<leader>y", '"+y', { desc = "Editing copy to system clipboard" })
keymap("v", "<leader>Y", '"+Y', { desc = "Editing Copy line to system clipboard" })

keymap("v", "<leader>p", '"_dP', { desc = "Editing Replace text with paste buffer" })
keymap({ "n", "v" }, "<leader>d", '"_d', { desc = "Editing Delete without overwriting register" })

keymap("n", "<leader>rf", function() vim.cmd("normal! zx") end, { desc = "Editing Refresh Tree-sitter folds" })
