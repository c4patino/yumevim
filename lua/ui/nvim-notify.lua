return {
	"rcarriga/nvim-notify",
	event = "VeryLazy",
	keys = {
		{
			"<leader>un",
			function()
				require("notify").dismiss({ silent = true, pending = true })
			end,
			desc = "Dismiss All Notifications",
		},
	},
	config = function()
		local notify = require("notify")

		notify.setup({
			background_color = "#000000",
			fps = 60,
			render = "default",
			timeout = 500,
			top_down = false,
		})

		-- Filter out noisy or redundant messages
		local filtered_message = { "No information available" }

		---@diagnostic disable-next-line: duplicate-set-field
		vim.notify = function(message, level, opts)
			for _, msg in ipairs(filtered_message) do
				if message == msg then
					return
				end
			end

			local merged_opts = vim.tbl_extend("force", {
				on_open = function(win)
					local buf = vim.api.nvim_win_get_buf(win)
					vim.api.nvim_buf_set_option(buf, "filetype", "markdown")
				end,
			}, opts or {})

			return notify(message, level, merged_opts)
		end
	end,
}
