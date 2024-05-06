{lib, config, hostname, ...}:
with lib;
let
  kb_settings = config.home.keyboard;
  numberOfWorkspaces = 9;
  isLaptop = if hostname == "phobos" then true else false;
  mod = "ALT_L";
  defaultValues = {
    workspaces = 9;
    "$mod" = mod;
    
  };
in
''
$mod = ALT_L

monitor = ${if hostname == "phobos" then "eDP-1" else "HDMI-A-1"}, 1920x1080, 0x0, 1
monitor = Unknown-1,disabled

${if isLaptop == false then "
env = LIBVA_DRIVER_NAME,nvidia
env = XDG_SESSION_TYPE,wayland
env = GBM_BACKEND,nvidia-drm
env = __GLX_VENDOR_LIBRARY_NAME,nvidia
env = WLR_NO_HARDWARE_CURSORS,1" else ""}
env = NVD_BACKEND,direct

input {
  kb_layout = ${ kb_settings.layout }
  kb_variant = ${ kb_settings.variant }

  repeat_delay = 325
  repeat_rate = 38

  sensitivity = ${if isLaptop then "0.35" else "0.4"}
  follow_mouse = 1
  force_no_accel = ${if isLaptop then "false" else "true"}
  touchpad {
    natural_scroll = false
    scroll_factor = 0.8
  } 
}

${if isLaptop then 
''decoration {
  rounding = 10
  blur {
    enabled = false
  }

  drop_shadow = false 
}'' else 
''decoration {
  rounding = 10  
}''
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
