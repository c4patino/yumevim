return {
	{ "sitiom/nvim-numbertoggle", lazy = false },
	{ "junegunn/gv.vim", cmd = { "GV" } },
	{ "mbbill/undotree", cmd = { "UndotreeToggle" } },
	{ "folke/trouble.nvim", cmd = { "Trouble" }, opts = {} },
	{
		"zbirenbaum/copilot.lua",
		event = "InsertEnter",
		config = function()
			require("configs.copilot")
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeFocus" },
		config = function()
			require("configs.nvimtree")
		end,
	},
	{
		"folke/zen-mode.nvim",
		keys = { "<leader>zz" },
		config = function()
			require("configs.zenmode")
		end,
	},
	{
		"stevearc/conform.nvim",
		config = function()
			require("configs.conform")
		end,
	},
	{ "mfussenegger/nvim-dap", lazy = false },
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			require("configs.nvim-dap")
		end,
		lazy = false,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{
				"zbirenbaum/copilot-cmp",
				config = function()
					require("copilot_cmp").setup()
				end,
			},
		},
		opts = {
			sources = {
				{ name = "nvim_lsp", group_index = 2 },
				{ name = "copilot", group_index = 2 },
				{ name = "luasnip", group_index = 2 },
				{ name = "buffer", group_index = 2 },
				{ name = "nvim_lua", group_index = 2 },
				{ name = "path", group_index = 2 },
			},
		},
	},
	{ "kylechui/nvim-surround", event = "VeryLazy", opts = {} },
	{
		"tpope/vim-fugitive",
		keys = {
			{ "<leader>gs", "<cmd>Git<CR>", desc = "Git Toggle window" },
			{ "gu", "<cmd>diffget //2<CR>", desc = "Git Diff right side" },
			{ "gh", "<cmd>diffget //3<CR>", desc = "Git Diff left side" },
		},
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lspconfig")
		end,
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			"<leader>a",
			"<C-e>",
			"<C-j>",
			"<C-k>",
			"<C-l>",
			"<C-;>",
			"<leader><C-j>",
			"<leader><C-k>",
			"<leader><C-l>",
			"<leader><C-;>",
		},
		config = function()
			require("configs.harpoon")
		end,
	},
	{
		"kevinhwang91/nvim-ufo",
		lazy = false,
		dependencies = { "kevinhwang91/promise-async" },
		config = function()
			require("configs.ufo")
		end,
	},
}
