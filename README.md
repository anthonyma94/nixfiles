# Steps

1. Install NixOS and install Git if not already on there.
1. Clone this repo with HTTPS (we will need to switch to SSH later).
1. Copy (and replace if necessary) `configuration.nix` and `hardware-configuration.nix` from `/etc/nixos/` into the desired system directory.
1. Enable Flakes by adding `nix.settings.experimental-features = [ "nix-command" "flakes" ];` to `configuration.nix`.
1. Install home-manager by following instructions [here](https://nix-community.github.io/home-manager/index.xhtml#sec-install-standalone).
1. Generate a key for SOPS using instructions [here](https://github.com/Mic92/sops-nix?tab=readme-ov-file#usage-example).
  - If this is a new system, you will need to add the public key to `secrets.yaml` on another system.
1. Run `sudo nixos-rebuild switch --flake <dir-to-system>` to build NixOS.
1. Run `home-rebuild` to build home-manager.
1. Reboot.
1. Clone nvim config (git@github.com:anthonyma94/nvim.git) into `~/.config/nvim`.

