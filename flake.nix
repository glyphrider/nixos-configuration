{
  description = "NixOS 23.11 Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations.beast = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
          ./amd-graphics-drivers.nix
          ./beast-network.nix
          ./beast-filesystems.nix
          ./zfs-grub-configuration.nix
          ./nfs-mounts.nix
          ./users-brian.nix
        ];
      };
    };
}
