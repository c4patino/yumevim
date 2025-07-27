return {
	"L3MON4D3/LuaSnip",
	event = "InsertEnter",
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
						virt_text = {{"●", "GruvboxOrange"}},
					},
				},
				[types.insertNode] = {
					active = {
						virt_text = {{"●", "GruvboxBlue"}},
					},
				},
			},
		})
	end,
}
