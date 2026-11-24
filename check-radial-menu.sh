#!/bin/bash
# Is the Radial Menu (jlc.radial-menu) ready for the dock to hand "apps" to?
#   0  installed, enabled and new enough
#   2  not installed
#   3  installed but disabled
#   4  older than the version that opens the Apps ring for `omarchy-menu toggle apps`
# Older menus send "apps" back to the dock, so the dock must not hand off to them.

min="${RADIAL_DOCK_MIN_MENU:-1.3.0}"
id="jlc.radial-menu"

info=$(omarchy plugin list --json 2>/dev/null | jq -c --arg id "$id" '.[] | select(.id == $id)')
[[ -n $info ]] || exit 2
[[ $(jq -r '.enabled' <<<"$info") == true ]] || exit 3

version=$(jq -r '.version // "0"' "$HOME/.config/omarchy/plugins/$id/manifest.json" 2>/dev/null)
[[ -n $version ]] || version=0
[[ $(printf '%s\n%s\n' "$min" "$version" | sort -V | head -n1) == "$min" ]] || exit 4
exit 0
