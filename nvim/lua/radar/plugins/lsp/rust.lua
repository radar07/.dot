return {
  {
    -- "mrcjkb/rustaceanvim",
    -- version = "^5", -- Recommended
    -- lazy = false, -- This plugin is already lazy
  },
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    config = function()
      require("crates").setup()

      local crates = require("crates")
      local keymap = vim.keymap.set

      keymap("n", "<leader>ct", crates.toggle, { desc = "Crates - Toggle UI" })
      keymap("n", "<leader>cr", crates.reload, { desc = "Crates - Reload" })

      keymap("n", "<leader>cv", crates.show_versions_popup, { desc = "Crates - Show versions" })
      keymap("n", "<leader>cf", crates.show_features_popup, { desc = "Crates - Show features" })
      keymap("n", "<leader>cd", crates.show_dependencies_popup, { desc = "Crates - Show dependencies" })

      keymap("n", "<leader>cu", crates.update_crate, { desc = "Crates - Update" })
      keymap("v", "<leader>cu", crates.update_crates, { desc = "Crates - Update" })
      keymap("n", "<leader>ca", crates.update_all_crates, { desc = "Crates - Update all" })
      keymap("n", "<leader>cU", crates.upgrade_crate, { desc = "Crates - Upgrade" })
      keymap("v", "<leader>cU", crates.upgrade_crates, { desc = "Crates - Upgrade" })
      keymap("n", "<leader>cA", crates.upgrade_all_crates, { desc = "Crates - Upgrade all" })

      keymap("n", "<leader>cx", crates.expand_plain_crate_to_inline_table, {})
      keymap("n", "<leader>cX", crates.extract_crate_into_table, {})

      keymap("n", "<leader>cH", crates.open_homepage, { desc = "Crates - Open homepage" })
      keymap("n", "<leader>cR", crates.open_repository, { desc = "Crates - Open repo" })
      keymap("n", "<leader>cD", crates.open_documentation, { desc = "Crates - Open documentation" })
      keymap("n", "<leader>cC", crates.open_crates_io, { desc = "Crates - Open crates.io" })
    end,
  },
}
