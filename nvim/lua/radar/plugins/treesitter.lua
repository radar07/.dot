return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'windwp/nvim-ts-autotag',
    },
    config = function()
      local treesitter_config = require 'nvim-treesitter.configs'

      treesitter_config.setup {
        modules = {},

        ensure_installed = {
          'astro',
          'bash',
          'c',
          'cpp',
          'css',
          'dockerfile',
          'go',
          'graphql',
          'haskell',
          'html',
          'javascript',
          'json',
          'llvm',
          'lua',
          'nix',
          'python',
          'ruby',
          'rust',
          'sql',
          'svelte',
          'templ',
          'toml',
          'tsx',
          'typescript',
          'yaml',
          'zig',
        },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = false,

        -- List of parsers to ignore installing (or "all")
        ignore_install = {},

        highlight = { enable = true, additional_vim_regex_highlighting = true },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<C-s>',
            node_incremental = '<C-s>',
            scope_incremental = false,
            node_decremental = '<bs>',
          },
        },
        query_linter = {
          enable = true,
          use_virtual_text = true,
          lint_events = { 'BufWrite', 'CursorHold' },
        },
        vim.filetype.add {
          extension = {
            mdx = 'mdx',
          },
        },
        vim.treesitter.language.register('markdown', 'mdx'),
      }

      local parser_config = require('nvim-treesitter.parsers').get_parser_configs()

      parser_config.ziggy = {
        install_info = {
          url = '~/Code/ziggy', -- local path or git repo
          includes = { 'tree-sitter-ziggy/src' },
          files = { 'tree-sitter-ziggy/src/parser.c' }, -- note that some parsers also require src/scanner.c or src/scanner.cc
          -- optional entries:
          branch = 'main', -- default branch in case of git repo if different from master
          generate_requires_npm = false, -- if stand-alone parser without npm dependencies
          requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
        },
        filetype = 'ziggy',
      }

      parser_config.ziggy_schema = {
        install_info = {
          url = '~/Code/ziggy',
          files = { 'tree-sitter-ziggy-schema/src/parser.c' },
          branch = 'main',
          generate_requires_npm = false,
          requires_generate_from_grammar = false,
        },
        filetype = 'ziggy-schema',
      }

      parser_config.supermd = {
        install_info = {
          url = '~/Code/supermd',
          includes = { 'tree-sitter/supermd/src' },
          files = {
            'tree-sitter/supermd/src/parser.c',
            'tree-sitter/supermd/src/scanner.c',
          },
          branch = 'main',
          generate_requires_npm = false,
          requires_generate_from_grammar = false,
        },
        filetype = 'supermd',
      }

      parser_config.supermd_inline = {
        install_info = {
          url = '~/Code/supermd',
          includes = { 'tree-sitter/supermd-inline/src' },
          files = {
            'tree-sitter/supermd-inline/src/parser.c',
            'tree-sitter/supermd-inline/src/scanner.c',
          },
          branch = 'main',
          generate_requires_npm = false,
          requires_generate_from_grammar = false,
        },
        filetype = 'supermd_inline',
      }

      parser_config.superhtml = {
        install_info = {
          url = '~/Code/superhtml',
          includes = { 'tree-sitter-superhtml/src' },
          files = {
            'tree-sitter-superhtml/src/parser.c',
            'tree-sitter-superhtml/src/scanner.c',
          },
          branch = 'main',
          generate_requires_npm = false,
          requires_generate_from_grammar = false,
        },
        filetype = 'superhtml',
      }

      vim.filetype.add {
        extension = {
          smd = 'supermd',
          shtml = 'superhtml',
          ziggy = 'ziggy',
          ['ziggy-schema'] = 'ziggy_schema',
        },
      }

      vim.filetype.add {
        extension = {
          ziggy = 'ziggy',
          ['ziggy-schema'] = 'ziggy_schema',
        },
      }
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    event = { 'BufEnter' },
    enabled = true,
    opts = { mode = 'cursor', max_lines = 3 },
    config = function()
      require('treesitter-context').setup {}
    end,
  },
}
