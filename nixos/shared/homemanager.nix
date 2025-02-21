{home-manager, ...}: {
  imports = [
    home-manager.nixosModules.home-manager
  ];

  home-manager = {
    useUserPackages = true;
    backupFileExtension = "bak";
    users.deafex = (import ./userhome.nix);
  };  
}
