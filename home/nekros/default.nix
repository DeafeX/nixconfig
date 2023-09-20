{pkgs, ...} @ inputs : {
	imports = [
		../shared
		../features/helix
		../features/hyprland
		../features/kitty
		../features/eww
		../features/easyeffects
	];

	home.packages = with pkgs; [
		vlc
		ardour
		qpwgraph
	];
}
