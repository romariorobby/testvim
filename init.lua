require('aqs')
-- Plugins
require('qs-galaxyline')
require('qs-hop')
require('qs-quickscope')
require('qs-telescope')
require('qs-whichkey')
require('qs-autopairs')
require('qs-treesitter')
-- Lang
require('lsp')
require ('lsp.lua-ls')
require ('lsp.bash-ls')
require ('lsp.clangd-ls')
require ('lsp.latex-ls')

vim.cmd('source ~/.config/nvim/vimscripts/autocmd.vim')
