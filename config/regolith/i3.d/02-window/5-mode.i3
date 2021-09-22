# vim: ft=i3config syntax=i3config softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab

# [ NOTE ] ensure  
for_window [class="Floating"] floating enable
for_window [class="Floating"] border normal
for_window [class="Floating"] resize set 1200 700
for_window [class="Floating"] move position center
## Modify // Window Layout Mode // <> t ##
set_from_resource $i3-wm.binding.layout_mode i3-wm.binding.layout_mode t
bindsym $mod+$i3-wm.binding.layout_mode layout toggle tabbed splith splitv


## Modify // Window Floating Toggle // <><Shift> f ##
set_from_resource $i3-wm.binding.float_toggle i3-wm.binding.float_toggle Shift+f
bindsym $mod+Shift+$i3-wm.binding.float_toggle floating toggle

## Modify // Tile/Float Focus Toggle // <><Shift> t ##
set_from_resource $i3-wm.binding.focus_toggle i3-wm.binding.focus_toggle Shift+t
bindsym $mod+$i3-wm.binding.focus_toggle focus mode_toggle
