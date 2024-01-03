{pkgs, ...} @ inputs : {
	imports = [
		../shared
		../features/helix
		../features/hyprland
		../features/kitty
		../features/easyeffects
	];

	home.packages = with pkgs; [
		vlc
		ardour
		qpwgraph
		p7zip
	];
}
