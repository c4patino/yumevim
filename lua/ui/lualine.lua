return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	config = function()
		require("lualine").setup({
			options = {
				globalstatus = true,
				always_divide_middle = true,
				theme = "auto",
				ignore_focus = { "nvim-tree" },
				component_separators = {
					left = "|",
					right = "|",
				},
			},
			extensions = { "fzf" },
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					{ "branch", icon = "", icons_enabled = true },
					{ "diff" },
					{ "diagnostics" },
				},
				lualine_c = { "filename" },
				lualine_x = { "filetype" },
				lualine_y = { "location" },
				lualine_z = {
					function()
						return " " .. os.date("%R")
					end,
				},
			},
		})
	end,
}
