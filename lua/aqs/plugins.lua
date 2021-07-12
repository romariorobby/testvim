local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
	return
end

packer.init {
	git = {
		clone_timeout = 300
	},
	display = {
		open_fn = function()
			return require("packer.util").float {border = "single" }
		end,
	},
}
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	-- General
		-- Tab Bar
  use {
	  'romgrk/barbar.nvim',
	  -- event = "BufRead",
	  config = function()
		  vim.api.nvim_set_keymap('n', '<TAB>', ':BufferNext<CR>',
			  {noremap = true, silent = true})
		  vim.api.nvim_set_keymap('n', '<S-TAB>', ':BufferPrevious<CR>',
			  {noremap = true, silent = true})
		  vim.api.nvim_set_keymap('n', '<S-x>', ':BufferClose<CR>',
			  {noremap = true, silent = true})
        end
	}
		-- explorer
	use {
		'kyazdani42/nvim-tree.lua',
		config = function()
			require("qs-nvimtree").config()
		end
	}

	use {
		'norcalli/nvim-colorizer.lua',
        event = "BufRead",
		config = function()
			require("colorizer").setup()
			vim.cmd("ColorizerReloadAllBufers")
		end
	}
		-- status line
    use 'glepnir/galaxyline.nvim'

    use {
		'glepnir/dashboard-nvim',
        event = 'BufWinEnter',
        cmd = {"Dashboard", "DashboardNewFile", "DashboardJumpMarks"},
        config = function()
            require('qs-dashboard').config()
        end,
        opt = true
	}
		-- Themes
	use { "romariorobby/nvcode-color-schemes.vim" }

	-- Syntax Highlighting {{
	-- FIXME: When remove this spaces become 8, idk why?
	-- use 'sheerun/vim-polyglot'
		-- Treesitter
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
	-- }}
	use 'nvim-treesitter/playground'

	use 'p00f/nvim-ts-rainbow'
		-- Which key
    use {"folke/which-key.nvim"}
	-- Icons
    use {'yamatsum/nvim-web-nonicons', requires = {'kyazdani42/nvim-web-devicons'}}

	-- LSP
	use 'neovim/nvim-lspconfig'
		-- LSP saga
	use 'glepnir/lspsaga.nvim'
		-- Easy LSP install
	use 'kabouzeid/nvim-lspinstall'

    -- use {
    --     "ahmedkhalf/lsp-rooter.nvim",
    --     event = "BufRead",
    --     config = function()
    --         require("lsp-rooter").setup()
    --     end
    -- }

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim', requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'},
	}
	use 'nvim-telescope/telescope-media-files.nvim'

    use {
        "nvim-telescope/telescope-project.nvim",
        event = "BufRead",
        after = "telescope.nvim",
	}
	-- auto completion
    use {
        "hrsh7th/nvim-compe",
        event = "InsertEnter",
        config = function()
            require("qs-compe").config()
        end
	}
    use {"rafamadriz/friendly-snippets", event = "InsertEnter"}

    -- Autopairs
    use {"windwp/nvim-autopairs"}

    use {
		"hrsh7th/vim-vsnip", event = "InsertEnter",
		setup = function()
			vim.g.vsnip_snippet_dir = "~/.config/nvim/snippets"
		end
	}

	-- {{ GIT
	use {
		'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim',
		config = function()
			require("qs-gitsigns").config()
		end,
		event = "BufRead"
	}

	use {
		'ruifm/gitlinker.nvim', requires = 'nvim-lua/plenary.nvim',
		event = "BufRead",
		config = function()
			require"gitlinker".setup({
				opts = {
					add_current_line_on_normal_mode = true,
                    action_callback = require"gitlinker.actions".open_in_browser,
					print_url = true,
					mappings = "<leader>gy"
					}
				})
		end
	}

    use {
        "kdheepak/lazygit.nvim",
        cmd = "LazyGit"
    }

    use {
        "pwntester/octo.nvim",
        event = "BufRead"
    }

    -- use {
    --     "sindrets/diffview.nvim",
    --     event = "BufRead"
	-- }
    -- use {
    --     "mattn/vim-gist", requires = 'mattn/webapi-vim',
    --     event = "BufRead",
	--  }}

    -- diagnostics
	-- TODO Learn to use effectively
    use {
        "folke/trouble.nvim",
        cmd = 'TroubleToggle'
    }
	-- Debugging
    use {
        "mfussenegger/nvim-dap",
        event = "BufRead"
    }

    -- Better quickfix
    use {
        "kevinhwang91/nvim-bqf",
        event = "BufRead"
    }
    -- Floating terminal
    use {
        'numToStr/FTerm.nvim',
        event = "BufRead",
        config = function()
            require'FTerm'.setup({
                dimensions = {height = 0.8, width = 0.8, x = 0.5, y = 0.5},
                border = 'single' -- or 'double'
            })
        end
    }

    -- Search & Replace
    use {
        'windwp/nvim-spectre',
        event = "BufRead",
        config = function()
            require('spectre').setup()
        end
    }
	use {
        "lukas-reineke/indent-blankline.nvim",
        branch = "lua",
        event = "BufRead",
        setup = function()
		  vim.g.indentLine_enabled = 1
				vim.g.indent_blankline_char = "▏"

				vim.g.indent_blankline_filetype_exclude =
					{"help", "terminal", "dashboard"}
				vim.g.indent_blankline_buftype_exclude = {"terminal"}

				vim.g.indent_blankline_show_trailing_blankline_indent = false
				vim.g.indent_blankline_show_first_indent_level = true
        end
	}
	-- Etc
		-- Commenting
	use {
		"terrortylor/nvim-comment",
		cmd = "CommentToggle",
		config = function()
			require('nvim_comment').setup()
		end
	}
		-- commenting in context
    use {
        'JoosepAlviste/nvim-ts-context-commentstring',
        event = "BufRead",
    }

		-- Undo Tree
	use 'mbbill/undotree'

	-- Outliner
    use {
        'simrat39/symbols-outline.nvim',
        cmd = 'SymbolsOutline',
	}
		-- Vista
	-- use 'liuchengxu/vista.vim'
		-- easy motion plugin like
	
	use {
		'phaazon/hop.nvim',
		event = 'BufRead',
		config = function()
			require('qs-hop').config()
		end,
		opt = true
	}
		-- 
	use 'unblevable/quick-scope'
		-- Zen
	use "Pocco81/TrueZen.nvim"
	use {
		'folke/zen-mode.nvim',
        cmd = "ZenMode",
        config = function()
            require('qs-zen').config()
        end
	}

	-- Peek line number
	use { 'nacro90/numb.nvim',
		event = "BufRead",
		config = function()
			require('numb').setup {
				show_numbers = true,
				show_cursorline = true,
			}
		end
	}
	-- Markdown
    use {'npxbr/glow.nvim', run = ':GlowInstall'}
    use {
		'iamcco/markdown-preview.nvim',
		run = 'cd app && npm install',
		ft = 'markdown,'
	}

    use {
        "felipec/vim-sanegx",
        event = "BufRead",
	}

    use {
        "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup()
		end
    }

    use {
        'turbio/bracey.vim',
        event = "BufRead",
        run = 'npm install --prefix server',
    }
	if vim.fn.executable "taskell" == 1 then
	  use {'romariorobby/taskell.nvim', run = ':TaskellInstall'}
	end
	use {'dhruvasagar/vim-dotoo'}

	if vim.fn.executable "neuron" == 1 then
	  use {
		  "oberblastmeister/neuron.nvim",
		  config = function()
			  require('qs-neuron').config()
		  end
	  }
	end
	-- use {'jakewvincent/texmagic.nvim'}
	-- use 'junegunn/goyo.vim'
    -- use 'junegunn/limelight.vim'
end)
-- Due date string 
-- https://github.com/NFrid/due.nvim
