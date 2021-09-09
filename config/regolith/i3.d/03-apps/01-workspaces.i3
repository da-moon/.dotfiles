# vim: ft=i3config syntax=i3config softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab

# -----------------------------------------------------------
# for_window [class="Geary" window_type="normal"]               move scratchpad
# bindsym $mod+m               [class="Geary"] scratchpad show, resize set 1200 700, move position center
# -----------------------------------------------------------
## Launch // Terminal // <> Enter ##
set $ws1 "1:"
set_from_resource $i3-wm.program.terminal $i3-wm.program.terminal $(which alacritty)
set_from_resource $i3-wm.binding.terminal i3-wm.binding.terminal Return
bindsym $mod+$i3-wm.binding.terminal exec $i3-wm.program.terminal
assign [class="(?i)Alacritty"] $ws1
for_window [class="(?i)Alacritty"] focus
# -----------------------------------------------------------
set $ws2 "2:"
assign [class="(?i)neovide"] $ws2
for_window [class="(?i)neovide"] focus
# ----------------------------------------------------------------------------
set $ws3 "3:﬏"
assign [class="Code"] $ws3
for_window [class="Code"] focus
# ----------------------------------------------------------------------------
## Launch // Browser // <><Shift> Enter ##
set $ws4 "4:爵"
set_from_resource $i3-wm.binding.browser i3-wm.binding.browser Shift+Return
bindsym $mod+$i3-wm.binding.browser exec gtk-launch $(xdg-settings get default-web-browser)
assign [class="(?i)brave"] $ws4
for_window [class="(?i)brave"] focus
# ----------------------------------------------------------------------------
set $ws5 "5:"
assign [class="(?i)Firefox"] $ws5
for_window [class="(?i)Firefox"] focus
# ----------------------------------------------------------------------------
## Launch // slack // <> s ##
set $ws6 "6:"
set_from_resource $i3-wm.binding.slack i3-wm.binding.slack s
set_from_resource $i3-wm.program.slack i3-wm.program.slack $(which slack)
bindsym $mod+$i3-wm.binding.slack exec $i3-wm.program.slack
assign [class="(?i)Slack"] $ws6
for_window [class="(?i)Slack"] focus
# ----------------------------------------------------------------------------
set $ws7 "7:"
assign [class="(?i)hiri"] $ws7
for_window [class="(?i)hiri"] focus
# ----------------------------------------------------------------------------
set $ws8 "8:"
assign [class="(?i)TelegramDesktop"] $ws8
for_window [class="(?i)TelegramDesktop"] focus
# -----------------------------------------------------------
# Launch // music // <> m ##
set $ws9 "9:"
set_from_resource $i3-wm.binding.music i3-wm.binding.music m
set_from_resource $i3-wm.program.music i3-wm.program.music $(which spotify)
bindsym $mod+$i3-wm.binding.music exec $i3-wm.program.music
assign [class="(?i)Spotify"] $ws9
for_window [class="(?i)Spotify"] focus
# ----------------------------------------------------------------------------
set $ws10 "10:"
set_from_resource $i3-wm.binding.kitty i3-wm.binding.kitty Ctrl+Return
set_from_resource $i3-wm.program.kitty i3-wm.program.kitty $(which kitty)
bindsym $mod+$i3-wm.binding.kitty exec $i3-wm.program.kitty
assign [class="(?i)kitty"] $ws10
for_window [class="(?i)kitty"] focus
# ----------------------------------------------------------------------------
assign [class="(?i)St"] $ws11
for_window [class="(?i)St"] focus
# ----------------------------------------------------------------------------
# set $ws9 "9:"
assign [class="(?i)VirtualBox Machine"] $ws12
for_window [class="(?i)VirtualBox Machine"] focus
# -----------------------------------------------------------
assign [class="(?i)zoom"] $ws17
for_window [class="(?i)zoom"] focus
# ----------------------------------------------------------------------------
set $ws18 "18:"
assign [class="(?i)webex"] $ws18
for_window [class="(?i)webex"] focus
# ----------------------------------------------------------------------------
set $ws19 "19:"
assign [class="(?i)Vpnui"] $ws19
for_window [class="(?i)Vpnui"] focus
