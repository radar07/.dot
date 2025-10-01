-- Enable LSP
vim.lsp.enable { 'clangd', 'gopls', 'lua_ls', 'rust_analyzer', 'zls' }

vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', { desc = 'Goto Declaration' })
-- vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { desc = 'Goto Definition' })
vim.keymap.set('n', 'K', "<cmd>lua vim.lsp.buf.hover({border = 'rounded'})<CR>", { desc = 'Hover' })
vim.keymap.set('n', 'gri', '<cmd>lua vim.lsp.buf.implementation()<CR>', { desc = 'Goto implementation' })
vim.keymap.set('n', 'grr', '<cmd>lua vim.lsp.buf.references()<CR>', { desc = 'References' })
vim.keymap.set('n', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { desc = 'Signature help' })
vim.keymap.set('n', 'grn', '<cmd>lua vim.lsp.buf.rename()<CR>', { desc = 'Rename' })
vim.keymap.set('n', 'gra', '<cmd>lua vim.lsp.buf.code_action()<CR>', { desc = 'Code action' })
vim.keymap.set('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', { desc = 'Type Definition' })
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { desc = 'Prev Diagnostic' })
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', { desc = 'Next Diagnostic' })
vim.keymap.set('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', { desc = 'Set loclist' })
vim.keymap.set('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder<CR>', { desc = 'Add workspace folder' })
vim.keymap.set(
  'n',
  '<leader>wr',
  '<cmd>lua vim.lsp.buf.remove_workspace_folder<CR>',
  { desc = 'Remove workspace folder' }
)
vim.keymap.set(
  'n',
  '<leader>wl',
  '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders))<CR>',
  { desc = 'List workspace folders' }
)

vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { desc = 'Goto Definition' })

vim.lsp.config('*', {})

local x = vim.diagnostic.severity
vim.diagnostic.config {
  virtual_text = { prefix = '●' },

  -- Use the default configuration
  -- virtual_lines = true,

  -- Alternatively, customize specific options
  virtual_lines = {
    -- Only show virtual line diagnostics for the current cursor line
    -- current_line = true,
  },
  signs = { text = { [x.ERROR] = ' ', [x.WARN] = ' ', [x.HINT] = ' ', [x.INFO] = ' ' } },
  underline = true,
  float = { border = 'rounded' },
}
