  -- 1. Explicitly force Kitty graphics environment flag
  vim.env.SNACKS_KITTY = 'true'

  -- 2. Add the package to Neovim's registry
  vim.pack.add { 'https://github.com/folke/snacks.nvim' }

  -- -- 3. FORCE Neovim to load the paths for snacks right now synchronously
  -- vim.pack.load('snacks.nvim')

  -- 4. Execute setup immediately so the health check status clears
  require('snacks').setup({
    image = { enabled = true },
  })
