return {
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")

			dap.adapters.codelldb = {
				type = "server",
				port = 13000,
				executable = {
					command = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb",
					args = { "--port", "13000" },
				},
			}

			dap.adapters.go = {
				type = "server",
				port = 38697,
				executable = {
					command = "dlv",
					args = { "dap", "-l", "127.0.0.1:38697" },
				},
			}

			dap.adapters["pwa-node"] = {
				type = "server",
				host = "127.0.0.1",
				port = 9229,
				executable = {
					command = "js-debug-adapter",
					args = { "9229", "127.0.0.1" },
				},
			}

			-- Common executable config
			local function exeConfigs()
				return {
					{
						type = "codelldb",
						request = "launch",
						name = "exe",
						program = function()
							return vim.fn.input("Executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
						end,
						cwd = function()
							return vim.fn.getcwd()
						end,
					},
					{
						type = "codelldb",
						request = "launch",
						name = "exe:args",
						program = function()
							return vim.fn.input("Executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
						end,
						cwd = function()
							return vim.fn.getcwd()
						end,
						args = function()
							return vim.fn.split(vim.fn.input("Arguments: "), " ")
						end,
					},
					{
						type = "codelldb",
						request = "attach",
						name = "attach",
						connect = function()
							return vim.fn.input("Host: ")
						end,
						cwd = function()
							return vim.fn.getcwd()
						end,
					},
				}
			end

			local function webConfigs()
				return {
					{
						type = "pwa-node",
						request = "launch",
						name = "current",
						program = "${file}",
						cwd = function()
							return vim.fn.getcwd()
						end,
					},
					{
						type = "pwa-node",
						request = "launch",
						name = "current:args",
						program = "${file}",
						cwd = function()
							return vim.fn.getcwd()
						end,
						args = function()
							return vim.fn.split(vim.fn.input("Arguments: "), " ")
						end,
					},
					{
						type = "pwa-node",
						request = "launch",
						name = "file",
						program = function()
							return vim.fn.input("Executable: ", vim.fn.getcwd(), "file")
						end,
						cwd = function()
							return vim.fn.getcwd()
						end,
					},
					{
						type = "pwa-node",
						request = "launch",
						name = "file:args",
						program = function()
							return vim.fn.input("Executable: ", vim.fn.getcwd(), "file")
						end,
						cwd = function()
							return vim.fn.getcwd()
						end,
						args = function()
							return vim.fn.split(vim.fn.input("Arguments: "), " ")
						end,
					},
					{
						type = "pwa-node",
						request = "attach",
						name = "attach",
						connect = function()
							return vim.fn.input("Host: ")
						end,
						cwd = function()
							return vim.fn.getcwd()
						end,
					},
				}
			end

			local function find_python()
				local cwd = vim.fn.getcwd()
				if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
					return cwd .. "/venv/bin/python"
				elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
					return cwd .. "/.venv/bin/python"
				else
					return "python3"
				end
			end

			-- Language configurations
			dap.configurations = {
				python = {
					{
						type = "python",
						request = "launch",
						name = "module",
						module = function()
							return vim.fn.input("Module: ")
						end,
						pythonPath = find_python,
					},
					{
						type = "python",
						request = "launch",
						name = "module:args",
						module = function()
							return vim.fn.input("Module: ")
						end,
						args = function()
							return vim.fn.split(vim.fn.input("Arguments: "), " ")
						end,
						pythonPath = find_python,
					},
				},
				c = exeConfigs(),
				cpp = exeConfigs(),
				rust = exeConfigs(),
				zig = exeConfigs(),
				go = {
					{
						type = "go",
						request = "launch",
						name = "file",
						program = "${file}",
						outputMode = "remote",
					},
					{
						type = "go",
						request = "launch",
						name = "file:args",
						program = "${file}",
						args = function()
							return vim.fn.split(vim.fn.input("Arguments: "), " ")
						end,
						outputMode = "remote",
					},
					{
						type = "go",
						mode = "remote",
						request = "attach",
						name = "attach",
						connect = function()
							local input = vim.fn.input("Host: ")
							local host, port = string.match(input, "([^:]+):(%d+)")
							return { host = host, port = tonumber(port) }
						end,
						cwd = function()
							return vim.fn.getcwd()
						end,
					},
				},
				javascript = webConfigs(),
				javascriptreact = webConfigs(),
				typescript = webConfigs(),
				typescriptreact = webConfigs(),
			}

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
