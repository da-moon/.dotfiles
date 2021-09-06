# vim: ft=i3config syntax=i3config softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab
# -----------------------------------------------------------
# set_from_resource $rofiTheme rofi.theme /usr/share/regolith-look/minimal/rofi.rasi
set_from_resource $rofiTheme rofi.theme ~/.config/rofi/rofidmenu.rasi
# -----------------------------------------------------------
## Launch // This Dialog // <><Shift> ? ##
set_from_resource $i3-wm.program.help i3-wm.program.help /usr/bin/remontoire-toggle
set_from_resource $i3-wm.binding.help i3-wm.binding.help Shift+question
bindsym $mod+$i3-wm.binding.help exec $i3-wm.program.help
## Launch // Application // <> Space ##
set_from_resource $i3-wm.binding.launcher.app i3-wm.binding.launcher.app space
# set_from_resource $i3-wm.program.launcher.app i3-wm.program.launcher.app rofi -show drun -theme $rofiTheme
set_from_resource $i3-wm.program.launcher.app i3-wm.program.launcher.app rofi -show drun -theme ~/.config/rofi/rofidmenu.rasi
bindsym $mod+$i3-wm.binding.launcher.app exec $i3-wm.program.launcher.app
# -----------------------------------------------------------
## Launch // Command // <><Shift> Space ##
# set_from_resource $i3-wm.program.launcher.cmd i3-wm.program.launcher.cmd rofi -show run -theme $rofiTheme
set_from_resource $i3-wm.program.launcher.cmd i3-wm.program.launcher.cmd rofi -show run -theme ~/.config/rofi/rofidmenu.rasi
set_from_resource $i3-wm.binding.launcher.cmd i3-wm.binding.launcher.cmd Shift+space
bindsym $mod+$i3-wm.binding.launcher.cmd exec $i3-wm.program.launcher.cmd
# -----------------------------------------------------------
## Navigate // Window by Name // <><Ctrl> Space ##
# set_from_resource $i3-wm.program.launcher.window i3-wm.program.launcher.window rofi -show window -theme $rofiTheme
set_from_resource $i3-wm.program.launcher.window i3-wm.program.launcher.window rofi -show window -theme ~/.config/rofi/rofidmenu.rasi
set_from_resource $i3-wm.binding.launcher.window i3-wm.binding.launcher.window Ctrl+space
bindsym $mod+$i3-wm.binding.launcher.window exec $i3-wm.program.launcher.window
# -----------------------------------------------------------
## Launch // File Search // <><Alt> Space ##
set_from_resource $i3-wm.program.file_search i3-wm.program.file_search rofi -show find -modi find:/usr/share/rofi/modi/finder.sh -theme ~/.config/rofi/rofidmenu.rasi
set_from_resource $i3-wm.binding.file_search i3-wm.binding.file_search Mod1+space
bindsym $mod+$i3-wm.binding.file_search exec $i3-wm.program.file_search
# -----------------------------------------------------------
## Launch // Look Selector // <><Alt> l ##
set_from_resource $i3-wm.program.look_selector i3-wm.program.look_selector rofi -show look -modi look:/usr/share/rofi/modi/look-selector.sh -theme ~/.config/rofi/rofidmenu.rasi
set_from_resource $i3-wm.binding.look_selector i3-wm.binding.look_selector Mod1+l
bindsym $mod+$i3-wm.binding.look_selector exec $i3-wm.program.look_selector
# -----------------------------------------------------------
## Launch // Notification Viewer // <> n ##
set_from_resource $i3-wm.program.notification_ui i3-wm.program.notification_ui /usr/bin/rofication-gui
set_from_resource $i3-wm.binding.notification_ui i3-wm.binding.notification_ui n
bindsym $mod+$i3-wm.binding.notification_ui exec $i3-wm.program.notification_ui
