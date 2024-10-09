{ pkgs }:

{
  enable = true;
  package = pkgs.wezterm;
  enableZshIntegration = true;
  extraConfig = ''
    local wezterm = require 'wezterm'
    return {
      font = wezterm.font_with_fallback {
	"IosevkaTerm NFM",
      },
      font_size = 18,
      color_scheme = "Tokyo Night",
      audible_bell = "Disabled",
      window_decorations = "RESIZE",
      window_padding = {
        left = 2,
	right = 2,
	top = 4,
	bottom = 0,
      },
      window_background_opacity = 0.8,
      hide_tab_bar_if_only_one_tab = true,
      --Error "Unable to spawn ... No available candidates found in PATH ..."
      --default_prog = { "zsh", "--login", "-c", "tmux new session -A Main" },
    }
  '';
}
