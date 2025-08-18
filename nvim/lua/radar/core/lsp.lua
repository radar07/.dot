-- Enable LSP
vim.lsp.enable { 'clangd', 'gopls', 'lua_ls', 'rust_analyzer', 'zls' }

vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { buffer = bufnr, desc = 'Goto Definition' })

vim.diagnostic.config {
  -- Use the default configuration
  -- virtual_lines = true,

  -- Alternatively, customize specific options
  virtual_lines = {
    -- Only show virtual line diagnostics for the current cursor line
    -- current_line = true,
  },
}
