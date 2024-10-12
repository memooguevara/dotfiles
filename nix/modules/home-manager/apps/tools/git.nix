{ inputs, lib, config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Jonathan Guevara";
    extraConfig = {
      pull.rebase = false;
      init.defaultBranch = "main";
    };
  };
}
