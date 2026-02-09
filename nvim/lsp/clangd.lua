return {
  cmd = {
    'clangd',
    '--query-driver=/run/current-system/sw/bin/g++',
  },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
}
