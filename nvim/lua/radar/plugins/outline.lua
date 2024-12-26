return {
  "hedyhli/outline.nvim",
  config = function()
    -- vim.keymap.set("n", "<leader>o", "<cmd>Outline<cr>", { desc = "Toggle Outline" })
    require("outline").setup({})
  end,
  keys = {
    { "<leader>o", "<cmd>Outline<cr>", desc = "Toggle Outline" },
  },
}
