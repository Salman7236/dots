vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })

local statusline = require("mini.statusline")
statusline.setup({ use_icons = vim.g.have_nerd_font })

-- cursor location to LINE:COLUMN
---@diagnostic disable-next-line: duplicate-set-field
statusline.section_location = function()
	return "%2l:%-2v"
end

-- Add/delete/replace surroundings (brackets, quotes, etc.)
-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
-- - sd'   - [S]urround [D]elete [']quotes
-- - sr)'  - [S]urround [R]eplace [)] [']
require("mini.surround").setup()

require("mini.comment").setup()
require("mini.move").setup()
require("mini.cursorword").setup()
require("mini.indentscope").setup()
require("mini.pairs").setup()
require("mini.trailspace").setup()
require("mini.bufremove").setup()
require("mini.icons").setup()

-- Better Around/Inside textobjects
-- Examples:
--  - va)  - [V]isually select [A]round [)]paren
--  - yiiq - [Y]ank [I]nside [I]+1 [Q]uote
--  - ci'  - [C]hange [I]nside [']quote
require("mini.ai").setup({
	-- NOTE: Avoid conflicts with the built-in incremental selection mappings on Neovim>=0.12 (see `:help treesitter-incremental-selection`)
	mappings = {
		around_next = "aa",
		inside_next = "ii",
	},
	n_lines = 500,
})

-- require('mini.diff').setup()
-- require('mini.git').setup()
-- require('mini.completion').setup()

-- local miniclue = require('mini.clue')
-- miniclue.setup({
--   triggers = {
-- 	-- Leader triggers
-- 	{ mode = { 'n', 'x' }, keys = '<Leader>' },
--
-- 	-- `[` and `]` keys
-- 	{ mode = 'n', keys = '[' },
-- 	{ mode = 'n', keys = ']' },
--
-- 	-- Built-in completion
-- 	{ mode = 'i', keys = '<C-x>' },
--
-- 	-- `g` key
-- 	{ mode = { 'n', 'x' }, keys = 'g' },
--
-- 	-- Marks
-- 	{ mode = { 'n', 'x' }, keys = "'" },
-- 	{ mode = { 'n', 'x' }, keys = '`' },
--
-- 	-- Registers
-- 	{ mode = { 'n', 'x' }, keys = '"' },
-- 	{ mode = { 'i', 'c' }, keys = '<C-r>' },
--
-- 	-- Window commands
-- 	{ mode = 'n', keys = '<C-w>' },
--
-- 	-- `z` key
-- 	{ mode = { 'n', 'x' }, keys = 'z' },
--   },
--
--   clues = {
-- 	-- Enhance this by adding descriptions for <Leader> mapping groups
-- 	miniclue.gen_clues.square_brackets(),
-- 	miniclue.gen_clues.builtin_completion(),
-- 	miniclue.gen_clues.g(),
-- 	miniclue.gen_clues.marks(),
-- 	miniclue.gen_clues.registers(),
-- 	miniclue.gen_clues.windows(),
-- 	miniclue.gen_clues.z(),
--   },
-- })
--
-- Inside your lua/plugins/mini.lua file:

require("mini.notify").setup({
	-- Completely turn off mini.notify's automated LSP tracking
	lsp_progress = {
		enable = false,
	},

	-- Your notification window options (optional)
	window = {
		winblend = 15, -- Tweak background transparency if you want
	},
})
