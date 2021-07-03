vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {})
-- :help just enough
vim.api.nvim_set_keymap('n', '<F1>', '<NOP>', {})
vim.api.nvim_set_keymap('i', '<F1>', '<NOP>', {})
vim.g.mapleader=" "
vim.g.maplocalleader=" ,"

local opt = {noremap=true, silent=true}

vim.api.nvim_set_keymap('n', 'Q', '<NOP>', opt)
-- windows navigation[
vim.api.nvim_set_keymap('n', '<leader>h', '<C-w>h', opt)
vim.api.nvim_set_keymap('n', '<leader>j', '<C-w>j', opt)
vim.api.nvim_set_keymap('n', '<leader>k', '<C-w>k', opt)
vim.api.nvim_set_keymap('n', '<leader>l', '<C-w>l', opt)
vim.api.nvim_set_keymap('n', '<leader>s', '<C-w>s', opt)
vim.api.nvim_set_keymap('n', '<leader>v', '<C-w>v', opt)

-- extended keyboard
-- Opens line below or above the current line
-- vim.api.nvim_set_keymap('i','<S-CR>','<C-O>o', {noremap=true})
-- vim.api.nvim_set_keymap('i','<C-CR>','<C-O>O', {noremap=true})

-- Terminal Navigation {{
vim.api.nvim_set_keymap('t', '<leader>h', [[<C-\><C-N><C-w>h]], opt)
vim.api.nvim_set_keymap('t', '<leader>j', [[<C-\><C-N><C-w>j]], opt)
vim.api.nvim_set_keymap('t', '<leader>k', [[<C-\><C-N><C-w>k]], opt)
vim.api.nvim_set_keymap('t', '<leader>l', [[<C-\><C-N><C-w>l]], opt)
vim.api.nvim_set_keymap('t', '<leader>s', [[<C-\><C-N><C-w>s]], opt)
vim.api.nvim_set_keymap('t', '<leader>v', [[<C-\><C-N><C-w>v]], opt)
vim.api.nvim_set_keymap('t', '<C-[>', [[<C-\><C-N>]], opt)
vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-N>]], opt)
-- }}
-- Hate escape
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', opt)
vim.api.nvim_set_keymap('i', 'kj', '<ESC>', opt) vim.api.nvim_set_keymap('i', 'kk', '<ESC>', opt)
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', opt)
-- Make arrow bit useful (for scrolling)
vim.api.nvim_set_keymap('n', '<Up>', '<C-y>', {})
vim.api.nvim_set_keymap('n', '<Down>', '<C-e>', {})

-- Command line mode (I don't care) {{{
vim.api.nvim_set_keymap('c', '<A-h>', '<Left>', {})
vim.api.nvim_set_keymap('c', '<A-l>', '<Right>', {})
--
vim.api.nvim_set_keymap('c', '<C-h>', '<Left>', {})
vim.api.nvim_set_keymap('c', '<C-l>', '<Right>', {})
vim.api.nvim_set_keymap('c', '<C-k>', '<Up>', {})
vim.api.nvim_set_keymap('c', '<C-j>', '<Down>', {})
vim.api.nvim_set_keymap('c', '<C-d>', '<C-u>', {})
vim.api.nvim_set_keymap('c', '<C-v>', '<C-r>+', {})
vim.api.nvim_set_keymap('c', '<C-p>', '<C-r>"', {})
--- }}}
-- Toggle Jump quickly between two files
vim.api.nvim_set_keymap('n', '<A-Tab>', '<C-^>', opt)
-- FIXME: Remove this
-- https://github.com/neovim/neovim/issues/12771
-- C-BS not behave as it should
vim.api.nvim_set_keymap('i', '<C-h>', '<C-W>', {})

-- Resizing:  {{{
-- FIXME:: If there's a conflict i need to change this
-- Horizontal
vim.api.nvim_set_keymap('n', '<A-=>', '<C-W>+', opt)
vim.api.nvim_set_keymap('n', '<A-->', '<C-W>-', opt)
-- Vertical
vim.api.nvim_set_keymap('n','<A-,>', '<C-W><',opt)
vim.api.nvim_set_keymap('n','<A-.>', '<C-W>>',opt)
vim.api.nvim_set_keymap('n', '<A-BS>', '<C-W>=', opt)

-- vim.api.nvim_set_keymap('n', '<Bslash>', ':', opt)
-- Indenting in visual block
vim.api.nvim_set_keymap('v', '<', '<gv', opt)
vim.api.nvim_set_keymap('v', '>', '>gv', opt)

vim.cmd('vnoremap p "0p')
vim.cmd('vnoremap P "0P')

-- Move selected line / block of text in visual
vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', opt)
vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv', opt)
-- Better nav for omnicomplete
-- vim.cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
-- vim.cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')
--
-- vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', opt)
-- Tab switch buffer
-- vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', opt)
-- vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', opt)
