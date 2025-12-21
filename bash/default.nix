{
  enable = true;
  profileExtra = ''
    export GOPATH=$HOME/go

    # asdf
    export PATH="$PATH:$HOME/.asdf/shims"

    # Applications
    export PATH="$PATH:$HOME/Applications"

    # Go path
    export PATH="$PATH:$GOPATH/bin"
  '';
  bashrcExtra = ''
    tmux a || tmux
  '';
}
