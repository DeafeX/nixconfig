{hyprland, pkgs, ...} : {

	programs.xwayland.enable = true;
	
	programs.hyprland = {
		enable = true;
	};

	xdg.portal.extraPortals = with pkgs; [
		xdg-desktop-portal-gtk
	];

}
