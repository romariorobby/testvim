local actions = require('telescope.actions')
-- Global remapping
------------------------------
-- '--color=never',
require('telescope').load_extension('media_files')
require('telescope').setup{
    defaults = {
        vimgrep_arguments = {'rg', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'},
        prompt_prefix = " ",
        selection_caret = " ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = { mirror = false},
            vertical = { mirror = false},
            width = 0.75,
            prompt_position = "bottom",
            preview_cutoff = 120
        },
		path_display = {
		  "absolute"
		  -- "shorten",
		},
        file_sorter = require'telescope.sorters'.get_fuzzy_file,
        file_ignore_patterns = {},
        generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
        winblend = 0,
        border = {},
        borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
        color_devicons = true,
        use_less = true,
        set_env = {['COLORTERM'] = 'truecolor'}, -- default = nil,
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

        -- Developer configurations: Not meant for general override
	--
        buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
        mappings = {
            i = {
                -- To disable a keymap, put [map] = false
                -- So, to not map "<C-n>", just put
                -- Otherwise, just set the mapping to the function that you want it to be.
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-x>"] = false,
                ["<C-s>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                -- See if this not conflict with anything
                ["<A-s>"] = actions.select_horizontal,
                ["<A-v>"] = actions.select_vertical,
                ["<esc>"] = actions.close,

                -- ["<C-i>"] = actions.select_horizontal,

                -- Add up multiple actions
                ["<CR>"] = actions.select_default + actions.center

                -- ["<CR>"] = actions.select_default + actions.center + my_cool_custom_action,
            },
            n = {
		    -- it doesnt work with tmux
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-x>"] = false,
      			    ["<C-s>"] = actions.select_horizontal,
      			    ["<C-v>"] = actions.select_vertical,
                -- See if this not conflict with anything
      			    ["<A-s>"] = actions.select_horizontal,
      			    ["<A-v>"] = actions.select_vertical,
                ["l"] = actions.select_default + actions.center,
                ["g"] = actions.move_to_top,
                ["z"] = actions.move_to_middle,
                ["G"] = actions.move_to_bottom
                -- ["<C-i>"] = my_cool_custom_action,
		--
                -- You can perform as many actions in a row as you like
            }
        }
    },
	require'telescope'.setup {
		extensions = {
			media_files = {
				-- filetypes whitelist
				-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
				filetypes = {"png", "webp", "jpg", "jpeg"},
				find_cmd = "rg" -- find command (defaults to `fd`)
			}
		}
	}
}

require('plenary.reload').reload_module("qs-telescope")

local M = {}

function M.find_neovim()
  require('telescope.builtin').find_files {
    prompt_title = "~ dotfiles ~",
	path_display = { "absolute" },
    cwd = "~/.config/nvim",

    layout_strategy = 'horizontal',
    layout_config = {
      preview_width = 0.65,
    },
  }
end
-- TODO this is also will laggy overtime when notes increment
-- maybe only agenda files? or seperate function? function M.find_agenda?
function M.find_notes()
  require('telescope.builtin').find_files {
    prompt_title = "~ Notes ~",
	path_display = { "absolute" },
    cwd = "~/Dropbox/media/documents/notes/",

    layout_strategy = 'horizontal',
    layout_config = {
      preview_width = 0.65,
    },
  }
end

function M.find_todos()
  require('telescope.builtin').find_files {
    prompt_title = "~ Agenda/TODOS ~",
	path_display = { "absolute" },
    cwd = "~/Dropbox/media/documents/notes/gtd/",

    layout_strategy = 'horizontal',
    layout_config = {
      preview_width = 0.65,
    },
  }
end
-- TODO LAG! Find a way to exclude some of file or dir
function M.find_dot()
  require('telescope.builtin').find_files {
    prompt_title = "~ Dotfiles ~",
	path_display = { "absolute" },
    file_ignore_patterns = {
			"spicetify", "JetBrains", "Google", "*.log", "*.db",
			"BraveSoftware", "obsidian", "VSCodium", "emacs", "Notion", "Rambox", "Bitwarden",
			"pulse", "persepolis_download_manager", "mpv/watch_later/*", "Mailspring", "awesome/themes/",
			"transmission/resume/*", "transmission/torrents/*", "fontforge", "calibre", "spotify",
			"android"

},
    cwd = "~/.config/",

    layout_strategy = 'horizontal',
    layout_config = {
      preview_width = 0.65,
    },
  }
end

function M.find_chezdot()
  require('telescope.builtin').find_files {
    prompt_title = "~ Chezmoi Dotfiles ~",
	path_display = { "shorten" },
    file_ignore_patterns = {},
    cwd = "~/.local/share/chezmoi/",

    layout_strategy = 'horizontal',
    layout_config = {
      preview_width = 0.65,
    },
  }
end
function M.find_scripts()
  require('telescope.builtin').find_files {
    prompt_title = "~ Scripts ~",
	path_display = { "absolute" },
    cwd = "~/.local/bin/",

    layout_strategy = 'horizontal',
    layout_config = {
      preview_width = 0.65,
    },
  }
end

function M.find_suck()
  require('telescope.builtin').find_files {
    prompt_title = "~ Suckless ~",
	path_display = { "absolute" },
    file_ignore_patterns = {},
    cwd = "~/.local/src/",

    layout_strategy = 'horizontal',
    layout_config = {
      preview_width = 0.65,
    },
  }
end

return M

