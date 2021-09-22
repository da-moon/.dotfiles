# vim: ft=i3config syntax=i3config softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab
###############################################################################
# Workspace Names
# These are the labels which define each i3 workspace.
###############################################################################
set_from_resource $ws1  i3-wm.workspace.01.name "1"
set_from_resource $ws2  i3-wm.workspace.02.name "2"
set_from_resource $ws3  i3-wm.workspace.03.name "3"
set_from_resource $ws4  i3-wm.workspace.04.name "4"
set_from_resource $ws5  i3-wm.workspace.05.name "5"
set_from_resource $ws6  i3-wm.workspace.06.name "6"
set_from_resource $ws7  i3-wm.workspace.07.name "7"
set_from_resource $ws8  i3-wm.workspace.08.name "8"
set_from_resource $ws9  i3-wm.workspace.09.name "9"
set_from_resource $ws10 i3-wm.workspace.10.name "10"
set_from_resource $ws11 i3-wm.workspace.11.name "11"
set_from_resource $ws12 i3-wm.workspace.12.name "12"
set_from_resource $ws13 i3-wm.workspace.13.name "13"
set_from_resource $ws14 i3-wm.workspace.14.name "14"
set_from_resource $ws15 i3-wm.workspace.15.name "15"
set_from_resource $ws16 i3-wm.workspace.16.name "16"
set_from_resource $ws17 i3-wm.workspace.17.name "17"
set_from_resource $ws18 i3-wm.workspace.18.name "18"
set_from_resource $ws19 i3-wm.workspace.19.name "19"
###############################################################################
# Workspace Keys
# These are the keys which will be used while binding workspace switching
###############################################################################
set_from_resource $ws1_key  i3-wm.workspace.01.key 1
set_from_resource $ws2_key  i3-wm.workspace.02.key 2
set_from_resource $ws3_key  i3-wm.workspace.03.key 3
set_from_resource $ws4_key  i3-wm.workspace.04.key 4
set_from_resource $ws5_key  i3-wm.workspace.05.key 5
set_from_resource $ws6_key  i3-wm.workspace.06.key 6
set_from_resource $ws7_key  i3-wm.workspace.07.key 7
set_from_resource $ws8_key  i3-wm.workspace.08.key 8
set_from_resource $ws9_key  i3-wm.workspace.09.key 9
set_from_resource $ws10_key i3-wm.workspace.10.key 0
set_from_resource $ws11_key i3-wm.workspace.11.key 11
set_from_resource $ws12_key i3-wm.workspace.12.key 12
set_from_resource $ws13_key i3-wm.workspace.13.key 13
set_from_resource $ws14_key i3-wm.workspace.14.key 14
set_from_resource $ws15_key i3-wm.workspace.15.key 15
set_from_resource $ws16_key i3-wm.workspace.16.key 16
set_from_resource $ws17_key i3-wm.workspace.17.key 17
set_from_resource $ws18_key i3-wm.workspace.18.key 18
set_from_resource $ws19_key i3-wm.workspace.19.key 19

###############################################################################
# Workspace Navigation
###############################################################################
## Navigate // Workspaces 1-10 // <> 0..9 ##
bindsym $mod+$ws1_key workspace number $ws1
bindsym $mod+$ws2_key workspace number $ws2
bindsym $mod+$ws3_key workspace number $ws3
bindsym $mod+$ws4_key workspace number $ws4
bindsym $mod+$ws5_key workspace number $ws5
bindsym $mod+$ws6_key workspace number $ws6
bindsym $mod+$ws7_key workspace number $ws7
bindsym $mod+$ws8_key workspace number $ws8
bindsym $mod+$ws9_key workspace number $ws9
bindsym $mod+$ws10_key workspace number $ws10
## Navigate // Workspace 11 - 19 // <><Ctrl> 1..9 ##
bindsym $mod+Ctrl+$ws1_key workspace number $ws11
bindsym $mod+Ctrl+$ws2_key workspace number $ws12
bindsym $mod+Ctrl+$ws3_key workspace number $ws13
bindsym $mod+Ctrl+$ws4_key workspace number $ws14
bindsym $mod+Ctrl+$ws5_key workspace number $ws15
bindsym $mod+Ctrl+$ws6_key workspace number $ws16
bindsym $mod+Ctrl+$ws7_key workspace number $ws17
bindsym $mod+Ctrl+$ws8_key workspace number $ws18
bindsym $mod+Ctrl+$ws9_key workspace number $ws19

## Navigate // Next Workspace // <> Tab ##
set_from_resource $i3-wm.binding.ws_next i3-wm.binding.ws_next Tab
bindsym $mod+$i3-wm.binding.ws_next workspace next

## Navigate // Next Workspace // <><Alt> → ##
set_from_resource $i3-wm.binding.ws_next2 i3-wm.binding.ws_next2 Mod1+Right
bindsym $mod+$i3-wm.binding.ws_next2 workspace next

## Navigate // Previous Workspace // <><Alt> ← ##
set_from_resource $i3-wm.binding.ws_prev2 i3-wm.binding.ws_prev2 Mod1+Left
bindsym $mod+$i3-wm.binding.ws_prev2 workspace prev

## Navigate // Next Workspace on Output // <><Ctrl> Tab ##
set_from_resource $i3-wm.binding.ws_next_on_output i3-wm.binding.ws_next_on_output Ctrl+Tab
bindsym $mod+$i3-wm.binding.ws_next_on_output workspace next_on_output

## Navigate // Next Workspace on Output // <><Ctrl> l ##
set_from_resource $i3-wm.binding.ws_next_on_output2 i3-wm.binding.ws_next_on_output2 Ctrl+l
bindsym $mod+$i3-wm.binding.ws_next_on_output2 workspace next_on_output

## Navigate // Previous Workspace // <><Shift> Tab ##
set_from_resource $i3-wm.binding.ws_prev i3-wm.binding.ws_prev Shift+Tab
bindsym $mod+$i3-wm.binding.ws_prev workspace prev
## Navigate // Previous Workspace on Output // <><Ctrl><Shift> Tab ##
set_from_resource $i3-wm.binding.ws_prev_on_output i3-wm.binding.ws_prev_on_output Ctrl+Shift+Tab
bindsym $mod+$i3-wm.binding.ws_prev_on_output workspace prev_on_output

## Navigate // Previous Workspace on Output // <><Ctrl> h ##
set_from_resource $i3-wm.binding.ws_prev_on_output2 i3-wm.binding.ws_prev_on_output2 Ctrl+h
bindsym $mod+$i3-wm.binding.ws_prev_on_output2 workspace prev_on_output

## Navigate // Next Free Workspace // <> ` ##
set_from_resource $i3-wm.binding.next_free i3-wm.binding.next_free grave
bindsym $mod+$i3-wm.binding.next_free exec --no-startup-id /usr/bin/i3-next-workspace
