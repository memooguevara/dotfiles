{ config }:
{
  enable = true;
  userName = "Jonathan Guevara";
  extraConfig = {
    pull = {
      rebase = true;
    };
    init = {
      defaultBranch = "main";
    };
  };
}
