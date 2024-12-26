return {
  "ThePrimeagen/harpoon",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    {
      "<leader>a",
      function()
        local mark = require("harpoon.mark")
        mark.add_file()
      end,
      desc = "Harpoon Add",
    },
    {
      "<leader>h",
      function()
        local ui = require("harpoon.ui")
        ui.toggle_quick_menu()
      end,
      desc = "Harpoon UI",
    },
    {
      "<leader>j",
      function()
        local ui = require("harpoon.ui")
        ui.nav_prev()
      end,
      desc = "Harpoon Prev Mark",
    },
    {
      "<leader>k",
      function()
        local ui = require("harpoon.ui")
        ui.nav_next()
      end,
      desc = "Harpoon Next Mark",
    },
  },
  config = function()
    local ui = require("harpoon.ui")
    for i = 1, 4, 1 do
      vim.keymap.set("n", "<leader>" .. tostring(i), function()
        ui.nav_file(i)
      end, { desc = "Harpoon Navigate " .. tostring(i) })
    end
  end,
}
