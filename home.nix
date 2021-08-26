{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    #development
    editorconfig-core-c
    jq
    nixfmt
    rust-analyzer
    shellcheck
    bat
    ripgrep
    exa

    #multimedia
    spotify
    spicetify-cli
    playerctl
    vlc

    #productivity
    aseprite
    krita
    libreoffice
    kdenlive
    blender
    darktable
    write_stylus

    #messeging
    signal-desktop
    discord

    #desktop utils
    pcmanfm
    xdg-utils
    keepass
    nwg-launchers
    ulauncher
    bibata-cursors

    #sway
	swaylock
      wofi
      alacritty
      # wl-clipboard
      waybar
      autotiling
      flashfocus
      wf-recorder
      slurp
      grim
      v4l-utils
      swayidle
  ];

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1";
    XDG_CURRENT_DESKTOP = "sway";
    MOZ_USE_XINPUT2 = "1";
  };

 wayland.windowManager.sway = {
 enable = true;
 wrapperFeatures.gtk = true;
 };

  home.file = {
  ".profile".text = ''
  . "${config.home.profileDirectory}/etc/profile.d/hm-session-vars.sh"
  '';

  ".config/sway/customconfig".source = ./swayconfig;
  };

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
  gtk.gtk3.extraConfig.gtk-cursor-theme-name = "Bibata Classic";

  gtk.gtk2.extraConfig = ''
    gtk-cursor-theme-name = "Bibata Classic"
  '';

  programs.starship = {
  enable = true;
  enableZshIntegration = true;
  };

  programs.home-manager = {
    enable = true;
  };
}
