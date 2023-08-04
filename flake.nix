{
  description = "Home Manager configuration of deafex";

  inputs = {
  
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    eww = {
      url = "github:elkowar/eww";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.rust-overlay.follows = "rust-overlay";
    };
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, hyprland, ... }@inputs: 
  let
    lib = import ./lib.nix inputs;
  in 
  { 
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPkgs = true; 
    
    nixosConfigurations = {
      phobos = lib.mkHost "phobos";
    };

    homeConfigurations = {
      "deafex@phobos" = lib.mkHome "phobos";
    };    
  };
}
