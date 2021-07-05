local M = {}
-- local bmap = vim.api.nvim_buf_set_keymap
M.config = function()
	require("neuron").setup {
		virtual_title = true,
		mappings = true,
		run = nil,
		neuron_dir = "~/Dropbox/notes/",
		leader = "<leader>n"

}
end
-- bmap(0, 'n', "<CR>", ":lua require'neuron'.enter_link()<CR>", {noremap=true, silent=true})
return M
