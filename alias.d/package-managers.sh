if command -- jq --version > /dev/null 2>&1 \
&& command -- node --version > /dev/null 2>&1 \
&& command -- yarn --version > /dev/null 2>&1 \
&& [ -r $(sudo $(which node) $(which yarn) global dir)/package.json ] ; then
alias yarn-pkgs='cat  $(sudo $(which node) $(which yarn) global dir)/package.json  | jq -r ".dependencies|keys[]"'
fi
