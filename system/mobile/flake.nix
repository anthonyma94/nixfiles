{
  description = "Advanced example of Nix-on-Droid system config with home-manager.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = { self, nixpkgs, home-manager, nix-on-droid }: 
  let
    inherit (homeConfigurations "anthony" [
      ../../preset/desktop/user.nix
    ]) homeConfigurations;
  in
  {

    nixOnDroidConfigurations.default = nix-on-droid.lib.nixOnDroidConfiguration {
      modules = [
        ./nix-on-droid.nix
        ../../preset/base/system-module.nix
      ];

      extraSpecialArgs = {
        hostname = "default";
      };

      # set nixpkgs instance, it is recommended to apply `nix-on-droid.overlays.default`
      pkgs = import nixpkgs {
        system = "aarch64-linux";

        overlays = [
          nix-on-droid.overlays.default
        ];
      };

      # set path to home-manager flake
      # home-manager-path = home-manager.outPath;
    };


    inherit (homeConfigurations "anthony" [
    ]) homeConfigurations;
  };
}
