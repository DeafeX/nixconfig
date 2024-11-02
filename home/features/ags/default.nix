{ pkgs, ags }: {
  imports = [ ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;

    config = ./config;

    extraPackages = with pkgs; [
        
    ];
  };
}
