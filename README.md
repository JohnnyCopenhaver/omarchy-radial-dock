# Radial Dock

Omarchy's dock, with one change: the app grid button (and **Super + Alt + Space**) opens the
[Radial Menu](https://github.com/JohnnyCopenhaver/omarchy-radial-menu)'s Apps ring instead of the
flat app grid. Pinned apps, running apps, drag to reorder, auto-hide and dock position all work
the same as the built-in dock.

In the Apps ring, right-click an app (or press Menu / Shift+F10) for **Keep in Dock** or
**Remove from Dock**.

## Requirements

- Omarchy with the built-in dock (`omarchy.dock`)
- The Radial Menu plugin (`jlc.radial-menu`) 1.3.0 or newer, enabled. **Install it first:**

  ```
  omarchy plugin add https://github.com/JohnnyCopenhaver/omarchy-radial-menu.git --enable
  ```

  If it is missing, disabled or too old, Radial Dock shows a notification when it loads with a
  button that installs, enables or updates it, and until then the app grid button opens
  Omarchy's normal app grid.

## Install

Install the Radial Menu first (see Requirements), then:

```
omarchy plugin add https://github.com/JohnnyCopenhaver/omarchy-radial-dock.git --enable
```

Enabling it replaces the built-in dock.

## Remove

```
omarchy plugin remove jlc.radial-dock
```

The built-in dock comes back.

## Keeping up with Omarchy

This plugin is a copy of Omarchy's `shell/plugins/dock`. Only `Dock.qml` (`openApps`, `radialNotice`, the
`radialCheck` process and timer, and the `apps` IPC call), `check-radial-menu.sh` and `manifest.json` differ, so a newer Omarchy dock
can be copied over and those parts re-applied.
