# vim: ft=i3config syntax=i3config softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab
###############################################################################
# Window Gaps
###############################################################################
gaps inner 14
gaps outer -2
smart_gaps on
smart_borders on

set_from_resource $i3-wm.binding.inc_gaps i3-wm.binding.inc_gaps plus
set_from_resource $i3-wm.binding.dec_gaps i3-wm.binding.dec_gaps minus

set_from_resource $i3-wm.binding.inc_gaps_big i3-wm.binding.inc_gaps_big Shift+plus
set_from_resource $i3-wm.binding.dec_gaps_big i3-wm.binding.dec_gaps_big Shift+minus
