{...} : {
	programs.helix = {
		enable = true;
		defaultEditor = true;

		settings = {
			theme = "kanagawa";
			editor = {
				cursorline = true;
				bufferline = "multiple";
				true-color = true;

				soft-wrap.enable = true;

				lsp = {
					display-messages = true;
					display-inlay-hints = true;
				};
				
				cursor-shape = {
					insert = "bar";
				};

				indent-guides = {
					render = true;
					character = "╎";
				};
			};

			languages = {
				language = [
					{
						name = "nix";
						indent = { 
							tab-width = 2; 
							unit = "	";
						};
					}
				];
			};

			
			keys = {
				normal = { 
					K = "move_visual_line_up";
					H = "move_visual_line_down";
					k = "move_char_left";
					h = "move_char_right";
					A-k = "goto_next_buffer";
					A-h = "goto_previous_buffer";
					A-w = ":buffer-close";
				};
			};
		};
	};
}
