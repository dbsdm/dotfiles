# Installation
Run right after clean Arch Linux installation, as user.
```bash
./install.sh
```
# Desktop Environments and Window Managers
Script will ask you which DE or WM should be installed.
<br/>After ```install.sh``` will finish installing essential packages and performing basic configurations, desktop specific ```install.sh``` will be launched:
```
dotfiles/desktops/{desktop_name}/install.sh
```
This script will perform configuration required for specific desktop (installing additional dependencies, configuring conky, dunst, etc.).
### Adding new DE or WM
To add new configuration:
1. Create directory under 'desktops' (name of this dir will be displayed as name of configuration)
2. Place all files related to new DE or WM in created directory (pacman.txt with packages, conky, dunst, etc.)
3. Create 'install.sh' file with necessary configuration (run pacman, link configs)

New configuration will be automatically picked up and offered during installation.

# Available configurations
### i3gaps
Theme: Dracula
Font: Jet Brains Mono Nerd Font
Environment: rofi, polybar, dunst, conky
### dwm
Theme: Dracula
Font: Jet Brains Mono Nerd Font
Environment: dmenu, slstatus, dunst, conky
