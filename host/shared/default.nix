{pkgs, ...} : {
  imports = [
    ./grub.nix
    ./nixcfg.nix
  ];
  
  documentation.man.generateCaches = true;

  networking.wireless.enable = false;
  networking.networkmanager.enable = true;
  
  i18n.defaultLocale = "en_US.UTF-8";
  console.useXkbConfig = true;
    
  services.xserver.layout = "us";
  services.xserver.xkbVariant = "colemak_dh_iso";

  programs.light.enable = true;
      
  users.users.deafex = {
    isNormalUser = true;
    extraGroups = [ "wheel"];
    shell = pkgs.fish;
  };
  
  environment = {
    systemPackages = with pkgs; [
      pciutils
    ];
    defaultPackages = [];
    variables = {      
		  LIBSEAT_BACKEND = "logind";
    };
    pathsToLink = [
      /share/fish
    ];
  }; 

  services.upower.enable = true;

  system.stateVersion = "23.11";
}
