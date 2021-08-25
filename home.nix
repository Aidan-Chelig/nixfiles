{ config, pkgs, ... }:

{
  home.packages = [
    #development
    pkgs.editorconfig-core-c
    pkgs.jq
    pkgs.nixfmt
    pkgs.rust-analyzer
    pkgs.shellcheck
    pkgs.bat
    pkgs.ripgrep
    pkgs.exa

    #multimedia
    pkgs.spotify
    pkgs.spicetify-cli
    pkgs.playerctl

    #productivity
    pkgs.aseprite
    pkgs.krita

    #messeging
    pkgs.signal-desktop
    pkgs.discord

    #desktop utils
    pkgs.pcmanfm
    pkgs.xdg-utils
    pkgs.keepass
    pkgs.nwg-launchers
    pkgs.ulauncher
  ];

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1";
    XDG_CURRENT_DESKTOP = "sway";
    MOZ_USE_XINPUT2 = "1";
  };

  home.file.".profile".text = ''
  . "${config.home.profileDirectory}/etc/profile.d/hm-session-vars.sh"
  '';

#  programs.firefox = {
#    enable = true;
#    package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
#      forceWayland = true;
#    };
#  };

programs.zsh = {
  enable = true;
  autocd = true;
  dotDir = ".config/zsh";
  enableAutosuggestions = true;
  enableCompletion = true;
  shellAliases = {
    sl = "exa";
    ls = "exa";
    la = "exa -la";
    hme = "nvim ~/.config/nixpkgs/home.nix";
    hms = "home-manager switch";
  };
};
  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };

  services.syncthing = {
  enable = true;
  };

  gtk.enable = true;
  gtk.theme.package = pkgs.vimix-gtk-themes;
  gtk.theme.name = "vimix-dark-doder";
  gtk.iconTheme.package = pkgs.flat-remix-icon-theme;
  gtk.iconTheme.name = "Flat-Remix-Blue";

  programs.starship = {
  enable = true;
  enableZshIntegration = true;
  };

  programs.home-manager = {
    enable = true;
  };
}
