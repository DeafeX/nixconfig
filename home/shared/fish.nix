{pkgs, ...} : {  
	home.packages = with pkgs; [
		fishPlugins.fzf-fish
		fzf
		bat
		fd
	];

			
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };

  
}
