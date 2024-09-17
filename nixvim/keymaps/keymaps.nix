let
  remaps = import ./keys_remaps.nix;
  lspMaps = import ./lsp_keymaps.nix;
  pluginsMaps = import ./plugins_keymaps.nix;
in
  remaps ++ lspMaps ++ pluginsMaps
