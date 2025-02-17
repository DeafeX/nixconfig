toLoad : {home-manager, ...}@inputs: {
  # tolaod = [ { name = "hyprland", args = {...};}]
  home-manager.users.deafex = {...}@inputs: {
    imports = map (x: import ./${x.name} (if builtins.isAttrs x.args then x.args else {})) toLoad; # evaluate to: [ lamda ]    
  };
}
