{
  services.easyeffects = {
		enable = true;
	};
  
  xdg.configFile."easyeffects/output" = {
    source = ./presets;
    recursive = true;
  };
}
