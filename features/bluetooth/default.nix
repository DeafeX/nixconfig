{
  nixosConfig = { headphoneSupport ? false, ... }@fArgs:
    { ... }@inputs: ({
      hardware.bluetooth = {
        enable = true;
        settings = { General = { Enable = "Source,Sink,Media,Socket"; }; };
      };
    } // (if headphoneSupport then ((import ../pipewire).nixosConfig fArgs inputs) else {} ));
}
