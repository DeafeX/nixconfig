{ pkgs, ...} : {			
  home.username = "deafex";
  home.homeDirectory = "/home/deafex";
  
  home.stateVersion = "23.05";  


  home.packages = with pkgs; [
    google-chrome
    nil
		firefox-wayland
    obsidian  
  ];

     
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Deafex";
    userEmail = "thalesmyfortes@gmail.com";
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    completionInit = ''autoload -U compinit && compinit && zstyle ':completion:*' menu select'';
  };

  programs.starship = {
    enable = true;
    
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
