{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    disableConfirmationPrompt = true;

    extraConfig = ''
      set -g default-terminal "tmux-256color"
      set -g status-bg "purple"
      set -as terminal-features ",*:RGB"
    '';
  };
}
