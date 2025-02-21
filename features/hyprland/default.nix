{
  nixosConfig = {...}: {...}: {
    programs.hyprland.enable = true;
  };
  
  homeConfig = import ./hyprland.nix;
}
