{hyprland, pkgs, ...} : {

	programs.xwayland.enable = true;
	
	programs.hyprland = {
		enable = true;
		package = hyprland.packages.${pkgs.system}.hyprland;
	};

}
