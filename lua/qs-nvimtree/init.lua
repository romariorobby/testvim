local M = {}

M.config = function()
    vim.o.termguicolors = true
    vim.g.nvim_tree_ignore = {".git", "node_modules", ".cache"}
    vim.g.nvim_tree_auto_ignore_ft = {'startify', 'dashboard'} -- don't open on spesific types
    vim.g.nvim_tree_side = "left"
    vim.g.nvim_tree_auto_open = 1 -- auto open when typing $DIR or without filename
    vim.g.nvim_tree_disable_netrw = 0
    vim.g.nvim_tree_width = 30
    vim.g.nvim_tree_disable_default_keybindings = 1
    vim.g.nvim_tree_root_folder_modifier = ":t"
    vim.g.nvim_tree_tree_follow = 1
    vim.g.nvim_tree_allow_resize = 1
    vim.g.nvim_tree_lsp_diagnostics = 1
    vim.g.nvim_tree_follow = 1
    vim.g.nvim_tree_indent_markers = 1
    vim.g.nvim_tree_hide_dotfiles = 1 --0 by default, this option hides files and folders starting with a dot `.`
	vim.g.nvim_tree_update_cwd = 1 -- 0 by default, will update the tree cwd when changing nvim's directory (DirChanged event). Behaves strangely with autochdir set.
    vim.g.nvim_tree_auto_close = 0 --0 by default, closes the tree when it's the last window

    vim.g.nvim_tree_icons = {
        default = '',
        symlink = '',
        git = {
            unstaged = "✗",
            staged = "✓",
            unmerge = "",
            renamed = "",
            untracked = ""
        },
        folder = {
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
            symlink_open = "",
        }
    }
-- Mapping
    local tree_cb = require'nvim-tree.config'.nvim_tree_callback
    vim.g.nvim_tree_bindings = {
      { key = {"<C-t>", "b"},cb = tree_cb("tabnew") },
      { key = "<", cb = tree_cb("prev_sibling") },
      { key = ">", cb = tree_cb("next_sibling") },
      { key = {"P", "`"}, cb = tree_cb("parent_node") },
      { key = "<BS>", cb = tree_cb("close_node") },
      { key = "<S-CR>", cb = tree_cb("close_node") },
      { key = "<Tab>", cb = tree_cb("preview") },
      { key = "K", cb = tree_cb("first_sibling") },
      { key = "J", cb = tree_cb("last_sibling") },
      { key = "I", cb = tree_cb("toggle_ignored") },
      { key = {"q"}, cb = tree_cb("close")},
      { key = {"a"}, cb = tree_cb("create")},
      { key = "g[", cb = tree_cb("prev_git_item") },
      { key = "g]", cb = tree_cb("next_git_item") },
      { key = {"-", "H"}, cb = tree_cb("dir_up") },
      { key = {"<2-RightMouse>", "<C-}>" ,"L"}, cb = tree_cb("cd") },

      { key = {"<CR>", "<2-LeftMouse>", "o"}, cb = tree_cb("edit")},
      { key = {"v"}, cb = tree_cb("vsplit")},
      { key = {"h"}, cb = tree_cb("close_node")},
      { key = {"s"}, cb = tree_cb("split")},
      { key = {"<C-r>"}, cb = tree_cb("refresh")},
      { key = {"p"}, cb = tree_cb("paste")},
      { key = {"y"}, cb = tree_cb("copy")},
      { key = {"d"}, cb = tree_cb("remove")},
      { key = {"Y"}, cb = tree_cb("copy_path")},
      { key = {"x"}, cb = tree_cb("cut")},
      { key = {"ra"}, cb = tree_cb("rename")},
      { key = {"rc"}, cb = tree_cb("full_rename")},
      { key = {"."}, cb = tree_cb("toggle_dotfiles")},
      { key = {"g?"}, cb = tree_cb("toggle_help")}
    }
end
--  {key = ["x"]              cb = tree_cb("cut"),
--  {key = ["c"]              cb = tree_cb("copy"),
--  {key = ["p"]              cb = tree_cb("paste"),
--  {key = ["o"]              cb = tree_cb("edit"),
--  {key = ["."]              cb = tree_cb("toggle_dotfiles"),
--  {key = ["<2-LeftMouse>"]  cb = tree_cb("edit"),
--  {key = ["<2-RightMouse>"] cb = tree_cb("cd"),
--  {key = ["rA"]             cb = tree_cb("rename"),
--  {key = ["rc"]          	cb = tree_cb("full_rename"),
--  {key = ["L"]          cb = tree_cb("cd"),
--  {key = ["H"]             cb = tree_cb("dir_up"),
--  {key = ["v"]          cb = tree_cb("vsplit"),
--  {key = ["s"]          cb = tree_cb("split"),
--  {key = ["<C-t>"]         cb = tree_cb("tabnew"),
--  {key = ["<BS>"]          cb = tree_cb("close_node"),
--  {key = ["<S-CR>"]        cb = tree_cb("close_node"),
--  {key = ["<Tab>"]         cb = tree_cb("preview"),
--  {key = ["I"]             cb = tree_cb("toggle_ignored"),
--  {key = ["R"]             cb = tree_cb("refresh"),
--  {key = ["a"]             cb = tree_cb("create"),
--  {key = ["d"]             cb = tree_cb("remove"),
--  {key = ["[c"]            cb = tree_cb("prev_git_item"),
--  {key = ["]c"]            cb = tree_cb("next_git_item"),
--  {key = ["q"]             cb = tree_cb("close"),

return M
