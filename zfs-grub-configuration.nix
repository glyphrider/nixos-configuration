{ config, lib, pkgs, ... }:

{
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = false;
  boot.loader.grub = {
    enable = true;
    zfsSupport = true;
    efiSupport = true;
    efiInstallAsRemovable = true;
    mirroredBoots = [
      { devices = [ "nodev" ]; path = "/boot"; }
    ];
  };
  boot.loader.efi.canTouchEfiVariables = false;
  # boot.plymouth.enable = true;

  # Need to setup a random host id with
  # :r !cut -c4 /dev/urandom | od -A none -t x4
  # networking.hostId = 
}

