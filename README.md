# Installation
Run right after clean Arch Linux installation, as user.
```bash
./install.sh
```
# Desktop Environments and Window Managers
By default [ly](https://github.com/fairyglade/ly) used as desktop manager.
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
### i3
**Theme:** Pure Black (zazen fork)<br/>
**Font:** Jet Brains Mono Nerd Font<br/>
**Environment:** rofi, polybar, dunst, conky<br/>

### dwm
**Theme:** Pure Black (zazen fork)<br/>
**Font:** Jet Brains Mono Nerd Font<br/>
**Environment:** dmenu, slstatus, dunst, conky<br/>
**Applied patches:**
1. [Actual fulscreen](https://dwm.suckless.org/patches/actualfullscreen/)
2. [Adjacent tag, skip vacant](https://dwm.suckless.org/patches/adjacenttag/)
3. [Always center](https://dwm.suckless.org/patches/alwayscenter/)
4. [Attach aside](https://dwm.suckless.org/patches/attachaside/)
5. [Bar height](https://dwm.suckless.org/patches/bar_height/)
6. [Cool autostart](https://dwm.suckless.org/patches/cool_autostart/)
7. [Hide vacant tags](https://dwm.suckless.org/patches/hide_vacant_tags/)
8. [Move stack](https://dwm.suckless.org/patches/movestack/)
9. [No borders flicker fix](https://dwm.suckless.org/patches/noborderflicker/)
10. [Systray](https://dwm.suckless.org/patches/systray/)
