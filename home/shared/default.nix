{ pkgs, ...} : {			
  home.username = "deafex";
  home.homeDirectory = "/home/deafex";
  
  home.stateVersion = "23.11";  

  imports = [
    ./nushell
  ];

  home.packages = with pkgs; [
    (google-chrome.override {
      commandLineArgs = [
        "--ozone-platform=wayland"
      ];
    })
    nil
    (nerdfonts.override {
      fonts = [
        "Mononoki"
      ];
    })
    migu
    kanji-stroke-order-font
    anki-bin
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
