{pkgs, hostname, ...}@inputs:
{
  imports = (import ../features/loader.nix {
    hyprland = true;
    kitty = true;
    helix = true;
  });


  home-manager.users.deafex = {
    home.packages = with pkgs; [
      cutter
    ];
  };
}
