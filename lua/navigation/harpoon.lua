return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	lazy = false,
	keys = {
		{
			"<leader>a",
			function()
				require("harpoon"):list():add()
			end,
			desc = "Harpoon Add File",
		},
		{
			"<C-e>",
			function()
				require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
			end,
			desc = "Harpoon Toggle Quick Menu",
		},
		{
			"<C-j>",
			function()
				require("harpoon"):list():select(1)
			end,
			desc = "Harpoon to File 1",
		},
		{
			"<C-k>",
			function()
				require("harpoon"):list():select(2)
			end,
			desc = "Harpoon to File 2",
		},
		{
			"<C-l>",
			function()
				require("harpoon"):list():select(3)
			end,
			desc = "Harpoon to File 3",
		},
		{
			"<C-;>",
			function()
				require("harpoon"):list():select(4)
			end,
			desc = "Harpoon to File 4",
		},
	},

	config = function()
		local harpoon = require("harpoon")
		harpoon:setup({
			settings = {
				save_on_toggle = true,
			},
		})

		if require("lazy.core.config").plugins["telescope.nvim"] then
			local telescope = require("telescope")
			telescope.load_extension("harpoon")
		end
	end,
}
