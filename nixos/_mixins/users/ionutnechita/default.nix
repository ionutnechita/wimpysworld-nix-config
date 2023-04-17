{ config, desktop, lib, pkgs, ...}:
let
  ifExists = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
   # Only include desktop components if one is supplied.
  imports = [
    ./packages-console.nix
  ] ++ lib.optional (builtins.isString desktop) ./packages-desktop.nix;

  users.users.ionutnechita = {
    description = "Ionut Nechita";
    extraGroups = [
        "audio"
        "networkmanager"
        "users"
        "video"
        "wheel"
      ]
      ++ ifExists [
        "docker"
        "podman"
      ];
    # mkpasswd -m sha-512
    hashedPassword = "$6$QnbmeaZIdqJvh26p$PC3vcXDa9wjmXlvfs7ww4iB/pc2atEXskNKYhLOISeeTbfUwj.MD1ghKvmQu6KfOpQqvT9koStrrjIuP6x4cK0";
    isNormalUser = true;
    openssh.authorizedKeys.keys = [
      ""
    ];
    packages = [ pkgs.home-manager ];
    shell = pkgs.fish;
  };
}
