{
  description = "My dev machine";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = { self, nixpkgs, nixos-hardware }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        thinkpad = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            nixos-hardware.nixosModules.lenovo-thinkpad-x1-carbon
            ./hosts/thinkpad
            ./modules/common.nix
          ];
        };

        virtualbox = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/virtualbox
            ./modules/common.nix
          ];
        };
      };
    };
}
