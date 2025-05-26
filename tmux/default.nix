pkgs: {
  enable = true;
  keyMode = "vi";
  plugins = with pkgs.tmuxPlugins; [
    {
      plugin = dracula;
      extraConfig = ''
        set -g @dracula-plugins "time"
        set -g @dracula-time-format "%d/%m/%Y %H:%M"
      '';
    }
    { plugin = sensible; }
    {
      plugin = resurrect;
      extraConfig = ''
        set -g @resurrect-strategy-nvim 'session'
        set -g @resurrect-capture-pane-contents 'off'
      '';
    }
    {
      plugin = continuum;
      extraConfig = ''
        set -g @continuum-restore 'on'
        set -g @continuum-save-interval '0'
        set -g @continuum-save 'off'
        set -g @continuum-boot 'on'
      '';
    }
  ];
  extraConfig = ''
    setw -g mouse on

    set -g base-index 1
    setw -g pane-base-index 1
    set -g repeat-time 1000

    # moving between panes with vim movement keys
    bind h select-pane -L
    bind j select-pane -D
    bind k select-pane -U
    bind l select-pane -R

    # resize the pane
    bind-key -r J resize-pane -D 3
    bind-key -r K resize-pane -U 3
    bind-key -r H resize-pane -L 3
    bind-key -r L resize-pane -R 3
  '';
}
