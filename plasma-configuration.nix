{ config, lib, pkgs, ... }:

{
  services = {
    xserver.enable = true;
    xserver.displayManager.sddm.enable  = true;
    desktopManager.plasma6.enable = true;
  };
}
