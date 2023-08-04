{lib, config, hostname, ...}:
with lib;
let
  kb_settings = config.home.keyboard;
  numberOfWorkspaces = 9;
  isLaptop = if hostname == "phobos" then true else false;
in
''
$mod = ALT_L

monitor = eDP-1, 1920x1080, 0x0, 1

input {
  kb_layout = ${ kb_settings.layout }
  kb_variant = ${ kb_settings.variant }

  repeat_delay = 325
  repeat_rate = 38

  sensitivity = ${if isLaptop then "0.35" else "0.5" }
  follow_mouse = 1

  touchpad {
    natural_scroll = false
    scroll_factor = 0.8
  } 
}

decoration {
  rounding = 10
  blur = false

  drop_shadow = false
}

general {
  gaps_in = 5
  gaps_out = 16

  layout = dwindle
}

animations {
  enabled = true
}

master {
  new_is_master = true
}

misc {
  disable_hyprland_logo = true
  disable_splash_rendering = true
}

bind = $mod SHIFT, Q, exit
bind = $mod SHIFT, C, killactive
bind = $mod SHIFT, Return, exec, kitty
bind = $mod, P, exec, wofi --show drun
bind = $mod, k, movefocus, l
bind = $mod, h, movefocus, r
bind = $mod SHIFT, K, movewindow, l
bind = $mod SHIFT, H, movewindow, r

${
  concatStringsSep "\n" (
    genList (
      number: 
      let
        workspace = toString (number + 1);
      in "
        bind = $mod, ${workspace}, workspace, ${workspace}
        bind = $mod SHIFT, ${workspace}, movetoworkspace, ${workspace}
      "
    ) numberOfWorkspaces
  )
}
''
