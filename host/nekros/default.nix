{...} : {
  imports = [
	  ./hardware-configuration.nix
    ../shared
    ../features/hyprland
  ];
  services.xserver.videoDrivers = ["nvidia"];
  
  hardware.nvidia.modesetting.enable = true;

  boot.initrd.kernelModules = [
    "nvidia"
    "nvidia_modeset"
    "nvidia_uvm" 
    "nvidia_drm"
  ];
}
