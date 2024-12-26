vim.opt.backup = false -- creates a backup file
vim.opt.confirm = true -- confirm to save before exiting a modified buffer
-- vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.cmdheight = 2 -- more space in the neovim command line for displaying messages
vim.opt.colorcolumn = { "80", "120" }
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
-- vim.opt.conceallevel = 1 -- so that `` is visible in markdown files
vim.opt.cursorline = true -- highlights the current line
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
vim.opt.hlsearch = false -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.list = true
vim.opt.listchars = { tab = "→ ", extends = "›", precedes = "‹", nbsp = "␣", trail = "·" }
vim.opt.number = true -- set numbered lines
vim.opt.numberwidth = 4 -- set number column width to 2 {default 4}
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.shiftround = true -- round indent
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })
vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 2 -- always show tabs
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.opt.sidescrolloff = 8
vim.opt.smartcase = true -- smart case
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.spell = false
vim.opt.spelllang = "en_us"
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitkeep = "screen"
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false -- creates a swapfile
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
-- vim.opt.timeoutlen = 1000                    -- time to wait for a mapped sequence to complete (in milliseconds)
-- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- vim.opt.undodir = vim.fn.expand('~/.vim.undodir')
vim.opt.undofile = true -- enable persistent undo
vim.opt.undolevels = 10000
vim.opt.updatetime = 200 -- faster completion (4000ms default)
-- vim.opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.wildmode = "longest:full,full" -- command-line completion mode
vim.opt.wrap = true -- display lines as one long line

vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

vim.cmd("set whichwrap+=<,>,[,],h,l")
