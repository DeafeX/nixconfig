{ hyprland, hyprpaper, pkgs, ... } @ inputs:
{
	imports = [
		hyprland.homeManagerModules.default	
		hyprpaper.homeManagerModules.default
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

	services.hyprpaper = {
		enable = true;

		ipc = false;

		preloads = [
			
		];

		wallpapers = [
			
		];
	};

		/*programs.hyprpaper = {
		enable = true;
	};*/
}
