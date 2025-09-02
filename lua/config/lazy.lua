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
vim.g.maplocalleader = " "

vim.opt.shiftwidth=4
vim.opt.number = true

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- { "neovim/nvim-lspconfig",
    --    version = "0.1.7" },
    { "mason-org/mason.nvim" },
    -- {
    --     "mason-org/mason-lspconfig.nvim",
    --     opts = {},
    --     dependencies = {
    --         { "mason-org/mason.nvim", opts = {} },
    --         "neovim/nvim-lspconfig",
    --     },
    -- },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { "nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate" },
    { "nvim-tree/nvim-web-devicons", opts = {} },
    { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },
    { 'nvim-telescope/telescope.nvim', tag = '0.1.8' },
    { "nvim-lua/plenary.nvim" },
    { 'stevearc/oil.nvim',
      ---@module 'oil'
      ---@type oil.SetupOpts
	opts = {},
      -- Optional dependencies
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
      -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
      -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
	lazy = false,
    }
  },

  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

vim.keymap.set('n', '<leader>n', ':nohlsearch<CR>') -- limpa o hlsearch
vim.keymap.set('n', '<leader><tab>', ':b#<CR>')
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
