# system

Runs first: bootstraps base packages and the boot setup.

- Installs `system_base_packages` (git, curl, ca-certificates, build-essential,
  pkg-config, unzip) with a cache refresh, so the later roles can clone and
  build. Runs before every other role.
- Sets the default systemd target to `{{ system_boot_target }}` (via the
  `/etc/systemd/system/default.target` symlink that `systemctl set-default`
  creates); `graphical.target` starts GDM.
- Sets the console keyboard layout to `keyboard_layout` and bakes it into the
  initramfs, so the LUKS passphrase prompt uses it too.
- Strips `quiet` and `splash` from `GRUB_CMDLINE_LINUX_DEFAULT` in
  `/etc/default/grub` and runs `update-grub`, so kernel messages are visible and
  no vendor splash is shown. Idempotent — leaves any other cmdline params alone.

Vars: `system_base_packages`, `system_boot_target`, `system_grub_remove_params`.
