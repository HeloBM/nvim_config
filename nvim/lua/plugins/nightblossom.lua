-- Setup with configuration options
require("nightblossom").setup({
  variant = "pastel",              -- "spring", "sakura", "pastel"
  transparent = false,             -- Enable background transparency
  integrations = {
    treesitter = true,             -- TreeSitter highlighting
  },
})
