{ config, lib, pkgs, ... }:
{
  fileSystems = {
    "/home/brian/Games" = {
      depends = [ "/" "/home" ];
      device = "/dev/disk/by-uuid/d1a11a3d-52f2-4f88-bef5-c1abcb68c56f";
    };
#    "/var/lib/libvirt" = {
#      depends = [ "/" "/var" ];
#      device = "/dev/disk/by-uuid/3ec5b0fb-b766-40e4-982e-fd948fe52495";
#    };
  };
}
