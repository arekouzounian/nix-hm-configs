{ pkgs, lib, imports, ... }:
{
  # copied this config structure from: 
  # https://github.com/LudovicDeMatteis/.dotfiles/blob/master/modules/neovim/default.nix
  imports = [
    ./neovim
  ];
}
