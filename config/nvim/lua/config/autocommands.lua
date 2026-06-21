-- Command aliases
vim.api.nvim_create_user_command('Tree', 'Neotree', {})
vim.api.nvim_create_user_command('TreeToggle', 'Neotree toggle', {})
vim.api.nvim_create_user_command('TreeLeft', 'Neotree position=left', {})
vim.api.nvim_create_user_command('TreeRight', 'Neotree position=right', {})
vim.api.nvim_create_user_command('TreeFloat', 'Neotree position=float', {})

vim.api.nvim_create_user_command('Term', 'ToggleTerm', {})
vim.api.nvim_create_user_command('TermH', 'ToggleTerm direction=horizontal', {})
vim.api.nvim_create_user_command('TermV', 'ToggleTerm direction=vertical', {})
vim.api.nvim_create_user_command('TermF', 'ToggleTerm direction=float', {})
