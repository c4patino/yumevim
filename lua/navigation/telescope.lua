return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
	},
	keys = {
		{
			"<leader>pws",
			function()
				local word = vim.fn.expand("<cword>")
				require("telescope.builtin").grep_string({ search = word })
			end,
			desc = "Telescope Live grep word under cursor",
		},
		{
			"<leader>pWs",
			function()
				local word = vim.fn.expand("<cWORD>")
				require("telescope.builtin").grep_string({ search = word })
			end,
			desc = "Telescope Live grep WORD under cursor",
		},

		{
			"<leader>pf",
			"<cmd>Telescope find_files<cr>",
			desc = "Telescope Find project files",
		},
		{
			"<leader>pa",
			"<cmd>Telescope find_files follow=true no_ignore=true hidden=true<cr>",
			desc = "Telescope Find all files",
		},
		{
			"<leader>pz",
			"<cmd>Telescope current_buffer_fuzzy_find<cr>",
			desc = "Telescope Find in buffer",
		},
		{
			"<leader>ps",
			"<cmd>Telescope live_grep<cr>",
			desc = "Telescope Live grep",
		},
		{
			"ws",
			"<cmd>Telescope lsp_document_symbols ignore_symbols='variable'<cr>",
			desc = "Telescope LSP Document symbols",
		},
		{
			"<leader>tt",
			"<cmd>Telescope diagnostics<cr>",
			desc = "Telescope Diagnostics",
		},
		{
			"<leader>tf",
			"<cmd>Telescope diagnostics bufnr=0<cr>",
			desc = "Telescope Diagnostics in buffer",
		},
		{
			"<leader>:",
			"<cmd>Telescope command_history<cr>",
			desc = "Telescope Command history",
		},
	},
	config = function()
		local telescope = require("telescope")
		telescope.setup({
			defaults = {
				prompt_prefix = "   ",
				selection_caret = " ",
				entry_prefix = " ",
				sorting_strategy = "ascending",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.65,
					},
					width = 0.75,
					height = 0.80,
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
			},
		})

		-- Load extensions
		pcall(telescope.load_extension("fzf"))
		pcall(telescope.load_extension("ui-select"))
	end,
}
