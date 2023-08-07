{pkgs, ...} : {
  imports = [
    ./grub.nix
    ./nixcfg.nix
  ];
  
  networking.wireless.enable = false;
  networking.networkmanager.enable = true;
  
  i18n.defaultLocale = "en_US.UTF-8";
  console.useXkbConfig = true;
    
  services.xserver.layout = "us";
  services.xserver.xkbVariant = "colemak_dh_iso";

  programs.zsh.enable = true;
    
  users.users.deafex = {
    isNormalUser = true;
    extraGroups = [ "wheel"];
    shell = pkgs.zsh;
  };
  
  environment = {
    systemPackages = [
      pkgs.pciutils
      pkgs.ranger
    ];
    defaultPackages = [];
    pathsToLink = [
      "/shared/zsh"
    ];
  }; 

  services = {
    upower.enable = true;
    power-profiles-daemon.enable = true;
  };

  system.stateVersion = "23.11";
}
