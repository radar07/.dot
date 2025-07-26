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

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method 'textDocument/completion' then
      vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
      vim.keymap.set('i', '<C-Space>', function()
        vim.lsp.completion.get()
      end)
    end
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
