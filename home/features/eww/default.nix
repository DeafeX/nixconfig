{pkgs, hostname, ...} : {
  home.packages = [
    pkgs.eww-wayland
  ];

  xdg.configFile = {
    "eww".source = ./config;
    
  };
}