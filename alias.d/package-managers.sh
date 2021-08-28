# vim: ft=sh syntax=sh softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab
if command -- jq --version > /dev/null 2>&1 \
&& command -- node --version > /dev/null 2>&1 \
&& command -- yarn --version > /dev/null 2>&1 \
&& [ -r $(sudo $(which node) $(which yarn) global dir)/package.json ] ; then
alias yarn-pkgs='cat  $(sudo $(which node) $(which yarn) global dir)/package.json  | jq -r ".dependencies|keys[]"'
fi
