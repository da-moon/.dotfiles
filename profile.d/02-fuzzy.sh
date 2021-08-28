# vim: ft=sh syntax=sh softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab
if command -- sk --version > /dev/null 2>&1; then
  if command -- rg --version > /dev/null 2>&1; then
    # uses skim and bat to enable quick search an preview of 
    # files in directory tree
    # f(fuzzy)p(preview)
    if command -- bat --version > /dev/null 2>&1; then
      function fp {
        rg --files $1 | sk --preview="bat {} --color=always --style=grid,numbers"
      }
    fi
    # run text search with ripgrep interactively
    # f(fuzzy)s(search)
    function fs {
      sk -i -c "rg {} --color=always $1" --ansi
    }
  fi
fi
