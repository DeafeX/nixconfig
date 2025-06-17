{pkgs, lib, ...}@nice : {  			
  news.display = "show";
  home.stateVersion = "25.05";
  home.username = "deafex";
  home.homeDirectory = "/home/deafex";
	nixpkgs.config.allowUnfree = true;

  imports = [
    ./nushell
  ];

  home.packages = with pkgs; [
    (google-chrome.override {
      commandLineArgs = [
        "--ozone-platform=wayland"
      ];
    })
    nerd-fonts.mononoki
    kochi-substitute
    migu
    anki-bin
    #obsidian
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

  programs.gh = {
    enable = true;
  };

  programs.nh = {
    enable = true;
    flake = "/home/deafex/.nixconfig";
  };

	
	home.keyboard = {
		layout = "us";
		variant = "colemak_dh_iso";
	};
}
