{ pkgs }:

{
  enable = true;
  settings = {
    # https://github.com/alacritty/alacritty-theme
    general = {
      import = with pkgs; [ alacritty-theme.tokyo-night ];
    };
    env.TERM = "xterm-256color";
    font = {
      normal.family = "IosevkaTerm NFM";
      size = 18;
    };
    window = {
      opacity = 0.95;
    };
  };
}
