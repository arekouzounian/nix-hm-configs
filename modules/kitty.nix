{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    enableGitIntegration = true;
    # https://github.com/kovidgoyal/kitty-themes/tree/master/themes
    themeFile = "ANSI-87";

    # Environment variables
    environment = {
    };

    font = {
      name = "Fantasque Sans Mono";
      size = 12;
    };

    shellIntegration = {
      enableBashIntegration = true;
      enableZshIntegration = true;
    };

    # see https://sw.kovidgoyal.net/kitty/conf.html
    settings = {
      backround_image = "~/Documents/wallpapers/papyrus.png";
      allow_remote_control = "yes";
    };

    keybindings = {
      "ctrl+q" = "close_window";
    };

    quickAccessTerminalConfig = {
      background_opacity = 0.85;
      hidden_on_focus_loss = true;
      start_as_hidden = false;
      edge = "top";
      lines = 25;
    };

    extraConfig = "";
  };
}
