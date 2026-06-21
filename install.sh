#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "$0")" && pwd)"
HOME="${HOME:-$HOME}"

echo "  Installing dotfiles from $DOTFILES"
echo ""

link() {
  local src="$1" dest="$2"
  mkdir -p "$(dirname "$dest")"
  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    echo "  WARN: $dest exists and is not a symlink — skipping"
    return
  fi
  ln -sf "$src" "$dest"
  echo "  LINK $dest -> $src"
}

# ── Shells ──────────────────────────────────────────────
link "$DOTFILES/zsh/.zshrc"                  "$HOME/.zshrc"
link "$DOTFILES/bash/.bashrc"                "$HOME/.bashrc"
link "$DOTFILES/bash/.bash_profile"          "$HOME/.bash_profile"
link "$DOTFILES/fish/config.fish"            "$HOME/.config/fish/config.fish"

# ── KDE Plasma 6 ────────────────────────────────────────
for f in "$DOTFILES/plasma/"*.rc "$DOTFILES/plasma/"*.json; do
  [ -f "$f" ] && link "$f" "$HOME/.config/$(basename "$f")"
done
[ -d "$DOTFILES/plasma/aurorae" ]      && link "$DOTFILES/plasma/aurorae"       "$HOME/.local/share/aurorae"
[ -d "$DOTFILES/plasma/desktoptheme" ]  && link "$DOTFILES/plasma/desktoptheme"  "$HOME/.local/share/plasma/desktoptheme"
[ -d "$DOTFILES/plasma/look-and-feel" ] && link "$DOTFILES/plasma/look-and-feel" "$HOME/.local/share/plasma/look-and-feel"
[ -d "$DOTFILES/plasma/konsole" ]       && link "$DOTFILES/plasma/konsole"       "$HOME/.local/share/konsole"

# SDDM
[ -f "$DOTFILES/plasma/sddm/sddm.conf" ] && sudo ln -sf "$DOTFILES/plasma/sddm/sddm.conf" /etc/sddm.conf
[ -d "$DOTFILES/plasma/sddm/sddm-astronaut-theme" ] && link "$DOTFILES/plasma/sddm/sddm-astronaut-theme" "$HOME/sddm-astronaut-theme"

# ── Themes / GTK / Icons / Kvantum ──────────────────────
link "$DOTFILES/themes/icons"             "$HOME/.icons"
link "$DOTFILES/themes/themes"            "$HOME/.themes"
link "$DOTFILES/themes/gtk-3.0"           "$HOME/.config/gtk-3.0"
link "$DOTFILES/themes/gtk-4.0"           "$HOME/.config/gtk-4.0"
link "$DOTFILES/themes/color-schemes"     "$HOME/.local/share/color-schemes"
link "$DOTFILES/themes/fontconfig"        "$HOME/.config/fontconfig"
[ -d "$DOTFILES/themes/Kvantum" ]         && link "$DOTFILES/themes/Kvantum"     "$HOME/.config/Kvantum"
[ -f "$DOTFILES/themes/gtkrc" ]           && link "$DOTFILES/themes/gtkrc"       "$HOME/.config/gtkrc"
[ -f "$DOTFILES/themes/gtkrc-2.0" ]       && link "$DOTFILES/themes/gtkrc-2.0"   "$HOME/.config/gtkrc-2.0"
[ -f "$DOTFILES/themes/.gtkrc-2.0" ]      && link "$DOTFILES/themes/.gtkrc-2.0"  "$HOME/.gtkrc-2.0"

# ── Hyprland ────────────────────────────────────────────
link "$DOTFILES/hyprland/hypr"            "$HOME/.config/hypr"

# ── Apps ────────────────────────────────────────────────
link "$DOTFILES/apps/dunst"               "$HOME/.config/dunst"
link "$DOTFILES/apps/rofi"                "$HOME/.config/rofi"
link "$DOTFILES/apps/fastfetch"           "$HOME/.config/fastfetch"
link "$DOTFILES/apps/neofetch"            "$HOME/.config/neofetch"
link "$DOTFILES/apps/kitty"               "$HOME/.config/kitty"
link "$DOTFILES/apps/ghostty"             "$HOME/.config/ghostty"
link "$DOTFILES/apps/cava"                "$HOME/.config/cava"
link "$DOTFILES/apps/mpv"                 "$HOME/.config/mpv"
link "$DOTFILES/apps/nvim"                "$HOME/.config/nvim"

# ── Misc ────────────────────────────────────────────────
[ -f "$DOTFILES/misc/.cmatrixrc" ] && link "$DOTFILES/misc/.cmatrixrc" "$HOME/.cmatrixrc"
[ -f "$DOTFILES/misc/.screenrc" ]  && link "$DOTFILES/misc/.screenrc"  "$HOME/.screenrc"
[ -f "$DOTFILES/misc/wallpaper.jpg" ] && link "$DOTFILES/misc/wallpaper.jpg" "$HOME/Pictures/wallpaper.jpg"

echo ""
echo "  Done! Restart your shell or run: source ~/.zshrc"
