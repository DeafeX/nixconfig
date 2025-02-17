{
  description = "Configuration of deafex";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { nixpkgs, home-manager, ... }@inputs: 
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
      config.nvidia.acceptLicense = true;
    };
    mkHost = (hostname: nixpkgs.lib.nixosSystem {
      inherit pkgs;
      specialArgs = inputs // { hostname = hostname; };

      modules = [
        home-manager.nixosModules.home-manager
        /etc/nixos/hardware-configuration.nix
        ./nixos/${hostname}.nix
        ./nixos/shared
        { networking.hostName = hostname; }
      ];
    });
  in 
  {
    nixosConfigurations = {
      phobos = mkHost "phobos";
      
      nekros = mkHost "nekros";

      tellus = mkHost "tellus";
    };
  };
}
