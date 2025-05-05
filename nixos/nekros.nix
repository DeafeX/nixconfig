{ pkgs, config, ... }: {
  imports = (import ../features/loader.nix {
    hyprland = { input.sensitivity = "-0.1"; };
    helix = true;
    kitty = true;
    pipewire = true;
  });

  home-manager.users.deafex = {
    home.packages = with pkgs; [ vlc ardour qpwgraph p7zip ncspot ];
  };

  services = {
    xserver = { videoDrivers = [ "nvidia" ]; };
    power-profiles-daemon.enable = true;
  };

  hardware = {
    nvidia = {
      open = true;
      modesetting.enable = true;
      nvidiaSettings = true;
    };
    graphics = {
      extraPackages = with pkgs; [
        nvidia-vaapi-driver
      ];
    };
  };

  boot.loader.grub.useOSProber = true;

  boot.initrd.kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
}
