{ inputs, lib, config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    profiles = {
      jguevara = {
        bookmarks = [
          {
            name = "Wikipedia";
            tags = [ "wiki" ];
            keyword = "wiki";
            url = "https://wikipedia.org";
          }
        ];
        settings = {
          "dom.security.https_only_mode" = true;
          "browser.download.panel.shown" = true;
          # Disable fx accounts
          "identity.fxaccounts.enabled" = false;
          # Disable "save password" prompt
          "signon.rememberSignons" = false;
        };
        extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
          bitwarden
          ublock-origin
        ];
      };
    };
  };
}
