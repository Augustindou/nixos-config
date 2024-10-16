{lib, config, pkgs, ...}: 
let 
    userCfg = config.user;
    cfg = config.lazygit;
in {
    options.lazygit = {
        enable = lib.mkEnableOption "Enable Hyprland desktop environment";
    };

    config = lib.mkIf cfg.enable {
        programs.lazygit.enable = true;

        home-manager.users.${userCfg.username} = {
            programs.lazygit.enable = true;
            programs.lazygit.settings = {
                gui = {
                    statusPanelView = "allBranchesLog";
                    scrollHeight = 5;
                    mainBranches = [
                        "master"
                        "main"
                        "production"
                        "develop"
                    ];
                    branchColors = {
                        feature = "default";
                        bugfix = "default";
                        hotfix = "default";
                    };
                };
            };
        };

        environment.systemPackages = with pkgs; [
            lazygit
        ];
    };
}