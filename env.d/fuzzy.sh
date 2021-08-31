# vim: ft=sh syntax=sh softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab
if command -- sk -h > /dev/null 2>&1 ; then
export SKIM_DEFAULT_OPTIONS="--preview 'preview {} | head -n 500'"
export SKIM_DEFAULT_COMMAND="rg --files --no-ignore --hidden --follow --no-messages"
export SKIM_CTRL_T_COMMAND="${SKIM_DEFAULT_COMMAND}"
# export SKIM_CTRL_T_OPTS=""
# export SKIM_CTRL_R_OPTS=""
# Use ~~ as the trigger sequence instead of the default **
# export SKIM_COMPLETION_TRIGGER='~~'
export SKIM_COMPLETION_TRIGGER='**'
fi
