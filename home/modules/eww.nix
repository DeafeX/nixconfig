{cfg, pkgs, lib, ...}: 
with lib;
{
  options = {
    enable = mkEnableOption "eww";
    
    pkg = mkPackageOption pkgs "eww" {
      default = pkgs.eww;
    };

    
  };

  config = {
    
  }; 
}
