{ nixpkgs, home-manager, system ? "x86_64-linux", version, inputs, ... }:

username:
modules:

let
  pkgs = nixpkgs.legacyPackages.${system};
in
{
  homeConfigurations = {
    ${username} = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [ 
        ./user-module.nix
        ../../module/zsh/user.nix
        ../../module/neovim/user.nix
      ] ++ modules;
      extraSpecialArgs = {
        inherit inputs username version;
      };
    };
  };
}
