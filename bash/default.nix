{
  enable = true;
  profileExtra = ''
    # asdf
    export PATH="$PATH:$HOME/.asdf/shims"

    # Applications
    export PATH="$PATH:$HOME/Applications"
  '';
  bashrcExtra = ''
    tmux a || tmux
  '';
}
