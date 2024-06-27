{ pkgs, hostname, username, ... }:

{
  imports = [
    ../../module/zsh/system.nix
    ../../module/neovim/system.nix
  ];

  environment.systemPackages = with pkgs; [
    cargo
    curl
    htop
    gcc
    git
    gnumake
    lazygit
    rustc
    sops
    unzip
    wget
    zip
  ];

  programs.git = {
    enable = true;
  };

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ];})
  ];

  environment.shellAliases = {
    "os-rebuild" = "nixos-rebuild switch --flake /home/${username}/.nixfiles/system/${hostname}";
    "home-rebuild" = "home-manager switch --flake /home/${username}/.nixfiles/system/${hostname}";
  };
}
