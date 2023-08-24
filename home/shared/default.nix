{ pkgs, ...} : {			
  home.username = "deafex";
  home.homeDirectory = "/home/deafex";
  
  home.stateVersion = "23.11";  

  imports = [
    ./fish.nix
  ];

  home.packages = with pkgs; [
    google-chrome
    nil
    obsidian
    ranger
    (nerdfonts.override {
      fonts = [
        "Mononoki"
      ];
    })
  ];

  fonts.fontconfig.enable = true;
  
  ### programs

  programs.firefox = {
    enable = true;
    package = pkgs.firefox-wayland;
  };
  
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Deafex";
    userEmail = "thalesmyfortes@gmail.com";
  };

  services.flameshot.enable = true;
	
	home.keyboard = {
		layout = "us";
		variant = "colemak_dh_iso";
	};
	

	programs.wofi = {
		enable = true;
	};

	programs.gh = {
		enable = true;
	};
}
