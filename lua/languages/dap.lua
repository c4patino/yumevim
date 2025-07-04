return {
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")

			-- Signs
			vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint" })
			vim.fn.sign_define("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition" })
			vim.fn.sign_define("DapLogPoint", { text = "◆", texthl = "DapLogPoint" })

			-- Keymaps
			local map = vim.keymap.set
			local function with_opts(desc)
				return vim.tbl_extend("force", { silent = true }, { desc = desc })
			end

			map("n", "<leader>db", ":DapToggleBreakpoint<CR>", with_opts("Toggle Breakpoint"))
			map("n", "<leader>dc", "<cmd>DapContinue<CR>", with_opts("Continue"))
			map(
				"n",
				"<leader>da",
				"<cmd>lua require('dap').continue({ before = get_args })<CR>",
				with_opts("Run with Args")
			)
			map("n", "<leader>dC", "<cmd>lua require('dap').run_to_cursor()<CR>", with_opts("Run to Cursor"))
			map("n", "<leader>dg", "<cmd>lua require('dap').goto_()<CR>", with_opts("Go to Line (no execute)"))
			map("n", "<leader>di", ":DapStepInto<CR>", with_opts("Step Into"))
			map("n", "<leader>dj", "<cmd>lua require('dap').down()<CR>", with_opts("Down"))
			map("n", "<leader>dk", "<cmd>lua require('dap').up()<CR>", with_opts("Up"))
			map("n", "<leader>dl", "<cmd>lua require('dap').run_last()<CR>", with_opts("Run Last"))
			map("n", "<leader>do", ":DapStepOut<CR>", with_opts("Step Out"))
			map("n", "<leader>dO", ":DapStepOver<CR>", with_opts("Step Over"))
			map("n", "<leader>dp", "<cmd>lua require('dap').pause()<CR>", with_opts("Pause"))
			map("n", "<leader>dr", ":DapToggleRepl<CR>", with_opts("Toggle REPL"))
			map("n", "<leader>ds", "<cmd>lua require('dap').session()<CR>", with_opts("Session"))
			map("n", "<leader>dt", ":DapTerminate<CR>", with_opts("Terminate"))
			map("n", "<leader>du", "<cmd>lua require('dapui').toggle()<CR>", with_opts("Dap UI"))
			map({ "n", "v" }, "<leader>de", "<cmd>lua require('dapui').eval()<CR>", with_opts("Eval"))
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			require("dapui").setup({
				floating = {
					mappings = {
						close = { "<ESC>", "q" },
					},
				},
			})
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		dependencies = { "mfussenegger/nvim-dap" },
		config = true,
	},
	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
		end,
	},
}
