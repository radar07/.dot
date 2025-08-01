return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      require('rose-pine').setup {
        styles = {
          transparency = true,
        },
      }
      vim.cmd 'colorscheme rose-pine'
    end,
  },
  {
    'folke/tokyonight.nvim',
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('tokyonight').setup {
        style = 'night',
        styles = {
          -- functions = { italic = true },
        },
        transparent = true,
        sidebars = { 'qf', 'vista_kind', 'terminal', 'packer' },
      }
      -- vim.cmd.colorscheme("tokyonight")
    end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('catppuccin').setup {
        transparent_background = true,
        flavour = 'mocha',
        term_colors = false,
        styles = {
          -- keywords = { "italic" },
          -- functions = { "italic" },
        },
        integrations = {
          cmp = true,
          gitsigns = true,
          lsp_trouble = true,
          mason = true,
          native_lsp = {
            enabled = true,
            underlines = {
              errors = { 'undercurl' },
              hints = { 'undercurl' },
              warnings = { 'undercurl' },
              information = { 'undercurl' },
            },
          },
          nvimtree = true,
          harpoon = true,
          telescope = true,
          treesitter = true,
          treesitter_context = true,
          which_key = true,
        },
      }
      -- load the colorscheme here
      -- vim.cmd.colorscheme 'catppuccin'
    end,
  },
}
