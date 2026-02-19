# hyprland-clamshell-script
I use this script to run my laptop in clamshell mode with hyprland so that I can solely use my big ass widescreen monitor

---
Installation
One-shot install (creates folder + adds hyprland keybind)
```
mkdir -p ~/.config/hypr/scripts && \
curl -sL https://raw.githubusercontent.com/ryantzor/hyprland-clamshell-script/main/lid.sh -o ~/.config/hypr/scripts/lid.sh && \
chmod +x ~/.config/hypr/scripts/lid.sh && \
echo 'bind = SUPER, L, exec, ~/.config/hypr/scripts/lid.sh' >> ~/.config/hypr/hyprland.conf
```

Manual install
1. Save lid.sh to ~/.config/hypr/scripts/
2. Make executable: chmod +x ~/.config/hypr/scripts/lid.sh
3. Add to ~/.config/hypr/hyprland.conf:
      bind = SUPER, L, exec, ~/.config/hypr/scripts/lid.sh
   
---
Configuration
Edit the script to match your setup:
- INTERNAL - Your laptop's internal display (default: eDP-1)
- Resolution/refresh settings - Modify the hyprctl keyword monitor commands to match your external monitor's specs
---
Usage
Press SUPER + L to toggle clamshell mode:
- First press: Disables internal display, enables external monitor
- Second press: Re-enables internal display
