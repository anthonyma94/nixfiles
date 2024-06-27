{
	inputs = {
		nixpkgs.url = "nixpkgs/nixos-24.05";
		home-manager.url = "github:nix-community/home-manager/release-24.05";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
	};

	outputs = { nixpkgs, home-manager, sops-nix, ... }@inputs:
	let
    homeConfigurations = import ../../preset/base/user.nix { inherit nixpkgs home-manager inputs; version = "24.05"; };
    nixosConfigurations = import ../../preset/base/system.nix { inherit nixpkgs inputs; };
	in {
    inherit (nixosConfigurations {hostname = "vm"; username = "anthony";} [
      ./configuration.nix
    ]) nixosConfigurations;
    inherit (homeConfigurations "anthony" [
    ]) homeConfigurations;
	};
}
