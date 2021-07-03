require("which-key").setup {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = false, -- adds help for operators like d, y, ...
            motions = false, -- adds help for motions
            text_objects = false, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true -- bindings for prefixed with g
        }
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+" -- symbol prepended to a group
    },
    window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = {1, 0, 1, 0}, -- extra window margin [top, right, bottom, left]
        padding = {1, 1, 1, 1} -- extra window padding [top, right, bottom, left]
	},
    layout = {
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 4
    },
    ignore_missing = false, -- hide if didn't intended to specify
    show_help = true
}
local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false -- use `nowait` when creating keymaps
}

-- TODO How to make local mapping whichkey without repeating?
local mappings = {
    a = {
        name = "Action",
	    S = {':%s/\\s\\+$//<cr>' , 'remove whitespace'},
	    g = {':Glow<cr>', 'Glow Markdown Preview'},
    },
    b = {
        name = 'Buffer',
        c = {':BufferClose<cr>' , 'Close Buffer'},
        f = {':BufferPick<cr>' , 'pick Buffer'},
        l = {':BufferNext<cr>' , 'next Buffer'},
        h = {':BufferPrevious<cr>' , 'Previous Buffer'},
        K = {':BufferMoveNext<cr>' , 'Move To Right'},
        J = {':BufferMovePrevious<cr>' , 'Move to left'},
        C = {':BufferCloseAllButCurrent<cr>' , 'Delete all other buffer'},
        x = {':BufferCloseAllButCurrent<cr>' , 'Delete all other buffer'},
        d = {':BufferDelete<Cr>' , 'Delete Buffer'},
        s = {':BufferOrderByDirectory<cr>' , 'Sort By Directory'},
        S = {':BufferOrderByLanguage<cr>' , 'Sort By Language'},
        G = {':BufferLast<cr>' , 'go to buffer Last'},
        g = {':BufferGoto 1<Cr>' , 'Go to Buffer 1'},
        b = {':Telescope buffers<cr>' , 'Switch Buffer'},
        ['1'] = {':BufferGoto 1<cr>' , 'Go to Buffer 1'},
        ['2'] = {':BufferGoto 2<cr>' , 'Go to Buffer 2'},
        ['3'] = {':BufferGoto 3<cr>' , 'Go to Buffer 3'},
        ['4'] = {':BufferGoto 4<cr>' , 'Go to Buffer 4'},
        ['5'] = {':BufferGoto 5<cr>' , 'Go to Buffer 5'},
        ['6'] = {':BufferGoto 6<cr>' , 'Go to Buffer 6'},
    },
    c = {
        name = "Code/LSP",
        a = {':Lspsaga code_action<cr>', 'Code Action'},
        A = {':Lspsaga range_code_action<cr>', 'Selected Action'},
        d = {':Telescope lsp_document_diagnostics<CR>', 'Document diagnostic'},
        D = {':Telescope lsp_workspace_diagnostics<CR>', 'Workspace diagnostic'},
        k = {':Lspsaga diagnostic_jump_prev<cr>', 'Prev Diagnostic'},
        j = {':Lspsaga diagnostic_jump_next<cr>', 'Next Diagnostic'},
        I = {':Lspinfo<CR>', 'Lsp Info'},
	    l = {':Lspsaga lsp_finder<cr>', 'Lsp Finder'},
        L = {':Lspsaga show_line_diagnostics<cr>','Line Diagnostic'},
        p = {':Lspsaga preview_definition<cr>', 'Preview Definition'},
	    r = {':Lspsaga rename<cr>', 'Rename'},
        s = {':Telescope lsp_document_symbols<cr>', 'Document Symbols'},
        S = {':Telescope lsp_dynamic_workspace_symbols<cr>','Workspace Symbols'},
	    o = {':SymbolsOutline<cr>', 'Outline'},
    },
    d = {
        name = "Diagnostics",

    },
    f = {
        name = 'Find',
        f = {':Telescope find_files<cr>'   , 'Files Current Dir' },
        p = {':lua require"telescope".extensions.project.project{}<cr>'   , 'Files Current Dir' },
        r = {':Telescope oldfiles<cr>'     , 'Recent Files' },
        R = {':call RenameFile()<cr>', 'Rename Files' },
        y = {':call CopyFile()<cr>', 'Copy Files' },
        D = {':call delete(expand("%")) | echo "Deleted File" | BufferClose<cr>', 'Delete files' },
        m = {':Telescope media_files<cr>'  , 'Media Files' },
        t = {':Telescope live_grep<cr>'        , 'Grep text' },
        v = {':lua require("qs-telescope").find_neovim()<cr>', 'Tele Neovim Dir' },
        ['.'] = {':lua require("qs-telescope").find_dot()<cr>', 'Tele dot Dir' },
        c = {':lua require("qs-telescope").find_chezdot()<cr>', 'Tele chez dot Dir' },
        x = {':lua require("qs-telescope").find_scripts()<cr>', 'Tele Scripts Dir' },
        s = {':lua require("qs-telescope").find_suck()<cr>', 'Tele suck Dir' },
    },
    g = {
        name = "Git",
	    B = {':Gitsigns blame_line<cr>', 'Blame'},
        b = {':Telescope git_branches<cr>', 'Checkout Branch'},
        c = {':Telescope git_commits<cr>', 'Checkout Commit'},
        C = {':Telescope git_bcommits<cr>', 'Checkout Commit (current line)'},
        ['1'] = {':LazyGit<cr>', 'LazyGit'},
        g = {':LazyGit<cr>', 'LazyGit'},
	    t = {':Gitsigns toggle_signs<cr>', 'Toggle Gutter'},
        j = {':Gitsigns next_hunk<cr>', 'Next Hunk'},
        k = {':Gitsigns prev_hunk<cr>', 'Previous Hunk'},
        r = {':Gitsign reset_hunk<cr>', 'Reset Hunk'},
        R = {':Gitsign reset_buffer<CR>','Reset Buffer'},
        s = {':Telescope git_status<cr>', 'Open Changed file'},
        u = {':Gitsigns undo_stage_hunk<CR>', 'Undo Hunk'},

    },
    t = {
        name = "Toggle",
	    c = {':colorizertoggle<cr>', 'Colorizer'},
	    i = {':IndentBlanklineToggle<cr>', 'Indent Line'},
	    n = {':NvimTreeToggle<cr>', 'Nvim Tree'},
	    u = {':UndotreeToggle<cr>', 'Undo Tree'},
	    z = {
            name = "Zen",
            z = {':ZenMode<cr>', 'Zen'},
            m = {':TZMinimalis<cr>', 'Minimalist'},
            f = {':TZFocus<cr>', 'Focus'},
        },
    },
    w = {
        name = "window",
        r = {'<C-w>r', 'Rotate'},
        R = {'<C-w>R', 'Rotate!'},
        w = {'<C-w>x', 'Swap??'},
        H = {'<C-w>H', 'Left!'},
        J = {'<C-w>J', 'Down!'},
        K = {'<C-w>K', 'Top!'},
        L = {'<C-w>L', 'Right!'},
        ['-'] = { '<C-w>-', 'Dec Height'},
        ['='] = { '<C-w>+', 'Inc Height'},
        ['_'] = { '<C-w>5-', 'Dec Height'},
        ['+'] = { '<C-w>5+', 'Inc Height'},
        [','] = { '<C-w><', 'Dec Width'},
        ['.'] = { '<C-w>>', 'Inc Width'},
        ['<'] = { '<C-w>5<', 'Dec Width'},
        ['>'] = { '<C-w>5>', 'Inc Width'},
        ['0'] = {'<C-w>=', 'Reset Size'},
        ['<TAB>'] = {'<C-w>T','Move to new tab'},
        -- TODO unfortunately the cursor not in the same place when activated
        ['\\'] = {':TZFocus<cr>','Focus'}
    },
	['<TAB>'] = {
		name = '+tab',
		c = {':tabc<cr>','Close'},
		C = {':tabonly<cr>','Close other tabs'},
		n = {':tabnew<cr>','New'},
		l = {':tabn<cr>','Next'},
		h = {':tabp<cr>','Previous'},
	},
    ['?'] = {
        name = "Help",
        t = {':Telescope colorscheme<CR>', 'Load Theme'},
        m = {':Telescope man_pages<cR>','Man Page'},
        [':'] = {':Telescope commands<CR>','List Commands'},
    }


}
-- Commenting
vim.api.nvim_set_keymap('n', "<leader>//", ":CommentToggle<CR>", {noremap=true, silent=true})
-- vim.api.nvim_set_keymap('i', "<leader>/", ":CommentToggle<CR>", {noremap=true})
vim.api.nvim_set_keymap('v', "<leader>//", ":CommentToggle<CR>", {noremap=true, silent=true})

mappings["h"] = "Left"
mappings["j"] = "Bottom"
mappings["k"] = "Up"
mappings["l"] = "Left"
mappings["s"] = "hsplit"
mappings["v"] = "vsplit"
---
mappings["gy"] = "GitLink"
local wk = require("which-key")
wk.register(mappings, opts)
