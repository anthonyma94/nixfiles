{ pkgs, hostname, ... }:

{
  imports = [
    ../../module/zsh/system.nix
    ../../module/neovim/system.nix
  ];

  environment.systemPackages = with pkgs; [
    cargo
    curl
    gcc
    git
    git-credential-manager
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
    config = {
      credential = {
        credentialStore = "gpg";
      };
    };
  };


  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ];})
  ];

  environment.shellAliases = {
    "os-rebuild" = "nixos-rebuild switch --flake $HOME/.nixfiles/system/${hostname}";
    "home-rebuild" = "home-manager switch --flake $HOME/.nixfiles/system/${hostname}";
  };
}
