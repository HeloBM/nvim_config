vim.keymap.set('n', '<leader>n', ':nohlsearch<CR>') -- limpa o hlsearch

vim.keymap.set('n', '<leader><tab>', ':b#<CR>')

vim.keymap.set('n', '<C-d>', '<C-d>zz', {})
vim.keymap.set('n', '<C-u>', '<C-u>zz', {})

vim.keymap.set('n', '<leader>sh', ':terminal<CR>', {})
vim.keymap.set('n', '<leader>sv', ':vert terminal<CR>', {})
vim.keymap.set('n', '<leader>j', '<C-W>j', {})
vim.keymap.set('n', '<leader>k', '<C-W>k', {})
vim.keymap.set('n', '<leader>l', '<C-W>l', {})
vim.keymap.set('n', '<leader>h', '<C-W>h', {})
vim.keymap.set("n", "<C-H>", ":vertical resize -2<CR>", {})
vim.keymap.set("n", "<C-L>", ":vertical resize +2<CR>", {})
vim.keymap.set("n", "<C-J>", ":resize -2<CR>", {})
vim.keymap.set("n", "<C-K>", ":resize +2<CR>", {})

vim.keymap.set({ 'v', 'x', 'n' }, '<leader>y', '"+y', {})
vim.keymap.set({ 'v', 'x', 'n' }, '<leader>d', '"+d', {})
vim.keymap.set({ 'v', 'x', 'n' }, '<leader>p', '"+p', {})

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- nvim-tree
vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')
