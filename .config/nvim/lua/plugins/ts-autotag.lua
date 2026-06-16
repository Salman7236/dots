vim.pack.add({ "https://github.com/tronikelis/ts-autotag.nvim" })

require("ts-autotag").setup({
	filetypes = {
		"html",
		"htmldjango",
		"jinja",
		"javascript",
		"typescript",
		"javascriptreact",
		"typescriptreact",
		"xml",
	},
	auto_rename = {
		enabled = true,
	},
})
