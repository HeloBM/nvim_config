vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.shiftwidth=4
vim.opt.number = true
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.cursorline = true
vim.opt.autoread = true

vim.keymap.set('n', '<leader>n', ':nohlsearch<CR>') -- limpa o hlsearch

vim.keymap.set('n', '<leader><tab>', ':b#<CR>')

vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

vim.keymap.set('n', '<leader>sh', ':terminal<CR>', opts)
vim.keymap.set('n', '<leader>sv', ':vert terminal<CR>', opts)
vim.keymap.set('n', '<leader>j', '<C-W>j', opts)
vim.keymap.set('n', '<leader>k', '<C-W>k', opts)
vim.keymap.set('n', '<leader>l', '<C-W>l', opts)
vim.keymap.set('n', '<leader>h', '<C-W>h', opts)
vim.keymap.set("n", "<C-H>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-L>", ":vertical resize +2<CR>", opts)
vim.keymap.set("n", "<C-J>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-K>", ":resize +2<CR>", opts)

vim.keymap.set({ 'v', 'x', 'n' }, '<leader>y', '"+y', opts)
vim.keymap.set({ 'v', 'x', 'n' }, '<leader>d', '"+d', opts)
vim.keymap.set({ 'v', 'x', 'n' }, '<leader>p', '"+p', opts)

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- nvim-tree
vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')
