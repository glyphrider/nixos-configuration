{ config, lib, pkgs, ... }:

{
  networking.hostName = "beast"; # Define your hostname.
  networking.hostId = "d955bd6b";

  networking.networkmanager.enable = false;  # Easiest to use and most distros use this by default.

  networking.useNetworkd = true;

  systemd.network = {
    enable = true;
    netdevs = {
      "10-br0" = {
        netdevConfig = {
          Name = "br0";
          Kind = "bridge";
          MACAddress = "B6:86:EA:F0:DE:2E";
        };
      };
    };
    networks = {
      "20-br0-bind" = {
        matchConfig.Name = "enp39s0";
        networkConfig.Bridge = "br0";
      };
      "30-br0-ip" = {
        matchConfig.Name = "br0";
        networkConfig = {
          DHCP = "ipv4";
          IPForward = "yes";
          MulticastDNS = "yes";
        };
        dhcpV4Config = {
          UseDNS = "yes";
          UseDomains = "yes";
        };
      };
    };
  };
}
