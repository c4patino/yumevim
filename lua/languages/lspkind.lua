return {
	{
		"onsails/lspkind.nvim",
		lazy = true,
		config = function()
			require("lspkind").init({
				maxwidth = 50,
				ellipsis_char = "...",
			})
		end,
	},
}
