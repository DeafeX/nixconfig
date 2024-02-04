{ nixpkgs, home-manager, ... } @ inputs : {

  mkHome = hostname: home-manager.lib.homeManagerConfiguration {
    pkgs = import nixpkgs {
      system = "x86_64-linux";
      config.allowUnfree = true;
    };
    
    extraSpecialArgs = inputs // { hostname = hostname; };
    modules = [ ./home/${hostname} ];
  };

  
  mkHost = hostname: nixpkgs.lib.nixosSystem {
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };
      
      specialArgs = inputs // { hostname = hostname; };
      modules = [
        { networking.hostName = hostname; }
        ./host/${hostname}
      ];
  };
}
