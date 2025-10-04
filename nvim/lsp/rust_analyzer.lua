return {
  cmd = { 'rustup', 'run', 'stable', 'rust-analyzer' },
  filetypes = { 'rust' },
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = true,
      },
      lens = {
        enable = true,
      },
      checkOnSave = {
        command = 'clippy',
      },
      files = {
        excludeDirs = {
          '.direnv',
          '.git',
          '.github',
          '.gitlab',
          'bin',
          'node_modules',
          'target',
          'venv',
          '.venv',
        },
      },
    },
  },
}
