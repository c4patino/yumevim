require("nvchad.autocmds")

local autocmd = vim.api.nvim_create_autocmd

autocmd({ "TextYankPost" }, {
	group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

autocmd({ "BufWinEnter" }, {
	group = vim.api.nvim_create_augroup("Fugitive", {}),
	callback = function()
		if vim.bo.ft ~= "fugitive" then
			return
		end

		vim.keymap.set("n", "<leader>p", "<cmd>Git pull<CR>", { desc = "Fugitive Git pull" })
		vim.keymap.set("n", "<leader>P", "<cmd>Git push<CR>", { desc = "Fugitive Git push" })
	end,
})

autocmd({ "LspAttach" }, {
	group = vim.api.nvim_create_augroup("Lsp", {}),
	callback = function(e)
		local opts = { buffer = e.buf }
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end, opts)
	end,
})
