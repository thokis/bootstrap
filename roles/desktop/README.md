# desktop

The X session glue that ties the dwm/st/dmenu/slstatus/xsecurelock roles
together. Run those first — this role assumes their binaries are installed.

Deploys:
- `~/.xinitrc` (templated: wallpaper via `desktop_wallpaper`) — starts feh,
  slstatus, picom, idle-manager, xss-lock and runs dwm on the
  systemd `--user` bus (so gnome-keyring/portal/ssh-agent resolve instantly).
- Dotfiles: `~/.Xresources`, `~/.config/picom.conf`,
  `~/.config/xdg-desktop-portal/portals.conf` (forces the GTK backend),
  `~/.icons/default/index.theme` (Adwaita cursor).
- `/etc/X11/xorg.conf.d/40-libinput-touchpad.conf` (tap-to-click, natural
  scroll).
- Helper scripts to `~/.local/bin`: `lockscreen`, `idle-manager`, `netstatus`,
  `google-chrome` (scales Chrome to 0.9), `screenshot`.
- CaskaydiaCove Nerd Font (`desktop_font_version`).
- feh as default image viewer in `~/.config/mimeapps.list` (`desktop_image_viewer`
  / `desktop_image_mimes`), so `xdg-open` and nnn's Enter open images in feh.
- zathura as default PDF viewer (`desktop_pdf_viewer`).

`lockscreen` runs upstream xsecurelock (built by the `xsecurelock` role): plain
black background + password prompt, no blurred backdrop.

Note: several scripts are tuned to a Framework 13 AMD (`k10temp`, `amdgpu_bl1`,
`ACAD`, `wlp1s0`, `BAT1`) — adjust for other hardware.

Vars: see `defaults/main.yml`.
