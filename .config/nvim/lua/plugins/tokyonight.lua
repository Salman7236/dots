vim.pack.add { 'https://github.com/folke/tokyonight.nvim' }

require("tokyonight").setup({
  -- use the night style
	style = "moon",
	transparent = true,
})

vim.cmd[[colorscheme tokyonight]]
