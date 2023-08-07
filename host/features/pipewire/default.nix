{...} : {
	sound.enable = false;
				
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		jack.enable = true;
		wireplumber.enable = true;
	};
}
