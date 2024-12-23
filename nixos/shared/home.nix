{home-manager, pkgs, ...}@inputs: {
  imports = [
    home-manager.nixosModules.home-manager
  ];
  
  home-manager.users.deafex = {
    home.stateVersion = "24.11";

  };
}
