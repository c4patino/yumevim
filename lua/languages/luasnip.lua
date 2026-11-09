return {
	"L3MON4D3/LuaSnip",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local ls = require("luasnip")
		local types = require("luasnip.util.types")
		ls.config.set_config({
			history = true,
			updateevents = "TextChanged,TextChangedI",
			enable_autosnippets = true,
			ext_opts = {
				[types.choiceNode] = {
					active = {
						virt_text = { { "●", "GruvboxOrange" } },
					},
				},
				[types.insertNode] = {
					active = {
						virt_text = { { "●", "GruvboxBlue" } },
					},
				},
			},
		})

		-- Load snippets
		local snip_dir = vim.fn.stdpath("config") .. "/lua/languages/snippets/"
		for _, file in ipairs(vim.uv.fs_scandir(snip_dir)) do
			if string.match(file, "%.lua$") then
				vim.cmd("luafile " .. snip_dir .. file)
			end
		end
	end,
}
