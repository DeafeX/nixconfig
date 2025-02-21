{...}@fArgs: {
  "$mod" = "ALT_L";
  input = {
    kb_layout = "us";
    kb_variant = "colemak_dh_iso";

    repeat_delay = "325";
    repeat_rate = "38";

    sensitivity = "0.35";
  };
  decoration = {
    rounding = "10";
    blur.enabled = false;
    shadow.enabled = false;
  };
  misc = {
    disable_hyprland_logo = true;
    disable_splash_rendering = true;
  };
  bind = [
    "$mod SHIFT, Q, exit"
    "$mod SHIFT, C, killactive"
    "$mod, P, exec, wofi --show drun"
    "$mod SHIFT, Return, exec, kitty"
    "$mod, k, movefocus, l"
    "$mod, h, movefocus, r"
    "$mod SHIFT, k, movewindow, l"
    "$mod SHIFT, h, movewindow, r"
  ] ++ (let len = 9; in (builtins.genList 
        (number: 
        let 
          workspace = (number + 1); 
        in(
          if workspace <= len then
            "$mod, ${builtins.toString workspace}, workspace, ${builtins.toString workspace}"
          else
            "$mod SHIFT, ${builtins.toString (workspace - len)}, movetoworkspace, ${builtins.toString (workspace - len)}"
        )
      ) (len * 2) ));
}
