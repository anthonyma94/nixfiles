{config, username, inputs, version, ...}: {
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  home.username = "${username}";
  home.homeDirectory = "/home/${username}";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "${version}"; # Please read the comment before changing.
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;

  sops = {
    age.sshKeyPaths = [ "${config.home.homeDirectory}/.ssh/id_ed25519" ];
    defaultSopsFile = ../../secret/secret.yaml;
  };

  programs.git = {
    enable = true;
    userName = "Anthony Ma";
    userEmail = "github@anthonyma.ca";
  };
}
