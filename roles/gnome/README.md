# gnome

Stock Ubuntu GNOME (Wayland) session, and removal of what the former startx +
dwm setup left behind. Pair with the `system` role booting to
`graphical.target`, so GDM starts.

- Installs `gnome_packages` (`ubuntu-desktop-minimal`, keyring, gcr4, GNOME
  portal) and removes `picom`.
- GDM: links `display-manager.service` → `gdm3.service` (what gdm3's postinst
  does; the dwm setup had removed it), `WaylandEnable=true` in
  `/etc/gdm3/custom.conf`.
- Keyring: unlocked by GDM's own PAM stack; drops the tty-login
  `pam_gnome_keyring` hooks from `/etc/pam.d/login`.
- SSH: stock gnome-keyring agent (`SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/keyring/ssh`);
  unmasks the per-user `gcr-ssh-agent.socket` mask the dwm setup added;
  `AddKeysToAgent yes` (+ GitLab key for stations) in `~/.ssh/config`.
- Deletes `gnome_dwm_leftovers` (`.xinitrc`, forced GTK `portals.conf`, Chrome
  scale wrapper, `.Xresources`, helper scripts, Xorg touchpad snippet) and the
  feh/zathura `mimeapps.list` defaults, so GNOME's viewers take over.
- dconf `gnome_settings`: keyboard layout from `keyboard_layout`, tap-to-click,
  natural scroll, fractional scaling.

Not removed: binaries built into `/usr/local` by the former dwm/st/dmenu/
slstatus/xsecurelock roles — unused, delete by hand if wanted.

Log out and back in (or reboot) after the first run.

Verify:
```bash
systemctl get-default                       # graphical.target
systemctl is-active display-manager         # active
echo $SSH_AUTH_SOCK                         # /run/user/<uid>/keyring/ssh
busctl --user list | grep secrets           # org.freedesktop.secrets
```
