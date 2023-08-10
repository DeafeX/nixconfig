{pkgs, ...} : {  
	home.packages = with pkgs; [
		fishPlugins.fzf-fish
		fzf
		bat
		fd
	];

	programs.man.generateCaches = true;
	
	programs.fish = {
		enable = true;

	};
			
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };

  
}
