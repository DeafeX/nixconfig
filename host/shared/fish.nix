{pkgs, config, ... } : {
	programs.fish = {
		enable = true;
		shellInit = "
			set -U fish_greeting	
		";
		interactiveShellInit = ''
			if test "$TERM" != "dumb"
        eval (starship init fish)
      end
		'';
	};
}
