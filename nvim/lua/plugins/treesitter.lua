require'nvim-treesitter.configs'.setup({
    ensure_installed = {
	"c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "python", "javascript", "typescript", "dockerfile"
    },
    sync_install = false,
    auto_install = true,
    highlight = {
	enable = true,
    },
    injection = {
	enable = true
    },
    indent = {
	enable = true
    },
    query_linter = {
	enable = true,
	use_virtual_text = true,
	lint_events = {"BufWrite", "CursorHold"},
    },
})
