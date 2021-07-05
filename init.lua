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
require ('lsp.html-ls')
require ('lsp.json-ls')
require ('lsp.vim-ls')
require ('lsp.yaml-ls')
require ('lsp.css-ls')

vim.cmd('source ~/.config/nvim/vimscripts/autocmd.vim')
