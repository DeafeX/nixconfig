{pkgs, hostname, ...}@inputs:
{
  imports = (import ../features/loader.nix {
    hyprland = true;
    kitty = true;
    helix = true;
  });

}
