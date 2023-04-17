{ pkgs, ... }: {
  # Desktop application momentum follows the unstable channel.
  programs = {
    firefox = {
      enable = true;
      package = pkgs.unstable.firefox;
    };
  };
  nixpkgs.config.permittedInsecurePackages = [ 
     "yandex-browser-22.9.1.1110-1"
  ];
              
  environment.systemPackages = with pkgs.unstable; [
     yandex-browser
  ];
}
