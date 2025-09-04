{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOs/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.simons-nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./configuration.nix];
    };
  };
}
