{pkgs, ...} : {
  imports = [
    ./grub.nix
    ./nixcfg.nix
  ];
  


  networking = {
    networkmanager.enable = true;
    firewall = {
      enable = true;
    };
  };

  fonts = {
    packages = with pkgs; [
      kochi-substitute
    ];

  };
    
  i18n.defaultLocale = "en_US.UTF-8";
  console.useXkbConfig = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "colemak_dh_iso";
  };

  programs.light.enable = true;
      
  users.users.deafex = {
    isNormalUser = true;
    extraGroups = [ "wheel"];
    shell = pkgs.nushell;
  };
  
  environment = {
    systemPackages = with pkgs; [
      pciutils
    ];
    defaultPackages = [];
    variables = {      
		  LIBSEAT_BACKEND = "logind";
    };
    sessionVariables = {
      PATH = [
        "$HOME/.local/bin"
      ];
    };
  }; 
  
  services.upower.enable = true;

  system.stateVersion = "23.11";
}
