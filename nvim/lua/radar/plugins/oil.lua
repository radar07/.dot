return {
  "stevearc/oil.nvim",
  keys = {
    { "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
  },
  config = function()
    require("oil").setup({
      default_file_explorer = true,
      win_options = {
        wrap = false,
        signcolumn = "no",
        cursorcolumn = false,
        foldcolumn = "0",
        spell = false,
        list = false,
        conceallevel = 3,
        concealcursor = "nvic",
      },
    })

    vim.keymap.set("n", "<space>-", require("oil").toggle_float)
  end,
}
