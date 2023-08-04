{pkgs, ...} : {

  i18n.defaultLocale = "en_US.UTF-8";
  console.useXkbConfig = true;
    
  services.xserver.layout = "us";
  services.xserver.xkbVariant = "colemak_dh_iso";
  
  users.users.deafex = {
    isNormalUser = true;
    extraGroups = [ "wheel"];
    shell = pkgs.zsh;
  };
  

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = [
    pkgs.pciutils
  ];

  environment.defaultPackages = [];

  
  environment.pathsToLink = [
    "/shared/zsh"
  ];
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
  };

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
      '';
  };
}
