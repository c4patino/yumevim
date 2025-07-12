return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{
			"rcarriga/nvim-notify",
			config = function()
				vim.notify = require("notify")
			end,
		},
	},
	config = function()
		local conform = require("conform")

		conform.setup({
			notify_on_error = true,
			default_format_opts = {
				lsp_format = "fallback",
			},
			formatters_by_ft = {
				astro = { "prettierd", "prettier" },
				cabal = { "ormolu" },
				haskell = { "ormolu" },
				javascript = { "prettierd", "prettier" },
				javascriptreact = { "prettierd", "prettier" },
				typescript = { "prettierd", "prettier" },
				typescriptreact = { "prettierd", "prettier" },
				lua = { "stylua" },
				nix = { "alejandra" },
				racket = { "raco_fmt" },
			},
			formatters = {
				raco_fmt = {
					command = "raco",
					args = { "fmt" },
				},
			},
			format_on_save = function(bufnr)
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				return { lsp_format = "fallback" }
			end,
		})

		local function show_notification(message, level)
			vim.notify(message, level, { title = "conform.nvim" })
		end

		vim.api.nvim_create_user_command("FormatToggle", function(args)
			local is_global = not args.bang
			if is_global then
				vim.g.disable_autoformat = not vim.g.disable_autoformat
				show_notification(
					vim.g.disable_autoformat and "Autoformat-on-save disabled globally"
						or "Autoformat-on-save enabled globally",
					"info"
				)
			else
				vim.b.disable_autoformat = not vim.b.disable_autoformat
				show_notification(
					vim.b.disable_autoformat and "Autoformat-on-save disabled for this buffer"
						or "Autoformat-on-save enabled for this buffer",
					"info"
				)
			end
		end, { desc = "Toggle autoformat-on-save", bang = true })

		-- Keybindings
		vim.keymap.set("n", "<leader>ff", "<cmd>FormatToggle<cr>", {
			silent = true,
			desc = "Conform Toggle autoformat",
		})

		vim.keymap.set({ "n", "v" }, "<leader>f", function()
			require("conform").format({ lsp_format = "fallback" })
		end, { silent = true, desc = "Conform Format" })
	end,
}
