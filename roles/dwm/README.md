# dwm

Builds dwm from **pinned upstream** (`dwm_version`), applies the vendored
patches in `dwm_patches` order, deploys `files/config.h`, then builds/installs
to `/usr/local`. No fork — the patches + config live here.

- `files/pertag-grid.patch`: per-tag layout/mfact/nmaster/bar state + a grid layout.
- `files/fullscreen-focus.patch`: with `lockfullscreen`, a newly mapped window
  does not take focus from a fullscreen client (Chrome drops page fullscreen
  when its own "Press Esc" hint window gets focus).

To change the config: edit `files/config.h`. To evolve the C patch: apply it to
a checkout, edit, regenerate the diff, and bump `dwm_version` if you rebased onto
newer upstream.
