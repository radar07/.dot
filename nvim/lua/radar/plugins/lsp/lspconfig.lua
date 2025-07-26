return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
  },
  opts = {
    diagnostics = {
      underline = true,
      update_in_insert = false,
      virtual_text = {
        spacing = 4,
        source = 'if_many',
        prefix = 'icons',
      },
      severity_sort = true,
    },
  },
  config = function()
    local lspconfig = require 'lspconfig'
    -- local util = require("lspconfig.util")
    local cmp_nvim_lsp = require 'cmp_nvim_lsp'

    local on_attach = function(_, bufnr)
      -- stylua: ignore start
      vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { buffer = bufnr, desc = "Goto Declaration" })
      vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { buffer = bufnr, desc = "Goto Definition" })
      vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover({border = 'rounded'})<CR>", { buffer = bufnr, desc = "Hover" })
      vim.keymap.set( "n", "gri", "<cmd>lua vim.lsp.buf.implementation()<CR>", { buffer = bufnr, desc = "Goto implementation" })
      vim.keymap.set("n", "grr", "<cmd>lua vim.lsp.buf.references()<CR>", { buffer = bufnr, desc = "References" })
      vim.keymap.set( "n", "<C-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { buffer = bufnr, desc = "Signature help" })
      vim.keymap.set("n", "grn", "<cmd>lua vim.lsp.buf.rename()<CR>", { buffer = bufnr, desc = "Rename" })
      vim.keymap.set( "n", "gra", "<cmd>lua vim.lsp.buf.code_action()<CR>", { buffer = bufnr, desc = "Code action" })
      vim.keymap.set( "n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { buffer = bufnr, desc = "Type Definition" })
      vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { buffer = bufnr, desc = "Prev Diagnostic" })
      vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", { buffer = bufnr, desc = "Next Diagnostic" })
      vim.keymap.set("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", { buffer = bufnr, desc = "Set loclist" })
      vim.keymap.set( "n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder<CR>", { buffer = bufnr, desc = "Add workspace folder" })
      vim.keymap.set( "n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder<CR>", { buffer = bufnr, desc = "Remove workspace folder" })
      vim.keymap.set( "n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders))<CR>", { buffer = bufnr, desc = "List workspace folders" })
      -- stylua: ignore end
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    local x = vim.diagnostic.severity
    vim.diagnostic.config {
      virtual_text = { prefix = '●' },
      signs = { text = { [x.ERROR] = ' ', [x.WARN] = ' ', [x.HINT] = ' ', [x.INFO] = ' ' } },
      underline = true,
      float = { border = 'rounded' },
    }

    -- html server
    lspconfig['html'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- css server
    lspconfig['cssls'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- json server
    lspconfig['jsonls'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
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
      on_attach = on_attach,
    }

    -- astro language server
    lspconfig['astro'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- svelte language server
    lspconfig['svelte'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      cmd = { 'svelteserver', '--stdio' },
      filetypes = { 'svelte' },
    }

    -- tailwindcss server
    lspconfig['tailwindcss'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- python server
    lspconfig['pyright'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- c/c++ server
    lspconfig['clangd'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- bash server
    lspconfig['bashls'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- ruby server
    lspconfig['ruby_lsp'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- rust analyzer
    lspconfig['rust_analyzer'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      cmd = { 'rustup', 'run', 'stable', 'rust-analyzer' },
      settings = {
        ['rust-analyzer'] = {
          diagnostics = {
            enable = true,
          },
          lens = {
            enable = true,
          },
          checkOnSave = {
            command = 'clippy',
          },
        },
      },
    }
  end,
}
