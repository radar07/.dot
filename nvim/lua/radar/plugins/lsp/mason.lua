return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  config = function()
    local mason = require 'mason'
    local mason_lspconfig = require 'mason-lspconfig'
    local mason_tool_installer = require 'mason-tool-installer'

    mason.setup {
      pip = {
        upgrade_pip = true,
      },
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
      log_level = vim.log.levels.INFO,
      max_concurrent_installers = 4,
    }

    mason_lspconfig.setup {
      ensure_installed = {
        'cssls',
        'html',
        'ts_ls',
        'pyright',
        'jsonls',
        'gopls',
        'rust_analyzer',
        'zls',
      },
      automatic_installation = true, -- not the same as ensure_installed
    }

    mason_tool_installer.setup {
      ensure_installed = {
        'prettier', -- prettier formatter
        'eslint_d', -- js linter
        'isort',
        'black',
        'pylint',
      },
    }
  end,
}
