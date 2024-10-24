{lib, config, pkgs, ...}: 
let 
    userCfg = config.user;
    cfg = config.hyprland;
in {
    options.hyprland = {
        enable = lib.mkEnableOption "Enable Hyprland desktop environment";
    };

    imports = [
        ./hyprlock
        ./waybar
        ./swaync
        ./wofi
    ];

    config = lib.mkIf cfg.enable {
        programs.hyprland.enable = true;

        hyprlock.enable = true;
        waybar.enable = true;
        swaync.enable = true;
        wofi.enable = true;

        home-manager.users.${userCfg.username} = {
            wayland.windowManager.hyprland = {
                enable = true;
                extraConfig = builtins.readFile ./hyprland.conf;
            };
        };

        environment.systemPackages = with pkgs; [
            kitty # terminal
            gnome.nautilus # file explorer
            bluetuith # bluetooth TUI
            hyprshot # screenshots
            obs-studio # record screen
            pamixer # audio + / - / mute
            vlc # video

            # screensharing 
            pipewire
            wireplumber
        ];
    };
}