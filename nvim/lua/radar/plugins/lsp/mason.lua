return {
  'williamboman/mason.nvim',
  dependencies = {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  config = function()
    local mason = require 'mason'
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

    -- Install LSP servers manually using Mason or ensure they're installed via your system package manager
    -- The following servers are enabled in your core/lsp.lua: clangd, gopls, lua_ls, rust_analyzer, ts_ls, zls

    mason_tool_installer.setup {
      ensure_installed = {
        -- LSP servers (install these manually via Mason UI or ensure they're in your PATH)
        'typescript-language-server', -- ts_ls
        'gopls',
        'rust-analyzer',
        'lua-language-server', -- lua_ls
        'clangd',
        'zls',
        -- Formatters and linters
        'prettier', -- prettier formatter
        'eslint_d', -- js linter
        'isort',
        'black',
        'pylint',
      },
    }
  end,
}
