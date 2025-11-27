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

    shellIntegration = {
      enableBashIntegration = true;
      enableZshIntegration = true;
    };

    # see https://sw.kovidgoyal.net/kitty/conf.html
    settings = {
    };

    keybindings = {
    };

    extraConfig = '''';
  };
}
