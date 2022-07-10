# How to use
```bash
./install.sh
```
# Installation process
1. Script will ask you which configuration should be installed.
2. Regardless of the choice made, the 'minimal' configuration will be installed first:
```
dotfiles/configurations/minimal/install.sh
```
3. Additional configurations are installed (if they were selected in step 1):
```
dotfiles/configurations/{configuration_name}/install.sh
```
# How to add configuration
1. Create directory under 'configurations', dir name = configuration name.
2. Place all files required for configuration in newly created dir.
3. Create 'install.sh' file.

# Available configurations
### sway
**Display server/Protocol:** Wayland<br/>
**Environment:** bemenu, waybar, dunst<br/>

### i3
**Display server/Protocol:** Xorg<br/>
**Environment:** rofi, polybar, dunst, conky<br/>

### dwm
**Display server/Protocol:** Xorg<br/>
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
11. [No title](https://dwm.suckless.org/patches/notitle/)
12. [Status Colors](https://dwm.suckless.org/patches/statuscolors/)
