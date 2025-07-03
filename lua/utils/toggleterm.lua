return {
	"akinsho/toggleterm.nvim",
	keys = {
		{ "<A-i>", "<cmd>ToggleTerm<CR>", desc = "Toggle terminal" },
	},
	opts = {
		open_mapping = "<A-i>",
		direction = "float",
		float_opts = {
			border = "curved",
		},
		winbar = {
			enabled = true,
		},
	},
}
