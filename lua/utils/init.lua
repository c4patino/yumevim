return {
	{
		"folke/persistence.nvim",
		lazy = false,
		config = function()
			require("persistence").setup()
		end,
	},
	{ "folke/which-key.nvim", event = "VeryLazy" },
}
