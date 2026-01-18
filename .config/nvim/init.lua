-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- fix esc
vim.keymap.set('i', '<Esc>', '<Esc>`^')
-- vim surround
vim.keymap.set('x', 's', '<Plug>VSurround')

-- Swap p and P in visual mode
vim.keymap.set('x', 'p', 'P')
vim.keymap.set('x', 'P', 'p')

vim.keymap.set({'n', 'x'}, 'w', '<Plug>CamelCaseMotion_w', { silent = true })
vim.keymap.set({'n', 'x'}, 'ge', '<Plug>CamelCaseMotion_ge', { silent = true })
vim.keymap.set('o', 'ie', '<Plug>CamelCaseMotion_ie', { silent = true })
vim.keymap.set('x', 'ie', '<Plug>CamelCaseMotion_ie', { silent = true })

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- fork to fix spacing
    "zhengkyl/vim-surround",
    "bkad/CamelCaseMotion",
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
