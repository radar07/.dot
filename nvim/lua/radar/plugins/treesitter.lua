return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "windwp/nvim-ts-autotag",
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "astro",
          "bash",
          "c",
          "cpp",
          "css",
          "dockerfile",
          "go",
          "graphql",
          "haskell",
          "html",
          "javascript",
          "json",
          "llvm",
          "lua",
          "nix",
          "ocaml",
          "ocaml_interface",
          "python",
          "ruby",
          "rust",
          "sql",
          "svelte",
          "templ",
          "toml",
          "tsx",
          "typescript",
          "yaml",
          "zig",
        },
        highlight = { enable = true, additional_vim_regex_highlighting = true },
        indent = { enable = true },
        autotag = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-s>",
            node_incremental = "<C-s>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
        query_linter = {
          enable = true,
          use_virtual_text = true,
          lint_events = { "BufWrite", "CursorHold" },
        },
        vim.filetype.add({
          extension = {
            mdx = "mdx",
          },
        }),
        vim.treesitter.language.register("markdown", "mdx"),
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufEnter" },
    enabled = true,
    opts = { mode = "cursor", max_lines = 3 },
    config = function()
      require("treesitter-context").setup({})
    end,
  },
}
