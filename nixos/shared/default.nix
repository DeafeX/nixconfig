{home-manager, pkgs, ...} : {
  imports = [
    ./grub.nix
    ./nixcfg.nix
    ./homemanager.nix
  ];

  users = {
    users = {
      deafex = {
        isNormalUser = true;
        extraGroups = ["wheel"];
        shell = pkgs.nushell;
      };
    };
  };
  
  security.polkit.enable = true;

  networking = {
    networkmanager.enable = true;
    firewall = {
      enable = true;
    };
  };

    
  i18n.defaultLocale = "en_US.UTF-8";
  console.useXkbConfig = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "colemak_dh_iso";
  };

  programs.light.enable = true;
      
  
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

  system.stateVersion = "25.05";
}
