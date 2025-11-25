{
  plugins = {
    lsp-format = {
      enable = true;
      lspServersToEnable = "all";
    };

    lsp-lines = {
      enable = true;
      autoLoad = true;
    };

    lsp = {
      enable = true;
      inlayHints = true;

      servers = {
        clangd.enable = true;
        rust_analyzer = {
          enable = true;
          installCargo = true;
          installRustc = true;
        };
      };
    };
  };
}
