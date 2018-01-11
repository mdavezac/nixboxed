{ config, pkgs, ... }:

{
    services.xserver.enable = true;
    services.xserver.displayManager.lightdm.enable = true;

    environment.systemPackages = with pkgs; [
        firefox
        terminator
        neovim
        git
        zsh
    ];

    services.xserver.windowManager.i3 = {
        enable = true;
        package = pkgs.i3-gaps;
        extraPackages = [
            pkgs.dmenu
            pkgs.i3status
            pkgs.polybar
            pkgs.i3lock
            pkgs.compton
            pkgs.rofi
            pkgs.nitrogen
        ];
    };
}
