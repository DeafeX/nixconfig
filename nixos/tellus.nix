{pkgs, hostname, ...}@inputs:
{
  imports = (import ../features/loader.nix {
    hyprland = true;
    kitty = true;
    helix = true;
    bluetooth = { headphoneSupport = true; };
  });

  services.tlp.enable = true;

  home-manager.users.deafex = {
    home.packages = with pkgs; [
      cutter
      mitmproxy
      transmission_4
    ];
  };
}
