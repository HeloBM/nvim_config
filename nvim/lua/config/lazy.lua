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

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { "neovim/nvim-lspconfig",
	dependencies = {
	    { "folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
		    library = {
			{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
		    },
		},
	    },
	},
	config = function()
	    require("lspconfig").lua_ls.setup{}
	end,
    },
    { "mason-org/mason.nvim" },
    { "mason-org/mason-lspconfig.nvim",
	opts = {},
	dependencies = {
	    { "mason-org/mason.nvim", opts = {} },
	    "neovim/nvim-lspconfig",
	},
    },
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp' },
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
    },
    { "nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
	    "nvim-tree/nvim-web-devicons",
	},
	config = function()
	    require("nvim-tree").setup {}
	end,
    },
    { 'ThePrimeagen/harpoon',
	requires = {{'nvim-lua/plenary.vim'}}
    },
    { "lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	---@module "ibl"
	---@type ibl.config
	opts = {},
    },
    { "catppuccin/nvim",
	name = "catppuccin",
	priority = 1000
    },
    { "rijulpaul/nightblossom.nvim",
	name = "nightblossom",
	lazy = false,
	priority = 1000,
	config = function()
	end,
    },
    { 'everviolet/nvim',
	name = 'evergarden',
	priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
    },
    { "tiagovla/tokyodark.nvim" },
    { "rose-pine/neovim",
	name = "rose-pine",
    },
    { "ofirgall/ofirkai.nvim" },
    { 'MunifTanjim/nui.nvim' },
    { "rcarriga/nvim-notify" },
    { "folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
	-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
	    "MunifTanjim/nui.nvim",
	    -- OPTIONAL:
	    --   `nvim-notify` is only needed, if you want to use the notification view.
	    --   If not available, we use `mini` as the fallback
	    "rcarriga/nvim-notify",
	}
    },
    { 'eandrju/cellular-automaton.nvim' },
    { 'numToStr/Comment.nvim' },
    { 'windwp/nvim-autopairs',
	event = "InsertEnter",
	config = true
    }
  },

  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  -- install = { colorscheme = { "habamax" } },
  install = { colorscheme = { "ofirkai" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.netrw_list_hide = ''
vim.g.netrw_hide = 0

vim.opt.shiftwidth=4
vim.opt.number = true
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.cursorline = true
vim.opt.autoread = true
vim.opt.colorcolumn = "80"
vim.opt.relativenumber = true
vim.opt.hidden = true

vim.o.background = "dark"
