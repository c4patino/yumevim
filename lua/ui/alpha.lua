local function mkPadding(val)
	return { type = "padding", val = val }
end

local function mkButton(label, shortcut, command)
	return {
		type = "button",
		val = label,
		on_press = function()
			local key = vim.api.nvim_replace_termcodes(shortcut, true, false, true)
			vim.api.nvim_feedkeys(key, "n", false)
		end,
		opts = {
			keymap = {
				"n",
				shortcut,
				command,
				{
					noremap = true,
					silent = true,
					nowait = true,
				},
			},
			shortcut = shortcut,

			position = "center",
			cursor = 3,
			width = 38,
			align_shortcut = "right",
			hl_shortcut = "Keyword",
		},
	}
end

return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "VimEnter",
	config = function()
		local layout = {
			mkPadding(4),
			{
				opts = {
					hl = "AlphaHeader",
					position = "center",
				},
				type = "text",
				val = {
					[[▓██   ██▓ █    ██  ███▄ ▄███▓▓█████ ██▒   █▓ ██▓ ███▄ ▄███▓]],
					[[ ▒██  ██▒ ██  ▓██▒▓██▒▀█▀ ██▒▓█   ▀▓██░   █▒▓██▒▓██▒▀█▀ ██▒]],
					[[  ▒██ ██░▓██  ▒██░▓██    ▓██░▒███   ▓██  █▒░▒██▒▓██    ▓██░]],
					[[  ░ ▐██▓░▓▓█  ░██░▒██    ▒██ ▒▓█  ▄  ▒██ █░░░██░▒██    ▒██ ]],
					[[  ░ ██▒▓░▒▒█████▓ ▒██▒   ░██▒░▒████▒  ▒▀█░  ░██░▒██▒   ░██▒]],
					[[   ██▒▒▒ ░▒▓▒ ▒ ▒ ░ ▒░   ░  ░░░ ▒░ ░  ░ ▐░  ░▓  ░ ▒░   ░  ░]],
					[[ ▓██ ░▒░ ░░▒░ ░ ░ ░  ░      ░ ░ ░  ░  ░ ░░   ▒ ░░  ░      ░]],
					[[ ▒ ▒ ░░   ░░░ ░ ░ ░      ░      ░       ░░   ▒ ░░      ░   ]],
					[[ ░ ░        ░            ░      ░  ░     ░   ░         ░   ]],
					[[                                                           ]],
					[[                  git@github.com:c4patino                  ]],
				},
			},

			mkPadding(2),
			mkButton("  Find File", "f", ":Telescope find_files<CR>"),
			mkPadding(1),
			mkButton("  New File", "n", ":ene <BAR> startinsert<CR>"),
			mkPadding(1),
			mkButton("󰈚  Recent Files", "r", ":Telescope oldfiles<CR>"),
			mkPadding(1),
			mkButton("󰈭  Find Word", "g", ":Telescope live_grep<CR>"),
			mkPadding(1),
			mkButton("  Restore Session", "s", ":lua require('persistence').load()<CR>"),
			mkPadding(1),
			mkButton("  Quit Neovim", "q", ":qa<CR>"),
		}

		require("alpha").setup({
			layout = layout,
		})
	end,
}
