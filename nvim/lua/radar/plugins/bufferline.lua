return {
  "akinsho/bufferline.nvim",
  -- version = "*",
  opts = function()
    return {
      options = {
        close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
        right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
        separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
      },
    }
  end,
}
