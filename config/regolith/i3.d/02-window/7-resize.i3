# vim: ft=i3config syntax=i3config softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab
###############################################################################
# Window Resize and Gaps
###############################################################################

## Resize // Enter Resize Mode // <> r ##
mode "Resize Mode" {
        # These bindings trigger as soon as you enter the resize mode

        ## Resize // Resize Window // ↑ ↓ ← → ##
        bindsym Left resize shrink width 6 px or 6 ppt
        bindsym Down resize grow height 6 px or 6 ppt
        bindsym Up resize shrink height 6 px or 6 ppt
        bindsym Right resize grow width 6 px or 6 ppt

        bindsym Shift+Left resize shrink width 12 px or 12 ppt
        bindsym Shift+Down resize grow height 12 px or 12 ppt
        bindsym Shift+Up resize shrink height 12 px or 12 ppt
        bindsym Shift+Right resize grow width 12 px or 12 ppt

        ## Resize // Resize Window // k j h l ##
        bindsym $i3-wm.binding.left resize shrink width 6 px or 6 ppt
        bindsym $i3-wm.binding.up resize grow height 6 px or 6 ppt
        bindsym $i3-wm.binding.down resize shrink height 6 px or 6 ppt
        bindsym $i3-wm.binding.right resize grow width 6 px or 6 ppt

        bindsym $i3-wm.binding.move_left resize shrink width 12 px or 12 ppt
        bindsym $i3-wm.binding.move_up resize grow height 12 px or 12 ppt
        bindsym $i3-wm.binding.move_down resize shrink height 12 px or 12 ppt
        bindsym $i3-wm.binding.move_right resize grow width 12 px or 12 ppt

        ## Resize // Window Gaps // + - ##
        bindsym $i3-wm.binding.dec_gaps gaps inner current minus 6
        bindsym $i3-wm.binding.inc_gaps gaps inner current plus 6
        bindsym $i3-wm.binding.dec_gaps_big gaps inner current minus 12
        bindsym $i3-wm.binding.inc_gaps_big gaps inner current plus 12

        ## Resize // Exit Resize Mode // Escape or Enter ##
        bindsym Return mode "default"
        bindsym Escape mode "default"
        bindsym $mod+r mode "default"
}
bindsym $mod+r mode "Resize Mode"
