# Steps

1. Enable Flakes by adding `nix.settings.experimental-features = [ "nix-command" "flakes" ];` to `/etc/nixos/configuration.nix`.
    - Also add `git` and `vim` to `environment.systemPackages`.
    - Enable ssh now if needed, this is the default ssh with PasswordAuthentication enabled.
1. Run `sudo nixos-rebuild switch` to apply changes.
1. Clone this repo with HTTPS (we will need to switch to SSH later).
1. Copy (and replace if necessary) `configuration.nix` and `hardware-configuration.nix` from `/etc/nixos/` into the desired system directory.
1. Create or download SSH key to `~/.ssh/id_ed25519`.
    - If creating a new key, it needs to be uploaded to [GitHub](https://github.com/settings/keys).
1. Install home-manager by following instructions [here](https://nix-community.github.io/home-manager/index.xhtml#sec-install-standalone).
    - You may need to re-login when running the install command.
1. Generate a key for SOPS:
    ```bash
    mkdir -p ~/.config/sops/age
    nix-shell -p ssh-to-age --run "ssh-to-age -private-key -i ~/.ssh/id_ed25519 > ~/.config/sops/age/keys.txt"
    ```
    - If this is a new SSH key, you will need to add the public key age to `.nixfiles/secret/.sops.yaml`. Retrieve the public key with `nix-shell -p ssh-to-age--run 'cat ~/.ssh/id_ed25519.pub | ssh-to-age'`.
1. Run `sudo nixos-rebuild switch --flake <dir-to-system>` to build NixOS.
1. Run `home-rebuild` to build home-manager.
1. Reboot.
1. Clone nvim config (`git@github.com:anthonyma94/nvim.git`) into `~/.config/nvim`.
1. Change the origin of this repo to use SSH, `git remote set-url origin git@github.com:anthonyma94/nixfiles.git`.

