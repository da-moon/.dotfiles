###############################################################################
# i3 Appearance and Behavior
###############################################################################

# Disable titlebar
set_from_resource $i3-wm.window.border.size i3-wm.window.border.size 1
set_from_resource $i3-wm.floatingwindow.border.size i3-wm.floatingwindow.border.size 1
default_border pixel $i3-wm.window.border.size
default_floating_border pixel $i3-wm.floatingwindow.border.size

# Specify the distance between windows in pixels. (i3-gaps)
set_from_resource $i3-wm.gaps.inner.size i3-wm.gaps.inner.size 5
set_from_resource $i3-wm.gaps.outer.size i3-wm.gaps.outer.size 0
gaps inner $i3-wm.gaps.inner.size
gaps outer $i3-wm.gaps.outer.size

# Only enable gaps on a workspace when there is at least one container
set_from_resource $i3-wm.gaps.smart i3-wm.gaps.smart on
smart_gaps $i3-wm.gaps.smart

# Enable popup during fullscreen
set_from_resource $i3-wm.gaps.popup_during_fullscreen i3-wm.gaps.popup_during_fullscreen smart
popup_during_fullscreen $i3-wm.gaps.popup_during_fullscreen

# window focus follows your mouse movements as the mouse crosses window borders
set_from_resource $i3-wm.gaps.focus_follows_mouse i3-wm.gaps.focus_follows_mouse no
focus_follows_mouse $i3-wm.gaps.focus_follows_mouse
