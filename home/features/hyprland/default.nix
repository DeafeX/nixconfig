{ hyprland, hyprpaper, pkgs, ... } @ inputs:
{
	imports = [
	];
	
	wayland.windowManager.hyprland = {
		enable = true;
		extraConfig = import ./config.nix inputs;
	};

	home.sessionVariables = {
		MOZ_ENABLE_WAYLAND = 1;
		NIXOS_OZONE_WL = "1";
		LIBSEAT_BACKEND = "logind";
	};
	
}
