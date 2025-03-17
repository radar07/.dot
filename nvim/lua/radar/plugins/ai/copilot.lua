return {
  "github/copilot.vim",
  event = "InsertEnter",
  lazy = false,
  autoStart = true,
  config = function()
    vim.g.copilot_assume_mapped = true
    vim.api.nvim_set_keymap("i", "<M-Space>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
    vim.g.copilot_no_tab_map = true
  end,
}
