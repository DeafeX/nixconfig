{ nixpkgs, home-manager, ... } @ inputs : 
let
  pkgs = import nixpkgs {
    system = "x86_64-linux";
    config.allowUnfree= true;
  };
in {

  mkHome = hostname: home-manager.lib.homeManagerConfiguration {
    inherit pkgs;
    
    extraSpecialArgs = inputs // { hostname = hostname; };
    modules = [ ./home/${hostname} ];
  };
  
  mkHost = hostname: nixpkgs.lib.nixosSystem {
      inherit pkgs;
           
      specialArgs = inputs // { hostname = hostname; };
      modules = [
        { networking.hostName = hostname; }
        ./host/${hostname}
      ];
  };
}
