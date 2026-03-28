return {
  settings = {
    pyright = {
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        typeCheckingMode = 'strict', -- or "basic"
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      },
    },
  },
}
