vim.pack.add({ "https://github.com/olrtg/nvim-emmet" })

vim.keymap.set(
	{ "n", "v" },
	"<leader>we",
	require("nvim-emmet").wrap_with_abbreviation,
	{ desc = "Wrap with Emmet abbreviation" }
)
