-- Useful status updates for LSP.
vim.pack.add({ "https://github.com/j-hui/fidget.nvim" })

require("fidget").setup({
	notification = {
		override_vim_notify = true,
	},
})

vim.notify = require("fidget.notification").notify
