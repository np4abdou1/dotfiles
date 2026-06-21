<img src="https://img.shields.io/badge/OS-Arch_Linux-1793D1?style=for-the-badge&logo=arch-linux&logoColor=white"/>
<img src="https://img.shields.io/badge/DE-KDE_Plasma_6-3DAEEF?style=for-the-badge&logo=kde&logoColor=white"/>
<img src="https://img.shields.io/badge/WM-Hyprland-8A2BE2?style=for-the-badge&logo=hyprland&logoColor=white"/>

---

# `dotfiles` — np4abdou1

My **Arch Linux** + **KDE Plasma 6** + **Hyprland** configuration. Warm gold/olive on dark — the *Jux* theme.

---

##  Quick Start

```bash
git clone https://github.com/np4abdou1/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

Then install required packages:

```bash
# KDE Plasma 6
sudo pacman -S plasma-meta kde-applications-meta sddm

# Hyprland
sudo pacman -S hyprland hyprlock hypridle hyprpaper dunst rofi waybar

# Terminal
sudo pacman -S kitty fish eza bat fastfetch neofetch

# Fonts
sudo pacman -S ttf-jetbrains-mono-nerd noto-fonts noto-fonts-arabic

# Other
sudo pacman -S mpv cava cmatrix kvantum
```

---

##  Structure

```
dotfiles/
├── zsh/                    # ZSH + oh-my-zsh
│   ├── .zshrc              # Aliases, env, plugins, colors
│   └── .oh-my-zsh/         # Framework (theme: duellj)
├── bash/                   # Fallback bash configs
│   ├── .bashrc
│   └── .bash_profile
├── fish/                   # Fish shell (daily driver)
│   └── config.fish         # bobthefish theme, aliases, abbrs
├── plasma/                 # KDE Plasma 6
│   ├── kdeglobals          # Global color scheme & theme
│   ├── kwinrc              # KWin: Aurorae JuxDeco decoration
│   ├── kglobalshortcutsrc  # Custom key binds
│   ├── kscreenlockerrc     # Lockscreen settings
│   ├── kcminputrc          # Touchpad, mouse, keyboard
│   ├── dolphinrc           # Dolphin file manager
│   ├── konsolerc           # Konsole terminal
│   ├── katerc              # Kate editor
│   ├── kwinoutputconfig.json  # Dual-monitor layout
│   ├── kwinrulesrc         # KWin window rules
│   ├── aurorae/JuxDeco/    #  Aurorae window decoration
│   ├── desktoptheme/JuxPlasma/ #  Plasma desktop theme
│   ├── look-and-feel/      #  Look-and-feel packages
│   ├── plasmoids/          #  Third-party widgets
│   ├── konsole/            #  Konsole profiles & color schemes
│   └── sddm/               #  SDDM astronaut theme
├── themes/                 # Visual theming
│   ├── icons/              # McMojave-cursors, Obsidian, WhiteSur
│   ├── themes/             # GTK theme: Catppuccin-Mocha-Sapphire
│   ├── Kvantum/            # Kvantum: NoMansSkyJux
│   ├── gtk-3.0/            # GTK3 settings & CSS
│   ├── gtk-4.0/            # GTK4 settings & CSS
│   ├── color-schemes/      # 12+ KDE color schemes
│   ├── fontconfig/         # Font rendering & Arabic fallback
│   ├── gtkrc, gtkrc-2.0   # Legacy GTK configs
│   └── Mystical-Blue-Theme/ # Source theme archive
├── hyprland/               # Hyprland (alternate WM)
│   └── hypr/
│       ├── hyprland.conf   # Main config, monitor, animations
│       ├── keybinds.conf   # Super+X kitty, Super+D rofi, etc.
│       ├── window.conf     # Window rules
│       ├── hyprlock.conf   # Lockscreen UI
│       ├── hypridle.conf   # Auto-lock/suspend timings
│       └── hyprpaper.conf  # Wallpaper
├── apps/                   # Application configs
│   ├── dunst/              # Notification daemon
│   ├── rofi/               # App launcher
│   ├── fastfetch/          # System fetch (replaces neofetch)
│   ├── neofetch/           # Legacy system fetch
│   ├── kitty/              # GPU-accelerated terminal
│   ├── ghostty/            # Modern terminal emulator
│   ├── cava/               # Audio visualizer
│   ├── mpv/                # Media player
│   └── nvim/               # LazyVim-based Neovim
├── fonts/                  # Font installation
├── misc/
│   ├── bfetch/             # Custom C fetch tool
│   ├── .cmatrixrc          # Matrix screensaver
│   ├── .screenrc           # Terminal multiplexer
│   └── wallpaper.jpg       # Yuji + Choso wallpaper
├── install.sh              # One-command symlink setup
├── .gitignore
└── README.md
```

---

##  Color Palette

```
 Gold     #DFC86D  rgb(223,200,109)  — accents, highlights
 Olive    #A49355  rgb(164,147,85)   — secondary, file extensions
 Beige    #B4B4B0  rgb(180,180,176)  — foreground text
 Dark     #202020  rgb(32,32,32)     — background
 Muted    #595237  rgb(89,82,55)     — selection, less prominent
