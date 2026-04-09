require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "ts_ls",
        "pyright",
        "docker_compose_language_service",
        "dockerls",
    }
})

vim.diagnostic.config({
    virtual_text = true, -- Show inline messages
    signs = true,         -- Keep signs in the sign column
    underline = true,     -- Underline problematic code
    update_in_insert = false,
    severity_sort = true, -- Sort by severity

    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = true, -- Show source of diagnostic (e.g. pyright, ts_ls)
        header = "",
        prefix = "",
    },
})

-- Optional: prettier icons
local diagnostic_signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(diagnostic_signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

local on_attach = function(_, _)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, {})
    vim.keymap.set('n', '<leader>K', vim.diagnostic.open_float, {})
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, {})
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, {})
    vim.keymap.set('n', '<leader>wl', function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, {})
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, {})
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
    vim.keymap.set('n', '<leader>f', function()
	vim.lsp.buf.format { async = true }
	end, {})
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

vim.lsp.config("lua_ls", {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }
            }
        }
    }
})
vim.lsp.enable("lua_ls")

-- ts_ls
vim.lsp.config("ts_ls", {
    on_attach = on_attach,
    capabilities = capabilities
})
vim.lsp.enable("ts_ls")

-- pyright
vim.lsp.config("pyright", {
    on_attach = on_attach,
    capabilities = capabilities
})
vim.lsp.enable("pyright")

-- dockerls
vim.lsp.config("dockerls", {
    on_attach = on_attach,
    capabilities = capabilities,
})
vim.lsp.enable("dockerls")

-- docker_compose_language_service
vim.lsp.config("docker_compose_language_service", {
    on_attach = on_attach,
    capabilities = capabilities,
})
vim.lsp.enable("docker_compose_language_service")

vim.filetype.add({
    filename = {
        ["docker-compose.yml"] = "yaml.docker-compose",
        ["docker-compose.yaml"] = "yaml.docker-compose",
        ["compose.yml"] = "yaml.docker-compose",
        ["compose.yaml"] = "yaml.docker-compose",
        ["Dockerfile"] = "dockerfile",
    },
    pattern = {
        ["docker%-compose%..*"] = "yaml.docker-compose",
        ["compose%..*"] = "yaml.docker-compose",
        ["Dockerfile%..*"] = "dockerfile",
    },
})
