-- Leave empty for default values
require('ofirkai').setup {
}

-- Or setup with custom parameters
require('ofirkai').setup {
	theme = 'dark_blue', -- Choose theme to use, available themes: 'dark_blue'

	-- scheme = require('ofirkai').scheme, -- Option to override scheme
	custom_hlgroups = {},              -- Option to add/override highlight groups
	remove_italics = false,            -- Option to change all the italics style to none
}
