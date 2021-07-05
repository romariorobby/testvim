local opt = vim.opt
local cmd = vim.cmd

cmd('filetype plugin on') -- filetype detection
cmd('syntax on')
opt.number = true
opt.inccommand = "split"
opt.iskeyword = opt.iskeyword + { "-" } -- treat dash as seperate word
opt.relativenumber = true
opt.smartindent = true
opt.clipboard = "unnamedplus"
opt.termguicolors = true
opt.tabstop = 4
opt.softtabstop = 4
opt.undodir = "~/.config/nvim/undodir"
opt.swapfile = false
opt.title = true
opt.writebackup = false
opt.showmode = false
opt.mouse = "a"
opt.wrap = false
opt.hidden = true
opt.scrolloff = 10
opt.colorcolumn = "80"
opt.updatetime = 300
-- opt.autochdir = true -- auto change directory when open file or buffer
opt.splitbelow = true
opt.splitright = true
opt.backup = false
opt.signcolumn = "yes"
opt.timeoutlen = 300
opt.completeopt = {'menuone','noselect'} -- or ,noinsert
opt.guifont = "monospace:h17"           -- the font used in graphical neovim applications
