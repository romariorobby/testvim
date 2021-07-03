local M = {}
-- See if this this conflict or not with vim surround
M.config = function()
	vim.api.nvim_set_keymap('n', 'gw', ":HopWord<cr>", {silent = true})
	vim.api.nvim_set_keymap('n', 'gW', ":HopChar2<cr>", {silent = true})
	vim.api.nvim_set_keymap('n', 'gp', ":HopPattern<cr>", {silent = true})
	vim.api.nvim_set_keymap('n', 'gl', ":HopLine<cr>", {silent = true})
end
-- if theres a conflict use this binding
-- vim.api.nvim_set_keymap('n', '<localleader>s', ":HopChar2<cr>", {silent = true})
-- vim.api.nvim_set_keymap('n', '<localleader>s', ":HopWord<cr>", {silent = true})
return M
