return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    {
      "<leader>cF",
      function()
        require("conform").format({ formatters = { "injected" } })
      end,
      mode = { "n", "v" },
      desc = "Format (injected)",
    },
    {
      "<leader>cf",
      function()
        require("conform").format({ lsp_fallback = true, async = true })
      end,
      mode = { "n", "v" },
      desc = "Format (LSP)",
    },
  },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        -- vue = { "prettier" },
        svelte = { "prettier" },
        astro = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        -- scss = { "prettier" },
        json = { "prettier" },
        -- jsonc = { "prettier" },
        yaml = { "prettier" },
        -- graphql = { "prettier" },
        -- markdown = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
      },

      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      },
    })
  end,
}
