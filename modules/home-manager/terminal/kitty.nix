{ lib, config, ... }: {
    options.terminal.kitty = {
        enable = lib.mkEnableOption "Enable kitty";
    };
 
    config = lib.mkIf config.terminal.kitty.enable {
        programs.kitty = {
            enable = true;
            extraConfig = ''
                font_size 20
            '';
        };
    };
}
