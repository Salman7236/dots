-- Diagnostic config and keymaps
-- See `:help vim.diagnostic.Opts`
local diagnostic_signs = {
	Error = " ",
	Warn = " ",
	Hint = "",
	Info = "",
}

vim.diagnostic.config({
	update_in_insert = false,
	severity_sort = true,
	virtual_text = { prefix = "●", spacing = 4 },
	virtual_lines = false,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = diagnostic_signs.Error,
			[vim.diagnostic.severity.WARN] = diagnostic_signs.Warn,
			[vim.diagnostic.severity.INFO] = diagnostic_signs.Info,
			[vim.diagnostic.severity.HINT] = diagnostic_signs.Hint,
		},
	},
	float = { border = "rounded", source = true },
	underline = { severity = { min = vim.diagnostic.severity.WARN } },
	jump = {
		on_jump = function(_, bufnr)
			vim.diagnostic.open_float({
				bufnr = bufnr,
				scope = "cursor",
				focus = false,
			})
		end,
	},
})
