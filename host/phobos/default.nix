{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../shared
    ../features/hyprland      
  ];

 services = {
    tlp.enable = true;
  };
}

