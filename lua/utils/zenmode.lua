return {
	"folke/zen-mode.nvim",
	keys = {
		{ "<leader>zz", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" },
	},
	config = function()
		require("zen-mode").setup({
			window = {
				width = 150,
			},
		})
	end,
}
