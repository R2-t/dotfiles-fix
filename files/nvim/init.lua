-- Essentials
vim.g.mapleader = " "
vim.g.python3_host_skip_check = 1
vim.g.bulitin_lsp = true

require("ag") -- load my lua configs

-- Behaviors
vim.opt.belloff = "all" -- NO BELLS!
vim.opt.completeopt = {"menu", "menuone", "noselect"} -- ins-completion how vsnip likes it
vim.opt.swapfile = false -- no swap files
vim.opt.inccommand = "split" -- preview %s commands in a split window as I type
vim.opt.hidden = true -- move away from unsaved buffers
vim.opt.updatetime = 100 -- stop typing quickly
vim.opt.undofile = true -- keep track of my 'undo's between sessions
vim.opt.grepprg = "rg --vimgrep --smart-case --no-heading" -- search with rg
vim.opt.grepformat = "%f:%l:%c:%m" -- filename:line number:column number:error message
vim.opt.mouse = "n" -- use mouse to scroll around in normal mode (hold shift to disable)

-- Indentation
vim.opt.autoindent = true -- continue indentation to new line
vim.opt.smartindent = true -- add extra indent when it makes sense
vim.opt.smarttab = true -- <Tab> at the start of a line behaves as expected
vim.opt.expandtab = true -- <Tab> inserts spaces
vim.opt.shiftwidth = 4 -- >>, << shift line by 4 spaces
vim.opt.tabstop = 4 -- <Tab> appears as 4 spaces
vim.opt.softtabstop = 4 -- <Tab> behaves as 4 spaces when editing

-- Colors
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.cmd "colorscheme dark_catppuccino"
vim.cmd "let base16colorspace=256"

-- Look and feel
vim.opt.number = true -- absolute numbers...
vim.opt.relativenumber = true -- but only on the current line
vim.opt.cursorline = false -- don't highlight current line
vim.opt.list = true -- show list chars
vim.opt.listchars = {
    -- these list chars
    tab = "»·",
    nbsp = "␣",
    extends = "…",
    precedes = "…",
    trail = "·"
}
vim.opt.scrolloff = 10 -- padding between cursor and top/bottom of window
vim.opt.foldmethod = "expr" -- use function to determine folds
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- use treesitter for folding
vim.opt.foldlevel = 0 -- allow folding the whole way down
vim.opt.foldlevelstart = 99 -- open files with all folds open
vim.opt.splitright = true -- prefer vsplitting to the right
vim.opt.splitbelow = true -- prefer splitting below
vim.opt.wrap = false -- don't wrap my text
vim.opt.textwidth = 120 -- wrap here for comments
vim.g.python_recommended_style = 0 -- I know how I like my python

-- Searching
vim.opt.wildmenu = true -- tab complete on command line
vim.opt.ignorecase = true -- case insensitive search...
vim.opt.smartcase = true -- unless I use caps
vim.opt.hlsearch = true -- highlight matching text
vim.opt.incsearch = true -- update results while I type
