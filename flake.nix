{
  description = "Configuration of deafex";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
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

    devShells.${system} = import ./devShells.nix inputs;
  };
}
