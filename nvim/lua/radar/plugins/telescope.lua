return {
  "nvim-telescope/telescope.nvim",
  lazy = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    local trouble = require("trouble.sources.telescope")

    telescope.setup({
      defaults = {
        prompt_prefix = "  ",
        selection_caret = "  ",
        layout_config = { prompt_position = "top" },
        layout_strategy = "horizontal",
        sorting_strategy = "ascending",
        path_display = { "smart" },
        file_ignore_patterns = { ".git/", "node_modules/" },
        mappings = {
          i = {
            ["<Esc>"] = actions.close,
            ["<C-Down>"] = actions.cycle_history_next,
            ["<C-Up>"] = actions.cycle_history_prev,
            ["<C-f>"] = actions.preview_scrolling_down,
            ["<C-b>"] = actions.preview_scrolling_up,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<C-t>"] = trouble.open,
          },
          n = {
            ["<C-t>"] = trouble.open,
          },
        },
      },
    })

    -- telescope.load_extension("fzf")
  end,
  keys = {
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
    {
      "<leader>fR",
      function()
        local builtin = require("telescope.builtin")
        builtin.oldfiles({
          cwd = vim.fn.getcwd(),
        })
      end,
      desc = "Recent (cwd)",
    },
    {
      "<leader>df",
      function()
        local builtin = require("telescope.builtin")
        builtin.find_files({
          prompt_title = "< Dotfiles >",
          cwd = "$HOME/.dot/",
          hidden = true,
        })
      end,
      desc = "Dotfiles",
    },
    {
      "<leader>ff",
      function()
        local builtin = require("telescope.builtin")
        builtin.find_files({
          prompt_title = "< Project files >",
          cwd = "",
          hidden = true,
        })
      end,
      desc = "Find files",
    },
    {
      "<leader>fg",
      function()
        local builtin = require("telescope.builtin")
        builtin.git_files({
          prompt_title = "< Git files >",
          hidden = true,
        })
      end,
      desc = "Git files",
    },
    { "<leader>fb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
    { "<leader>/", "<cmd>Telescope live_grep<cr>" },

    { '<leader>s"', "<cmd>Telescope registers<cr>", desc = "Registers" },
    { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Autocommands" },
    { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Autocommands" },
    { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
    { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
    { "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document diagnostics" },
    { "<leader>sD", "<cmd>Telescope diagnostics<cr>", desc = "Workspace diagnostics" },
    { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help pages" },
    { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
    { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
    { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Marks" },
    { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man pages" },
    { "<leader>ss", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Goto symbol" },
    { "<leader>sS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Goto symbol (Workspace)" },

    { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git status" },
    { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Git commits" },
    { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Git branches" },

    {
      "<leader>sw",
      function()
        local builtin = require("telescope.builtin")
        builtin.grep_string({
          cwd = vim.fn.getcwd(),
        })
      end,
      desc = "Search word",
    },
    {
      "<leader>sW",
      function()
        local builtin = require("telescope.builtin")
        builtin.grep_string({
          word = "-w",
        })
      end,
      desc = "Search word (exact)",
    },
  },
}
