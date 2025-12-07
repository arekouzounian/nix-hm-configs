{
  description = "Home Manager configuration for declarative dotfile management";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    # Home Manager for dotfile management
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nixvim for Neovim configuration in Nix
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ nixpkgs, home-manager, ... }:
    let
      # Default system architecture
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      # Home Manager configuration for user "arek"
      homeConfigurations."arek" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Main configuration entry point
        modules = [ ./home.nix ];

        # Pass flake inputs to modules
        extraSpecialArgs = { inherit inputs; };
      };

      # Formatter for 'nix fmt'
      formatter.${system} = pkgs.nixpkgs-fmt;
    };
}
