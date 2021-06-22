alias brl='command -v brl > /dev/null 2>&1 && sudo brl'
alias strat='command -v brl > /dev/null 2>&1 && brl strat'
alias alpine='command -v brl > /dev/null 2>&1 && strat --restrict alpine'
alias arch='command -v brl > /dev/null 2>&1 && strat --restrict arch'
alias ubuntu='command -v brl > /dev/null 2>&1 && strat --restrict ubuntu'
alias apt='command -v brl > /dev/null 2>&1 && ubuntu sudo apt || sudo apt'
alias apt-get='command -v brl > /dev/null 2>&1 && ubuntu sudo apt-get || sudo apt-get'
alias apk='command -v brl > /dev/null 2>&1 && alpine apk'
# [ FIXME ]
# alias brlpin='set -x;read -p "name: " name;read -p "stratum: " stratum;strat -r $stratum which $name > /dev/null 2>&1 && sudo sed -i -e "/$name/d" -e "/^\s*\[cross-bin\]\s*$/a pin/bin/$name = $stratum:$(strat -r $stratum which $name)" -e "/^\s*\[restriction\]\s*$/a pin/bin/$name = $stratum:$(strat -r $stratum which $name)" /bedrock/etc/bedrock.conf ;unset $name; unset $stratum;set +x'