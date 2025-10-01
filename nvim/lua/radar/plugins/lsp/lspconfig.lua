return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
  },
  config = function()
    local lspconfig = require 'lspconfig'
    -- local util = require("lspconfig.util")
    local cmp_nvim_lsp = require 'cmp_nvim_lsp'

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- html server
    lspconfig['html'].setup {
      capabilities = capabilities,
    }

    -- css server
    lspconfig['cssls'].setup {
      capabilities = capabilities,
    }

    -- json server
    lspconfig['jsonls'].setup {
      capabilities = capabilities,
      filetypes = { 'json', 'jsonc' },
      settings = {
        json = {
          -- Schemas https://www.schemastore.org
          schemas = {
            {
              fileMatch = { 'package.json' },
              url = 'https://json.schemastore.org/package.json',
            },
            {
              fileMatch = { 'tsconfig*.json' },
              url = 'https://json.schemastore.org/tsconfig.json',
            },
            {
              fileMatch = {
                '.prettierrc',
                '.prettierrc.json',
                'prettier.config.json',
              },
              url = 'https://json.schemastore.org/prettierrc.json',
            },
            {
              fileMatch = { '.eslintrc', '.eslintrc.json' },
              url = 'https://json.schemastore.org/eslintrc.json',
            },
            {
              fileMatch = { '.babelrc', '.babelrc.json', 'babel.config.json' },
              url = 'https://json.schemastore.org/babelrc.json',
            },
            {
              fileMatch = { 'lerna.json' },
              url = 'https://json.schemastore.org/lerna.json',
            },
            {
              fileMatch = { 'now.json', 'vercel.json' },
              url = 'https://json.schemastore.org/now.json',
            },
            {
              fileMatch = {
                '.stylelintrc',
                '.stylelintrc.json',
                'stylelint.config.json',
              },
              url = 'http://json.schemastore.org/stylelintrc.json',
            },
          },
        },
      },
    }

    -- typescript server
    lspconfig['ts_ls'].setup {
      capabilities = capabilities,
    }

    -- svelte language server
    lspconfig['svelte'].setup {
      capabilities = capabilities,
      cmd = { 'svelteserver', '--stdio' },
      filetypes = { 'svelte' },
    }

    -- python server
    lspconfig['pyright'].setup {
      capabilities = capabilities,
    }
  end,
}
