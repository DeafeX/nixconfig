{ pkgs, ... }: {
  imports = [
    ../shared
    ../features/hyprland
    ../features/kitty
    ../features/helix
  ];
}