```

---

##  What Goes Where

### KDE Plasma 6

| Setting | File | Location |
|---------|------|----------|
| Color scheme | `kdeglobals` | `~/.config/` |
| Window decoration | `kwinrc` | `~/.config/` |
| Aurorae theme | `JuxDeco/` | `~/.local/share/aurorae/themes/` |
| Plasma theme | `JuxPlasma/` | `~/.local/share/plasma/desktoptheme/` |
| Look & feel | `archsimpleblue` + custom | `~/.local/share/plasma/look-and-feel/` |
| Widgets | `plasmoids/` | `~/.local/share/plasma/plasmoids/` |
| Shortcuts | `kglobalshortcutsrc` | `~/.config/` |
| Monitor layout | `kwinoutputconfig.json` | `~/.config/` |
| Input devices | `kcminputrc` | `~/.config/` |
| Screen locker | `kscreenlockerrc` | `~/.config/` |
| SDDM theme | `sddm-astronaut-theme` | `~/sddm-astronaut-theme/` |

### Hyprland

| Config | Purpose |
|--------|---------|
| `hyprland.conf` | Monitor (1920x1080@60, scale 1.5), gaps, borders, input |
| `keybinds.conf` | Super+X kitty, Super+D rofi, Super+Q kill, volume/brightness |
| `window.conf` | Window rules & tiling |
| `hyprlock.conf` | Lockscreen with time, password field |
| `hypridle.conf` | Lock after 5min, DPMS off after 5:30, suspend after 10min |
| `hyprpaper.conf` | Wallpaper |

### Shells

**Fish** (daily driver):
- bobthefish theme with powerline + nerd fonts
- `eza`, `bat` aliases, git abbreviations
- custom `cmatrix` and `tgpt` wrapper functions
- Custom syntax highlighting colors

**ZSH** (fallback):
- oh-my-zsh with `duellj` theme
- Plugins: git, sudo, command-not-found, colored-man-pages, extract, fzf
- zsh-autosuggestions + zsh-syntax-highlighting

### Applications

| App | Config | Highlights |
|-----|--------|------------|
| **Kitty** | `kitty.conf` | JetBrainsMono Nerd Font 13px, custom Jux colors, 85% opacity |
| **Ghostty** | `ghostty/config` | Dark theme, block cursor, no ligatures |
| **Dunst** | `dunstrc` | Top-right, blue accent, JetBrainsMono, corner radius 0 |
| **Rofi** | `config.rasi` | App launcher (Super+D in Hyprland) |
| **Fastfetch** | `config.jsonc` | Gold/beige colors, Nerd Font icons, Arch logo |
| **MPV** | `mpv.conf` | VAAPI hwdec, large cache |
| **Cava** | `config` | Audio visualizer |
| **Neovim** | `nvim/` | LazyVim-based |

### Fonts

130+ fonts in `~/.local/share/fonts/`:
- **IBM Plex** — full family: Mono, Sans, Condensed, Serif, Arabic, JP, KR, TC, Thai, Devanagari, Hebrew
- **SF Arabic** — Arabic UI text
- JetBrainsMono Nerd Font (terminal)

---

## 🔐 What's NOT included

These are excluded for security or reproducibility reasons:

- `~/.ssh/`, `~/.git-credentials` — SSH keys & tokens
- `~/.claude.json`, `~/.claude/` — API keys
- Browser profiles (Chrome, Brave, Firefox) — use browser sync
- `.zsh_history`, `.bash_history` — session history
- `.cache/`, `.bun/`, `.npm/`, `.cargo/` — rebuilt on install
- `.zcompdump*` — regenerated automatically
- VS Code settings — use Settings Sync

---

## 📦 Packages to Install

### AUR helper (required)
```bash
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si
```

### Must-have
```bash
# Core
sudo pacman -S kitty fish eza bat fastfetch neofetch mpv cava cmatrix rofi dunst

# Fonts
sudo pacman -S ttf-jetbrains-mono-nerd noto-fonts noto-fonts-arabic

# AUR
yay -S ghostty
```

---

##  Showcase

<video src="https://github.com/np4abdou1/dotfiles/raw/main/media/showcase.mp4" controls width="100%">
  Your browser doesn't support HTML5 video.
  <a href="https://github.com/np4abdou1/dotfiles/raw/main/media/showcase.mp4">Download MP4</a>
</video>

---

## 📝 Credits

- **[Catppuccin Mocha](https://github.com/catppuccin/catppuccin)** — GTK theme
- **[SDDM Astronaut](https://github.com/Keyitdev/sddm-astronaut-theme)** — Login theme
- **[Mystical Blue Theme](https://github.com/vinceliuice/Mystical-Blue-Theme)** — Original source inspiration for Jux
- **[oh-my-zsh](https://ohmyz.sh/)** — ZSH framework
- **[LazyVim](https://www.lazyvim.org/)** — Neovim distribution

---

## 📄 License

MIT
