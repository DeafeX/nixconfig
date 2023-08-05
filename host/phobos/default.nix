{ config, pkgs, ... }:
{
  imports = [
      ./hardware-configuration.nix
      ../shared
      ../features/hyprland
  ];
  
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;


  networking.wireless.enable = false;
  networking.networkmanager.enable = true;  

}

