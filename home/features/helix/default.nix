{...} : {
	programs.helix = {
		enable = true;
		defaultEditor = true;

		settings = {
			theme = "amberwood";
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
					character = "▏";
				};
			};
						
			keys = {
				normal = { 
					K = "move_visual_line_up";
					H = "move_visual_line_down";
					k = "move_char_left";
					h = "move_char_right";
					C-k = "goto_previous_buffer";
					C-h = "goto_next_buffer";
					C-w = ":buffer-close";
				};
			};
		};

		languages = {
			language = [
				{
					name = "rust";

					debugger = {
						name = "lldb-vscode";
        		transport = "stdio";
						command = "lldb-vscode";
						
						templates = [
							{
								name = "binary";
								request = "launch";
								completion = [ {name = "binary"; completion = "filename"; } ];
								args = { program = "{0}"; initCommands = [ "command script import /usr/local/etc/lldb_vscode_rustc_primer.py" ]; };
							}
						];
					};
				}
			];
		};
	};
}
