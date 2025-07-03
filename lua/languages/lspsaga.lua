return {
	{
		"nvimdev/lspsaga.nvim",
		event = "LspAttach",
		config = function()
			require("lspsaga").setup({
				beacon = { enable = true },
				ui = {
					border = "rounded",
					code_action = "💡",
				},
				hover = {
					open_cmd = "!floorp",
					open_link = "gx",
				},
				diagnostic = {
					border_follow = true,
					diagnostic_only_current = false,
					show_code_action = true,
				},
				symbol_in_winbar = {
					enable = true,
				},
				code_action = {
					extend_gitsigns = false,
					show_server_name = true,
					only_in_cursor = true,
					num_shortcut = true,
					keys = {
						exec = "<CR>",
						quit = { "<Esc>", "q" },
					},
				},
				lightbulb = {
					enable = false,
					sign = false,
					virtual_text = true,
				},
				implement = {
					enable = false,
				},
				rename = {
					auto_save = false,
					keys = {
						exec = "<CR>",
						quit = { "<C-k>", "<Esc>" },
						select = "x",
					},
				},
				outline = {
					auto_close = true,
					auto_preview = true,
					close_after_jump = true,
					layout = "normal",
					win_position = "right",
					keys = {
						jump = "e",
						quit = "q",
						toggle_or_jump = "o",
					},
				},
				scroll_preview = {
					scroll_down = "<C-f>",
					scroll_up = "<C-b>",
				},
			})

			local keymap = vim.keymap.set
			local function with_opts(desc)
				return vim.tbl_extend("force", { silent = true }, { desc = desc })
			end

			keymap("n", "gd", "<cmd>Lspsaga finder def<CR>", with_opts("Goto Definition"))
			keymap("n", "gr", "<cmd>Lspsaga finder ref<CR>", with_opts("Goto References"))
			keymap("n", "gI", "<cmd>Lspsaga finder imp<CR>", with_opts("Goto Implementation"))
			keymap("n", "gT", "<cmd>Lspsaga peek_type_definition<CR>", with_opts("Type Definition"))
			keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", with_opts("Hover"))
			keymap("n", "<leader>cw", "<cmd>Lspsaga outline<CR>", with_opts("Outline"))
			keymap("n", "<leader>cr", "<cmd>Lspsaga rename<CR>", with_opts("Rename"))
			keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", with_opts("Code Action"))
		end,
	},
}
