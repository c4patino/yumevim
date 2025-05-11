local map = vim.keymap.set

-- General
map("n", ";", ":", { desc = "General Enter command mode" })
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "General Clear highlights" })
map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "General Toggle nvcheatsheet" })

-- File
map("n", "<C-s>", "<cmd>w<CR>", { desc = "File Save" })
map("n", "<leader>f", function()
	require("conform").format({ lsp_fallback = true })
end, { desc = "File Format" })

-- Buffer
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "Buffer new" })
map("n", "<tab>", function()
	require("nvchad.tabufline").next()
end, { desc = "Buffer goto next" })
map("n", "<S-tab>", function()
	require("nvchad.tabufline").prev()
end, { desc = "Buffer goto prev" })
map("n", "<leader>x", function()
	require("nvchad.tabufline").close_buffer()
end, { desc = "Buffer Close" })

-- nvimtree
map("n", "<leader>pv", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })

-- Terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "Terminal Escape terminal mode" })
map("n", "<leader>h", function()
	require("nvchad.term").new({ pos = "sp" })
end, { desc = "Terminal New horizontal term" })
map({ "n", "t" }, "<A-h>", function()
	require("nvchad.term").toggle({ pos = "sp", id = "htoggleTerm" })
end, { desc = "Terminal New horizontal term" })
map({ "n", "t" }, "<A-i>", function()
	require("nvchad.term").toggle({ pos = "float", id = "floatTerm" })
end, { desc = "Terminal Toggle floating term" })

-- Vertical
map("n", "<C-d>", "<C-d>zz", { desc = "Vertical Scroll down and keep cursor in same position" })
map("n", "<C-u>", "<C-u>zz", { desc = "Vertical Scroll up and keep cursor in same position" })

-- Find/Replace
map("n", "n", "nzzzv", { desc = "Find/Replace Move to next match" })
map("n", "N", "Nzzzv", { desc = "Find/Replace Move to previous match" })
map(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Find/Replace Replace current word" }
)

-- Editing
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Editing Move line down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Editing Move line up" })
map("n", "<leader>Y", [["+Y]], { desc = "Editing Copy line to system clipboard" })
map("v", "<leader>p", [["_dP]], { desc = "Editing Replace text with paste buffer" })
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Editing Copy to system clipboard" })
map({ "n", "v" }, "<leader>d", [["_d]], { desc = "Editing Delete selected to void buffer" })

-- Navigation
map("n", "<C-S-k>", "<cmd>cnext<CR>zz", { desc = "Navigation Move to next in quickfix list" })
map("n", "<C-S-j>", "<cmd>cprev<CR>zz", { desc = "Navigation Move to previous in quickfix list" })
map("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Navigation Move to next in location list" })
map("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Navigation Move to previous in location list" })

-- Telescope
map("n", "<leader>pf", "<cmd>Telescope find_files<CR>", { desc = "Telescope Find files" })
map(
	"n",
	"<leader>pa",
	"<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
	{ desc = "Telescope Find all files" }
)
map("n", "<leader>ps", "<cmd>Telescope live_grep<CR>", { desc = "Telescope Live grep" })
map("n", "<leader>pz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Telescope Find in current buffer" })
map("n", "<leader>pws", function()
	local word = vim.fn.expand("<cword>")
	require("telescope.builtin").grep_string({ search = word })
end, { desc = "Telescope Search for current word" })
map("n", "<leader>pWs", function()
	local word = vim.fn.expand("<cWORD>")
	require("telescope.builtin").grep_string({ search = word })
end, { desc = "Telescope Search for current WORD" })
map("n", "ws", function()
	require("telescope.builtin").lsp_document_symbols({ ignore_symbols = "variable" })
end, { desc = "Telescope View workspace symbols" })

-- Undotree
map("n", "<leader>u", "<cmd>UndotreeToggle<CR>", { desc = "Undotree Toggle window Open diagnostics" })

-- Trouble
map("n", "<leader>tt", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Errors Open diagnostics" })
map("n", "<leader>tf", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Errors Open buffer diagnostics" })
map("n", "<leader>tl", "<cmd>Trouble loclist toggle<CR>", { desc = "Errors Open location list" })
map("n", "<leader>tq", "<cmd>Trouble qflist toggle<CR>", { desc = "Errors Open quickfix fist" })
