-- ============================================================
-- SECTION 6: FORMATTING
-- conform.nvim setup and keymap
-- ============================================================
-- [[ Formatting ]]
vim.pack.add({ "https://github.com/stevearc/conform.nvim" })
require("conform").setup({
	notify_on_error = false,
	format_on_save = function(bufnr)
		-- You can specify filetypes to autoformat on save here:
		local enabled_filetypes = {
			lua = true,
			python = true,
			javascript = true,
			typescript = true,
			javascriptreact = true,
			typescriptreact = true,
			html = true,
			css = true,
			htmldjango = true,
			jinja = true,
			sh = true,
			json = true,
			jsonc = true,
		}
		if enabled_filetypes[vim.bo[bufnr].filetype] then
			return { timeout_ms = 1000 }
		else
			return nil
		end
	end,
	default_format_opts = {
		lsp_format = "fallback", -- Use external formatters if configured below, otherwise use LSP formatting. Set to `false` to disable LSP formatting entirely.
	},
	-- You can also specify external formatters in here.
	formatters_by_ft = {
		lua = { "stylua" },
		rust = { "rustfmt" },
		-- Conform can also run multiple formatters sequentially
		python = { "ruff_fix", "ruff_format" },
		c = { "clang-format" },
		sh = { "shfmt" },
		bash = { "shfmt" },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		typescript = { "prettierd", "prettier", stop_after_first = true },
		javascriptreact = { "prettierd", "prettier", stop_after_first = true },
		typescriptreact = { "prettierd", "prettier", stop_after_first = true },
		json = { "prettierd", "prettier", stop_after_first = true },
		jsonc = { "prettierd", "prettier", stop_after_first = true },
		html = { "prettierd", "prettier", stop_after_first = true },
		css = { "prettierd", "prettier", stop_after_first = true },
		htmldjango = { "djlint" }, -- Django templates
		jinja = { "djlint" }, -- Jinja templates
	},
	formatters = {
		ruff_fix = {
			command = "ruff",
			args = { "check", "--select", "I", "--fix", "--stdin-filename", "$FILENAME", "-" },
		},
		ruff_format = {
			command = "ruff",
			args = { "format", "--stdin-filename", "$FILENAME", "-" },
		},
		djlint = {
			args = function(_, ctx)
				local ft = vim.bo[ctx.buf].filetype
				local profile = ft == "htmldjango" and "django" or "jinja"
				return { "--reformat", "--profile", profile, "-" }
			end,
		},
	},
})

vim.keymap.set({ "n", "v" }, "<leader>F", function()
	require("conform").format({ async = true })
end, { desc = "[F]ormat buffer" })
