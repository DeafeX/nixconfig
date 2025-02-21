{
  homeConfig = {...}@fArgs: {pkgs, ...}@inputs: {
    home.packages = with pkgs; [
      nil
      nixfmt-classic
      nixd
    ];
    
    programs.helix = {
      enable = true;
      defaultEditor = true;
      
      settings = (import ./settings.nix);

      languages = (import ./languages.nix);
    };
  };
}
