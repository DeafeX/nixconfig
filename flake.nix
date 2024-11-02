{
  description = "Configuration of deafex";

  inputs = {
  
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

    ags.url = "github:Aylur/ags";
    
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { nixpkgs, home-manager, ... }@inputs: 
  let
    lib = import ./lib.nix inputs;
  in 
  {
          
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
