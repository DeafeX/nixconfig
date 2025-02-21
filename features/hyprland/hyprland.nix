{...}@fArgs: { pkgs, ... }@inputs:
let
	wallPaper = "alpines.jpg";
in {
	home.packages = with pkgs; [
		hyprcursor
	];

	programs.wofi.enable = true;
			
	wayland.windowManager.hyprland = {
		enable = true;

		settings = (import ./config.nix fArgs);
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

			preload = (map (x: builtins.toString (./.) + "/wallpapers/" + x) (builtins.attrNames (builtins.readDir ./wallpapers)));
			wallpaper = [(", " + builtins.toString (./.) + "/wallpapers/" + wallPaper)];		
		};
	};	
}
