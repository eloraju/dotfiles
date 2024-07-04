{
  description = "jänkhä's flake";
  inputs = {
    nixpkgs.url = "nixpkgs/nixpkgs-unstable";
    home-manager-unstable.url = "github:nix-community/home-manager/master";
    home-manager-unstable.inputs.nixpkgs.follows = "nixpkgs";

    nixpkgs-stable.url = "nixpkgs/nixos-24.05";
    home-manager-stable.url = "github:nix-community/home-manager/release-23.11";
    home-manager-stable.inputs.nixpkgs.follows = "nixpkgs-stable";
  };

  outputs = inputs@{ self, ... }:
  let 
    userSettings = {
      personal = {
        username = "jänkhä";
      };

      work = {
        username = "juuso.elo-rauta";
      };
    };
  in {
    homeConfigurations = {
      test = inputs.home-manager-stable.lib.homeManagerConfiguration {
        pkgs = inputs.nixpkgs-stable.legacyPackages.aarch64-darwin; #nixpkgs.legacyPackages.aarch64-darwin;
        modules = [ ./home.nix ];
        extraSpecialArgs = {
          inherit userSettings;
        };
      };
    };
  };
}
