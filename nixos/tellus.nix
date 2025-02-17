{pkgs, hostname, ...}@inputs:
let
  toLoad = [ {name = "hyprland"; args = {};} ];
  loader = import ../features/loader.nix;
  loaded = loader toLoad;
in
{
  #imports = [ (import ../features/loader.nix [
  #  { name = "hyprland"; args = {};}
  #])
  #];

  
  
}
