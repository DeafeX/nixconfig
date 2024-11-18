{
  description = "Configuration of deafex";

  inputs = {
  
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    ags.url = "github:aylur/ags";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { nixpkgs, home-manager, ags, ... }@inputs: 
  let
    lib = import ./lib.nix inputs;
    system = "x86_64-linux";
    pkgs = (nixpkgs.legacyPackages.${system});
  in 
  {
    packages.${system}.default = ags.lib.bundle {
      inherit pkgs;

      src = ./ags/.;
      name = "agsapp";

      entry = "app.ts";

      extraPackages = [
        
      ];
    };
           
    nixosConfigurations = {
      phobos = lib.mkHost "phobos";
      
      nekros = lib.mkHost "nekros";
    };
    
    homeManagerModules = import "./home/modules";
    
    homeConfigurations = {
      "deafex@phobos" = lib.mkHome "phobos";

      "deafex@nekros" = lib.mkHome "nekros";

    };    
  };
}
