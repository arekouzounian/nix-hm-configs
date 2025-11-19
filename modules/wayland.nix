{ pkgs, lib, config, ... }:
let
  # Wallpaper configuration
  wallpaperLoc = "$HOME/Documents/wallpapers/nix-wallpaper-gear.png";

  # Display configuration
  disp1 = "DP-3";
  disp2 = "HDMI-A-5";

  # Resize amount for window resizing
  resizeAmount = "20";
in
{
  # Swaylock screen locking
  programs.swaylock = {
    enable = true;
    settings = {
      color = "808080";
      daemonize = true;
      image = wallpaperLoc;
      font-size = 24;
      indicator-idle-visible = false;
      indicator-caps-lock = true;
      indicator-radius = 100;
      line-color = "ffffff";
      show-failed-attempts = true;
    };
  };

  # Sway window manager
  wayland.windowManager.sway = {
    enable = true;
    # Allow running on GPUs that may not be fully supported
    extraOptions = [ "--unsupported-gpu" ];

    config = rec {
      modifier = "Mod1";
      terminal = "alacritty";
      startup = [
        { command = "swaybg -i ${wallpaperLoc}"; }
      ];

      workspaceOutputAssign = [
        {
          workspace = "1";
          output = disp1;
        }
        {
          workspace = "2";
          output = disp2;
        }
      ];

      fonts = {
        names = [ "UbuntuMono Nerd Font" ];
        style = "Bold";
        size = 11.0;
      };

      gaps = {
        horizontal = 8;
        vertical = 8;
      };

      keybindings =
        let
          modifier = config.wayland.windowManager.sway.config.modifier;
          screenshotDir = "$HOME/screenshots";
          dateFormat = "date \"+%m_%d_%y-%H_%M_%S\"";
        in
        lib.mkOptionDefault {
          "${modifier}+space" = "exec wofi --show=run";
          "${modifier}+b" = "splith";
          "${modifier}+Shift+s" =
            "exec --no-startup-id grim -g \"$(slurp)\" ${screenshotDir}/`${dateFormat}`.png";
        };

      modes = {
        resize = {
          Return = "mode default";
          Escape = "mode default";
          Down = "resize grow height ${resizeAmount} px";
          Left = "resize shrink width ${resizeAmount} px";
          Right = "resize grow width ${resizeAmount} px";
          Up = "resize shrink height ${resizeAmount} px";

          j = "resize grow height ${resizeAmount} px";
          k = "resize shrink height ${resizeAmount} px";
          h = "resize shrink width ${resizeAmount} px";
          l = "resize grow width ${resizeAmount} px";
        };
      };

      # Waybar is used instead of sway's default bar
      bars = [ ];
    };
  };

  # Waybar status bar
  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings = [
      {
        layer = "top";
        position = "top";
        height = 30;

        modules-left = [
          "sway/workspaces"
          "sway/mode"
        ];
        modules-center = [ "clock" ];
        modules-right = [
          "load"
          "memory"
          "pulseaudio"
          "network"
          "tray"
        ];

        "sway/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
        };

        "clock" = {
          format = "{:%a %Y-%m-%d %H:%M}";
        };

        "load" = {
          interval = 10;
          format = "CPU: {load1}";
          max-length = 10;
        };

        "memory" = {
          interval = 30;
          format = "MEM: {}%";
          max-length = 10;
        };

        "pulseaudio" = {
          format = "{volume}% {icon}";
          format-muted = " Muted";
          format-icons = {
            headphone = "";
            default = [
              ""
              ""
            ];
          };
          onclick = "pavucontrol";
        };

        "network" = {
          format-wifi = "{essid} ";
          format-ethernet = "{ifname} ETH";
          format-disconnected = "Disconnected ⚠️";
        };

        "tray" = {
          spacing = 10;
        };
      }
    ];

    style = ''
      * {
        font-family: "UbuntuMono Nerd Font", monospace;
        font-size: 14px;
        padding-left: 5px;
        padding-right: 5px;
      }

      window#waybar {
        background-color: #1e1e2e;
        color: #cdd6f4;
      }

      #workspaces button {
        padding: 0 2px;
        margin: 0 2px;
        border-radius: 6px;
        background: transparent;
        color: #cdd6f4;
      }

      #workspaces button.focused {
        background: #89b4fa;
        color: #1e1e2e;
      }
    '';
  };

  # Wofi application launcher
  programs.wofi = {
    enable = true;
    settings = {
      allow_markup = true;
    };
    style = ''
      window {
        margin: 0px;
        border: 1px solid #7A8478;
        background-color: #1E2326;
      }

      #input {
        margin: 5px;
        border: none;
        color: #D3C6AA;
        background-color: #272E33;
      }

      #inner-box {
        margin: 5px;
        border: none;
        background-color: #1E2326;
      }

      #outer-box {
        margin: 5px;
        border: none;
        background-color: #1E2326;
      }

      #scroll {
        margin: 0px;
        border: none;
      }

      #text {
        margin: 5px;
        border: none;
        color: #D3C6AA;
      }

      #entry:selected {
        background-color: #272E33;
      }
    '';
  };
}
