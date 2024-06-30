# nf [-NUM] [COMMENTARY] - never forget last N commands
function nf() {
  local n=-1
  [[ "$1" = -<-> ]] && n=$1 && shift
  fc -lnt ": %Y-%m-%d %H:%M ${*/\%/%%} ;" $n | tee -a $HOME/.neverforget
}

# paste bin on sprunge FILES... - paste to clbin.com
function pb() {
  local f
  if [ $# -lt 2 ]; then
    cat "$@"
  else
    for f; do
      echo "## $f"
      cat "$f"
      echo
    done
  fi | curl -sfF "clbin=<-" https://clbin.com | tr -d ' '
}

function datediff () {
    if [[ $# < 2 ]]; then
        echo
        echo Podaj dwa argumenty
        echo datediff 2024-11-28 2023-11-28
        echo
        return 1
    else
        echo $(( ($(date -u -d $1 +%s) - $(date -u -d $2 +%s)) / 86400))
    fi
}
