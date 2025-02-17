{home-manager, pkgs, osConfig, hostname, config, ...}@inputs: {
  imports = [
    home-manager.nixosModules.home-manager
  ];

  inputs.osConfig.programs.hyprland.enabled = true;
  home-manager = {
    useUserPackages = true;
  };
    
  
  home-manager.users.deafex = {
    home.stateVersion = "24.11";
    imports = [
		../../home/features/helix
		../../home/features/hyprland
		../../home/shared
    ../../home/features/kitty
		];
    home.packages = [
      pkgs.nixd
    ];
  };
}
