{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    xclip
  ];
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
}
