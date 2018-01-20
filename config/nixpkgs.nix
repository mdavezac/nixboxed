{
  allowUnfree = true;

  firefox = {
    enableGoogleTalkPlugin = true;
    enableAdobeFlash = true;
  };

  packageOverrides = pkgs: rec {
    polybar = pkgs.polybar.override {
        i3GapsSupport = true;
        githubSupport = true;
    };

    nerdfonts = pkgs.nerdfonts.override {
        withFonts="Deja Vue";
    };

    all = pkgs.buildEnv {
      name = "all";
      paths = with pkgs; [
        aspell
      
        vscode
        neovim
        xsel

        git
        zsh

        julia

        jsoncpp
        polybar

        ag
        cmake
      ];
    };

  };
}
