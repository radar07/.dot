local opts = { silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set

keymap("", "<Space>", "<Nop>", opts)

-- Disable arrow keys
keymap("n", "<Up>", "<Nop>", opts)
keymap("n", "<Down>", "<Nop>", opts)
keymap("n", "<Left>", "<Nop>", opts)
keymap("n", "<Right>", "<Nop>", opts)

-- Resize with arrow keys
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Copying to clipboard
keymap("n", "<leader>y", '"+y', opts)
keymap("v", "<leader>y", '"+y', opts)
keymap("n", "<leader>Y", 'gg"+yG', opts)

-- Keep the cursor centered
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "mzJ`z", opts)

-- Buffer navigation
keymap("n", "<S-h>", "<cmd>bprevious<cr>")
keymap("n", "<S-l>", "<cmd>bnext<cr>")
keymap("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other buffer" })
keymap("n", "<leader>bd", "<cmd>bdelete!<cr>", { desc = "Delete buffer" })

-- Better window navigation
keymap("n", "<C-H>", "<C-w>h", opts)
keymap("n", "<C-J>", "<C-w>j", opts)
keymap("n", "<C-K>", "<C-w>k", opts)
keymap("n", "<C-L>", "<C-w>l", opts)

-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Undo break points
keymap("i", ",", ",<c-g>u", opts)
keymap("i", ".", ".<c-g>u", opts)
keymap("i", ";", ";<c-g>u", opts)
keymap("i", "!", "!<c-g>u", opts)
keymap("i", "?", "?<c-g>u", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
keymap("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next search result" })
keymap("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
keymap("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
keymap("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev search result" })
keymap("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
keymap("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- Move text up and down
keymap("n", "<A-j>", "<cmd>m .+1<cr>==")
keymap("n", "<A-k>", "<cmd>m .-2<cr>==")
keymap("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi")
keymap("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi")
keymap("v", "<A-j>", ":m '>+1<cr>gv=gv")
keymap("v", "<A-k>", ":m '<-2<cr>gv=gv")

keymap("v", "<leader>d", '"_d', opts)
keymap("x", "<leader>p", '"_dP', opts)

-- Better terminal navigation
keymap("t", "jk", "<C-\\><C-n>", term_opts)
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

keymap("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
keymap("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })

-- Navigation through Quick fix list
keymap("n", "[q", ":cprev<CR>", opts)
keymap("n", "]q", ":cnext<CR>", opts)

-- Lazy
keymap("n", "<leader>l", ":Lazy<CR>", opts)

keymap("n", "gw", "*N")
keymap("x", "gw", "*N")
