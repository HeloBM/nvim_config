require('lualine').setup({
    options = {
	icons_enabled = true,
	theme = 'horizon',
    },
    sections = {
	lualine_a = {
	    {
		'filename',
		path = 1,
	    }
	}
    }
})
