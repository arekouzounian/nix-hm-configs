{ inputs, ... }:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

  
  programs.nixvim = {
    imports = [
      ./options.nix
      ./plugins
    ];
    enable = true; 
    defaultEditor = true; 
    nixpkgs.useGlobalPackages = true; 

    viAlias = true; 
    vimAlias = true; 

    luaLoader.enable = true;

    plugins = {
      lsp-format = {
        enable = true; 
        lspServersToEnable = "all";
      };
      
      lsp.enable = true;
    };
  };
}
