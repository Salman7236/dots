vim.pack.add({ "https://github.com/ibhagwan/fzf-lua" })

local fzf = require("fzf-lua")

---@diagnostic disable: missing-fields

---@module "fzf-lua"
---@type fzf-lua.Config|{}
local config = {}
---@diagnostic enable: missing-fields

-- Pass the type-checked config table into the setup engine
fzf.setup(config)

-- Tell Neovim to use fzf-lua for vim.ui.select
fzf.register_ui_select()

vim.keymap.set("n", "<leader><leader>", fzf.files, { desc = "[F]ind [F]iles" })
vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "[F]ind by [G]rep" })
vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "[F]ind active [B]uffers" })
vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "[F]ind [H]elp tags" })
vim.keymap.set("n", "<leader>fw", fzf.grep_cword, { desc = "[F]ind current [W]ord" })

vim.keymap.set("n", "<leader>fx", fzf.diagnostics_document, { desc = "[F]ind Document [X]diagnostics" })
vim.keymap.set("n", "<leader>fX", fzf.diagnostics_workspace, { desc = "[F]ind Workspace [X]diagnostics" })
vim.keymap.set("n", "<leader>fs", fzf.lsp_document_symbols, { desc = "[F]ind Document [S]ymbols" })
vim.keymap.set("n", "<leader>fS", fzf.lsp_workspace_symbols, { desc = "[F]ind Workspace [S]ymbols" })

-- Find recent files, keymaps, and resume last search
vim.keymap.set("n", "<leader>f.", fzf.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader>fk", fzf.keymaps, { desc = "[F]ind [K]eymaps" })
vim.keymap.set("n", "<leader>fr", fzf.resume, { desc = "[F]ind [R]esume" })

-- Fuzzily find in current buffer (Using f/ keeps the search mnemonic)
vim.keymap.set("n", "<leader>f/", fzf.lgrep_curbuf, { desc = "[F]ind [/] in current buffer" })

-- Shortcut for finding your Neovim configuration files
vim.keymap.set("n", "<leader>fn", function()
	fzf.files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[F]ind [N]eovim files" })
