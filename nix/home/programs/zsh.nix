{ pkgs }:
{
  enable = true;
  history = {
    size = 10000;
  };
  enableCompletion = true;
  autosuggestion.enable = true;
  syntaxHighlighting.enable = true;
  #defaultKeymap = "viins";
  initExtra = ''
    #VI_MODE_SET_CURSOR=true
    #VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true

    if [[ $- == *i* ]] && [[ $TMUX == "" ]] && [[ -t 1 ]]; then
      exec tmux
    fi
  '';
#  zplug = {
#    enable = true;
#    plugins = [
#      { name = "dracula/zsh"; tags = ["as:theme"]; }
#      { name = "plugins/git"; tags = [from:oh-my-zsh]; }
#      { name = "plugins/command-not-found"; tags = [from:oh-my-zsh]; }
#      { name = "plugins/pj"; tags = [from:oh-my-zsh]; }
#      #{ name = "plugins/vi-mode"; tags = [from:oh-my-zsh]; }
#    ];
#  };
  oh-my-zsh = {
    enable = true;
    plugins = [
      "git"
      "pj"
      "command-not-found"
    ];
    theme = "af-magic";
    extraConfig = ''
    '';
  };
  shellAliases = {
    lg = "lazygit";
    ls = "ls --color";
  };
}
