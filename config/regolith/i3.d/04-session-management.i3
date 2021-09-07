# vim: ft=i3config syntax=i3config softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab
###############################################################################
# Session Management
###############################################################################

## Session // Exit App // <><Shift> q ##
set_from_resource $i3-wm.binding.exit_app i3-wm.binding.exit_app Shift+q
bindsym $mod+$i3-wm.binding.exit_app [con_id="__focused__"] kill

## Session // Terminate App // <><Alt> q ##
set_from_resource $i3-wm.binding.kill_app i3-wm.binding.kill_app Mod1+q
bindsym $mod+$i3-wm.binding.kill_app [con_id="__focused__"] exec --no-startup-id kill -9 $(xdotool getwindowfocus getwindowpid)

## Session // Reload i3 Config // <><Shift> c ##
set_from_resource $i3-wm.binding.reload i3-wm.binding.reload Shift+c
bindsym $mod+$i3-wm.binding.reload reload

