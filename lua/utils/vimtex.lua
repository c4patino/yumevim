return {
	"lervag/vimtex",
	ft = { "tex", "latex" },
	config = function()
		vim.g.vimtex_view_method = "zathura"
	end,
}
