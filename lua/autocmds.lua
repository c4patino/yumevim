-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 50 })
	end,
})

-- Set 2-space tabs for specific filetypes
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "astro", "javascript", "javascriptreact", "nix", "tex", "typescript", "typescriptreact" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.expandtab = true
	end,
})

-- Enable wrap and ZenMode toggle for LaTeX files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "tex",
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.keymap.set("n", "<leader>zz", function()
			if require("zen-mode.view").is_open() then
				require("zen-mode").toggle()
			else
				require("zen-mode").toggle({ window = { width = 85 } })
			end
		end, { buffer = true, desc = "ZenMode toggle" })
	end,
})
