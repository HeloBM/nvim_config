local open_terminal = function()
  vim.g.last_buf = vim.api.nvim_get_current_buf()
  vim.cmd('term')
  vim.cmd('startinsert')
end

local close_terminal = function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), 'n', false)
  vim.cmd('bd!')
  if vim.g.last_buf and vim.api.nvim_buf_is_valid(vim.g.last_buf) then
    vim.cmd('buffer ' .. vim.g.last_buf)
  end
end

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<leader>n', ':nohlsearch<CR>') -- limpa o hlsearch

vim.keymap.set('n', '<leader><tab>', ':b#<CR>')

vim.keymap.set('n', '<leader>t', open_terminal, opts)
vim.keymap.set('t', '<C-q>', close_terminal, opts)

vim.keymap.set('n', '<C-d>', '<C-d>zz', {})
vim.keymap.set('n', '<C-u>', '<C-u>zz', {})

vim.keymap.set('n', '<leader>sh', ':split<CR>', {})
vim.keymap.set('n', '<leader>sv', ':vsplit<CR>', {})

vim.keymap.set('n', '<leader>j', '<C-W>j', {})
vim.keymap.set('n', '<leader>k', '<C-W>k', {})
vim.keymap.set('n', '<leader>l', '<C-W>l', {})
vim.keymap.set('n', '<leader>h', '<C-W>h', {})

vim.keymap.set('n', '<leader>ww', ':wqa<CR>', opts)
vim.keymap.set('n', '<leader>qq', ':qa!<CR>', opts)

vim.keymap.set({ 'v', 'x', 'n' }, '<leader>y', '"+y', {})
vim.keymap.set({ 'v', 'x', 'n' }, '<leader>d', '"+d', {})
vim.keymap.set({ 'v', 'x', 'n' }, '<leader>p', '"+p', {})

vim.keymap.set("n", "<C-H>", ":vertical resize -2<CR>", {})
vim.keymap.set("n", "<C-L>", ":vertical resize +2<CR>", {})
vim.keymap.set("n", "<C-J>", ":resize -2<CR>", {})
vim.keymap.set("n", "<C-K>", ":resize +2<CR>", {})

vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})

-- telescope
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', function () builtin.find_files() end, {})
vim.keymap.set('n', '<leader>fj', function () builtin.oldfiles() end, {})
vim.keymap.set('n', '<leader>fg', function () builtin.live_grep() end, {})
vim.keymap.set('n', '<leader>fh', function () builtin.help_tags() end, {})
vim.keymap.set('n', '<leader>fb', function () builtin.buffers() end, {})

-- nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local width = 80
local height = 20

require("nvim-tree").setup {
    filters = {
        dotfiles = false,
        custom = { "^.git$" },
    },
    git = {
        enable = true,
        ignore = false
    },
    view = {
        float = {
            enable = true,
            open_win_config = function ()

                local gwidth = vim.api.nvim_list_uis()[1].width
                local gheight = vim.api.nvim_list_uis()[1].height

                return {
                    relative = "editor",
                    border = "rounded",
                    width = width,
                    height = height,
                    row = (gheight - height) * 0.3,
                    col = (gwidth - width) * 0.5,
                }
            end
        }
    }
}

vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')

-- cellular-automaton
vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")

-- vimwiki
-- vim.api.nvim_set_keymap('n', '<Leader>ww', ':VimwikiIndex<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<Leader>wt', ':VimwikiMakeDiaryNote<CR>', { noremap = true, silent = true })

-- -- completions
-- local cmp = require("cmp")
--
-- require('luasnip.loaders.from_vscode').lazy_load()
--
-- cmp.setup({
--     mapping = cmp.mapping.preset.insert({
--         ['<C-Space>'] = cmp.mapping.complete(),
--         ['<C-e>'] = cmp.mapping.abort(),
--         ['<Tab>'] = cmp.mapping.confirm({ select = true }),
--         ['<CR>'] = cmp.mapping.confirm({ select = true }),
--         ['<C-j>'] = cmp.mapping.select_next_item(),
--         ['<C-k>'] = cmp.mapping.select_prev_item(),
--     }),
--     snippet = {
--         expand = function(args)
--             require('luasnip').lsp_expand(args.body)
--         end
--     },
--
--     sources = cmp.config.sources(
--         {
--             { name = 'nvim_lsp' },
--             { name = 'luasnip' },
--             { name = 'nvim_lua' },
--             { name = 'nvim_lsp_signature_help' },
--             { name = 'buffer' },
--             { name = 'path' },
--         }
--     )
-- })
--
-- harpoon
local harpoon = require("harpoon")
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>m", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>,", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>.", function() ui.nav_file(3) end)

harpoon.setup()

-- lualine
require('lualine').setup {
    options = {
        section_separators = { left = '', right = ''},
        component_separators = { left = '|', right = '|' },
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_c = {
            {
                'filename',
                path = 1,
            },
        },
    }
}

-- oil
require("oil").setup {
    columns = {
        "icon",
    },
    preview_split = "right",
    win_options = {
        signcolumn = "yes:2",
    },
    view_options = {
        show_hidden = true,
    }
}

vim.keymap.set('n', '-', '<CMD>Oil<CR>');

