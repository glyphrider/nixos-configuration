{ config, lib, pkgs, ... }:

{
  nix.settings.allowed-users = [ "brian" ];
  
  users.users.brian = {
    description = "Brian H. Ward";
    createHome = true;
    home = "/home/brian";
    shell = pkgs.bash;
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "kvm" "input" "disk" "libvirtd" "wireshark" "adbusers" ];
    packages = with pkgs; [
    ];
  };
}
