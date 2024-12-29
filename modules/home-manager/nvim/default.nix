{ lib, config, pkgs, ... }: {

    options.nvim.enable = lib.mkEnableOption "Enable neovim";
 
    config = lib.mkIf config.nvim.enable {
        home.file.".config/nvim" = {
            source = ./lua-config;
            recursive = true;
        };
 
        programs.neovim = {
            enable = true;
            defaultEditor = true;
        };
       
        home.packages = with pkgs; [
            # To compile & build packages
            gnumake
            gcc
            nodejs_22
            python3
            cargo
            unzip
        
            # Formatters
            stylua
            black
            rustfmt
            prettierd
            nixpkgs-fmt
        ];
    };
}