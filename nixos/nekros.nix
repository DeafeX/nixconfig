{pkgs, config, ...} : {
  imports = [
    ./features/hyprland
    ./features/pipewire
  ];
  environment.systemPackages = with pkgs; [
    alsa-utils
    solaar
  ];

  services = {
    xserver = {
      videoDrivers = ["nvidia"];
    };
    power-profiles-daemon.enable = true; 
  };

    
  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    modesetting.enable = true;
    nvidiaSettings = true;
  };
  
  boot.loader.grub.useOSProber = true;

  boot.initrd.kernelModules = [
    "nvidia"
    "nvidia_modeset"
    "nvidia_uvm" 
    "nvidia_drm"
  ];
}
