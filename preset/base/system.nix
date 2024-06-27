{ nixpkgs, system ? "x86_64-linux", inputs, ... }:

{hostname, username}:
modules:

let
  lib = nixpkgs.lib;
in
{
  nixosConfigurations = {
    ${hostname} = lib.nixosSystem {
      inherit system;
      modules = [
        ./system-module.nix 
        ../../module/zsh/system.nix
        ../../module/neovim/system.nix
      ] ++ modules;
      specialArgs = {
          inherit inputs hostname username;
      };
    };
  };
}
