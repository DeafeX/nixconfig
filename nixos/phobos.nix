{ config, pkgs, ... }:
{
  imports = [
    ./features/hyprland
  ];

 services = {
    tlp.enable = true;
  };
}

