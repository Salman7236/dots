vim.pack.add({
  "https://github.com/xiyaowong/transparent.nvim",
})

require("transparent").setup({
  exclude_groups = {
    "CursorLine",
    "CursorLineNr",
    "SignColumn",
  },
})

vim.api.nvim_set_hl(0, "CursorLine", {
  bg = "#24283b",
})

vim.api.nvim_set_hl(0, "CursorLineNr", {
  fg = "#ff9e64",
  bold = true,
})
