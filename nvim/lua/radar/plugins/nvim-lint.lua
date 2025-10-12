return {
  'mfussenegger/nvim-lint',
  event = { 'BufWritePost', 'BufReadPost', 'InsertLeave' },
  config = function()
    local lint = require 'lint'

    lint.linters_by_ft = {
      javascript = { 'eslint_d', 'eslint' },
      typescript = { 'eslint_d' },
      javascriptreact = { 'eslint_d' },
      typescriptreact = { 'eslint_d' },
      astro = { 'eslint_d' },
      python = { 'pylint' },
    }

    local eslint = lint.linters.eslint_d

    eslint.args = {
      '--no-warn-ignored', -- <-- this is the key argument
      '--format',
      'json',
      '--stdin',
      '--stdin-filename',
      function()
        return vim.api.nvim_buf_get_name(0)
      end,
    }

    lint.linters.eslint_d = require('lint.util').wrap(lint.linters.eslint_d, function(diagnostic)
      -- try to ignore "No ESLint configuration found" error
      -- if diagnostic.message:find("Error: No ESLint configuration found") then -- old version
      -- update: 20240814, following is working
      if diagnostic.message:find 'Error: Could not find config file' then
        return nil
      end
      return diagnostic
    end)

    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set('n', '<leader><leader>l', function()
      lint.try_lint()
    end, { desc = 'Try Lint' })
  end,
}
