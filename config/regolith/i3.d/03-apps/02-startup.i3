# vim: ft=i3config syntax=i3config softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab
# code: language=i3 insertSpaces=true tabSize=2

###############################################################################
# programs that i3 would run at startup
###############################################################################
# exec --no-startup-id                                          geary
# Start the installed regolith-compositor
# [ NOTE ] => commented out as we are starting picom manually
# set_from_resource $i3-wm.program.compositor i3-wm.program.compositor /usr/share/regolith-compositor/init
# exec_always --no-startup-id $i3-wm.program.compositor
# -----------------------------------------------------------
# Start Rofication for notifications
set_from_resource $i3-wm.program.notifications i3-wm.program.notifications /usr/bin/rofication-daemon
#set_from_resource $i3-wm.program.notifications i3-wm.program.notifications /usr/bin/dunst
exec --no-startup-id $i3-wm.program.notifications
# -----------------------------------------------------------
# Launch first time user experience script
set_from_resource $i3-wm.program.ftui i3-wm.program.ftui /usr/bin/regolith-ftue
exec --no-startup-id $i3-wm.program.ftui
# -----------------------------------------------------------
# Hide the mouse pointer if unused for a duration
set_from_resource $i3-wm.program.unclutter i3-wm.program.unclutter /usr/bin/unclutter -b
exec --no-startup-id $i3-wm.program.unclutter
# -----------------------------------------------------------
# Load nm-applet to provide auth dialogs for network access
set_from_resource $i3-wm.program.nm-applet i3-wm.program.nm-applet /usr/bin/nm-applet
exec --no-startup-id $i3-wm.program.nm-applet
# -----------------------------------------------------------
## Launch // notes // <><Shift> n ##
set_from_resource $i3-wm.binding.notes i3-wm.binding.notes Shift+n
set_from_resource $i3-wm.program.notes i3-wm.program.notes $(which notable)
exec --no-startup-id $i3-wm.program.notes
for_window [class="Notable"] focus
for_window [class="Notable" window_type="normal"] move scratchpad
bindsym $mod+$i3-wm.binding.notes [class="Notable"] scratchpad show, resize set 1200 700, move position center
# -----------------------------------------------------------
## Launch // File Explorer // <> f ##
set_from_resource $i3-wm.binding.files i3-wm.binding.files f
set_from_resource $i3-wm.program.files i3-wm.program.files /usr/bin/nautilus --new-window
exec --no-startup-id $i3-wm.program.files
for_window [class="Org.gnome.Nautilus"] focus
for_window [class="Org.gnome.Nautilus" window_type="normal"] move scratchpad
bindsym $mod+$i3-wm.binding.files [class="Org.gnome.Nautilus"] scratchpad show, resize set 1200 700, move position center
# -----------------------------------------------------------
## Launch // tilda // <> t ##
set_from_resource $i3-wm.binding.scratchpad-terminal i3-wm.binding.scratchpad-terminal Shift+s
set_from_resource $i3-wm.program.scratchpad-terminal.cmd i3-wm.program.scratchpad-terminal /usr/bin/tilda --config-file ~/.config/tilda/config_0
exec --no-startup-id $i3-wm.program.scratchpad-terminal.cmd 
for_window [class="Tilda"] focus
for_window [class="Tilda" window_type="normal"] move scratchpad
bindsym $mod+$i3-wm.binding.scratchpad-terminal [class="Tilda"] scratchpad show, resize set 1200 700, move position center
# -----------------------------------------------------------
## Session // Refresh Session // <><Shift> r ##
set_from_resource $i3-wm.binding.refresh i3-wm.binding.refresh Shift+r
set_from_resource $i3-wm.program.refresh_ui i3-wm.program.refresh_ui /usr/bin/regolith-look refresh
bindsym $mod+$i3-wm.binding.refresh exec --no-startup-id $i3-wm.program.refresh_ui
# -----------------------------------------------------------
## Launch // transparent windows
# set_from_resource $i3-wm.program.compositor.cmd i3-wm.program.compositor.cmd /usr/bin/picom -b --experimental-backends --config ~/.config/picom/config.toml
# exec --no-startup-id $i3-wm.program.compositor.cmd
# -----------------------------------------------------------
## Launch // conky
set_from_resource $i3-wm.program.conky.cmd i3-wm.program.conky.cmd /usr/bin/conky -c ~/.config/conky/conky.conf
exec --no-startup-id $i3-wm.program.conky.cmd
# -----------------------------------------------------------
