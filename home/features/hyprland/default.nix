{ hyprland, ... } @ inputs:
{
	imports = [];
	
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

		settings = {
			ipc = "on";
			splash = false;

			preload = (map (x: builtins.toString (./.) + "/" + x) (builtins.attrNames (builtins.readDir ./wallpapers)));		
		};
	};	
}
