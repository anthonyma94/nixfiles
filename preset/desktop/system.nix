{pkgs, ...}:

{
  imports = [
  ];

  programs = {
    "_1password-gui".enable = true;
  };

  environment.systemPackages = with pkgs; [
    discord
    google-chrome
    libreoffice
    spotify
    vlc
    vscode
  ];
}
