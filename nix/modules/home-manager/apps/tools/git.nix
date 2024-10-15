{ inputs, lib, config, pkgs, ... }:

{
  home.packages = with pkgs; [ lazygit ];
  programs.git = {
    enable = true;
    userName = "Jonathan Guevara";
    extraConfig = {
      pull.rebase = false;
      init.defaultBranch = "main";
    };
  };
}
