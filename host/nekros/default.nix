{pkgs, ...} : {
  imports = [
	  ./hardware-configuration.nix
    ../shared
    ../features/hyprland
    ../features/pipewire
  ];

  environment.systemPackages = [
    pkgs.alsa-utils
  ];

  services = {
    xserver = {
      videoDrivers = ["nvidia"];
    };
    power-profiles-daemon.enable = true; 
  };
  
  hardware.nvidia.modesetting.enable = true;
  
  boot.loader.grub.useOSProber = true;

  boot.initrd.kernelModules = [
    "nvidia"
    "nvidia_modeset"
    "nvidia_uvm" 
    "nvidia_drm"
  ];
}
