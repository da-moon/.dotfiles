{
  description = "Home env";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    claude-code.url = "git+ssh://git@github.com/da-moon/flakes.git?dir=claude-code";
    codex.url = "git+ssh://git@github.com/da-moon/flakes.git?dir=codex";
    kimi-cli.url = "git+ssh://git@github.com/da-moon/flakes.git?dir=kimi-cli";
    qmd.url = "git+ssh://git@github.com/da-moon/flakes.git?dir=qmd";

    beads.url = "git+ssh://git@github.com/da-moon/flakes.git?dir=beads";
    gemini-cli.url = "git+ssh://git@github.com/da-moon/flakes.git?dir=gemini-cli";

    goose-cli.url = "git+ssh://git@github.com/da-moon/flakes.git?dir=goose-cli";
    goose-cli.inputs.nixpkgs.follows = "nixpkgs";
    

  };

  outputs = { self, ... }@inputs:
    let
      inherit (inputs) nixpkgs nixpkgs-unstable home-manager;

      system = builtins.currentSystem;
      user = builtins.getEnv "USER";
      # Allow HM to use nixpkgs for the current system.
      pkgs = import nixpkgs { inherit system; };
      pkgsUnstable = import nixpkgs-unstable { inherit system; };

      playwrightBrowsers = pkgs.playwright-driver.browsers;
    in {
      # Attribute must match what `home-manager switch --flake .#<name>` expects
      homeConfigurations."${user}" =
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [{
            home.username = user;
            home.homeDirectory = "/home/${user}";

            home.stateVersion = "24.11"; # set once
            programs.home-manager.enable = true;
            home.packages = [
              inputs.claude-code.packages.${system}.claude-code
              inputs.codex.packages.${system}.codex
              inputs.beads.packages.${system}.beads
              inputs.kimi-cli.packages.${system}.kimi-cli
              inputs.gemini-cli.packages.${system}.gemini-cli

              inputs.qmd.packages.${system}.qmd
              # inputs.goose-cli.packages.${system}.goose-cli
              pkgs.biome
              pkgs.dockerfile-language-server
              pkgs.playwright-mcp
              playwrightBrowsers
              pkgs.earthly
              pkgs.nixfmt
              pkgs.vtsls
              pkgs.nodejs
              pkgs.nodePackages_latest.bash-language-server
              pkgs.nodePackages_latest.prettier
              pkgs.bun
              pkgs.uv
              pkgs.deno
              pkgs.ttdl
              pkgs.zellij
              pkgs.keybase
              pkgs.sops
              pkgs.zoxide
              pkgs.dolt
            ];

            # Make sure Playwright uses the Nix-provided browser bundle.
            home.sessionVariables = {
              PLAYWRIGHT_BROWSERS_PATH = "${playwrightBrowsers}";
              PLAYWRIGHT_SKIP_VALIDATE_HOST_REQUIREMENTS = "1";
            };

          }];
        };
    };
}
# NOTE: activate with a command like the following
# nix run home-manager/release-24.11 -- switch --flake --impure  ~/.config/home-manager#${USER}
# cd ~/.config/home-manager && nix flake update && home-manager switch --flake --impure .#${USER}

# NOTE: update lockfiles first before usign the switch command
# nix flake update

# NOTE: update individual inputs
# nix flake lock --update-input claude-code --update-input codex

# NOTE: update everything except certain inputs
# nix flake update --override-input nixpkgs nixpkgs

# NOTE: List installed packages
# nix-env -q

# NOTE: Uninstall a package
# nix-env -e gemini-cli-bin

# NOTE: Get upstream version
# nix eval nixpkgs#<package>.version

# NOTE: Get all metadata
# nix eval nixpkgs#<package>.meta.description --raw
# nix eval nixpkgs#<package>.meta.homepage --raw

# NOTE: Search for packages
# nix search nixpkgs <query>

# NOTE: Fetch latest nixpkgs-unstable directly
# nix eval github:NixOS/nixpkgs/nixpkgs-unstable#gemini-cli.version

# NOTE: Update your local flake registry
# nix registry pin nixpkgs github:NixOS/nixpkgs/nixpkgs-unstable
