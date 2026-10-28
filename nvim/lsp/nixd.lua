return {
  cmd = { 'nixd' },
  filetypes = { 'nix' },
  root_markers = { 'flake.nix', '.git' },
  settings = {
    nixd = {
      nixpkgs = {
        expr = 'import (builtins.getFlake(toString ./.)).inputs.nixpkgs { }',
      },
      formatting = {
        command = { 'nixfmt' },
      },
      options = {
        nixos = {
          expr = '(builtins.getFlake (toString ./.)).nixosConfigurations.shiro.options',
        },
        home_manager = {
          expr = '(builtins.getFlake (toString ./.)).homeConfigurations.shiro.options',
        },
      },
    },
  },
}
