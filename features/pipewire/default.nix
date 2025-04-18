{
  nixosConfig = { extraConfig ? {}, ... }: { ... }: ({
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };
  } // extraConfig);
}
