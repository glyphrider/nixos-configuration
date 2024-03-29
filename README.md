# Bootstrapping my nixos-configuration

Acquire the [minimal installer](https://channels.nixos.org/nixos-23.11/latest-nixos-minimal-x86_64-linux.iso) from NixOS.

Burn that to something bootable (CD,DVD,USB) and reboot the computer with that.

Get on the network. Wired is easy, wireless means wpa_supplicant.

Repartition the disk to your liking. I use ZFS on my desktop (beast) and BTRFS on my laptop (pango).
So those are good examples for setting up that kind of thing.

I have more examples on this [blog post](https://wardtalks.com/posts/nixos/).

After the partitioning, and formatting (with mkfs), and mounting... it's time for the magic.
In this example, I'm using the configuration from my pango machine.
The use of pango in filenames and command-line arguments would changed to suit your needs.
However, for machines that aren't in _my list_, you would need to create additional configurations in flake.nix.

```
nix-shell -p efibootmgr git
git clone https://github.com/glyphrider/nixos-configuration /mnt/etc/nixos
nixos-generate-config --root /mnt
cp /mnt/etc/nixos/hardware-configuration.nix /mnt/etc/nixos/pango-hardware-configuration.nix
```

At this point I stop and use `efibootmgr` to remove **everything** from my EFI.
The _general_ pattern is to run `efibootmgr` (with no args) to get a list of existing bootable thingies.
Then run `efibootmgr -b <id> -B` for the id of each bootable thingie..
The relevant stuff will reappear after a boot, but cruft left behind can cause problems.

After that, it's time to install!

```
nixos-install --flake /mnt/etc/nixos#pango
```

This takes a few minutes (~10 for me).
At the end of the installation you will be asked to set a root password;
this way, the root password needn't appear in the configuration file.
The unprivileged user created by the configuration will **not** have an initial password;
that account will be locked.
After the reboot, you can login as root and set the password for the unprivileged user.

**NOW**, you can reboot.
