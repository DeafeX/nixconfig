{pkgs, ... } : {
	environment.systemPackages = with pkgs; [
		fishPlugins.fzf-fish
		fzf
		bat
		fd
	];
	
	programs.fish = {
		enable = true;
		shellInit = "
			set -U fish_greeting	
		";
	};
}
