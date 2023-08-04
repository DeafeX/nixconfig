{ nixpkgs, home-manager, eww, ... } @ inputs : {

  mkHome = hostname: home-manager.lib.homeManagerConfiguration {
    pkgs = import nixpkgs {
      system = "x86_64-linux";
      config.allowUnfree = true;
      overlays = [
        eww.overlays.default
      ];
    };
    
    extraSpecialArgs = inputs // { hostname = hostname; };
    modules = [ ./home/${hostname} ];
  };

  
  mkHost = hostname: nixpkgs.lib.nixosSystem {
      specialArgs = inputs // { hostname = hostname; };
      modules = [
        { networking.hostName = hostname; }
        ./host/${hostname}
      ];
  };
}