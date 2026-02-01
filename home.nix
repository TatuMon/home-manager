################
# KNOWN ISSUES #
################
# When using KDE Plasma and systemd, if the app launcher is not detecting the installed packages,
# run one of these:
#   - `systemctl restart --user plasma-plasmashell`
#   - `kbuildsycoca6 --noincremental`

# Minimun nixpkgs version: 24.11
{ pkgs, config, ... }:

let
  nixvim = import (
    builtins.fetchGit {
      url = "https://github.com/nix-community/nixvim";
    }
  );

  sshy = import ./sshy { pkgs = pkgs; };
  wallpapers = import ./wallpapers { pkgs = pkgs; };
  rofi-themes = import ./rofi/rofi-themes.nix { pkgs = pkgs; };
  waybar-module-pomodoro = import ./waybar/modules/waybar-module-pomodoro.nix { pkgs = pkgs; };
in
{
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };

    overlays = [
      (
        final: prev:
        let
          pkgsMaster =
            import
              (builtins.fetchTarball {
                url = "https://github.com/NixOS/nixpkgs/archive/master.tar.gz";
              })
              {
                system = prev.system;
                config.allowUnfree = true;
              };
        in
        {
          master = pkgsMaster;
        }
      )
    ];
  };

  xdg = import ./xdg;

  targets.genericLinux.nixGL.packages = import <nixgl> { inherit pkgs; };

  imports = [ nixvim.homeModules.nixvim ];

  dconf.settings = import ./dconf;
  gtk = import ./gtk pkgs;

  programs.nixvim = import ./nixvim pkgs;
  programs.kitty = import ./kitty {
    pkgs = pkgs;
    config = config;
  };
  programs.btop.enable = true;

  programs.tmux = import ./tmux pkgs;
  programs.newsboat = import ./newsboat;
  programs.starship = import ./starship { lib = pkgs.lib; };
  programs.zoxide.enable = true;
  programs.ripgrep.enable = true;

  programs.bash = import ./bash;

  programs.git = {
    enable = true;
    settings = {
      user = {
        email = "tatumonar@proton.me";
        name = "tatumon";
      };
      init.defaultBranch = "main";
      core.editor = "nvim";
      alias.stashall = "stash --include-untracked";
    };
  };

  programs.rofi = import ./rofi pkgs;

  services.lorri.enable = true;

  services.swaync = import ./swaync;

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "tatumon";
  home.homeDirectory = "/home/tatumon";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    ################
    ### SOFTWARE ###
    ################
    trash-cli
    tldr
    fastfetch
    master.anytype

    ###############
    ### VIVALDI ###
    ###############
    (config.lib.nixGL.wrap (
      # vivaldi.override {
      #   proprietaryCodecs = true;
      #   enableWidevine = false;
      # }
      master.vivaldi.override {
        proprietaryCodecs = true;
        enableWidevine = false;
      }
    ))

    #######################
    ### UNFREE SOFTWARE ###
    #######################
    spotify
    discord
    pcloud

    #########################
    ### PROGRAMMING STUFF ###
    #########################
    asdf-vm # Extendable version manager
    opencode

    #############
    ### FONTS ###
    #############
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.iosevka
    nerd-fonts.departure-mono

    wallpapers
    sshy

    #! ATTENTION !#
    # Comment the packages bellow this line if you're planning on using a
    # desktop environment (e.g. GNOME, KDE, etc.)

    ################
    ### HYPRLAND ###
    ################
    hyprsunset # Dark light
    hypridle # Idle management
    hyprsysteminfo # System info
    hyprshot # Screenshots
    hyprpicker # hyprshot dependency

    ##############
    ### WAYBAR ###
    ##############
    waybar
    wttrbar # Weather
    waybar-module-pomodoro

    #########################
    ### DESKTOP UTILITIES ###
    #########################
    wlogout # Power menu
    rofi-themes # rofi themes
    easyeffects
    pcmanfm
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';

    "Pictures/Wallpapers".source = "${wallpapers}/wallpapers";
    ".todo/config".text = import ./todotxt/dotfile.nix;
    ".config/hypr".source = ./hyprland;
    ".config/waybar".source = ./waybar;
    ".config/wlogout".source = ./wlogout;
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/tatumon/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
