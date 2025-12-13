{
  description = "Home env";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    claude-code.url = "git+ssh://git@github.com/da-moon/flakes.git?dir=claude-code";
    codex.url = "git+ssh://git@github.com/da-moon/flakes.git?dir=codex";
    beads.url = "git+ssh://git@github.com/da-moon/flakes.git?dir=beads";
    goose-cli.url = "git+ssh://git@github.com/da-moon/flakes.git?dir=goose-cli";
  };

  outputs = { self, ... }@inputs:
    let
      inherit (inputs) nixpkgs nixpkgs-unstable home-manager;

      # Prefer the system the flake is evaluated on; fall back to linux if unset.
      system = let s = builtins.currentSystem or ""; in if s == "" then "x86_64-linux" else s;

      # Same idea for user/home – use environment when available to avoid hard-coding.
      user = let u = builtins.getEnv "USER"; in if u == "" then "ubuntu" else u;
      homeDir = let h = builtins.getEnv "HOME"; in if h == "" then "/home/${user}" else h;

      # Allow HM to use nixpkgs for the current system.
      pkgs = import nixpkgs { inherit system; };
      pkgsUnstable = import nixpkgs-unstable { inherit system; };

      # Use the latest dockerfile language server from unstable.
      dockerfileLS = pkgsUnstable.dockerfile-language-server;
    in {
      # Attribute must match what `home-manager switch --flake .#<name>` expects
      homeConfigurations."${user}" =
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [{
            home.username = user;
            home.homeDirectory = homeDir;
            home.stateVersion = "24.11"; # set once
            programs.home-manager.enable = true;
            home.packages = [
              inputs.claude-code.packages.${system}.claude-code
              inputs.codex.packages.${system}.codex
              inputs.beads.packages.${system}.beads
              inputs.goose-cli.packages.${system}.goose-cli
              pkgs.biome
              dockerfileLS
              pkgs.earthly
              pkgsUnstable.gemini-cli-bin
              pkgs.nixfmt
              pkgs.vtsls
              pkgs.nodejs
              pkgs.nodePackages_latest.bash-language-server
              pkgs.nodePackages_latest.prettier
              pkgs.bun
              pkgs.uv
              pkgs.deno
            ];

          }];
        };
    };
}
# NOTE: activate with a command like the following
# nix run home-manager/release-24.11 -- switch --flake ~/.config/home-manager#${USER}
