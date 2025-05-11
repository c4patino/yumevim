require("ufo").setup({
	provider_selector = function(bufnr, filetype, buftype)
		return { "treesitter", "indent" }
	end,
})

local set = vim.keymap.set
set("n", "zR", require("ufo").openAllFolds)
set("n", "zM", require("ufo").closeAllFolds)
