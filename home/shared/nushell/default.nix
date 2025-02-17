{pkgs, ...} : {
		home.packages = with pkgs; [
			
		];

		programs = {
			nushell = {
				enable = true;
			};
		};
}
