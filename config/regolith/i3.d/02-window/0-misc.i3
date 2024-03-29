# vim: ft=i3config syntax=i3config softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab
# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

# Hiding borders adjacent to the screen edges.
# The "smart" setting hides borders on workspaces with only one window visible.
set_from_resource $i3-wm.hide.edge.borders i3-wm.hide.edge.borders smart
hide_edge_borders $i3-wm.hide.edge.borders
