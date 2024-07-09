{
  description = "jänkhä's flake";
  inputs = {
    nixpkgs-unstable.url = "nixpkgs/nixpkgs-unstable";
    nixpkgs.url = "nixpkgs/nixos-24.05";

    home-manager-unstable = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs@{ self, home-manager, nixpkgs, ... }:
    let
      userSettings = {
        username = "juuso.elo-rauta";
        stateVersion = "24.05";
      };

      # pkgs = import nixpkgs {
      #   system = "aarch64-darwin";
      #   config = {
      #     allowUnfree = true;
      #     allowUnfreePredicate = (_:true);
      #   };
      # };
    in
    {
      homeConfigurations = {
        mac = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.aarch64-darwin;
          modules = [ ./mac/home.nix ];
          extraSpecialArgs = {
            inherit userSettings;
          };
        };
      };
    };
}
