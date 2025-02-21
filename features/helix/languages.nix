{
  language = [
    {
      name = "rust";

      debugger = {
        name = "lldb-vscode";
        transport = "stdio";
        command = "lldb-vscode";

        templates = [{
          name = "binary";
          request = "launch";
          completion = [{
            name = "binary";
            completion = "filename";
          }];
          args = {
            program = "{0}";
            initCommands = [
              "command script import /usr/local/etc/lldb_vscode_rustc_primer.py"
            ];
          };
        }];
      };
    }
    {
      name = "nix";

      language-servers = [ "nixd" "nil" ];
      formatter = { command = "nixfmt"; };
    }
  ];
  language-server.nixd = {
    command = "nixd";
    config = {
      nixd = {      
        home-manager.expr = ''(builtins.getFlake "/home/deafex/.nixconfig").nixosConfigurations.tellus.options'';
      };
    };
  };
}
