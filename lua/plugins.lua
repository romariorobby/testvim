local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	-- General
		-- Tab Bar
    use 'romgrk/barbar.nvim' -- bar
		-- explorer
	use 'kyazdani42/nvim-tree.lua'
		-- status line
    use 'glepnir/galaxyline.nvim'
		-- Themes
	use { "~/software/coloraqs" }
		-- Syntax Highlighting
	use 'sheerun/vim-polyglot'
		-- Treesitter
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
	use 'p00f/nvim-ts-rainbow'
	use 'nvim-treesitter/playground'
		-- Which key
  use {'AckslD/nvim-whichkey-setup.lua', requires = 'liuchengxu/vim-which-key'}
	
	-- Icons
    use {'yamatsum/nvim-web-nonicons', requires = {'kyazdani42/nvim-web-devicons'}}
    use 'ryanoasis/vim-devicons'
	-- LSP
	use 'neovim/nvim-lspconfig'
		-- LSP saga
	use 'glepnir/lspsaga.nvim'
		-- Easy LSP install
	use 'kabouzeid/nvim-lspinstall'
	-- Telescope
	use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}}
	use 'nvim-telescope/telescope-media-files.nvim'

	-- GIT
	if 0 == vim.fn.has 'nvim-0.5' then
		use 'mhinz/vim-signify'
	else
		use {'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim'}
	end

	-- Etc
		-- Commenting
	use "terrortylor/nvim-comment"
		-- Undo Tree
	use 'mbbill/undotree'
		-- Vista
	use 'liuchengxu/vista.vim'
		-- easy motion plugin like
	use 'phaazon/hop.nvim'
		-- 
	use 'unblevable/quick-scope'
		-- Zen
	use "Pocco81/TrueZen.nvim"
	-- Markdown
    use {'npxbr/glow.nvim', run = ':GlowInstall'}
    use { 'iamcco/markdown-preview.nvim', run = 'cd app && npm install'  }
	-- use 'junegunn/goyo.vim'
    -- use 'junegunn/limelight.vim'
end)

