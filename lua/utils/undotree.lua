return {
	"mbbill/undotree",
	keys = {
		{ "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undotree Toggle window" },
	},
	config = function()
		vim.g.undotree_WindowLayout = 4
		vim.g.undotree_DiffpaneHeight = 15
		vim.g.undotree_SplitWidth = 40
	end,
}
