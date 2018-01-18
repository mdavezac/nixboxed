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

    all = pkgs.buildEnv {
      name = "all";
      paths = with pkgs; [
        aspell
      
        vscode
        neovim

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
