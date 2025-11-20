{ pkgs, ... }:
{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      # Misc.
      ll = "ls -lah";

      # Nix
      ccnix = "sudo $EDITOR /etc/nixos/configuration.nix";
      cchome = "$EDITOR $HOME/.config/home-manager/home.nix";
      bflake = "sudo nixos-rebuild switch --flake /etc/nixos#nixos-tower";
      bhome = "home-manager switch && source ~/.bashrc";

      # git
      gst = "git status";
      gcm = "git commit -m ";
      gd = "git diff";

      # suspend & go to swaylock
      powernap = "swaylock && systemctl suspend";
    };
    profileExtra = ''
      [ "$(tty)" = "/dev/tty1" ] && exec sway --unsupported-gpu
    '';
    bashrcExtra = ''
      cd() {
        builtin cd "$@" && ls
      }

      duck() {
        dir="."
        if [ $# -gt 0 ]; then
          dir=$1
        fi

        du -hac "$dir" 2>/dev/null | tail -n 1
      }

      quack() {
        # get all directories
        mapfile -t dirs < <(find . -maxdepth 1 -type d)
        longest=0
        for dir in "''${dirs[@]}"; do
          if [ $longest -le ''${#dir} ]; then
            longest=''${#dir}
          fi
        done

        # min. number of spaces to populate
        offset=4

        for dir in "''${dirs[@]}"; do
          printf "$dir";
          printf "%*s" $((offset + longest - ''${#dir})) "";
          duck "$dir"
        done
      }
    '';
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;

    settings = {
      format = ''
        ┌─$time $username@$hostname $python $git_branch $git_status
        ├┤$directory│$nix_shell ($cmd_duration)
        └\$> '';
      command_timeout = 750;

      time = {
        disabled = false;
        format = "[$time]($style)";
        style = "underline bold yellow";
      };

      python = {
        format = "[(\($virtualenv\))]($style)";
        style = "bold yellow";
      };

      nix_shell = {
        disabled = false;
        format = " \([$symbol$state(\($name\))]($style)\)";
        style = "bold blue";
      };

      username = {
        show_always = true;
        style_user = "bold";
        format = "[$user]($style)";
      };

      hostname = {
        ssh_only = false;
        format = "[$ssh_symbol$hostname]($style)";
        style = "bold italic cyan";
      };

      directory = {
        format = "[$path]($style)[$read_only]($read_only_style)";
        style = "bold blue";
        truncation_symbol = "🐙 ";
      };

      cmd_duration = {
        format = "took [$duration]($style)";
        style = "underline bold green";
      };

      git_metrics = {
        disabled = false;
      };
    };
  };
}
