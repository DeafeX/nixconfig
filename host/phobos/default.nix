{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../shared
    ../features/hyprland      
  ];

  sound.enable = true;
  
  services = {
    tlp.enable = true;
  };
}

