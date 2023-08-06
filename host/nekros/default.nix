{...} : {
  imports = [
	  ./hardware-configuration.nix
    ../shared
    ../features/hyprland
    ../features/pipewire
  ];

  services.xserver.videoDrivers = ["nvidia"];
  
  hardware.nvidia.modesetting.enable = true;
  
  boot.loader.grub.useOSProber = true;

  boot.initrd.kernelModules = [
    "nvidia"
    "nvidia_modeset"
    "nvidia_uvm" 
    "nvidia_drm"
  ];
}
