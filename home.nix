# Minimun nixpkgs version: 24.11
{ pkgs, config, ... }:

let
  nixvim = import (builtins.fetchGit {
    url = "https://github.com/nix-community/nixvim";
    ref = "nixos-24.11";
  });
in {
  nixGL.packages = import <nixgl> { inherit pkgs; };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };

  imports = [ nixvim.homeManagerModules.nixvim ];

  programs.nixvim = import ./nixvim pkgs;
  programs.kitty = import ./kitty {
    pkgs = pkgs;
    config = config;
  };
  programs.btop.enable = true;

  programs.tmux = import ./tmux pkgs;

  programs.starship = import ./starship { lib = pkgs.lib; };
  programs.zoxide.enable = true;
  programs.ripgrep.enable = true;
  programs.direnv.enable = true;

  programs.bash = {
    enable = true;
    bashrcExtra = ''
      eval "$(starship init bash)"
      eval "$(zoxide init bash)"
      eval "$(direnv hook bash)"

      tmux a || tmux
    '';
  };

  programs.git = {
    enable = true;
    userEmail = "tatumonar@proton.me";
    userName = "tatumon";
    extraConfig = {
      init.defaultBranch = "main";
      core.editor = "nvim";
      alias.stashall = "stash --include-untracked";
    };
  };

  services.lorri.enable = true;

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
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    rustup
    trash-cli
    spotify
    tldr
    ranger
    elixir_1_18

    flameshot
    (config.lib.nixGL.wrap brave)

    # FONTS
    nerd-fonts.gohufont
    nerd-fonts.jetbrains-mono
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

    ".todo/config".text = import ./todotxt/dotfile.nix;
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
