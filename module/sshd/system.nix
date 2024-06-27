{ lib, username, ... }:
{
  services.openssh = {
    enable = lib.mkForce true;
    settings = {
      PasswordAuthentication = false;
    };
  };

  users.users.${username}.openssh = {
    authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOLIUAT+zhGfXrnKRtF4XFK85cxUQ8eCogSNJsHO/6I+ #desktop"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPTU8vUm7dWwdYED22uO3MxNwUVnDorv3zTxYIBwfeM7 #laptop"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH222jTa9wu1gI11KBS+zjbc/JY8b34xNvAnGw0t4ngk #mobile"
    ];
  };
}
