{ pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      general = {
        working_directory = "$HOME";
        live_config_reload = true;
      };

      window = {
        opacity = 0.9;
        blur = true;
        title = "sudocomprehensible";
        padding.x = 10;
        padding.y = 10;
        dynamic_padding = true;
      };

      font = {
        size = 12;

        normal = {
          family = "UbuntuMono Nerd Font";
          style = "Regular";
        };

        bold = {
          family = "UbuntuMono Nerd Font";
          style = "Bold";
        };

        italic = {
          family = "UbuntuMono Nerd Font";
          style = "Italic";
        };

        bold_italic = {
          family = "UbuntuMono Nerd Font";
          style = "Bold Italic";
        };
      };

      keyboard.bindings = [
        {
          key = "n";
          mods = "Control";
          action = "CreateNewWindow";
        }
        {
          key = "Enter";
          mods = "Control";
          action = "ToggleFullscreen";
        }
        {
          key = "q";
          mods = "Control";
          action = "Quit";
        }
      ];

      colors.primary.foreground = "#0bd092";
    };
  };
}
