# User-specific configuration
# This file contains settings that users should customize for their own setup
{
  # User information
  user = {
    name = "arek";
    homeDirectory = "/home/arek";
  };

  # Display configuration (for Sway)
  displays = {
    primary = "DP-3";
    secondary = "HDMI-A-5";
  };

  # Paths
  paths = {
    wallpaper = "$HOME/Documents/wallpapers/nix-wallpaper-gear.png";
    screenshots = "$HOME/screenshots";
  };

  # Sway window manager settings
  sway = {
    # Modifier key: "Mod1" = Alt, "Mod4" = Super/Windows key
    modKey = "Mod1";
    resizeAmount = "20";
  };
}
