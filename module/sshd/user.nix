{config, ...}:
{
  sops = {
    secrets = {
      ssh_config = {};
    };
  };

  programs.ssh = {
    enable = true;
    includes = [ "${config.sops.secrets.ssh_config.path}" ];
  };
}
