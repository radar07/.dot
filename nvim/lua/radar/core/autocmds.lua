local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlighted yank
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
  group = yank_group,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank {
      higroup = 'IncSearch',
      timeout = 75,
    }
  end,
})

-- Wrap and Spell check for text files
autocmd('FileType', {
  group = augroup('wrap_spell', {}),
  pattern = { 'gitcommit', 'markdown' },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- start insert in terminal
autocmd('TermOpen', {
  group = augroup('custom_buffer', { clear = true }),
  pattern = '*',
  command = 'startinsert | set winfixheight',
})

-- set italic diagnostic virtual text
autocmd('LspAttach', {
  pattern = '*',
  callback = function()
    vim.cmd [[highlight DiagnosticVirtualTextHint cterm=italic gui=italic]]
    vim.cmd [[highlight DiagnosticVirtualTextInfo cterm=italic gui=italic]]
    vim.cmd [[highlight DiagnosticVirtualTextWarn cterm=italic gui=italic]]
    vim.cmd [[highlight DiagnosticVirtualTextError cterm=italic gui=italic]]
  end,
})

autocmd('FileType', {
  group = augroup('ziggy', {}),
  pattern = 'ziggy',
  callback = function()
    vim.lsp.start {
      name = 'Ziggy LSP',
      cmd = { 'ziggy', 'lsp' },
      root_dir = vim.fs.dirname(vim.fs.find({ '.git' }, { upward = true })[1]),
      -- flags = { exit_timeout = 1000 },
    }
  end,
})

autocmd('FileType', {
  group = augroup('ziggy_schema', {}),
  pattern = 'ziggy_schema',
  callback = function()
    vim.lsp.start {
      name = 'Ziggy LSP',
      cmd = { 'ziggy', 'lsp', '--schema' },
      root_dir = vim.fs.dirname(vim.fs.find({ '.git' }, { upward = true })[1]),
      -- flags = { exit_timeout = 1000 },
    }
  end,
})

autocmd('FileType', {
  group = augroup('superhtml', {}),
  pattern = 'superhtml',
  callback = function()
    vim.lsp.start {
      name = 'SuperHTML LSP',
      cmd = { 'superhtml', 'lsp' },
      root_dir = vim.fs.dirname(vim.fs.find({ '.git' }, { upward = true })[1]),
      -- flags = { exit_timeout = 1000 },
    }
  end,
})
