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
**Theme:** Dracula<br/>
**Font:** Jet Brains Mono Nerd Font<br/>
**Environment:** rofi, polybar, dunst, conky<br/>
<details><summary>Screenshots</summary>
  
![i3-1](https://user-images.githubusercontent.com/44934250/168938410-6cb002c8-bba3-48ec-b704-0d8ab58d325d.png)
  
![i3-2](https://user-images.githubusercontent.com/44934250/168938426-a3cc6c4d-6dfc-43ef-90b9-22edf5402693.png)
  
</details>

### dwm
**Theme:** Dracula<br/>
**Font:** Jet Brains Mono Nerd Font<br/>
**Environment:** dmenu, slstatus, dunst, conky<br/>
<details><summary>Screenshots</summary>
  
![dwm-1](https://user-images.githubusercontent.com/44934250/168938447-8ec25173-50fd-48f6-87e3-38104d862fe4.png)
  
</details>
