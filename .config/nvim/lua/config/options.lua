vim.g.netrw_banner = 0
vim.opt.number = true
vim.opt.relativenumber = true
vim.g.have_nerd_font = true
vim.o.mouse = "a"
vim.opt.cursorline = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)
vim.opt.scrolloff = 10
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = false
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.o.breakindent = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.signcolumn = "yes"
-- vim.opt.colorcolumn = "100"
vim.opt.showmatch = true
vim.opt.cmdheight = 1
-- vim.opt.completeopt = { "menuone", "noinsert", "noselect" }
vim.opt.showmode = false
vim.o.undofile = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = true
vim.opt.listchars = {
	tab = "» ",
	trail = "·",
	nbsp = "␣",
}
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.confirm = true
-- vim.opt.pumheight = 10
-- vim.opt.pumblend = 10
-- vim.opt.winblend = 0
-- vim.opt.conceallevel = 0
-- vim.opt.concealcursor = ""
-- vim.opt.synmaxcol = 300
-- vim.opt.fillchars = { eob = " " }
vim.opt.autoread = true
vim.opt.autowrite = false
vim.opt.hidden = true
vim.opt.backspace = { "indent", "eol", "start" }
-- vim.opt.autochdir = false
-- vim.opt.iskeyword:append("-")
-- vim.opt.path:append("**")
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.diffopt:append("linematch:60")
-- vim.opt.redrawtime = 10000
-- vim.opt.maxmempattern = 20000
vim.opt.foldmethod = "expr" -- use expression for folding
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- use treesitter for folding
vim.opt.foldlevel = 99 -- start with all folds open
