{
  description = "Top level NixOS Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    alacritty-theme.url = "github:alexghr/alacritty-theme.nix";
    nixvim = {
      url = "github:nix-community/nixvim";
      #url = "path:/home/jguevara/nix-neovim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, alacritty-theme, nixvim, ... }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      overlays = [ alacritty-theme.overlays.default ];
    };
  in {
   homeConfigurations = {
     jguevara = home-manager.lib.homeManagerConfiguration {
       inherit pkgs;
       modules = [ 
         ./home
         nixvim.homeManagerModules.nixvim
       ];
     };
   };
  };
}
