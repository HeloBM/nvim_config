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
    virtual_text = true,  -- Show inline messages
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
    local opts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>K', vim.diagnostic.open_float, {})
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wl', function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, opts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>f', function()
	vim.lsp.buf.format { async = true }
	end, opts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({
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

lspconfig.ts_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities
})

lspconfig.pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

lspconfig.dockerls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig.docker_compose_language_service.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

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
