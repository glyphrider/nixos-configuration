{
  description = "NixOS 23.11 Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        beast = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./configuration.nix
            ./amd-graphics-driver-configuration.nix
            ./beast-hardware-configuration.nix
            ./beast-network-configuration.nix
            ./beast-extra-filesystems-configuration.nix
            ./zfs-grub-configuration.nix
            ./nfs-mounts-configuration.nix
            ./users-brian.nix
          ];
        };
        pango = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./configuration.nix
            ./amd-graphics-driver-configuration.nix
            ./pango-hardware-configuration.nix
            ./pango-network-configuration.nix
            ./grub-configuration.nix
            ./nfs-mounts-configuration.nix
            ./users-brian.nix
          ];
        };
      };
    };
}
