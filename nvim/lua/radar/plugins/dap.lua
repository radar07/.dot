return {
  "mfussenegger/nvim-dap",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "rcarriga/nvim-dap-ui",
      opts = {},
      config = function(_, opts)
        local dap = require("dap")
        local dapui = require("dapui")
        dapui.setup(opts)
        dap.listeners.after.event_initialized["dapui_config"] = function()
          dapui.open({})
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
          dapui.close({})
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
          dapui.close({})
        end
      end,
    },
    {
      "nvim-neotest/nvim-nio",
    },
    {
      "theHamsta/nvim-dap-virtual-text",
      opts = {},
      config = function() end,
    },
  },
  keys = {
    {
      "<leader>dB",
      function()
        require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end,
      desc = "Breakpoint condition",
    },
    {
      "<leader>db",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Toggle Breakpoint",
    },
    {
      "<leader>dc",
      function()
        require("dap").continue()
      end,
      desc = "Continue",
    },
    -- { "<leader>da", function() require("dap").continue({ before = get_args }) end, }, -- get_args function is used from LazyVim to get the arguments
    -- { "<leader>dC", function() require("dap").run_to_cursor() end, },
    -- { "<leader>dg", function() require("dap").goto_() end, },
    -- { "<leader>dj", function() require("dap").down() end, },
    -- { "<leader>dk", function() require("dap").up() end, },
    {
      "<leader>dl",
      function()
        require("dap").run_last()
      end,
      desc = "Run Last",
    },
    {
      "<leader>dO",
      function()
        require("dap").step_over()
      end,
      desc = "Step Over",
    },
    {
      "<leader>do",
      function()
        require("dap").step_out()
      end,
      desc = "Step Out",
    },
    {
      "<leader>di",
      function()
        require("dap").step_into()
      end,
      desc = "Step Into",
    },
    {
      "<leader>dr",
      function()
        require("dap").repl.toggle()
      end,
      desc = "Toggle REPL",
    },
    {
      "<leader>dt",
      function()
        require("dap").terminate()
      end,
      desc = "Terminate",
    },
    -- { "<leader>dp", function() require("dap").pause() end, },
    -- { "<leader>ds", function() require("dap").session() end, },
    -- { "<leader>dw", function() require("dap.ui.widgets").hover() end, },
    {
      "<leader>du",
      function()
        require("dapui").toggle({})
      end,
      desc = "Dap UI",
    },
    {
      "<leader>de",
      function()
        require("dapui").eval()
      end,
      mode = { "n", "v" },
      desc = "Eval",
    },
  },
  config = function()
    -- Golang
    local dap = require("dap")
    dap.adapters.delve = {
      type = "server",
      port = "${port}",
      executable = {
        command = "dlv",
        args = { "dap", "-l", "127.0.0.1:${port}" },
      },
      {
        type = "delve",
        name = "Debug test", -- configuration for debugging test files
        request = "launch",
        mode = "test",
        program = "${file}",
      },
    }

    dap.configurations.go = {
      {
        type = "delve",
        name = "Debug",
        request = "launch",
        showLog = false,
        program = "${file}",
        --[[ dlvToolPath = vim.fn.exepath('~/go/bin/dlv') -- Adjust to where delve is installed ]]
      },
    }

    -- Rust
    -- dap.adapters.codelldb = {
    --   type = "server",
    --   port = "${port}",
    --   executable = {
    --     command = os.getenv("HOME") .. "/builds/extension/adapter/codelldb",
    --     args = { "--port", "${port}" },
    --   },
    -- }

    -- dap.configurations.rust = {
    --   {
    --     name = "Launch file",
    --     type = "codelldb",
    --     request = "launch",
    --     program = function()
    --       return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
    --     end,
    --     cwd = "${workspaceFolder}",
    --     stopOnEntry = false,
    --   },
    -- }

    -- dap.configurations.cpp = {
    --   {
    --     name = "Launch file",
    --     type = "codelldb",
    --     request = "launch",
    --     program = function()
    --       return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    --     end,
    --     cwd = "${workspaceFolder}",
    --     stopOnEntry = false,
    --     runInTerminal = true,
    --   },
    -- }
  end,
}
