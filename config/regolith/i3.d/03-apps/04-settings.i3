# vim: ft=i3config syntax=i3config softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab
# -----------------------------------------------------------
## Modify // Settings // <> c ##
set_from_resource $i3-wm.binding.settings i3-wm.binding.settings c
set_from_resource $i3-wm.program.settings i3-wm.program.settings gnome-control-center --class=floating_window
bindsym $mod+$i3-wm.binding.settings exec $i3-wm.program.settings

## Modify // Display Settings // <> d ##
set_from_resource $i3-wm.binding.display i3-wm.binding.display d
set_from_resource $i3-wm.program.display i3-wm.program.display gnome-control-center --class=floating_window display
bindsym $mod+$i3-wm.binding.display exec $i3-wm.program.display

## Modify // Wifi Settings // <> w ##
set_from_resource $i3-wm.binding.wifi i3-wm.binding.wifi w
set_from_resource $i3-wm.program.wifi i3-wm.program.wifi gnome-control-center --class=floating_window wifi
bindsym $mod+$i3-wm.binding.wifi exec $i3-wm.program.wifi

## Modify // Bluetooth Settings // <> b ##
set_from_resource $i3-wm.binding.bluetooth i3-wm.binding.bluetooth b
set_from_resource $i3-wm.program.bluetooth i3-wm.program.bluetooth gnome-control-center --class=floating_window bluetooth
bindsym $mod+$i3-wm.binding.bluetooth exec $i3-wm.program.bluetooth


