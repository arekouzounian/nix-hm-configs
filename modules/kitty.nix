{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    enableGitIntegration = true;
    # https://github.com/kovidgoyal/kitty-themes/tree/master/themes
    themeFile = "gruvbox-dark-soft";

    # Environment variables
    environment = {
    };

    font = {
      name = "Fantasque Sans Mono";
      size = 14;
    };

    shellIntegration = {
      enableBashIntegration = true;
      enableZshIntegration = true;
    };

    # see https://sw.kovidgoyal.net/kitty/conf.html
    settings = {
    };

    keybindings = {
    };

    quickAccessTerminalConfig = {
      background_opacity = 0.85;
      hidden_on_focus_loss = false;
      start_as_hidden = false;
      edge = "top";
      lines = 25;
    };

    extraConfig = '''';
  };
}
