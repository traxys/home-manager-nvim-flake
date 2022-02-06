# Neovim in Home-Manager

Neovim from [traxys/nvim-flake](https://github.com/traxys/nvim-flake) with the programs it depends on, as a home-manager module.

## Usage

Add the `hm-nvim` input. You can then add `inputs.hm-nvim.overlay."${system}"` to nixpkg overlays and import the `inputs.hm-nvim.home-manageModule."${system}"` in your home-manager configuration.
