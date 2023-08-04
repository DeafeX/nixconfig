{ hyprland, ... } @ inputs:
{
	imports = [
		hyprland.homeManagerModules.default	
	];
	
	wayland.windowManager.hyprland = {
		enable = true;
		package = null;
		extraConfig = import ./config.nix inputs;
	};

	home.sessionVariables = {
		MOZ_ENABLE_WAYLAND = 1;
		NIXOS_OZONE_WL = "1";
		LIBSEAT_BACKEND = "logind";
	};

		/*programs.hyprpaper = {
		enable = true;
	};*/
}
