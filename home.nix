{
  config,
  pkgs,
  lib,
  ...
}:
let
  userConfig = import ./config.nix;
in
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = userConfig.user.name;
  home.homeDirectory = userConfig.user.homeDirectory;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;

  # Install packages that should be available in the user environment
  home.packages = [
    pkgs.nerd-fonts.ubuntu-mono
    pkgs.optifine
    pkgs.prismlauncher
  ];

  # Manage dotfiles - currently none configured
  # Example: home.file.".screenrc".source = ./dotfiles/screenrc;
  home.file = { };

  # Environment variables
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Import modular configurations
  imports = [
    ./modules
  ];

  # GTK and cursor theme
  gtk.enable = true;
  home.pointerCursor =
    let
      getFrom = url: hash: name: {
        gtk.enable = true;
        x11.enable = true;
        name = name;
        size = 48;
        package = pkgs.runCommand "moveUp" { } ''
          mkdir -p $out/share/icons
          ln -s ${
            fetchTarball {
              url = url;
              sha256 = hash;
            }
          } $out/share/icons/${name}
        '';
      };
    in
    getFrom "https://github.com/ful1e5/Bibata_Cursor/releases/download/v2.0.7/Bibata-Modern-Ice.tar.xz"
      "01acywlhs45hisa16ydmyq5r8zr49f7rnf6smz6k3x6avm0wsvs8"
      "Bibata-Modern-Ice";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
