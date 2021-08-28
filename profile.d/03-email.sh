# vim: ft=sh syntax=sh softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab
himalaya --output json -m Folders/damoon.external search new -s 50000 | jq -r '.response[] | select(.sender | contains("Peak Design")).uid' | xargs -r -I {} himalaya -m Folders/damoon.external delete {}
