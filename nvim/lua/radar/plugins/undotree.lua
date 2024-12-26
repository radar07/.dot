return {
  "mbbill/undotree",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- set keymaps
    local opts = { noremap = true, silent = true }
    local keymap = vim.keymap.set

    keymap("n", "<leader>u", ":UndotreeToggle<cr>", opts)
  end,
}
