{ pkgs, config }:
# let
#  tokyo-night = pkgs.tmuxPlugins.mkTmuxPlugin {
#    pluginName = "tokyo-night";
#    src = pkgs.fetchFromGithub {
#      owner = "janoamaral";
#      repo = "tokyo-night-tmux";
#      rev = "master";
#    };
#  };
{
  enable = true;
  shortcut = "a";
  keyMode = "vi";
  terminal = "screen-256color";
  baseIndex = 1;
  clock24 = true;
  aggressiveResize = true;
  disableConfirmationPrompt = true;
  shell = "${pkgs.zsh}/bin/zsh";
  extraConfig = ''
    # set-default colorset-option -ga terminal-overrides ",xterm-256color:Tc"
    set -as terminal-features ",xterm-256color:RGB"
    #set-option -ga terminal-overrides ",xterm*:Tc"

    # switch widows alt+number
    bind-key -n M-1 select-window -t 1
    bind-key -n M-2 select-window -t 2
    bind-key -n M-3 select-window -t 3
    bind-key -n M-4 select-window -t 4
    bind-key -n M-5 select-window -t 5

    # floating window
    bind-key -n M-g if-shell -F '#{==:#{session_name},scratch}' {
      detach-client
    } {
      display-popup -E "tmux new-session -A -s scratch"
    }

    set -sg escape-time 0
    set -g status-interval 0
    set -g status-position top
  '';
  plugins = with pkgs.tmuxPlugins; [
    sensible
    yank
    vim-tmux-navigator
    {
      plugin = resurrect;
      extraConfig = ''
        set -g @resurrect-strategy-nvim 'session'
        #set -g @resurrect-save 'C-s'
        #set -g @resurrect-restore 'C-r'
      '';
    }
    {
      plugin = tokyo-night-tmux;
    #  extraConfig = ''
    #    # available plugins: battery, cpu-usage, git, gpu-usage, ram-usage, tmux-ram-usage, network, network-bandwidth, network-ping, ssh-session, attached-clients, network-vpn, weather, time, mpc, spotify-tui, playerctl, kubernetes-context, synchronize-panes
    #    set -g @dracula-plugins "cpu-usage ram-usage time"
    #    set -g @dracula-show-powerline true
    #    set -g @dracula-show-timezone false
    #    set -g @dracula-show-left-icon session
    #  '';
    }
  ];
}
