return {
  cmd = { 'rustup', 'run', 'stable', 'rust-analyzer' },
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
    },
  },
}
