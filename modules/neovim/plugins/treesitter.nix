{
  plugins.treesitter = {
    enable = true; 
    nixvimInjections = true; 
    settings = {
      highlight.enable = true; 
      indent.enable = true; 
      autotag.enable = true; 
      folding.enable = true;
      ensure_installed = [
        "bash"
        "c"
        "cpp"
        "markdown"
        "rust"
        "nix"
        "go"
      ];
      autoinstall = true; 
      nixvimInjections = true;
    };
  };
}
