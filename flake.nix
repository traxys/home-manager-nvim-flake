{
  description = "Home manager neovim environnement";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    naersk.url = "github:nix-community/naersk";
    stylua = {
      url = "github:johnnymorganz/stylua";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, flake-utils, ... }@inputs: flake-utils.lib.eachDefaultSystem (system:
    let
      naersk-lib = inputs.naersk.lib."${system}";
    in
    {
      home-managerModule = { config, lib, pkgs, ... }: {
        home.packages = with pkgs; [
          rust-analyzer
          clang-tools
          nodePackages.bash-language-server
          rnix-lsp
          nixpkgs-fmt
          (naersk-lib.buildPackage {
            pname = "stylua";
            root = inputs.stylua;
          })
          shellcheck
          ripgrep
        ];

        home.sessionVariables.EDITOR = "nvim";
      };
    });
}
